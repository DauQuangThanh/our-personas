# Local Development Guide

This guide shows how to iterate on the `personas` CLI locally without publishing a release or committing to `main` first.

> Scripts now have both Bash (`.sh`) and PowerShell (`.ps1`) variants. The CLI auto-selects based on OS unless you pass `--script sh|ps`.

## 1. Clone and Switch Branches

```bash
git clone https://github.com/dauquangthanh/our-personas.git
cd our-personas
# Work on a feature branch
git checkout -b your-feature-branch
```

## 2. Run the CLI Directly (Fastest Feedback)

You can execute the CLI via the module entrypoint without installing anything:

```bash
# From repo root
python -m src.personas_cli --help
python -m src.personas_cli init demo-project --ai claude --ignore-agent-tools --script sh
```

If you prefer invoking the script file style (uses shebang):

```bash
python src/personas_cli/__init__.py init demo-project --script ps
```

### 2a. Additional CLI Options

The `init` command supports additional flags for advanced use cases:

```bash
# Force initialization in non-empty directory (skip confirmation)
python -m src.personas_cli init --here --force --ai claude

# Enable debug output for troubleshooting network/download issues
python -m src.personas_cli init demo-project --ai gemini --debug

# Explicitly provide GitHub token (avoids rate limiting)
python -m src.personas_cli init demo-project --github-token ghp_xxx...
# Or use environment variables: GH_TOKEN or GITHUB_TOKEN
export GITHUB_TOKEN=ghp_xxx...
python -m src.personas_cli init demo-project --ai claude
```

### 2b. Supported AI Assistants

The CLI supports 14 AI assistants. Use `--ai` flag with any of these values:

| Value | Assistant | Folder | Requires CLI Tool |
|-------|-----------|--------|-------------------|
| `copilot` | GitHub Copilot | `.github/` | No |
| `claude` | Claude Code | `.claude/` | Yes |
| `gemini` | Gemini CLI | `.gemini/` | Yes |
| `cursor-agent` | Cursor | `.cursor/` | No |
| `qwen` | Qwen Code | `.qwen/` | Yes |
| `opencode` | opencode | `.opencode/` | Yes |
| `codex` | Codex CLI | `.codex/` | Yes |
| `windsurf` | Windsurf | `.windsurf/` | No |
| `kilocode` | Kilo Code | `.kilocode/` | No |
| `auggie` | Auggie CLI | `.augment/` | Yes |
| `codebuddy` | CodeBuddy CLI | `.codebuddy/` | Yes |
| `roo` | Roo Code | `.roo/` | No |
| `q` | Amazon Q Developer | `.amazonq/` | Yes |
| `amp` | Amp | `.agents/` | Yes |

**Note**: If "Requires CLI Tool" is Yes, the CLI will check for the tool's installation. Use `--ignore-agent-tools` to skip these checks during development.

### 2c. Using Local Templates (Development)

When developing the CLI or templates locally, you can skip GitHub downloads and use local files directly. This mirrors the same pre-processing logic from `.github/workflows/scripts/create-release-packages.sh`.

```bash
# Auto-detect repo root and use local files
python -m src.personas_cli init demo --local-templates --ai claude --script sh

# Specify custom template path
python -m src.personas_cli init demo --local-templates --template-path /path/to/our-personas --ai gemini

# Use environment variables for convenience
export PERSONAS_USE_LOCAL_TEMPLATES=1
export PERSONAS_TEMPLATE_PATH=/Users/you/our-personas
python -m src.personas_cli init demo --ai claude

# With editable install
uv pip install -e .
export PERSONAS_USE_LOCAL_TEMPLATES=1
personas init test-project --ai copilot --script ps

# Initialize in current directory with local templates
python -m src.personas_cli init --here --local-templates --ai claude --script sh
```

**What happens with local templates:**

The CLI replicates the release packaging process locally:

- Creates `.personas/` subdirectory containing:
  - `memory/` → `.personas/memory/`
  - `scripts/bash/` or `scripts/powershell/` → `.personas/scripts/`
  - `templates/` (excluding commands) → `.personas/templates/`
- Copies `d-docs/` to project root
- Generates agent-specific commands from `templates/commands/*.md`:
  - Extracts YAML frontmatter (description, script commands)
  - Replaces placeholders: `{SCRIPT}`, `{AGENT_SCRIPT}`, `{ARGS}`, `__AGENT__`
  - Rewrites paths to match `.personas/` structure
  - Outputs to agent-specific folders (`.claude/commands/`, `.github/prompts/`, etc.)
- Handles agent-specific files (e.g., `.vscode/settings.json` for copilot)

**Benefits:**

- ⚡ **Faster** - No network delays or GitHub rate limits
- 🔒 **Offline** - Works without internet connection
- 🎯 **Accurate** - Test template changes immediately before release
- ♾️ **Consistent** - Matches production release structure exactly

**Environment Variables:**

- `PERSONAS_USE_LOCAL_TEMPLATES=1` - Enable local template mode
- `PERSONAS_TEMPLATE_PATH=/path/to/repo` - Custom source location

