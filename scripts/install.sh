#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_ROOT="$REPO_ROOT/skills"
PROFILES_ROOT="$REPO_ROOT/profiles"
EXPLICIT="${1:-}"
shift || true
PROFILES=("${@:-shanghai-primary-it}")

resolve_skill_root() {
  if [[ -n "$EXPLICIT" ]]; then printf '%s\n' "$EXPLICIT"; return; fi
  if [[ -d "$HOME/.agents" ]]; then printf '%s\n' "$HOME/.agents/skills"; return; fi
  if [[ -n "${CODEX_HOME:-}" ]]; then printf '%s\n' "$CODEX_HOME/skills"; return; fi
  if [[ -d "$HOME/.codex/skills" ]]; then printf '%s\n' "$HOME/.codex/skills"; return; fi
  printf '%s\n' "$HOME/.agents/skills"
}

SKILL_ROOT="$(resolve_skill_root)"
mkdir -p "$SKILL_ROOT"
STAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_ROOT="$SKILL_ROOT/.backups/china-k12-teacher-skills/$STAMP"

for source in "$SOURCE_ROOT"/*; do
  [[ -d "$source" ]] || continue
  name="$(basename "$source")"
  target="$SKILL_ROOT/$name"

  if [[ -e "$target" ]]; then
    mkdir -p "$BACKUP_ROOT"
    cp -R "$target" "$BACKUP_ROOT/$name"
    rm -rf "$target"
  fi

  cp -R "$source" "$target"
  mkdir -p "$target/references/profiles"

  for profile in "${PROFILES[@]}"; do
    profile_source="$PROFILES_ROOT/$profile"
    [[ -d "$profile_source" ]] || { echo "Unknown profile: $profile" >&2; exit 1; }
    cp -R "$profile_source" "$target/references/profiles/$profile"
  done

  [[ -f "$target/SKILL.md" ]] || { echo "SKILL.md missing: $target" >&2; exit 1; }
done

echo "Installed China K12 Teacher Skills to: $SKILL_ROOT"
[[ -d "$BACKUP_ROOT" ]] && echo "Backups: $BACKUP_ROOT"
echo "Profiles: ${PROFILES[*]}"
find "$SOURCE_ROOT" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sed 's/^/ - /'
