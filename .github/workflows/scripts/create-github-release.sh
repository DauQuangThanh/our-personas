#!/usr/bin/env bash
set -euo pipefail

# create-github-release.sh
# Create a GitHub release with all template zip files
# Usage: create-github-release.sh <version>

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <version>" >&2
  exit 1
fi

VERSION="$1"

# Remove 'v' prefix from version for release title
VERSION_NO_V=${VERSION#v}

gh release create "$VERSION" \
  .genreleases/our-personas-template-copilot-sh-"$VERSION".zip \
  .genreleases/our-personas-template-copilot-ps-"$VERSION".zip \
  .genreleases/our-personas-template-claude-sh-"$VERSION".zip \
  .genreleases/our-personas-template-claude-ps-"$VERSION".zip \
  .genreleases/our-personas-template-gemini-sh-"$VERSION".zip \
  .genreleases/our-personas-template-gemini-ps-"$VERSION".zip \
  .genreleases/our-personas-template-cursor-agent-sh-"$VERSION".zip \
  .genreleases/our-personas-template-cursor-agent-ps-"$VERSION".zip \
  .genreleases/our-personas-template-opencode-sh-"$VERSION".zip \
  .genreleases/our-personas-template-opencode-ps-"$VERSION".zip \
  .genreleases/our-personas-template-qwen-sh-"$VERSION".zip \
  .genreleases/our-personas-template-qwen-ps-"$VERSION".zip \
  .genreleases/our-personas-template-windsurf-sh-"$VERSION".zip \
  .genreleases/our-personas-template-windsurf-ps-"$VERSION".zip \
  .genreleases/our-personas-template-codex-sh-"$VERSION".zip \
  .genreleases/our-personas-template-codex-ps-"$VERSION".zip \
  .genreleases/our-personas-template-kilocode-sh-"$VERSION".zip \
  .genreleases/our-personas-template-kilocode-ps-"$VERSION".zip \
  .genreleases/our-personas-template-auggie-sh-"$VERSION".zip \
  .genreleases/our-personas-template-auggie-ps-"$VERSION".zip \
  .genreleases/our-personas-template-roo-sh-"$VERSION".zip \
  .genreleases/our-personas-template-roo-ps-"$VERSION".zip \
  .genreleases/our-personas-template-codebuddy-sh-"$VERSION".zip \
  .genreleases/our-personas-template-codebuddy-ps-"$VERSION".zip \
  .genreleases/our-personas-template-amp-sh-"$VERSION".zip \
  .genreleases/our-personas-template-amp-ps-"$VERSION".zip \
  .genreleases/our-personas-template-q-sh-"$VERSION".zip \
  .genreleases/our-personas-template-q-ps-"$VERSION".zip \
  --title "Personas Templates - $VERSION_NO_V" \
  --notes-file release_notes.md
