#!/usr/bin/env pwsh
# Setup architecture document paths and validate prerequisites

[CmdletBinding()]
param(
    [switch]$Json,
    [switch]$Help
)

$ErrorActionPreference = 'Stop'

# Show help if requested
if ($Help) {
    Write-Output "Usage: ./setup-arch.ps1 [-Json] [-Help]"
    Write-Output "  -Json     Output results in JSON format"
    Write-Output "  -Help     Show this help message"
    exit 0
}

# Get repository root
$scriptDir = Split-Path -Parent $PSCommandPath
$repoRoot = Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $scriptDir))

# Check if we're in a git repository
$hasGit = $false
$currentBranch = ""
try {
    git rev-parse --is-inside-work-tree 2>$null | Out-Null
    $hasGit = $true
    $currentBranch = git branch --show-current 2>$null
    if (-not $currentBranch) { $currentBranch = "" }
} catch {
    $hasGit = $false
}

# Validate ground-rules.md exists
$groundRules = Join-Path $repoRoot 'memory/ground-rules.md'
if (-not (Test-Path $groundRules)) {
    Write-Error "Ground rules not found at $groundRules"
    Write-Error "Please run /personas.regulate first to establish project principles"
    exit 1
}

# Ensure d-docs directory exists
$ddocsDir = Join-Path $repoRoot 'd-docs'
New-Item -ItemType Directory -Path $ddocsDir -Force | Out-Null

# Ensure checklists subdirectory exists
$checklistsDir = Join-Path $ddocsDir 'checklists'
New-Item -ItemType Directory -Path $checklistsDir -Force | Out-Null

# Architecture document path
$archDoc = Join-Path $ddocsDir 'architecture.md'

# Output results
if ($Json) {
    $result = [PSCustomObject]@{ 
        ARCH_DOC = $archDoc
        REPO_ROOT = $repoRoot
        CURRENT_BRANCH = $currentBranch
        HAS_GIT = $hasGit.ToString().ToLower()
    }
    $result | ConvertTo-Json -Compress
} else {
    Write-Output "ARCH_DOC: $archDoc"
    Write-Output "REPO_ROOT: $repoRoot"
    Write-Output "CURRENT_BRANCH: $currentBranch"
    Write-Output "HAS_GIT: $($hasGit.ToString().ToLower())"
}
