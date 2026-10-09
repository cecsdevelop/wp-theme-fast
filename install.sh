#!/usr/bin/env bash
# Enlaza las skills y el agente del curso en ~/.claude (no copia: los cambios se reflejan al editar aquí).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="${HOME}/.claude/skills"
AGENTS_DIR="${HOME}/.claude/agents"
mkdir -p "$SKILLS_DIR" "$AGENTS_DIR"

for skill in "$ROOT"/skills/*/; do
  name="$(basename "$skill")"
  slug="${name#[0-9][0-9]-}"
  dest="$SKILLS_DIR/$slug"
  if [[ -e "$dest" || -L "$dest" ]]; then echo "Omitido (ya existe): $dest"; continue; fi
  ln -s "${skill%/}" "$dest" && echo "Skill: $slug"
done

for agent in "$ROOT"/agents/*.md; do
  dest="$AGENTS_DIR/$(basename "$agent")"
  if [[ -e "$dest" || -L "$dest" ]]; then echo "Omitido (ya existe): $dest"; continue; fi
  ln -s "$agent" "$dest" && echo "Agente: $(basename "$agent")"
done
