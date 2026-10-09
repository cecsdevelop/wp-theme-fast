---
name: wp-limpio
description: Prepara un WordPress local vacío en MAMP - descarga WordPress, crea la carpeta y la base de datos utf8mb4, endurece wp-config y deja el sitio sin plugins, themes de fábrica ni contenido de ejemplo. Usar al iniciar el curso de theme desde cero o al montar un sitio de desarrollo limpio. Episodio 0.
---

# Episodio 0: WordPress limpio

Entradas: `NOMBRE-SITIO` (minúsculas, números y guiones). Entorno: MAMP en macOS, Apache en 8888, MySQL en 8889.

## Flujo

1. **Descarga, carpeta y BD:** `scripts/setup-wp.sh NOMBRE-SITIO`. Refuse si la carpeta ya existe. Credenciales por variables de entorno (`DB_USER`, `DB_PASS`), nunca escritas en el script.
2. **Instalador web:** el usuario abre `http://localhost:8888/NOMBRE-SITIO` y completa host `localhost`, la BD creada y el administrador. No automatizar: se muestra en el video.
3. **wp-config.php:** `WP_DEBUG` en `true` y `$table_prefix` distinto de `wp_` (por ejemplo `nt_`). El prefijo debe decidirse antes de instalar; si ya se instaló, avisar al usuario en lugar de cambiarlo.
4. **Theme propio:** ejecutar antes la skill `theme-minimo`; este paso necesita un theme activo.
5. **Limpieza:** `scripts/cleanup-wp.sh /ruta/al/sitio SLUG-THEME` borra Akismet, Hello Dolly, los themes `twenty*` y `readme.html`, `license.txt`, `wp-config-sample.php`. El script se niega a correr si el theme propio no existe.
6. **Contenido de ejemplo:** en el dashboard, borrar entrada "Hello world", página de ejemplo, página de privacidad y el comentario, y vaciar la papelera.
7. **Enlaces permanentes:** Ajustes → Enlaces permanentes → "Nombre de la entrada". Verificar que se generó el `.htaccess`.

## Verificación

- `wp-content/plugins/` contiene solo `index.php`.
- `wp-content/themes/` contiene solo el theme propio (y `index.php`).
- Panel de plugins vacío y una sola entrada en Apariencia → Themes.

## Reglas

- No ejecutar nada destructivo sin confirmar la ruta con el usuario.
- No modificar sitios existentes: si la carpeta ya existe, detenerse.
- Es un entorno local; no usar estas credenciales por defecto fuera de MAMP.
