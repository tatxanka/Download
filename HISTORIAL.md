# Historial de publicaciones públicas

Este registro describe las **publicaciones en tatxanka/Download**, no el historial interno de commits. Una versión nunca se sustituye silenciosamente: si cambia el binario, cambia la versión/tag y se añade una entrada. Los SHA-256 sirven para comprobar que la copia pública corresponde a la distribución de origen.

| Fecha | Producto | Versión | Estado público | Archivo | Origen |
| --- | --- | --- | --- | --- | --- |
| 2026-11-22 | VOXT | 0.1.0 | **Preparada; pendiente de adjuntar a Release pública** | `VOXT-0.1.0-win-x64.zip` | `tatxanka/Voxt` (privado), tag `v0.1.0` |
| 2026-11-23 | VOXT | 0.1.1 | **Publicada y verificada** | `VOXT-0.1.1-win-x64.zip` | `tatxanka/Voxt` (privado), tag `v0.1.1` |

## VOXT 0.1.0 — primera entrada

- **Fecha de aceptación funcional:** 22/11/2026, comunicada por el propietario: ocho pruebas físicas PASS; 22 pruebas automatizadas PASS en la publicación original.
- **Origen inalterado:** release privada `v0.1.0`, commit `2697e19eedb96603f0b6eba1c5252451de2c7c21`.
- **ZIP original:** 339.130.148 bytes; SHA-256 `7bb3359f39559c16a3eaa67a41288911a07d404847d0fc0eff95a52d4153e5f9`.
- **Tag público reservado:** `voxt-v0.1.0`. No confundir con el tag `v0.1.0` del proyecto de desarrollo.
- **Pendientes antes de dar por publicada:** transferencia binaria, comprobación de integridad, revisión de licencias para distribución pública y verificación de enlace sin autenticación.

Al publicar, registrar aquí la fecha efectiva, la URL final, el resultado de la descarga pública, el hash comprobado y cualquier incidencia. Mantener las entradas históricas, incluidas las preparaciones que precedieron a la publicación.

## Corrección editorial y licencia del catálogo · 22/11/2026

- Se ha confirmado el dominio oficial **https://voxt.site.je/** y corregido el error editorial anterior **https://voxt.sites.je/** en todas las referencias de Download. En la web de descargas sigue apareciendo una candidata `rc1`, pendiente de actualización en el alojamiento.
- El catálogo y sus scripts originales pasan a **MIT**; la licencia GPL-2.0 del commit de creación permanece en el historial de Git, pero no se proyecta sobre los ZIPs de aplicaciones. Los ejecutables requieren términos propios y cumplimiento de licencias de terceros. Ver [LICENSE](LICENSE), [LICENCIAS.md](LICENCIAS.md) y [PUBLICACION.md](PUBLICACION.md).
- Sin cambios de binario: la release pública de VOXT continúa **pendiente de transferencia y verificación**.

## 22/11/2026 · Auditoría binaria de VOXT 0.1.0

- **Estado de publicación: BLOQUEADA POR LICENCIAS**, no sustituye la aprobación funcional ni elimina el historial previo.
- Se descargó y comprobó el ZIP original SHA-256 `7bb3359f39559c16a3eaa67a41288911a07d404847d0fc0eff95a52d4153e5f9` (339130148 bytes). El paquete contiene las bibliotecas `libx264` y `libx265` en `_internal/av.libs`. La composición de FFmpeg/PyAV y los avisos correspondientes deben revisarse antes de permitir redistribución pública.
- Informe detallado: [auditoría de terceros de VOXT 0.1.0](productos/voxt/AUDITORIA_LICENCIAS_0.1.0.md). La release privada original se conserva; `Download` no ha publicado el ZIP.

## Confirmación pública · VOXT 0.1.1

<!-- release-publicada:voxt-v0.1.1 -->
- Fecha: **2026-11-23**. Estado: **PUBLICADA**.
- Descarga: [voxt-v0.1.1](https://github.com/tatxanka/Download/releases/tag/voxt-v0.1.1).
- ZIP original: `VOXT-0.1.1-win-x64.zip`, SHA-256 `3567273a5bf28b51fe4944aaa98c53839594c4ceddb6b0effcd2bd91f9700ec1`.
- Procedencia: `tatxanka/Voxt` (privado), release `v0.1.1`, commit `a25919bf1eb3a7ef9c1738cd27777a9692ae344a`.
- Registro automático a partir de los metadatos de GitHub Releases; el fichero publicado fue validado contra el manifiesto. Se descargaron sin autenticación los 15 adjuntos y se verificaron sus tamaños y SHA-256. El ZIP y el archivo de avisos pasaron la comprobación CRC.
