#!/usr/bin/env bash
# Persian Agent Rules - Universal Installer
# Installs Persian typography and BiDi rules into your workspace or global agent configs.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="."
AGENT="all"

usage() {
  cat << EOF
Usage: ./install.sh [OPTIONS]

Options:
  --target <path>       Target workspace directory (default: current directory)
  --agent <agent>       Target agent to configure:
                        all (default), cursor, claude, opencode, antigravity, windsurf, copilot
  -h, --help            Show this help message

Examples:
  ./install.sh --target /path/to/my-project --agent cursor
  ./install.sh --agent all
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
    -h|--help)
      usage
      ;;
    *)
      echo "Unknown argument: $1"
      usage
      ;;
  esac
done

TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"
echo "Configuring Persian Agent Rules..."
echo "Target Directory: $TARGET_DIR"
echo "Target Agent: $AGENT"

install_cursor() {
  echo "Installing Cursor rules..."
  cp "$SCRIPT_DIR/adapters/cursor/.cursorrules" "$TARGET_DIR/.cursorrules"
  mkdir -p "$TARGET_DIR/.cursor/rules"
  cp "$SCRIPT_DIR/adapters/cursor/rules/persian-style.mdc" "$TARGET_DIR/.cursor/rules/persian-style.mdc"
  echo "  ✓ .cursorrules & .cursor/rules/persian-style.mdc installed"
}

install_claude() {
  echo "Installing Claude Code rules..."
  if [ -f "$TARGET_DIR/CLAUDE.md" ]; then
    echo -e "\n\n" >> "$TARGET_DIR/CLAUDE.md"
    cat "$SCRIPT_DIR/adapters/claude/CLAUDE.md" >> "$TARGET_DIR/CLAUDE.md"
  else
    cp "$SCRIPT_DIR/adapters/claude/CLAUDE.md" "$TARGET_DIR/CLAUDE.md"
  fi
  echo "  ✓ CLAUDE.md configured"
}

install_opencode() {
  echo "Installing OpenCode / AGENTS.md..."
  if [ -f "$TARGET_DIR/AGENTS.md" ]; then
    echo -e "\n\n" >> "$TARGET_DIR/AGENTS.md"
    cat "$SCRIPT_DIR/adapters/opencode/AGENTS.md" >> "$TARGET_DIR/AGENTS.md"
  else
    cp "$SCRIPT_DIR/adapters/opencode/AGENTS.md" "$TARGET_DIR/AGENTS.md"
  fi
  echo "  ✓ AGENTS.md configured"
}

install_antigravity() {
  echo "Installing Antigravity rules..."
  mkdir -p "$TARGET_DIR/.gemini/rules"
  cp "$SCRIPT_DIR/adapters/antigravity/persian-typography.md" "$TARGET_DIR/.gemini/rules/persian-typography.md"
  echo "  ✓ .gemini/rules/persian-typography.md configured"
}

install_windsurf() {
  echo "Installing Windsurf rules..."
  cp "$SCRIPT_DIR/adapters/windsurf/.windsurfrules" "$TARGET_DIR/.windsurfrules"
  echo "  ✓ .windsurfrules installed"
}

install_copilot() {
  echo "Installing GitHub Copilot rules..."
  mkdir -p "$TARGET_DIR/.github"
  cp "$SCRIPT_DIR/adapters/copilot/copilot-instructions.md" "$TARGET_DIR/.github/copilot-instructions.md"
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

echo ""
echo "Successfully configured Persian Agent Rules for $AGENT in $TARGET_DIR!"
