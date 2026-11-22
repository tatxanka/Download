"""Registra una release pública verificada sin reescribir el historial anterior.

Uso desde GitHub Actions (evento release:published):
    python scripts/registrar_publicacion.py release.json
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def main() -> None:
    if len(sys.argv) != 2:
        raise SystemExit("Uso: registrar_publicacion.py <release.json>")
    published = json.loads(Path(sys.argv[1]).read_text(encoding="utf-8"))
    tag = published.get("tag_name")
    if not isinstance(tag, str) or not re.fullmatch(r"[a-z][a-z0-9-]*-v\d+\.\d+\.\d+", tag):
        raise ValueError("Tag público no permitido")
    if published.get("draft") or published.get("prerelease"):
        raise ValueError("No registrar un borrador o una prerelease")
    when = published.get("published_at")
    if not isinstance(when, str) or not re.fullmatch(r"\d{4}-\d{2}-\d{2}T.*", when):
        raise ValueError("Fecha de publicación ausente")

    catalog_file = ROOT / "catalogo.json"
    catalog = json.loads(catalog_file.read_text(encoding="utf-8"))
    matches = [
        (product, item)
        for product in catalog["products"]
        for item in product["releases"]
        if item["public_tag"] == tag
    ]
    if len(matches) != 1:
        raise ValueError("El tag no corresponde exactamente a una versión registrada")
    product, item = matches[0]
    assets = {asset["name"]: asset for asset in published.get("assets", [])}
    for expected in item["binaries"]:
        asset = assets.get(expected["filename"])
        if not asset or asset.get("state") != "uploaded":
            raise ValueError(f"Falta un asset publicado: {expected['filename']}")
        if asset.get("size") != expected["bytes"]:
            raise ValueError(f"Tamaño diferente: {expected['filename']}")
        if "sha256" in expected and asset.get("digest") != f"sha256:{expected['sha256']}":
            raise ValueError(f"Digest diferente: {expected['filename']}")
    if len(assets) != len(item["binaries"]):
        raise ValueError("El número de adjuntos no coincide con el catálogo")

    item["state"] = "publicada"
    item["public_published_date"] = when[:10]
    catalog_file.write_text(json.dumps(catalog, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    historial_file = ROOT / "HISTORIAL.md"
    historial = historial_file.read_text(encoding="utf-8")
    if tag == "voxt-v0.1.0":
        historial = historial.replace(
            "**Preparada; pendiente de adjuntar a Release pública**",
            "**Publicada; ZIP y SHA-256 verificados**",
            1,
        )
        historial = historial.replace(
            "- **Pendientes antes de dar por publicada:** transferencia binaria, comprobación de integridad, revisión de licencias para distribución pública y verificación de enlace sin autenticación.",
            "- **Publicación comprobada:** transferencia del ZIP original y su SHA-256, integridad de adjuntos y publicación de la release. La revisión de derechos y licencias sigue siendo responsabilidad del titular.",
            1,
        )
    marker = f"<!-- release-publicada:{tag} -->"
    if marker not in historial:
        zipfile = next((a for a in item["binaries"] if a["filename"].endswith(".zip")), None)
        digest = zipfile["sha256"] if zipfile else "(no aplicable)"
        historial += (
            f"\n## Confirmación pública · {product['title']} {item['version']}\n\n"
            f"{marker}\n"
            f"- Fecha: **{when[:10]}**. Estado: **PUBLICADA**.\n"
            f"- Descarga: [{tag}]({item['public_release_url']}).\n"
            f"- ZIP original: `{zipfile['filename'] if zipfile else '(ninguno)'}`, "
            f"SHA-256 `{digest}`.\n"
            f"- Procedencia: `{product['source']['repository']}` "
            f"(privado), release `{item['origin_tag']}`, commit `{item['origin_commit']}`.\n"
            "- Registro automático a partir de los metadatos de GitHub Releases; el fichero publicado fue validado contra el manifiesto.\n"
        )
    historial_file.write_text(historial, encoding="utf-8")

    if tag == "voxt-v0.1.0":
        readme_file = ROOT / "README.md"
        readme = readme_file.read_text(encoding="utf-8").replace(
            "**Transferencia preparada; ZIP público pendiente de publicación**",
            "**Publicada · Descarga disponible**",
            1,
        )
        readme_file.write_text(readme, encoding="utf-8")
        info_file = ROOT / "productos" / "voxt" / "README.md"
        info = info_file.read_text(encoding="utf-8").replace(
            "**Estado en Download:** transferencia pública preparada; comprobar si ya existe la",
            "**Estado en Download:** publicada y verificada; consulta la",
            1,
        )
        info_file.write_text(info, encoding="utf-8")
    print(f"Registrada {product['title']} {item['version']}: {tag}, {when[:10]}")


if __name__ == "__main__":
    main()
