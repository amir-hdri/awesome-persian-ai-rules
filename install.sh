#!/usr/bin/env bash
# ==============================================================================
# Persian Agent Rules - Universal Installer
# Repository: https://github.com/amir-hdri/awesome-persian-ai-rules
# License: MIT
# ==============================================================================

set -euo pipefail

RAW_BASE="https://raw.githubusercontent.com/amir-hdri/awesome-persian-ai-rules/main"
TARGET_DIR="."
AGENT="all"
GLOBAL=false
UNINSTALL=false
MARK_BEGIN="<!-- BEGIN awesome-persian-ai-rules -->"
MARK_END="<!-- END awesome-persian-ai-rules -->"

usage() {
  local code="${1:-0}"
  cat << EOF
🇮🇷 Persian Agent Rules Installer

Usage:
  ./install.sh [OPTIONS]
  curl -fsSL $RAW_BASE/install.sh | bash -s -- [OPTIONS]

Options:
  --target <path>       Target workspace directory (default: current directory)
  --agent <agent>       Target agent to configure:
                        all (default), cursor, claude, opencode, antigravity, windsurf, copilot
  --global              Install globally for Antigravity (~/.gemini/config/rules)
                        or Claude Code (~/.claude/CLAUDE.md)
  --uninstall           Remove previously installed rule files instead of installing
  -h, --help            Show this help message

Notes:
  - Existing config files are backed up to <file>.bak.YYYYmmddHHMMSS before
    being overwritten.
  - Appends to CLAUDE.md / AGENTS.md are wrapped in markers so --uninstall
    can strip exactly the added block.

Examples:
  # One-line install for current project:
  curl -fsSL $RAW_BASE/install.sh | bash

  # Configure Cursor only:
  ./install.sh --agent cursor

  # Remove the rules again:
  ./install.sh --agent cursor --uninstall
EOF
  exit "$code"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      TARGET_DIR="${2:---target requires a directory path}"
      shift 2
      ;;
    --agent)
      AGENT="${2:---agent requires an agent name}"
      shift 2
      ;;
    --global)
      GLOBAL=true
      shift
      ;;
    --uninstall)
      UNINSTALL=true
      shift
      ;;
    -h|--help)
      usage 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage 1
      ;;
  esac
done

if [[ "$UNINSTALL" != true ]]; then
  TARGET_DIR="$(cd "$TARGET_DIR" 2>/dev/null && pwd || echo "$TARGET_DIR")"
  mkdir -p "$TARGET_DIR"
fi

# Resolve source files: local or fetch remote
TEMP_DIR=""
clean_temp() {
  if [[ -n "${TEMP_DIR:-}" && -d "$TEMP_DIR" ]]; then
    rm -rf "$TEMP_DIR"
  fi
}
trap clean_temp EXIT

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-.}")" 2>/dev/null && pwd || true)"

get_source_file() {
  local rel_path="$1"
  if [[ -n "$SCRIPT_DIR" && -f "$SCRIPT_DIR/$rel_path" ]]; then
    echo "$SCRIPT_DIR/$rel_path"
  else
    if [[ -z "${TEMP_DIR:-}" ]]; then
      TEMP_DIR="$(mktemp -d)"
    fi
    local dest_file="$TEMP_DIR/$rel_path"
    mkdir -p "$(dirname "$dest_file")"
    curl -fsSL --retry 3 "$RAW_BASE/$rel_path" -o "$dest_file"
    echo "$dest_file"
  fi
}

manifest_file() { echo "$1/.persian-ai-rules/manifest"; }

record_installed() { # $1 = base dir, $2 = "type:path"
  local m
  m="$(manifest_file "$1")"
  mkdir -p "$(dirname "$m")"
  printf '%s\n' "$2" >> "$m"
}

backup_if_exists() { # $1 = file
  if [[ -f "$1" ]]; then
    local bak="$1.bak.$(date +%Y%m%d%H%M%S)"
    cp "$1" "$bak"
    echo "  ! existing file backed up to $bak"
  fi
}

# Wholesale file install (backs up any existing file first)
install_file() { # $1 = src, $2 = dest, $3 = base dir
  backup_if_exists "$2"
  mkdir -p "$(dirname "$2")"
  cp "$1" "$2"
  record_installed "$3" "file:$2"
  echo "  ✓ $2 installed"
}

# Append adapter content wrapped in markers (skips if already present)
append_marked() { # $1 = src, $2 = dest, $3 = base dir, $4 = legacy check string
  mkdir -p "$(dirname "$2")"
  if [[ -f "$2" ]] && { grep -qF "$MARK_BEGIN" "$2" || grep -qF "$4" "$2"; }; then
    echo "  = rules already present in $2, skipping"
    return
  fi
  {
    echo ""
    echo "$MARK_BEGIN"
    cat "$1"
    echo "$MARK_END"
  } >> "$2"
  record_installed "$3" "append:$2"
  echo "  ✓ $2 updated"
}

