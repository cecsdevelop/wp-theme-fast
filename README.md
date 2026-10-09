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

## Uso
```bash
./install.sh
```
Después, pedir al agente `theme-builder` que monte el sitio y el theme. Antes de ejecutar nada, el agente pregunta nombre del sitio, del theme y text domain.

Los scripts de `skills/00-wp-limpio/scripts/` también se pueden usar sin IA.
