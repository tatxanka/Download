# Download · Distribuciones públicas de tatxanka

Repositorio público de **descarga de aplicaciones** desarrolladas en proyectos independientes. Aquí se publican **binarios, instrucciones, notas de versión e historial**; el código de desarrollo, las incidencias internas y los trabajos de Codex permanecen en sus repositorios de origen.

## Aplicaciones del catálogo

| Aplicación | Plataforma | Modalidad | Primera versión | Estado |
| --- | --- | --- | --- | --- |
| **[VOXT](productos/voxt/README.md)** | Windows 11 x64 | Portable de uso gratuito | 0.1.0 | **[0.1.1 publicada](https://github.com/tatxanka/Download/releases/tag/voxt-v0.1.1)** |

**Sitio oficial de VOXT:** [voxt.site.je](https://voxt.site.je/) · [Descargas](https://voxt.site.je/?p=descargas) · [Ayuda](https://voxt.site.je/?p=ayuda) · [Guía en HTML](https://voxt.site.je/voxt-media/guia-voxt.html).

La página de descargas se verificó mediante una pestaña abierta el 22/11/2026. En esa revisión mostraba la candidata `0.1.0-rc1`. [PUBLICACION.md](PUBLICACION.md) conserva el registro de la actualización web pendiente.

Descarga pública verificada de [VOXT 0.1.1 para Windows](https://github.com/tatxanka/Download/releases/tag/voxt-v0.1.1). La release incluye el ZIP, su SHA-256, las fuentes Qt y los avisos de licencia.

## Cómo está organizado

- [Catálogo estructurado](catalogo.json): productos, versiones, procedencia de cada binario y sumas SHA-256.
- [Historial de publicaciones](HISTORIAL.md): registro cronológico de altas y cambios, sin sobrescribir versiones anteriores.
- [Normas de publicación y licencias](PUBLICACION.md): condiciones antes de distribuir, integridad, autenticación y trazabilidad.
- `productos/<producto>/`: ficha y notas de cada release.
- `scripts/`: utilidades locales para copiar y verificar los **binarios originales**, sin recompilación.
- `AGENTS.md`: reglas comunes para quienes mantengan el catálogo con Codex.

## Descargas y privacidad

Las versiones se adjuntan a **GitHub Releases**, no al historial Git del repositorio. El usuario final no necesita acceso a los repositorios privados de desarrollo. Cada publicación conserva el SHA-256 original, la plataforma y las instrucciones.

**Licencias separadas:** los scripts y materiales originales de este catálogo se ofrecen bajo la [licencia MIT](LICENSE). **No concede licencia MIT al ejecutable VOXT ni a otros ZIP o assets de Releases.** Cada aplicación conserva su propia licencia y obligaciones con terceros; la redistribución pública exige revisión previa. Más información en [LICENCIAS.md](LICENCIAS.md) y [PUBLICACION.md](PUBLICACION.md).

**Aviso de distribución:** el ZIP original de VOXT 0.1.0 todavía no está publicado aquí. Su auditoría binaria ha detectado DLL de x264/x265 que requieren resolver la redistribución; consulta [auditoría documentada](productos/voxt/AUDITORIA_LICENCIAS_0.1.0.md). No publicaremos la copia hasta subsanar o acreditar su cumplimiento.
