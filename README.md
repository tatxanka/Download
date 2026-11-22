# Download · Distribuciones públicas de tatxanka

Repositorio público de **descarga de aplicaciones** desarrolladas en proyectos independientes. Aquí se publican **binarios, instrucciones, notas de versión e historial**; el código de desarrollo, las incidencias internas y los trabajos de Codex permanecen en sus repositorios de origen.

## Aplicaciones del catálogo

| Aplicación | Plataforma | Modalidad | Primera versión | Estado |
| --- | --- | --- | --- | --- |
| **[VOXT](productos/voxt/README.md)** | Windows 11 x64 | Demo gratuita, aplicación portable | 0.1.0 | **Transferencia preparada; ZIP público pendiente de publicación** |

Sitio de VOXT: **https://voxt.sites.je/** (enlace aportado por el propietario; la web se administra por separado).

La descarga pública de VOXT, **una vez transferida y verificada**, aparecerá en:
[GitHub Releases · VOXT 0.1.0](https://github.com/tatxanka/Download/releases/tag/voxt-v0.1.0).

> **Importante:** hasta que GitHub muestre el ZIP en esa release, no hay todavía una descarga pública. No confundir el enlace original de un repositorio privado con una descarga abierta.

## Cómo está organizado

- [Catálogo estructurado](catalogo.json): productos, versiones, procedencia de cada binario y sumas SHA-256.
- [Historial de publicaciones](HISTORIAL.md): registro cronológico de altas y cambios, sin sobrescribir versiones anteriores.
- [Normas de publicación y licencias](PUBLICACION.md): condiciones antes de distribuir, integridad, autenticación y trazabilidad.
- `productos/<producto>/`: ficha y notas de cada release.
- `scripts/`: utilidades locales para copiar y verificar los **binarios originales**, sin recompilación.
- `AGENTS.md`: reglas comunes para quienes mantengan el catálogo con Codex.

## Descargas y privacidad

Las versiones se adjuntan a **GitHub Releases**, no al historial Git del repositorio. El usuario final no necesita acceso a los repositorios privados de desarrollo. Cada publicación conserva el SHA-256 original, la plataforma y las instrucciones.

**Descarga gratuita no equivale a código abierto ni a ausencia de obligaciones de licencia.** El archivo `LICENSE` existente en este repositorio es GPL-2.0; su alcance sobre este catálogo y sobre eventuales materiales propios debe aclararse antes de anunciar licencias de las aplicaciones. Ninguna ficha otorga por sí sola una licencia a los binarios que no haya sido declarada expresamente por sus titulares. Consulta [PUBLICACION.md](PUBLICACION.md).
