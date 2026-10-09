# wp-theme-fast
Theme de WordPress rápido de construir y rápido de renderizar: sin plugins, sin maquetadores, a punta de prompts.

Serie "WordPress a Código Puro". Cada episodio se construye en cámara y deja una skill reutilizable; un agente las ejecuta todas en orden.

```
skills/      una skill por episodio (prefijo numérico = orden)
agents/      theme-builder: orquesta las skills
install.sh   enlaza skills y agente en ~/.claude
ROADMAP.md   estado y orden
```

## Requisitos
- macOS con MAMP (Apache 8888, MySQL 8889).
- Claude Code.

## Instalación
```bash
git clone https://github.com/cecsdevelop/wp-theme-fast.git ~/wp-theme-fast
cd ~/wp-theme-fast && ./install.sh
```
No lo clones dentro de `htdocs`: es la herramienta, no un sitio. `install.sh` enlaza las skills y el agente en `~/.claude` y no sobrescribe nada que ya exista.

## Uso
Abre una sesión **nueva** de Claude Code (las skills se cargan al iniciar) y pide, por ejemplo: "Usa el agente theme-builder para montar un sitio llamado X con el theme Y". El agente pregunta nombre del sitio, del theme y text domain antes de ejecutar nada, y se detiene en el instalador web para que lo completes tú.

Los scripts de `skills/00-wp-instalar/scripts/` y `skills/02-wp-limpio/scripts/` también se pueden usar sin IA.
