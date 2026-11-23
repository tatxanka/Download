# VOXT · Demo gratuita para Windows

**VOXT** es un chat de escritorio accesible con modelos locales gestionados por Ollama. Permite trabajar con mensajes extensos, Markdown y bloques de código sin depender del ratón para dictar.

**Sitio:** https://voxt.site.je/  
**Primera versión:** 0.1.0 · Windows 11 x64 · ZIP portable  
**Estado en Download:** [VOXT 0.1.1 publicada](https://github.com/tatxanka/Download/releases/tag/voxt-v0.1.1). Se verificó la descarga anónima del ZIP y los materiales de cumplimiento.

## Qué permite hacer

- Conversar con los modelos de chat disponibles en Ollama, con contexto e historial.
- Dictar con Whisper local opcional, en español, inglés, francés y portugués.
- Elegir dos modos: **Espacio inicia / Intro detiene y envía**, o **Espacio inicia y Espacio detiene y envía**.
- Activar o desactivar voz sintética; el contenido completo permanece en pantalla.
- Leer texto técnico, bloques de código con resaltado y copiar contenido con teclado.
- Conservar conversaciones, idioma y preferencias al cerrar y actualizar.

## Requisitos y arranque

Windows 11 x64 con [Microsoft Visual C++ v14 x64](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist). Descarga y extrae **todo** `VOXT-0.1.1-win-x64.zip`. Ejecuta `VOXT/VOXT.exe` con la carpeta `_internal` junto al ejecutable. Requiere Ollama en ejecución con un modelo de chat local descargado. Si se quiere dictar, VOXT propone instalar **Whisper Base multilingüe (~148 MB)** en la primera apertura. El dictado funciona sin Internet después de instalar el modelo; la voz de lectura procede de Windows y puede requerir instalar voces adicionales.

El historial y las preferencias personales se guardan fuera del ZIP en `%LOCALAPPDATA%\VOXT`. Se recomiendan al menos 8 GB de RAM con modelos ligeros; el consumo real depende de Ollama. No incluye Ollama ni pesos de modelos de lenguaje.

## Versión y procedencia

[Notas de VOXT 0.1.1](v0.1.1.md) · [Histórico 0.1.0](v0.1.0.md) · [Historial del catálogo](../../HISTORIAL.md) · [Política de publicación](../../PUBLICACION.md).

La demo es una distribución gratuita, no una declaración de que VOXT sea código abierto. La [licencia MIT del catálogo](../../LICENSE) cubre los materiales propios de Download, **no** el ejecutable. Para VOXT 0.1.1, consulta los términos y los avisos de sus componentes en la release. [Alcance de la licencia del catálogo](../../LICENCIAS.md).

**Accesos oficiales:** [VOXT AI](https://voxt.site.je/) · [Descargas en la web](https://voxt.site.je/?p=descargas) · [Ayuda](https://voxt.site.je/?p=ayuda). La página de la web aún refleja la candidata rc1; se documenta su corrección en [PUBLICACION.md](../../PUBLICACION.md).

**Estado de disponibilidad (22/11/2026):** descarga pública de VOXT 0.1.0 bloqueada mientras se revisan bibliotecas x264/x265 incluidas en el ZIP. [Ver auditoría](AUDITORIA_LICENCIAS_0.1.0.md). La versión privada y la aprobación funcional no cambian.
