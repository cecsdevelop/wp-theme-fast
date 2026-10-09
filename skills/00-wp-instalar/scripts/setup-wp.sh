#!/usr/bin/env bash
# Pasos 1-3 del episodio 0: descarga WordPress, lo coloca en htdocs y crea la BD.
# Uso: setup-wp.sh nombre-sitio
# Variables opcionales: HTDOCS, MYSQL, DB_USER, DB_PASS, DB_NAME, WP_URL
set -euo pipefail

SITE="${1:?uso: setup-wp.sh nombre-sitio}"
[[ "$SITE" =~ ^[a-z0-9-]+$ ]] || { echo "Nombre inválido: solo minúsculas, números y guiones" >&2; exit 1; }

HTDOCS="${HTDOCS:-/Applications/MAMP/htdocs}"
MYSQL="${MYSQL:-/Applications/MAMP/Library/bin/mysql80/bin/mysql}"
DB_USER="${DB_USER:-root}"
DB_PASS="${DB_PASS:-root}"
DB_NAME="${DB_NAME:-${SITE//-/_}}"
WP_URL="${WP_URL:-https://es.wordpress.org/latest-es_ES.zip}"
TARGET="$HTDOCS/$SITE"

[[ -e "$TARGET" ]] && { echo "Ya existe $TARGET, no toco nada." >&2; exit 1; }
[[ -x "$MYSQL" ]] || { echo "No encuentro el cliente mysql en $MYSQL (¿MAMP encendido?)." >&2; exit 1; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "1/3 Descargando WordPress..."
curl -fsSL "$WP_URL" -o "$TMP/wp.zip"
unzip -q "$TMP/wp.zip" -d "$TMP"

echo "2/3 Colocando archivos en $TARGET..."
mkdir -p "$TARGET"
mv "$TMP"/wordpress/* "$TARGET"/

echo "3/3 Creando base de datos $DB_NAME..."
MYSQL_PWD="$DB_PASS" "$MYSQL" -u "$DB_USER" --protocol=TCP -h 127.0.0.1 -P "${DB_PORT:-8889}" \
  -e "CREATE DATABASE \`$DB_NAME\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

echo "Listo. Abre http://localhost:8888/$SITE e instala con host localhost, BD $DB_NAME."
