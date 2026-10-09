---
name: wp-limpio
description: Deja un WordPress local sin plugins, themes de fábrica, archivos sueltos ni contenido de ejemplo, conservando solo el theme propio. Usar después de wp-instalar y theme-minimo, con el theme propio ya activo. Episodio 0, segunda mitad.
---

# Episodio 0: dejar WordPress vacío

Requisito: el sitio ya está instalado (`wp-instalar`) y el theme propio existe y está **activo** (`theme-minimo`). WordPress necesita siempre al menos un theme; por eso esta limpieza va al final.

Entradas: ruta del sitio y slug del theme propio.

## Flujo

1. **Archivos:** `scripts/cleanup-wp.sh /ruta/al/sitio SLUG-THEME` borra Akismet, Hello Dolly, los themes `twenty*` y `readme.html`, `license.txt`, `wp-config-sample.php`. Se niega a correr si el theme propio no existe con su `style.css`. Confirmar la ruta con el usuario antes de ejecutarlo.
2. **Contenido de ejemplo (manual, en el dashboard):** borrar la entrada "Hello world", la página de ejemplo, la de privacidad y el comentario, y vaciar la papelera.
3. **Enlaces permanentes:** Ajustes → Enlaces permanentes → "Nombre de la entrada". Verificar que se generó el `.htaccess`.

## Verificación

- `wp-content/plugins/` contiene solo `index.php`.
- `wp-content/themes/` contiene solo el theme propio (y `index.php`).
- Panel de plugins vacío y una sola entrada en Apariencia → Themes.
- El front responde 200 sin avisos con `WP_DEBUG` activo.

## Reglas

- Nada destructivo sin confirmar la ruta exacta.
- No tocar sitios que no sean el que se acaba de crear.
