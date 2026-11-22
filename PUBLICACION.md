# Política de distribución y trazabilidad

Este repositorio publica **binarios de proyectos desarrollados en repositorios privados**. La publicación nunca consiste en hacer público el proyecto de desarrollo: se copia únicamente un artefacto de release, su comprobante SHA-256 y las notas públicas necesarias.

## Procedimiento obligatorio

1. **Origen validado.** Comprobar tag/release original, commit de procedencia, evidencia de pruebas, aceptación y dependencias.
2. **Derechos de distribución.** Confirmar que se puede redistribuir la aplicación y todos los componentes de terceros. En VOXT se incluyen Qt/PySide LGPLv3, Qt WebEngine/Chromium con múltiples licencias, FFmpeg/PyAV y otros componentes. Consultar el `THIRD_PARTY_NOTICES.md` del proyecto de origen y los avisos incorporados al ZIP. No se declara cerrada la revisión legal por el mero hecho de existir avisos. Consultar asesoramiento de licencias si es necesario.
3. **Licencia del catálogo.** Existe un `LICENSE` GPL-2.0 en este repositorio. **No interpretar automáticamente ese archivo como una licencia concedida al ejecutable VOXT.** Su ámbito y la licencia de cada aplicación requieren decisión expresa del titular; no modificarlo en silencio.
4. **Transporte sin modificar.** Obtener el ZIP de la release original, comprobar nombre, tamaño y SHA-256 oficial. **No reempaquetar ni recompilar** la release aprobada.
5. **Publicación por producto.** Usar un tag único `<producto>-v<versión>`: por ejemplo `voxt-v0.1.0`. Crear en GitHub Releases, adjuntar ZIP y SHA-256; publicar como release pública solo al terminar las comprobaciones.
6. **Comprobación posterior.** Verificar con la API pública, sin autorización privada, que la release no es borrador, que ambos archivos existen y que el ZIP publicado conserva el hash y tamaño del original. Probar descarga anónima y extracción.
7. **Histórico.** Registrar fecha efectiva, versión, plataforma, archivo, hash, origen, novedades, incidencias y estado en `catalogo.json`, `HISTORIAL.md` y ficha del producto. Un flujo de GitHub Actions actualizará automáticamente el estado del catálogo al publicarse una release conocida y verificada.
8. **Enlaces externos.** Solo entonces incorporar la URL de la release al botón de descarga del sitio correspondiente y comprobarla sin iniciar sesión.

## Publicación inicial de VOXT 0.1.0

El enlace de origen `tatxanka/Voxt` es **privado**. Para descargar el ZIP original desde Windows, usar GitHub CLI con un usuario autorizado en origen y destino:

```powershell
git clone https://github.com/tatxanka/Download.git
cd Download
gh auth status
pwsh -NoProfile -File .\scripts\publicar-voxt-0.1.0.ps1 -RevisionLicenciasConfirmada
```

El parámetro `-RevisionLicenciasConfirmada` constituye un reconocimiento deliberado del paso 2: **no utilizarlo antes de verificar los derechos de redistribución**. Nunca introducir tokens en el chat, en el código ni en el repositorio. El script descarga mediante `gh`, valida 339.130.148 bytes y SHA-256 `7bb3359f39559c16a3eaa67a41288911a07d404847d0fc0eff95a52d4153e5f9`, crea la release en borrador, comprueba los metadatos del servidor y después la publica. Si existe el tag, se detiene sin sustituir binarios.

El workflow `.github/workflows/registrar-release.yml` se inicia cuando GitHub confirma la publicación y actualiza el catálogo público. **Los controles manuales, la revisión de licencias y la transferencia binaria no se sustituyen por una simple edición del README.**

## Normas para proyectos futuros

Añadir primero una ficha en `productos/<slug>/` y una entrada en `catalogo.json` con `state: pendiente_subida_publica`; registrar origen privado, versión aprobada, pruebas, nombres de archivos, hashes y licencia revisada. Incorporar un script o workflow de transferencia con permisos mínimos. Cuando GitHub confirme la publicación, la ficha debe conservar sus notas y el histórico debe pasar a estado público sin destruir las versiones anteriores. Los usuarios pueden seguir descargando las releases anteriores por su tag.

Un update automático de la aplicación de escritorio (por ejemplo, VOXT-0003) es un desarrollo separado del mantenimiento del catálogo: no implementarlo aquí.