strip_marked() { # $1 = file
  if [[ -f "$1" ]] && grep -qF "$MARK_BEGIN" "$1"; then
    sed -i "/$MARK_BEGIN/,/$MARK_END/d" "$1"
    echo "  ✗ stripped rules block from $1"
  elif [[ -f "$1" ]]; then
    echo "  ! $1 has no marked block (installed by an older version?) - left untouched"
  fi
}

do_uninstall() { # $1 = base dir
  local m
  m="$(manifest_file "$1")"
  if [[ ! -f "$m" ]]; then
    return
  fi
  echo "• Uninstalling from $1 ..."
  while IFS= read -r line; do
    local type="${line%%:*}"
    local path="${line#*:}"
    if [[ "$type" == "file" ]]; then
      if [[ -f "$path" ]]; then
        rm -f "$path"
        echo "  ✗ removed $path"
      fi
    elif [[ "$type" == "append" ]]; then
      strip_marked "$path"
    fi
  done < "$m"
  rm -f "$m"
  rmdir "$1/.persian-ai-rules" 2>/dev/null || true
}

base_for() { # $1 = agent -> prints base dir
  case "$1" in
    claude)
      if [[ "$GLOBAL" == true ]]; then echo "$HOME/.claude"; else echo "$TARGET_DIR"; fi
      ;;
    antigravity)
      if [[ "$GLOBAL" == true ]]; then echo "$HOME/.gemini/config/rules"; else echo "$TARGET_DIR"; fi
      ;;
    *)
      echo "$TARGET_DIR"
      ;;
  esac
}

install_cursor() {
  local base="$1"
  echo "• Configuring Cursor..."
  install_file "$(get_source_file "adapters/cursor/.cursorrules")" "$base/.cursorrules" "$base"
  install_file "$(get_source_file "adapters/cursor/rules/persian-style.mdc")" "$base/.cursor/rules/persian-style.mdc" "$base"
}

install_claude() {
  local base="$1"
  echo "• Configuring Claude Code..."
  local dest="$base/CLAUDE.md"
  append_marked "$(get_source_file "adapters/claude/CLAUDE.md")" "$dest" "$base" \
    "# Persian Response & BiDi Guidelines for Claude Code"
}

install_opencode() {
  local base="$1"
  echo "• Configuring OpenCode & Cairn..."
  local dest="$base/AGENTS.md"
  append_marked "$(get_source_file "adapters/opencode/AGENTS.md")" "$dest" "$base" \
    "# Persian Typography and Response Rules for OpenCode"
}

install_antigravity() {
  local base="$1"
  echo "• Configuring Google Antigravity..."
  if [[ "$GLOBAL" == true ]]; then
    install_file "$(get_source_file "adapters/antigravity/persian-typography.md")" \
      "$base/persian-typography.md" "$base"
  else
    install_file "$(get_source_file "adapters/antigravity/persian-typography.md")" \
      "$base/.gemini/rules/persian-typography.md" "$base"
  fi
}

install_windsurf() {
  local base="$1"
  echo "• Configuring Windsurf Cascade..."
  install_file "$(get_source_file "adapters/windsurf/.windsurfrules")" "$base/.windsurfrules" "$base"
}

install_copilot() {
  local base="$1"
  echo "• Configuring GitHub Copilot..."
  install_file "$(get_source_file "adapters/copilot/copilot-instructions.md")" \
    "$base/.github/copilot-instructions.md" "$base"
}

run_agent() { # $1 = agent, $2 = mode (install|uninstall)
  local base
  base="$(base_for "$1")"
  if [[ "$2" == "uninstall" ]]; then
    do_uninstall "$base"
    return
  fi
  case "$1" in
    cursor)      install_cursor "$base" ;;
    claude)      install_claude "$base" ;;
    opencode)    install_opencode "$base" ;;
    antigravity) install_antigravity "$base" ;;
    windsurf)    install_windsurf "$base" ;;
    copilot)     install_copilot "$base" ;;
    *)
      echo "Error: Unknown agent type '$1'" >&2
      exit 1
      ;;
  esac
}

ALL_AGENTS="cursor claude opencode antigravity windsurf copilot"

if [[ "$UNINSTALL" == true ]]; then
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "  🇮🇷  Removing Persian Agent Rules"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  if [[ "$AGENT" == "all" ]]; then
    # shellcheck disable=SC2086
    for a in $ALL_AGENTS; do run_agent "$a" uninstall; done
  else
    run_agent "$AGENT" uninstall
  fi
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "✨ Uninstall complete."
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  exit 0
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  🇮🇷  Configuring Persian Agent Rules"
echo "  Target Directory: $TARGET_DIR"
echo "  Selected Agent:   $AGENT"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [[ "$AGENT" == "all" ]]; then
  # shellcheck disable=SC2086
  for a in $ALL_AGENTS; do run_agent "$a" install; done
else
  run_agent "$AGENT" install
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✨ Persian Agent Rules successfully installed!"
echo "⭐️ Star the repo: https://github.com/amir-hdri/awesome-persian-ai-rules"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
