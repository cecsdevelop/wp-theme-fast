# Roadmap del curso

Regla: cada episodio se hace **a mano en cámara**, y su skill se escribe **después**, con lo que funcionó. Al añadir una skill, se agrega al agente `theme-builder` en su lugar del orden.

| Ep | Tema | Skill | Estado |
|---|---|---|---|
| 0a | Instalar WordPress | `wp-instalar` | Probada en un sitio descartable (MAMP, WordPress en español) |
| 1 | Theme mínimo | `theme-minimo` | Probada: WordPress lo reconoce y activa |
| 0b | Dejar WordPress vacío | `wp-limpio` | Probada: se niega sin theme propio y limpia correctamente |
| 2+ | Bootstrap, autoloader, módulos, assets, CPT, paneles | — | En preparación |

## Requisitos
- macOS con MAMP (Apache 8888, MySQL 8889) y Claude Code.
- Los scripts asumen las credenciales por defecto de MAMP; se pueden cambiar con `DB_USER`, `DB_PASS` y `DB_PORT`.
