#!/usr/bin/env bash
# Pasos 8-10 del episodio 0: borra plugins, themes de fábrica y archivos sueltos.
# Ejecutar SOLO con el theme propio ya activo (WordPress necesita al menos un theme).
# Uso: cleanup-wp.sh /ruta/al/sitio slug-del-theme
set -euo pipefail

SITE_DIR="${1:?uso: cleanup-wp.sh /ruta/al/sitio slug-del-theme}"
THEME="${2:?falta el slug del theme propio}"
[[ "$THEME" =~ ^[A-Za-z0-9_-]+$ ]] || { echo "Slug inválido" >&2; exit 1; }

WP_CONTENT="$SITE_DIR/wp-content"
[[ -f "$SITE_DIR/wp-config.php" && -d "$WP_CONTENT" ]] || { echo "No parece una instalación de WordPress: $SITE_DIR" >&2; exit 1; }
[[ -f "$WP_CONTENT/themes/$THEME/style.css" ]] || { echo "No existe el theme $THEME con style.css; no borro nada." >&2; exit 1; }

echo "Plugins:"
rm -rf "$WP_CONTENT/plugins/akismet" "$WP_CONTENT/plugins/hello.php"

echo "Themes de fábrica (conservo $THEME):"
for dir in "$WP_CONTENT"/themes/*/; do
  name="$(basename "$dir")"
  [[ "$name" == "$THEME" ]] && continue
  [[ "$name" == twenty* ]] && { echo "  - $name"; rm -rf "$dir"; }
done

echo "Archivos sueltos:"
rm -f "$SITE_DIR/readme.html" "$SITE_DIR/license.txt" "$SITE_DIR/wp-config-sample.php"

echo "Listo. Falta, a mano en el dashboard: borrar contenido de ejemplo y vaciar la papelera."
