---
name: theme-minimo
description: Crea el theme clásico mínimo de WordPress (style.css con cabecera + index.php) en wp-content/themes y lo deja listo para activar. Usar como primer paso del curso de theme desde cero, después de instalar WordPress y antes de borrar los themes de fábrica. Episodio 1.
---

# Episodio 1: El theme mínimo

Entradas: `NOMBRE-THEME` (nombre visible), `nombretheme` (slug de carpeta y text domain, minúsculas sin espacios).

Requisito: WordPress ya instalado con la skill `wp-instalar`.

## Flujo

1. Crear `wp-content/themes/nombretheme/`.
2. Copiar `templates/style.css` y `templates/index.php`, reemplazando `NOMBRE-THEME` y `nombretheme`.
3. Activar en Apariencia → Themes. Verificar que el front muestra título y contenido y que no hay avisos con `WP_DEBUG` activo.

## Reglas

- Solo `Theme Name` es obligatorio en `style.css`; el resto de la cabecera se mantiene porque el theme final lo usará.
- `index.php` mínimo, sin lógica: el `functions.php` y los módulos llegan en episodios siguientes.
- No agregar CSS ni JS todavía; el encolado de assets es un episodio aparte.
- Si el usuario no define nombre, preguntar. No inventar una marca.
