# Licencias y ámbito del repositorio Download

## Catálogo, scripts y documentación

El contenido **original propiedad de tatxanka** de este repositorio —scripts de transferencia y registro, configuraciones de GitHub Actions, estructura del catálogo y documentación redactada para Download— se publica bajo la **Licencia MIT**, cuyo texto completo figura en [LICENSE](LICENSE).

Copyright © 2026 tatxanka.

La licencia anterior GPL-2.0 aparece en el historial de la creación inicial del repositorio; el titular ha elegido MIT para los contenidos originales actuales. Los derechos de terceros no se pueden relicenciar por esta decisión.

## Archivos binarios de aplicaciones

**La licencia MIT del catálogo no se extiende a los programas y bibliotecas compilados adjuntos a GitHub Releases.** Cada aplicación conserva sus propios derechos de autor, licencia, términos de uso, marca y avisos de terceros. Las fichas de producto y notas de versión son documentación, no licencias de ejecución.

Que un programa esté disponible gratuitamente para su descarga **no equivale a que el código sea abierto, a que pueda sublicenciarse o a que su redistribución por terceros quede automáticamente autorizada**. Estas facultades deben constar de forma expresa en la licencia de cada aplicación cuando corresponda.

## Caso concreto: VOXT 0.1.0

- VOXT se desarrolla en un repositorio privado independiente; el producto se ofrece como demo gratuita para Windows 11 x64.
- La release original incluye módulos de Qt y PySide6 (con obligaciones de LGPLv3 y otras licencias según los módulos), Qt WebEngine/Chromium, PyAV/FFmpeg y otros componentes independientes. Estos **no** están cubiertos por la licencia MIT de Download.
- Antes de compartir el ZIP públicamente, comprobar que los avisos y textos del paquete son completos y que se cumplen las obligaciones pertinentes, incluida la disponibilidad de fuentes o instrucciones aplicables a componentes LGPL, según corresponda.
- Referencia oficial para revisar el inventario: `THIRD_PARTY_NOTICES.md` de VOXT, junto a la carpeta `LICENCIAS` del propio ZIP. La copia pública debe ser idéntica al original, con SHA-256 `7bb3359f39559c16a3eaa67a41288911a07d404847d0fc0eff95a52d4153e5f9`.
- **Estado de revisión de distribución pública: pendiente de cierre.** No presentar la aplicación como MIT, GPL-2.0 ni «open source» por el contenido del catálogo; no publicar el binario como público hasta completar la comprobación.

Para nuevos proyectos, registrar expresamente en la ficha su modalidad de distribución, la licencia del programa y los avisos de terceros antes de activar la descarga.

Este texto organiza el ámbito de las licencias del repositorio; no sustituye una revisión jurídica cuando sea necesaria.
