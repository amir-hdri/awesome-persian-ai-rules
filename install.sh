#!/usr/bin/env bash
# ==============================================================================
# Persian Agent Rules - Universal Installer
# Repository: https://github.com/amir-hdri/persian-agent-rules
# License: MIT
# ==============================================================================

set -e

RAW_BASE="https://raw.githubusercontent.com/amir-hdri/persian-agent-rules/main"
TARGET_DIR="."
AGENT="all"
GLOBAL=false

usage() {
  cat << EOF
🇮🇷 Persian Agent Rules Installer

Usage:
  ./install.sh [OPTIONS]
  curl -fsSL $RAW_BASE/install.sh | bash -s -- [OPTIONS]

Options:
  --target <path>       Target workspace directory (default: current directory)
  --agent <agent>       Target agent to configure:
                        all (default), cursor, claude, opencode, antigravity, windsurf, copilot
  --global              Install globally for Antigravity (~/.gemini/config/rules) or Claude (~/.claude)
  -h, --help            Show this help message

Examples:
  # One-line install for current project:
  curl -fsSL $RAW_BASE/install.sh | bash

  # Configure Cursor only:
  ./install.sh --agent cursor

  # Configure all agents in a specific project:
  ./install.sh --target ~/GitHub/my-project --agent all
EOF
  exit 0
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      TARGET_DIR="$2"
      shift 2
      ;;
    --agent)
      AGENT="$2"
      shift 2
      ;;
    --global)
      GLOBAL=true
      shift
      ;;
    -h|--help)
      usage
      ;;
    *)
      echo "Unknown argument: $1"
      usage
      ;;
  esac
done

TARGET_DIR="$(cd "$TARGET_DIR" 2>/dev/null && pwd || echo "$TARGET_DIR")"
mkdir -p "$TARGET_DIR"

# Resolve source files: local or fetch remote
TEMP_DIR=""
clean_temp() {
  if [ -n "$TEMP_DIR" ] && [ -d "$TEMP_DIR" ]; then
    rm -rf "$TEMP_DIR"
  fi
}
trap clean_temp EXIT

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || true)"

get_source_file() {
  local rel_path="$1"
  if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/$rel_path" ]; then
    echo "$SCRIPT_DIR/$rel_path"
  else
    if [ -z "$TEMP_DIR" ]; then
      TEMP_DIR="$(mktemp -d)"
    fi
    local dest_file="$TEMP_DIR/$rel_path"
    mkdir -p "$(dirname "$dest_file")"
    curl -fsSL "$RAW_BASE/$rel_path" -o "$dest_file"
    echo "$dest_file"
  fi
}

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  🇮🇷  Configuring Persian Agent Rules"
echo "  Target Directory: $TARGET_DIR"
echo "  Selected Agent:   $AGENT"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

install_cursor() {
  echo "• Configuring Cursor..."
  local cursor_file
  local mdc_file
  cursor_file="$(get_source_file "adapters/cursor/.cursorrules")"
  mdc_file="$(get_source_file "adapters/cursor/rules/persian-style.mdc")"
  
  cp "$cursor_file" "$TARGET_DIR/.cursorrules"
  mkdir -p "$TARGET_DIR/.cursor/rules"
  cp "$mdc_file" "$TARGET_DIR/.cursor/rules/persian-style.mdc"
  echo "  ✓ .cursorrules created"
  echo "  ✓ .cursor/rules/persian-style.mdc created"
}

install_claude() {
  echo "• Configuring Claude Code..."
  local claude_file
  claude_file="$(get_source_file "adapters/claude/CLAUDE.md")"
  local dest="$TARGET_DIR/CLAUDE.md"
  
  if [ "$GLOBAL" = true ]; then
    mkdir -p "$HOME/.claude"
    dest="$HOME/.claude/CLAUDE.md"
  fi

  if [ -f "$dest" ]; then
    if ! grep -q "Persian Response" "$dest"; then
      echo -e "\n\n" >> "$dest"
      cat "$claude_file" >> "$dest"
    fi
  else
    cp "$claude_file" "$dest"
  fi
  echo "  ✓ $dest updated"
}

install_opencode() {
  echo "• Configuring OpenCode & Cairn..."
  local opencode_file
  opencode_file="$(get_source_file "adapters/opencode/AGENTS.md")"
  local dest="$TARGET_DIR/AGENTS.md"

  if [ -f "$dest" ]; then
    if ! grep -q "Persian Typography" "$dest"; then
      echo -e "\n\n" >> "$dest"
      cat "$opencode_file" >> "$dest"
    fi
  else
    cp "$opencode_file" "$dest"
  fi
  echo "  ✓ $dest updated"
}

install_antigravity() {
  echo "• Configuring Google Antigravity..."
  local agy_file
  agy_file="$(get_source_file "adapters/antigravity/persian-typography.md")"
  
  if [ "$GLOBAL" = true ]; then
    mkdir -p "$HOME/.gemini/config/rules"
    cp "$agy_file" "$HOME/.gemini/config/rules/persian-typography.md"
    echo "  ✓ ~/.gemini/config/rules/persian-typography.md (Global) installed"
  else
    mkdir -p "$TARGET_DIR/.gemini/rules"
    cp "$agy_file" "$TARGET_DIR/.gemini/rules/persian-typography.md"
    echo "  ✓ $TARGET_DIR/.gemini/rules/persian-typography.md (Workspace) installed"
  fi
}

install_windsurf() {
  echo "• Configuring Windsurf Cascade..."
  local windsurf_file
  windsurf_file="$(get_source_file "adapters/windsurf/.windsurfrules")"
  cp "$windsurf_file" "$TARGET_DIR/.windsurfrules"
  echo "  ✓ .windsurfrules installed"
}

install_copilot() {
  echo "• Configuring GitHub Copilot..."
  local copilot_file
  copilot_file="$(get_source_file "adapters/copilot/copilot-instructions.md")"
  mkdir -p "$TARGET_DIR/.github"
  cp "$copilot_file" "$TARGET_DIR/.github/copilot-instructions.md"
  echo "  ✓ .github/copilot-instructions.md installed"
}

case "$AGENT" in
  cursor)
    install_cursor
    ;;
  claude)
    install_claude
    ;;
  opencode)
    install_opencode
    ;;
  antigravity)
    install_antigravity
    ;;
  windsurf)
    install_windsurf
    ;;
  copilot)
    install_copilot
    ;;
  all)
    install_cursor
    install_claude
    install_opencode
    install_antigravity
    install_windsurf
    install_copilot
    ;;
  *)
    echo "Error: Unknown agent type '$AGENT'"
    exit 1
    ;;
esac

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✨ Persian Agent Rules successfully installed!"
echo "⭐️ Star the repo: https://github.com/amir-hdri/persian-agent-rules"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
