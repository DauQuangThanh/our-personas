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

# Define test-specific paths
TEST_SPEC="$FEATURE_DIR/test-spec.md"
TEST_REPORT="$FEATURE_DIR/test-report.md"
TEST_ARTIFACTS_DIR="$FEATURE_DIR/test-artifacts"

# Check if test spec exists
if [[ ! -f "$TEST_SPEC" ]]; then
    echo "Error: Test spec not found at $TEST_SPEC"
    echo "Please run /personas.design-test first to create the test spec"
    exit 1
fi

# Create test artifacts directory for E2E tests
mkdir -p "$TEST_ARTIFACTS_DIR"
mkdir -p "$TEST_ARTIFACTS_DIR/logs"
mkdir -p "$TEST_ARTIFACTS_DIR/e2e/screenshots"
mkdir -p "$TEST_ARTIFACTS_DIR/e2e/videos"
mkdir -p "$TEST_ARTIFACTS_DIR/e2e/traces"

# Copy test-report template if it exists
TEMPLATE="$REPO_ROOT/.personas/templates/test-report-template.md"
if [[ -f "$TEMPLATE" ]]; then
    cp "$TEMPLATE" "$TEST_REPORT"
    echo "Copied test-report template to $TEST_REPORT"
else
    echo "Warning: Test report template not found at $TEMPLATE"
    # Create a basic test-report file if template doesn't exist
    touch "$TEST_REPORT"
fi

# Output results
if $JSON_MODE; then
    printf '{"TEST_SPEC":"%s","TEST_REPORT":"%s","TEST_ARTIFACTS_DIR":"%s","SPECS_DIR":"%s","BRANCH":"%s","HAS_GIT":"%s"}\n' \
        "$TEST_SPEC" "$TEST_REPORT" "$TEST_ARTIFACTS_DIR" "$FEATURE_DIR" "$CURRENT_BRANCH" "$HAS_GIT"
else
    echo "TEST_SPEC: $TEST_SPEC"
    echo "TEST_REPORT: $TEST_REPORT"
    echo "TEST_ARTIFACTS_DIR: $TEST_ARTIFACTS_DIR"
    echo "SPECS_DIR: $FEATURE_DIR"
    echo "BRANCH: $CURRENT_BRANCH"
    echo "HAS_GIT: $HAS_GIT"
fi
