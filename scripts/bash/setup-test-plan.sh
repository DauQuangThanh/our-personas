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

# Get script directory and load common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Get all paths and variables from common functions
eval $(get_feature_paths)

# Check if we're on a proper feature branch (only for git repos)
check_feature_branch "$CURRENT_BRANCH" "$HAS_GIT" || exit 1

# Ensure the feature directory exists
mkdir -p "$FEATURE_DIR"

# Define test-plan specific path
TEST_PLAN="$FEATURE_DIR/test-plan.md"
IMPL_PLAN="$FEATURE_DIR/plan.md"

# Check if implementation plan exists
if [[ ! -f "$IMPL_PLAN" ]]; then
    echo "Error: Implementation plan not found at $IMPL_PLAN"
    echo "Please run /personas.plan first to create the implementation plan"
    exit 1
fi

# Copy test-plan template if it exists
TEMPLATE="$REPO_ROOT/.personas/templates/test-plan-template.md"
if [[ -f "$TEMPLATE" ]]; then
    cp "$TEMPLATE" "$TEST_PLAN"
    echo "Copied test-plan template to $TEST_PLAN"
else
    echo "Warning: Test plan template not found at $TEMPLATE"
    # Create a basic test-plan file if template doesn't exist
    touch "$TEST_PLAN"
fi

# Output results
if $JSON_MODE; then
    printf '{"IMPL_PLAN":"%s","TEST_PLAN":"%s","SPECS_DIR":"%s","BRANCH":"%s","HAS_GIT":"%s"}\n' \
        "$IMPL_PLAN" "$TEST_PLAN" "$FEATURE_DIR" "$CURRENT_BRANCH" "$HAS_GIT"
else
    echo "IMPL_PLAN: $IMPL_PLAN"
    echo "TEST_PLAN: $TEST_PLAN"
    echo "SPECS_DIR: $FEATURE_DIR"
    echo "BRANCH: $CURRENT_BRANCH"
    echo "HAS_GIT: $HAS_GIT"
fi
