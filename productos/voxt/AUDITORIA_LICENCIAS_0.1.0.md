# Auditoría de redistribución · VOXT 0.1.0 (ZIP original)

**Fecha:** 22/11/2026. **Dictamen técnico de preparación:** BLOQUEADA / NO APTA PARA ANUNCIAR COMO DESCARGA PÚBLICA EN ESTE ESTADO. No equivale a opinión jurídica vinculante; requiere resolver las obligaciones indicadas.

## Archivo exacto inspeccionado

- Origen: release privada `tatxanka/Voxt`, tag `v0.1.0`, compilación GitHub Actions aprobada.
- Nombre: `VOXT-0.1.0-win-x64.zip`.
- Tamaño: **339130148 bytes**.
- SHA-256 verificado recalculando bytes del ZIP: `7bb3359f39559c16a3eaa67a41288911a07d404847d0fc0eff95a52d4153e5f9`.
- El paquete contiene **3154 entradas**; directorio `VOXT/LICENCIAS/` con 56 archivos.
- No se ha modificado el ZIP ni el tag original.

## Hallazgos reproducibles y riesgos

### H1 · PyAV 16.1.0 incluye códecs GPL

La distribución binaria contiene `VOXT/_internal/av.libs/libx264-165-11f58e196647ac55063ea2b47126f2a6.dll` (2378240 bytes) y `VOXT/_internal/av.libs/libx265-e5556c00d79789a6a7fababf3f4bc6c0.dll` (12431872 bytes).

En `avcodec-62-0796e49249259295c31f1add9f446a07.dll`, FFmpeg 8.0.1 se identifican literalmente los parámetros `--enable-libx264` y `--enable-libx265`. La cadena embebida `libavcodec license: LGPL version 3 or later` **no demuestra** que las DLL externas x264 y x265 estén cubiertas por LGPL.

Los autores de x264 y x265 describen alternativas GPL y licencias comerciales. En las ruedas de PyAV existe discusión sobre qué condiciones se aplican al binario con bibliotecas auxiliares. **No se ha aportado evidencia de una excepción comercial redistribuible específica para estas dos DLL ni de una ruta GPL compatible con mantener privado el código de VOXT.**

Fuentes: https://x264.org/licensing/ · https://github.com/videolan/x265 · https://ffmpeg.org/legal.html · https://github.com/PyAV-Org/PyAV/issues/2270

### H2 · Avisos incompletos para el conjunto binario

El paquete incorpora `VOXT/LICENCIAS/av-LICENSE.txt` (BSD-3-Clause para el código de PyAV), pero **no se encontraron archivos individuales de licencia de x264, x265, FFmpeg o Chromium dentro de `VOXT/LICENCIAS/`**. `VOXT/THIRD_PARTY_NOTICES.md` contiene referencias generales a sus fuentes y licencias, y se incluyen los textos LGPL-2.1, LGPL-3.0 y GPL-3.0; eso no acredita por sí solo la composición y condiciones de las DLL de códecs ni los avisos de todos los terceros. Hay otras bibliotecas auxiliares en `av.libs`; deben auditarse individualmente.

### H3 · Qt / PySide6 6.10.2 y Qt WebEngine

La documentación del proyecto contiene avisos LGPLv3, fuentes y una declaración de posibilidad de sustituir las bibliotecas dinámicas. Falta acreditar sobre el paquete final: sustitución efectiva de las DLL pertinentes, derechos del usuario para depurar/modificar componentes LGPL, acceso al código fuente correspondiente (o alternativa válida) e información de instalación cuando sea exigida. Chromium en Qt WebEngine incorpora licencias propias y avisos que deben acompañar la distribución.

Fuentes: https://www.qt.io/development/open-source-lgpl-obligations · https://doc.qt.io/qtforpython-6/overviews/qtwebengine-licensing.html

### H4 · Licencia del propio producto

`tatxanka/Download` usa **MIT únicamente para el código y documentación original del catálogo**. VOXT no se convierte en MIT por alojar allí su ZIP. Antes de anunciar la demo, se recomienda documentar los términos propios de distribución/uso de VOXT, respetando las licencias de los terceros.

## Criterios de desbloqueo

1. Resolver las licencias de `libx264` y `libx265`: acreditar términos y derechos de distribución realmente aplicables al binario original, incluidos avisos/fuentes requeridos, **o** generar una nueva compilación en el repositorio privado eliminando las dependencias GPL si técnicamente posible.
2. Inventariar todas las DLL de `av.libs`, Qt, Chromium, FFmpeg y demás componentes, incluidas versiones, licencias, fuentes completas, avisos y condiciones de redistribución aplicables.
3. Completar el cumplimiento LGPL de Qt/PySide6/FFmpeg (información de reemplazo/reconstrucción, fuentes u ofertas correspondientes, y avisos). Verificarlo en el archivo a publicar y no solo en el código fuente.
4. Fijar los términos de distribución gratuita de VOXT y completar una revisión de licencias validada por el propietario y, cuando corresponda, asesor jurídico.
5. Solo después, generar y aceptar una release redistribuible: si el ZIP cambia **debe llevar otro hash y otro identificador de versión**; no sustituir `v0.1.0` ni falsear que es idéntico al original.
6. Comprobar acceso anónimo y SHA-256 de GitHub Releases tras su publicación, registrar la fecha en `catalogo.json`, `HISTORIAL.md` y documentación privada. Actualizar la web **en último lugar**.

**Situación:** `voxt-v0.1.0` de Download NO existe como release pública; ninguna transferencia autorizada. Conservamos el historial privado, el ZIP original y su hash sin cambios.
