# Copia la release VOXT original sin recompilarla. Se ejecuta localmente con gh autenticado.
param(
    [switch]$RevisionLicenciasConfirmada
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

if (-not $RevisionLicenciasConfirmada) {
    throw 'Antes de una distribución pública, revisa los derechos y avisos de terceros. Ejecuta con -RevisionLicenciasConfirmada solo tras hacerlo.'
}
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw 'GitHub CLI (gh) no está instalado o no se encuentra en PATH.'
}

$root = Split-Path -Parent $PSScriptRoot
$catalog = Get-Content -Raw -LiteralPath (Join-Path $root 'catalogo.json') | ConvertFrom-Json
$product = @($catalog.products | Where-Object { $_.id -eq 'voxt' }) | Select-Object -First 1
if ($null -eq $product) { throw 'No se encuentra el producto voxt en el catálogo.' }
$entry = @($product.releases | Where-Object { $_.version -eq '0.1.0' }) | Select-Object -First 1
if ($null -eq $entry) { throw 'No se encuentra VOXT 0.1.0 en el catálogo.' }

$source = [string]$product.source.repository
$destination = 'tatxanka/Download'
$sourceTag = [string]$entry.origin_tag
$targetTag = [string]$entry.public_tag
$zipEntry = @($entry.binaries | Where-Object { $_.filename -like '*.zip' }) | Select-Object -First 1
$sumEntry = @($entry.binaries | Where-Object { $_.filename -like '*.sha256' }) | Select-Object -First 1
if ($null -eq $zipEntry -or $null -eq $sumEntry) { throw 'Falta ZIP o suma SHA-256 en catalogo.json.' }
$expected = ([string]$zipEntry.sha256).ToLowerInvariant()
$expectedBytes = [long]$zipEntry.bytes
$expectedChecksumBytes = [long]$sumEntry.bytes
$notesPath = Join-Path $root ([string]$entry.notes).Replace('/', [System.IO.Path]::DirectorySeparatorChar)

$temp = Join-Path ([System.IO.Path]::GetTempPath()) ('voxt-public-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $temp -Force | Out-Null
try {
    & gh auth status *> $null
    if ($LASTEXITCODE -ne 0) { throw 'Autentica GitHub CLI con gh auth login, con acceso al origen privado y permiso de escritura en Download.' }

    & gh release view $targetTag --repo $destination --json tagName 2>$null | Out-Null
    if ($LASTEXITCODE -eq 0) {
        throw "La release pública $targetTag ya existe: no se sobrescribe."
    }

    & gh release download $sourceTag --repo $source --pattern ([string]$zipEntry.filename) --pattern ([string]$sumEntry.filename) --dir $temp
    if ($LASTEXITCODE -ne 0) { throw 'No se pudieron descargar los assets del repositorio privado de origen.' }

    $zipPath = Join-Path $temp ([string]$zipEntry.filename)
    $sumPath = Join-Path $temp ([string]$sumEntry.filename)
    if (-not (Test-Path -LiteralPath $zipPath) -or -not (Test-Path -LiteralPath $sumPath)) {
        throw 'La descarga está incompleta: faltan el ZIP o el SHA-256.'
    }

    $size = (Get-Item -LiteralPath $zipPath).Length
    $checksumSize = (Get-Item -LiteralPath $sumPath).Length
    if ($size -ne $expectedBytes -or $checksumSize -ne $expectedChecksumBytes) {
        throw "Tamaño inesperado: ZIP=$size, SHA256=$checksumSize."
    }

    $actual = (Get-FileHash -LiteralPath $zipPath -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actual -ne $expected) { throw 'SHA-256 del ZIP diferente del registrado en el origen. Publicación cancelada.' }

    $checksum = (Get-Content -Raw -LiteralPath $sumPath).Trim()
    if ($checksum -notmatch '^([0-9a-fA-F]{64})\s+\*?([^\r\n]+)$') {
        throw 'Formato del fichero SHA-256 inesperado.'
    }
    if ($Matches[1].ToLowerInvariant() -ne $expected -or $Matches[2] -ne $zipEntry.filename) {
        throw 'El fichero SHA-256 no corresponde al ZIP aprobado.'
    }

    Add-Type -AssemblyName System.IO.Compression
    $archive = [System.IO.Compression.ZipFile]::OpenRead($zipPath)
    try {
        if (-not @($archive.Entries | Where-Object { $_.FullName -eq 'VOXT/VOXT.exe' }).Count) {
            throw 'No aparece VOXT/VOXT.exe en el ZIP original.'
        }
    }
    finally { $archive.Dispose() }

    if (-not (Test-Path -LiteralPath $notesPath)) { throw 'Falta la ficha pública de la versión.' }
    Write-Host "Origen verificado: $($zipEntry.filename) ($size bytes), SHA-256 $actual"

    # Se publica primero como borrador: los visitantes no ven archivos parcialmente subidos.
    & gh release create $targetTag $zipPath $sumPath --repo $destination --target main --title 'VOXT 0.1.0 · Demo gratuita para Windows 11 x64' --notes-file $notesPath --latest=false --draft
    if ($LASTEXITCODE -ne 0) { throw 'La creación o subida de la release en borrador falló.' }

    $rawRelease = & gh api "repos/tatxanka/Download/releases/tags/$targetTag"
    if ($LASTEXITCODE -ne 0) { throw 'No se pudo comprobar la release en el servidor; permanece en borrador.' }
    $remote = $rawRelease | ConvertFrom-Json
    $remoteZip = @($remote.assets | Where-Object { $_.name -eq $zipEntry.filename }) | Select-Object -First 1
    $remoteSha = @($remote.assets | Where-Object { $_.name -eq $sumEntry.filename }) | Select-Object -First 1
    if ($null -eq $remoteZip -or $null -eq $remoteSha) {
        throw 'Faltan adjuntos en la release de GitHub. Se mantiene en borrador.'
    }
    if ([long]$remoteZip.size -ne $expectedBytes -or [long]$remoteSha.size -ne $expectedChecksumBytes) {
        throw 'El tamaño de los adjuntos públicos no coincide. Se mantiene en borrador.'
    }
    if ([string]$remoteZip.digest -ne "sha256:$expected") {
        throw 'El digest del adjunto en GitHub no coincide. Se mantiene en borrador.'
    }

    & gh release edit $targetTag --repo $destination --draft=false
    if ($LASTEXITCODE -ne 0) { throw 'No se pudo publicar la release, que permanece en borrador.' }

    # Comprobación sin usar credenciales privadas; no se descarga de nuevo el ZIP.
    $published = Invoke-RestMethod -Uri "https://api.github.com/repos/tatxanka/Download/releases/tags/$targetTag" -Headers @{ 'User-Agent' = 'VOXT-Publication-Check'; 'Accept' = 'application/vnd.github+json' }
    if ($published.draft -or $published.prerelease -or @($published.assets).Count -ne 2) {
        throw 'El estado público todavía no es válido. Comprueba la release.'
    }
    Write-Host "PUBLICADA Y VERIFICADA: https://github.com/tatxanka/Download/releases/tag/$targetTag"
    Write-Host "SHA-256: $expected"
}
finally {
    Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue
}
