# Download · Instrucciones compartidas para ChatGPT y Codex

Este repositorio **público** es solo un catálogo/distribuidor. El código de las aplicaciones reside en repositorios privados independientes; no copiar a Download código fuente privado, conversaciones, credenciales, tests internos ni datos personales.

1. Antes de publicar, comprobar `main`, releases existentes, `catalogo.json`, `HISTORIAL.md` y el registro de procedencia.
2. Mantener tags **inmutables y únicos por producto**: `voxt-v0.1.0`, `nombre-vX.Y.Z`. Nunca reemplazar silenciosamente un ZIP público.
3. Alojar ZIP y SHA-256 en **GitHub Releases**, no en commits ni Git LFS. Corroborar bytes y hash del origen, y acceso anónimo a la copia pública.
4. Cada publicación debe actualizar simultáneamente `catalogo.json`, `HISTORIAL.md`, `README.md` cuando corresponda y `productos/<producto>/` con fecha, procedencia, versión, plataforma, tamaño, digest, cambios y soporte.
5. Revisión de derechos y avisos de terceros **antes** de hacer públicos los binarios. No deducir que el ejecutable hereda automáticamente GPL-2.0 del repositorio. No cambiar `LICENSE` ni asumir la licencia de las apps sin decisión del propietario.
6. Copiar un binario probado **sin recompilar ni modificar**. Si hace falta crear una variante, prepararla y validarla en su repositorio privado, con otro identificador.
7. No almacenar tokens, accesos a repositorios privados ni credenciales en ficheros o comandos registrados. Usar GitHub CLI autenticado localmente o secretos de Actions con permisos mínimos.
8. Distinguir en la documentación `preparada`, `publicada`, `retirada` y `sustituida`; no anunciar links como operativos antes de verificar sus assets.
9. Las modificaciones de historial se hacen añadiendo entradas o correcciones trazadas; no borrar registros anteriores. El despliegue de la web y enlaces en sitios externos se verifica por separado.
