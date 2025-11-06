#!/usr/bin/env pwsh
# Setup test plan for a feature

[CmdletBinding()]
param(
    [switch]$Json,
    [switch]$Help
)

$ErrorActionPreference = 'Stop'

# Show help if requested
if ($Help) {
    Write-Output "Usage: ./setup-test-plan.ps1 [-Json] [-Help]"
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

# Define test-plan specific paths
$testPlan = Join-Path $paths.FEATURE_DIR 'test-plan.md'
$implPlan = Join-Path $paths.FEATURE_DIR 'plan.md'

# Check if implementation plan exists
if (-not (Test-Path $implPlan)) {
    Write-Error "Implementation plan not found at $implPlan"
    Write-Output "Please run /personas.plan first to create the implementation plan"
    exit 1
}

# Copy test-plan template if it exists, otherwise note it or create empty file
$template = Join-Path $paths.REPO_ROOT '.personas/templates/test-plan-template.md'
if (Test-Path $template) {
    Copy-Item $template $testPlan -Force
    Write-Output "Copied test-plan template to $testPlan"
} else {
    Write-Warning "Test plan template not found at $template"
    # Create a basic test-plan file if template doesn't exist
    New-Item -ItemType File -Path $testPlan -Force | Out-Null
}

# Output results
if ($Json) {
    $result = [PSCustomObject]@{
        IMPL_PLAN = $implPlan
        TEST_PLAN = $testPlan
        SPECS_DIR = $paths.FEATURE_DIR
        BRANCH = $paths.CURRENT_BRANCH
        HAS_GIT = $paths.HAS_GIT
    }
    $result | ConvertTo-Json -Compress
} else {
    Write-Output "IMPL_PLAN: $implPlan"
    Write-Output "TEST_PLAN: $testPlan"
    Write-Output "SPECS_DIR: $($paths.FEATURE_DIR)"
    Write-Output "BRANCH: $($paths.CURRENT_BRANCH)"
    Write-Output "HAS_GIT: $($paths.HAS_GIT)"
}