## 3. Use Editable Install (Isolated Environment)

Create an isolated environment using `uv` so dependencies resolve exactly like end users get them:

```bash
# Create & activate virtual env (uv auto-manages .venv)
uv venv
source .venv/bin/activate  # or on Windows PowerShell: .venv\Scripts\Activate.ps1

# Install project in editable mode
uv pip install -e .

# Now 'personas' entrypoint is available
personas --help
```

Re-running after code edits requires no reinstall because of editable mode.

## 4. Invoke with uvx Directly From Git (Current Branch)

`uvx` can run from a local path (or a Git ref) to simulate user flows:

```bash
uvx --from . personas init demo-uvx --ai copilot --ignore-agent-tools --script sh
```

You can also point uvx at a specific branch without merging:

```bash
# Push your working branch first
git push origin your-feature-branch
uvx --from git+https://github.com/dauquangthanh/our-personas.git@your-feature-branch personas init demo-branch-test --script ps
```

### 4a. Absolute Path uvx (Run From Anywhere)

If you're in another directory, use an absolute path instead of `.`:

```bash
uvx --from /mnt/c/GitHub/our-personas personas --help
uvx --from /mnt/c/GitHub/our-personas personas init demo-anywhere --ai copilot --ignore-agent-tools --script sh
```

Set an environment variable for convenience:

```bash
export OUR_PERSONAS_SRC=/mnt/c/GitHub/our-personas
uvx --from "$OUR_PERSONAS_SRC" personas init demo-env --ai copilot --ignore-agent-tools --script ps
```

(Optional) Define a shell function:

```bash
personas-dev() { uvx --from /mnt/c/GitHub/our-personas personas "$@"; }
# Then
personas-dev --help
```

## 5. Testing Script Permission Logic

After running an `init`, check that shell scripts are executable on POSIX systems:

```bash
ls -l scripts | grep .sh
# Expect owner execute bit (e.g. -rwxr-xr-x)
```

On Windows you will instead use the `.ps1` scripts (no chmod needed).

## 6. Run Lint / Basic Checks (Add Your Own)

Currently no enforced lint config is bundled, but you can quickly sanity check importability:

```bash
python -c "import personas_cli; print('Import OK')"
```

## 7. Build a Wheel Locally (Optional)

Validate packaging before publishing:

```bash
uv build
ls dist/
```

Install the built artifact into a fresh throwaway environment if needed.

## 8. Using a Temporary Workspace

When testing `init --here` in a dirty directory, create a temp workspace:

```bash
mkdir /tmp/spec-test && cd /tmp/spec-test
python -m src.personas_cli init --here --ai claude --ignore-agent-tools --script sh  # if repo copied here
```

Or copy only the modified CLI portion if you want a lighter sandbox.

## 9. Debug Network / TLS Skips

If you need to bypass TLS validation while experimenting:

```bash
personas check --skip-tls
personas init demo --skip-tls --ai gemini --ignore-agent-tools --script ps
```

(Use only for local experimentation.)

## 10. Rapid Edit Loop Summary

| Action | Command |
|--------|---------|
| Run CLI directly | `python -m src.personas_cli --help` |
| Editable install | `uv pip install -e .` then `personas ...` |
| Local uvx run (repo root) | `uvx --from . personas ...` |
| Local uvx run (abs path) | `uvx --from /mnt/c/GitHub/our-personas personas ...` |
| Git branch uvx | `uvx --from git+URL@branch personas ...` |
| Build wheel | `uv build` |
| Force init in current dir | `personas init --here --force --ai claude` |
| Debug network issues | `personas init demo --debug` |
| With GitHub token | `personas init demo --github-token $GITHUB_TOKEN` |
| Use local templates | `python -m src.personas_cli init demo --local-templates --ai claude` |
| Local templates + custom path | `personas init demo --local-templates --template-path /path/to/repo` |
| Local templates via env var | `PERSONAS_USE_LOCAL_TEMPLATES=1 personas init demo` |

## 11. Cleaning Up

Remove build artifacts / virtual env quickly:

```bash
rm -rf .venv dist build *.egg-info
```

## 12. Common Issues

| Symptom | Fix |
|---------|-----|
| `ModuleNotFoundError: typer` | Run `uv pip install -e .` |
| Scripts not executable (Linux) | Re-run init or `chmod +x scripts/*.sh` |
| Git step skipped | You passed `--no-git` or Git not installed |
| Wrong script type downloaded | Pass `--script sh` or `--script ps` explicitly |
| TLS errors on corporate network | Try `--skip-tls` (not for production) |
| GitHub API rate limit exceeded | Set `GH_TOKEN` or `GITHUB_TOKEN` env var, or use `--github-token` |
| Need to skip merge confirmation | Use `--force` flag with `--here` option |
| Download/extraction failing | Use `--debug` flag to see detailed error information |

## 13. Next Steps

- Update docs and run through Quick Start using your modified CLI
- Open a PR when satisfied
- (Optional) Tag a release once changes land in `main`
