#!/usr/bin/env bash

set -e

# Parse command line arguments
JSON_MODE=false
ARGS=()

for arg in "$@"; do
    case "$arg" in
        --json) 
            JSON_MODE=true 
            ;;
        --help|-h) 
            echo "Usage: $0 [--json]"
            echo "  --json    Output results in JSON format"
            echo "  --help    Show this help message"
            exit 0 
            ;;
        *) 
            ARGS+=("$arg") 
            ;;
    esac
done

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Check if we're in a git repository
HAS_GIT="false"
CURRENT_BRANCH=""
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    HAS_GIT="true"
    CURRENT_BRANCH=$(git branch --show-current 2>/dev/null || echo "")
fi

# Validate ground-rules.md exists
GROUND_RULES="$REPO_ROOT/memory/ground-rules.md"
if [[ ! -f "$GROUND_RULES" ]]; then
    echo "Error: Ground rules not found at $GROUND_RULES" >&2
    echo "Please run /personas.regulate first to establish project principles" >&2
    exit 1
fi

# Ensure d-docs directory exists
DDOCS_DIR="$REPO_ROOT/d-docs"
mkdir -p "$DDOCS_DIR"

# Ensure checklists subdirectory exists
mkdir -p "$DDOCS_DIR/checklists"

# Architecture document path
ARCH_DOC="$DDOCS_DIR/architecture.md"

# Output results
if $JSON_MODE; then
    printf '{"ARCH_DOC":"%s","REPO_ROOT":"%s","CURRENT_BRANCH":"%s","HAS_GIT":"%s"}\n' \
        "$ARCH_DOC" "$REPO_ROOT" "$CURRENT_BRANCH" "$HAS_GIT"
else
    echo "ARCH_DOC: $ARCH_DOC"
    echo "REPO_ROOT: $REPO_ROOT"
    echo "CURRENT_BRANCH: $CURRENT_BRANCH"
    echo "HAS_GIT: $HAS_GIT"
fi
