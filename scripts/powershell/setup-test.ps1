#!/usr/bin/env pwsh
# Setup test execution for a feature

[CmdletBinding()]
param(
    [switch]$Json,
    [switch]$Help
)

$ErrorActionPreference = 'Stop'

# Show help if requested
if ($Help) {
    Write-Output "Usage: ./setup-test.ps1 [-Json] [-Help]"
    Write-Output "  -Json     Output results in JSON format"
    Write-Output "  -Help     Show this help message"
    exit 0
}

# Load common functions
. "$PSScriptRoot/common.ps1"

# Get all paths and variables from common functions
$paths = Get-FeaturePathsEnv

# Check if we're on a proper feature branch (only for git repos)
if (-not (Test-FeatureBranch -Branch $paths.CURRENT_BRANCH -HasGit $paths.HAS_GIT)) {
    exit 1
}

# Ensure the feature directory exists
New-Item -ItemType Directory -Path $paths.FEATURE_DIR -Force | Out-Null

# Define test-specific paths
$testPlan = Join-Path $paths.FEATURE_DIR 'test-spec.md'
$testReport = Join-Path $paths.FEATURE_DIR 'test-report.md'
$testArtifactsDir = Join-Path $paths.FEATURE_DIR 'test-artifacts'

# Check if test spec exists
if (-not (Test-Path $testPlan)) {
    Write-Error "Test spec not found at $testPlan"
    Write-Output "Please run /personas.design-test first to create the test spec"
    exit 1
}

# Create test artifacts directory structure for E2E tests
New-Item -ItemType Directory -Path $testArtifactsDir -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $testArtifactsDir 'logs') -Force | Out-Null
$e2eDir = Join-Path $testArtifactsDir 'e2e'
New-Item -ItemType Directory -Path $e2eDir -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $e2eDir 'screenshots') -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $e2eDir 'videos') -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $e2eDir 'traces') -Force | Out-Null

# Copy test-report template if it exists, otherwise note it or create empty file
$template = Join-Path $paths.REPO_ROOT '.personas/templates/test-report-template.md'
if (Test-Path $template) {
    Copy-Item $template $testReport -Force
    Write-Output "Copied test-report template to $testReport"
} else {
    Write-Warning "Test report template not found at $template"
    # Create a basic test-report file if template doesn't exist
    New-Item -ItemType File -Path $testReport -Force | Out-Null
}

# Output results
if ($Json) {
    $result = [PSCustomObject]@{
        TEST_SPEC = $testPlan
        TEST_REPORT = $testReport
        TEST_ARTIFACTS_DIR = $testArtifactsDir
        SPECS_DIR = $paths.FEATURE_DIR
        BRANCH = $paths.CURRENT_BRANCH
        HAS_GIT = $paths.HAS_GIT
    }
    $result | ConvertTo-Json -Compress
} else {
    Write-Output "TEST_SPEC: $testPlan"
    Write-Output "TEST_REPORT: $testReport"
    Write-Output "TEST_ARTIFACTS_DIR: $testArtifactsDir"
    Write-Output "SPECS_DIR: $($paths.FEATURE_DIR)"
    Write-Output "BRANCH: $($paths.CURRENT_BRANCH)"
    Write-Output "HAS_GIT: $($paths.HAS_GIT)"
}
