<div align="center">
    <img src="./media/logo_small.webp" alt="Our Personas Logo"/>
    <h1>🌱 Our Personas - Organizing Us Rapidly</h1>
    <h3><em>Powering Team Synergy and Project Velocity.</em></h3>
</div>

<p align="center">
    <strong>An open-source toolkit ensures predictable results and reduces development overhead. Eliminate 'vibe coding' and focus strictly on your product roadmap and guaranteed outcomes. This allows for rapid feature shipping and validation.</strong>
</p>

<p align="center">
    <a href="https://github.com/dauquangthanh/our-personas/actions/workflows/release.yml"><img src="https://github.com/dauquangthanh/our-personas/actions/workflows/release.yml/badge.svg" alt="Release"/></a>
    <a href="https://github.com/dauquangthanh/our-personas/stargazers"><img src="https://img.shields.io/github/stars/dauquangthanh/our-personas?style=social" alt="GitHub stars"/></a>
    <a href="https://github.com/dauquangthanh/our-personas/blob/main/LICENSE"><img src="https://img.shields.io/github/license/dauquangthanh/our-personas" alt="License"/></a>
    <a href="https://dauquangthanh.github.io/our-personas/"><img src="https://img.shields.io/badge/docs-GitHub_Pages-blue" alt="Documentation"/></a>
</p>

---

## Table of Contents

- [🤔 What is Spec-Driven Development?](#-what-is-spec-driven-development)
- [⚡ Get Started](#-get-started)
- [🤖 Supported AI Agents](#-supported-ai-agents)
- [🔧 Personas CLI Reference](#-personas-cli-reference)
- [📚 Core Philosophy](#-core-philosophy)
- [🌟 Development Phases](#-development-phases)
- [🎯 Experimental Goals](#-experimental-goals)
- [🔧 Prerequisites](#-prerequisites)
- [📖 Learn More](#-learn-more)
- [📋 Detailed Process](#-detailed-process)
- [🔍 Troubleshooting](#-troubleshooting)
- [👥 Maintainers](#-maintainers)
- [💬 Support](#-support)
- [🙏 Acknowledgements](#-acknowledgements)
- [📄 License](#-license)

## 🤔 What is Spec-Driven Development?

Spec-Driven Development (SDD) reverses the traditional coding hierarchy. Instead of specifications being mere guides, they become **executable assets** that directly generate working implementations. Code no longer precedes the spec; the spec is the implementation.

## ⚡ Get Started

### 1. Install Personas CLI

Choose your preferred installation method:

#### Option 1: Persistent Installation (Recommended)

Install once and use everywhere:

```bash
uv tool install personas-cli --from git+https://github.com/dauquangthanh/our-personas.git
```

Then use the tool directly:

```bash
personas init <PROJECT_NAME>
personas check
```

To upgrade personas run:

```bash
uv tool install personas-cli --force --from git+https://github.com/dauquangthanh/our-personas.git
```

#### Option 2: One-time Usage

Run directly without installing:

```bash
uvx --from git+https://github.com/dauquangthanh/our-personas.git personas init <PROJECT_NAME>
```

**Benefits of persistent installation:**

- Tool stays installed and available in PATH
- No need to create shell aliases
- Better tool management with `uv tool list`, `uv tool upgrade`, `uv tool uninstall`
- Cleaner shell configuration

### 2. Establish project principles

Launch your AI assistant in the project directory. The `/personas.*` commands are available in the assistant.

Use the **`/personas.constitution`** command to create your project's governing principles and development guidelines that will guide all subsequent development.

```bash
/personas.constitution Create principles focused on code quality, testing standards, user experience consistency, and performance requirements
```

### 3. Create feature specifications

Use the **`/personas.specify`** command to describe what you want to build. Focus on the **what** and **why**, not the tech stack.

```bash
/personas.specify Build an application that can help me organize my photos in separate photo albums. Albums are grouped by date and can be re-organized by dragging and dropping on the main page. Albums are never in other nested albums. Within each album, photos are previewed in a tile-like interface.
```

### 4. Clarify requirements (optional but recommended)

Use **`/personas.clarify`** to resolve any ambiguities in your specification before planning.

```bash
/personas.clarify
```

### 5. Define system architecture

Use **`/personas.architect`** to establish your system's overall architecture, components, and infrastructure.

```bash
/personas.architect Design a single-page application with local storage, using a modular component architecture with clear separation between UI and data layers
```

### 6. Establish coding standards

Use **`/personas.standardize`** to define coding practices, testing requirements, and quality standards.

```bash
/personas.standardize Configure standards for vanilla JavaScript with ESLint, 80% test coverage using Vitest, and Prettier formatting
```

### 7. Create a technical implementation plan

Use the **`/personas.plan`** command to provide your tech stack and architecture choices.

```bash
/personas.plan The application uses Vite with minimal number of libraries. Use vanilla HTML, CSS, and JavaScript as much as possible. Images are not uploaded anywhere and metadata is stored in a local SQLite database.
```

### 8. Generate E2E test plan

Use **`/personas.test-plan`** to create a comprehensive E2E test plan based on user workflows from your quickstart guide.

```bash
/personas.test-plan
```

### 9. Break down into tasks

Use **`/personas.tasks`** to create an actionable task list from your implementation plan.

```bash
/personas.tasks
```

### 10. Analyze for consistency (optional but recommended)

Use **`/personas.analyze`** to validate consistency across all artifacts before implementation.

```bash
/personas.analyze
```

### 11. Execute implementation

Use **`/personas.implement`** to execute all tasks and build your feature according to the plan.

```bash
/personas.implement
```

### 12. Execute E2E tests

Use **`/personas.test`** to run E2E tests according to your test plan and generate a comprehensive test report.

```bash
/personas.test
```

For detailed step-by-step instructions, see our [comprehensive guide](./spec-driven.md).

## 🤖 Supported AI Agents

Our Personas supports **multiple AI agents simultaneously**. You can select one or more agents during initialization, and the CLI will set up the appropriate command structures for each selected agent.

| Agent                                                     | Support | Notes                                             |
|-----------------------------------------------------------|---------|---------------------------------------------------|
| [Claude Code](https://www.anthropic.com/claude-code)      | ✅ |                                                   |
| [GitHub Copilot](https://code.visualstudio.com/)          | ✅ |                                                   |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | ✅ |                                                   |
| [Cursor](https://cursor.sh/)                              | ✅ |                                                   |
| [Qwen Code](https://github.com/QwenLM/qwen-code)          | ✅ |                                                   |
| [opencode](https://opencode.ai/)                          | ✅ |                                                   |
| [Windsurf](https://windsurf.com/)                         | ✅ |                                                   |
| [Kilo Code](https://github.com/Kilo-Org/kilocode)         | ✅ |                                                   |
| [Auggie CLI](https://docs.augmentcode.com/cli/overview)   | ✅ |                                                   |
| [CodeBuddy CLI](https://www.codebuddy.ai/cli)             | ✅ |                                                   |
| [Roo Code](https://roocode.com/)                          | ✅ |                                                   |
| [Codex CLI](https://github.com/openai/codex)              | ✅ |                                                   |
| [Amazon Q Developer CLI](https://aws.amazon.com/developer/learning/q-developer-cli/) | ⚠️ | Amazon Q Developer CLI [does not support](https://github.com/aws/amazon-q-developer-cli/issues/3064) custom arguments for slash commands. |
| [Amp](https://ampcode.com/) | ✅ | |

**Multi-Agent Support**: When you run `personas init`, you can select multiple AI agents using the interactive menu (Space to toggle, Enter to confirm). The CLI will download and merge templates for all selected agents, allowing you to switch between different AI assistants seamlessly within the same project.

## 🔧 Personas CLI Reference

The `personas` command supports the following options:

### Commands

| Command     | Description                                                    |
|-------------|----------------------------------------------------------------|
| `init`      | Initialize a new Personas Project from the latest template      |
| `check`     | Check for installed tools (`git`, `claude`, `gemini`, `code`/`code-insiders`, `cursor-agent`, `windsurf`, `qwen`, `opencode`, `codex`) |

### `personas init` Arguments & Options

| Argument/Option        | Type     | Description                                                                  |
|------------------------|----------|------------------------------------------------------------------------------|
| `<project-name>`       | Argument | Name for your new project directory (optional if using `--here`, or use `.` for current directory) |
| `--ai`                 | Option   | Single AI agent to use: `claude`, `gemini`, `copilot`, `cursor-agent`, `qwen`, `opencode`, `codex`, `windsurf`, `kilocode`, `auggie`, `roo`, `codebuddy`, `amp`, or `q`. If not specified, an interactive multi-select menu will appear allowing you to choose multiple agents (default: `copilot` pre-selected). |
| `--script`             | Option   | Script variant to use: `sh` (bash/zsh) or `ps` (PowerShell)                 |
| `--ignore-agent-tools` | Flag     | Skip checks for AI agent tools like Claude Code                             |
| `--no-git`             | Flag     | Skip git repository initialization                                          |
| `--here`               | Flag     | Initialize project in the current directory instead of creating a new one   |
| `--force`              | Flag     | Force merge/overwrite when initializing in current directory (skip confirmation) |
| `--skip-tls`           | Flag     | Skip SSL/TLS verification (not recommended)                                 |
| `--debug`              | Flag     | Enable detailed debug output for troubleshooting                            |
| `--github-token`       | Option   | GitHub token for API requests (or set GH_TOKEN/GITHUB_TOKEN env variable)  |

### Examples

```bash
# Basic project initialization (interactive AI agent selection)
personas init my-project

# Initialize with specific AI assistant
personas init my-project --ai claude

# Initialize with multiple AI assistants (interactive selection will skip if --ai specified)
# Use interactive menu to select multiple agents
personas init my-project

# Initialize with Cursor support
personas init my-project --ai cursor-agent

# Initialize with Windsurf support
personas init my-project --ai windsurf

# Initialize with Amp support
personas init my-project --ai amp

# Initialize with PowerShell scripts (Windows/cross-platform)
personas init my-project --ai copilot --script ps

# Initialize in current directory (interactive AI selection)
personas init . 
# or use the --here flag
personas init --here

# Initialize in current directory with specific AI agent
personas init . --ai copilot
# or
personas init --here --ai copilot

# Force merge into current (non-empty) directory without confirmation
personas init . --force
# or
personas init --here --force

# Skip git initialization
personas init my-project --ai gemini --no-git

# Enable debug output for troubleshooting
personas init my-project --ai claude --debug

# Use GitHub token for API requests (helpful for corporate environments)
personas init my-project --ai claude --github-token ghp_your_token_here

# Check system requirements
personas check
```

### Available Slash Commands

After running `personas init`, your AI coding agent will have access to these slash commands for structured development:

#### Core Commands

Essential commands for the Spec-Driven Development workflow (in recommended order):

| Command                  | Description                                                           | When to Use |
|--------------------------|-----------------------------------------------------------------------|-------------|
| `/personas.constitution`  | Create or update project governing principles and development guidelines | First step: establish project values |
| `/personas.specify`       | Define what you want to build (requirements and user stories)        | After constitution: define features |
| `/personas.clarify`       | Clarify underspecified areas through structured questioning           | Optional: after specify, before architect |
| `/personas.architect`     | Define system architecture, components, and infrastructure            | After clarify: establish technical framework |
| `/personas.standardize`   | Establish coding standards, testing requirements, and quality practices | After architect: define implementation rules |
| `/personas.plan`          | Create technical implementation plans with your chosen tech stack     | After standards: plan feature implementation |
| `/personas.test-plan`     | Generate E2E test plan from user workflows in quickstart.md          | After plan: define E2E test scenarios |
| `/personas.tasks`         | Generate actionable task lists for implementation                     | After test-plan: break down into steps |
| `/personas.analyze`       | Cross-artifact consistency & coverage analysis                        | Optional: after tasks, before implement |
| `/personas.implement`     | Execute all tasks to build the feature according to the plan         | After analyze: build the feature |
| `/personas.test`          | Execute E2E tests and generate comprehensive test report              | After implement: validate user workflows |

#### Enhancement Commands

Additional commands for improved quality and validation:

| Command              | Description                                                           | When to Use |
|----------------------|-----------------------------------------------------------------------|-------------|
| `/personas.checklist` | Generate custom quality checklists for validating artifacts          | Any time: after specify, plan, or tasks |

### Environment Variables

| Variable         | Description                                                                                    |
|------------------|------------------------------------------------------------------------------------------------|
| `SPECIFY_FEATURE` | Override feature detection for non-Git repositories. Set to the feature directory name (e.g., `001-photo-albums`) to work on a specific feature when not using Git branches.<br/>**Must be set in the context of the agent you're working with prior to using `/personas.plan` or follow-up commands. |

## 📚 Core Philosophy

Spec-Driven Development is a structured process that emphasizes:

- **Intent-driven development** where specifications define the "*what*" before the "*how*"
- **Rich specification creation** using guardrails and organizational principles
- **Multi-step refinement** rather than one-shot code generation from prompts
- **Heavy reliance** on advanced AI model capabilities for specification interpretation

## 🌟 Development Phases

| Phase | Focus | Key Activities |
|-------|-------|----------------|
| **0-to-1 Development** ("Greenfield") | Generate from scratch | <ul><li>Start with high-level requirements</li><li>Generate specifications</li><li>Plan implementation steps</li><li>Build production-ready applications</li></ul> |
| **Creative Exploration** | Parallel implementations | <ul><li>Explore diverse solutions</li><li>Support multiple technology stacks & architectures</li><li>Experiment with UX patterns</li></ul> |
| **Iterative Enhancement** ("Brownfield") | Brownfield modernization | <ul><li>Add features iteratively</li><li>Modernize legacy systems</li><li>Adapt processes</li></ul> |

## 🎯 Experimental Goals

Our research and experimentation focus on:

### Technology independence

- Create applications using diverse technology stacks
- Validate the hypothesis that Spec-Driven Development is a process not tied to specific technologies, programming languages, or frameworks

### Enterprise constraints

- Demonstrate mission-critical application development
- Incorporate organizational constraints (cloud providers, tech stacks, engineering practices)
- Support enterprise design systems and compliance requirements

### User-centric development

- Build applications for different user cohorts and preferences
- Support various development approaches (from vibe-coding to AI-native development)

### Creative & iterative processes

- Validate the concept of parallel implementation exploration
- Provide robust iterative feature development workflows
- Extend processes to handle upgrades and modernization tasks

## 🔧 Prerequisites

- **Linux/macOS/Windows**
- [Supported](#-supported-ai-agents) AI coding agent.
- [uv](https://docs.astral.sh/uv/) for package management
- [Python 3.11+](https://www.python.org/downloads/)
- [Git](https://git-scm.com/downloads)

If you encounter issues with an agent, please open an issue so we can refine the integration.

## 📖 Learn More

- **[Complete Spec-Driven Development Methodology](./spec-driven.md)** - Deep dive into the full process
- **[Detailed Walkthrough](#-detailed-process)** - Step-by-step implementation guide

---

## 📋 Detailed Process

<details>
<summary>Click to expand the detailed step-by-step walkthrough</summary>

You can use the Personas CLI to bootstrap your project, which will bring in the required artifacts in your environment. Run:

```bash
personas init <project_name>
```

Or initialize in the current directory:

```bash
personas init .
# or use the --here flag
personas init --here
# Skip confirmation when the directory already has files
personas init . --force
# or
personas init --here --force
```

You will be prompted to select the AI agent you are using. You can also proactively specify it directly in the terminal:

```bash
personas init <project_name> --ai claude
personas init <project_name> --ai gemini
personas init <project_name> --ai copilot

# Or in current directory:
personas init . --ai claude
personas init . --ai codex

# or use --here flag
personas init --here --ai claude
personas init --here --ai codex

# Force merge into a non-empty current directory
personas init . --force --ai claude

# or
personas init --here --force --ai claude
```

The CLI will check if you have Claude Code, Gemini CLI, Cursor CLI, Qwen CLI, opencode, Codex CLI, or Amazon Q Developer CLI installed. If you do not, or you prefer to get the templates without checking for the right tools, use `--ignore-agent-tools` with your command:

```bash
personas init <project_name> --ai claude --ignore-agent-tools
```

### **STEP 1:** Establish project principles

Go to the project folder and run your AI agent. In our example, we're using `claude`.

You will know that things are configured correctly if you see the `/personas.constitution`, `/personas.specify`, `/personas.plan`, `/personas.test-plan`, `/personas.tasks`, `/personas.test`, and `/personas.implement` commands available.

The first step should be establishing your project's governing principles using the `/personas.constitution` command. This helps ensure consistent decision-making throughout all subsequent development phases:

```text
/personas.constitution Create principles focused on code quality, testing standards, user experience consistency, and performance requirements. Include governance for how these principles should guide technical decisions and implementation choices.
```

This step creates or updates the `.personas/memory/constitution.md` file with your project's foundational guidelines that the AI agent will reference during specification, planning, and implementation phases.

### **STEP 2:** Create project specifications

With your project principles established, you can now create the functional specifications. Use the `/personas.specify` command and then provide the concrete requirements for the project you want to develop.

>[!IMPORTANT]
>Be as explicit as possible about *what* you are trying to build and *why*. **Do not focus on the tech stack at this point**.

An example prompt:

```text
Develop Taskify, a team productivity platform. It should allow users to create projects, add team members,
assign tasks, comment and move tasks between boards in Kanban style. In this initial phase for this feature,
let's call it "Create Taskify," let's have multiple users but the users will be declared ahead of time, predefined.
I want five users in two different categories, one product manager and four engineers. Let's create three
different sample projects. Let's have the standard Kanban columns for the status of each task, such as "To Do,"
"In Progress," "In Review," and "Done." There will be no login for this application as this is just the very
first testing thing to ensure that our basic features are set up. For each task in the UI for a task card,
you should be able to change the current status of the task between the different columns in the Kanban work board.
You should be able to leave an unlimited number of comments for a particular card. You should be able to, from that task
card, assign one of the valid users. When you first launch Taskify, it's going to give you a list of the five users to pick
from. There will be no password required. When you click on a user, you go into the main view, which displays the list of
projects. When you click on a project, you open the Kanban board for that project. You're going to see the columns.
You'll be able to drag and drop cards back and forth between different columns. You will see any cards that are
assigned to you, the currently logged in user, in a different color from all the other ones, so you can quickly
see yours. You can edit any comments that you make, but you can't edit comments that other people made. You can
delete any comments that you made, but you can't delete comments anybody else made.
```

After this prompt is entered, you should see the AI agent kick off the planning and spec drafting process. It will also trigger some of the built-in scripts to set up the repository.

Once this step is completed, you should have a new branch created (e.g., `001-create-taskify`), as well as a new specification in the `specs/001-create-taskify` directory.

The produced specification should contain a set of user stories and functional requirements, as defined in the template.

At this stage, your project folder contents should resemble the following:

```text
└── .personas
    ├── memory
    │  └── constitution.md
    ├── scripts
    │  ├── check-prerequisites.sh
    │  ├── common.sh
    │  ├── create-new-feature.sh
    │  ├── setup-plan.sh
    │  └── update-agent-context.sh
    ├── specs
    │  └── 001-create-taskify
    │      └── spec.md
    └── templates
        ├── plan-template.md
        ├── spec-template.md
        └── tasks-template.md
```

### **STEP 3:** Functional specification clarification (optional but recommended)

With the baseline specification created, you can clarify any requirements that were not captured properly in the first attempt.

You should run the structured clarification workflow **before** defining architecture and planning to reduce rework downstream.

Use `/personas.clarify` for sequential, coverage-based questioning that records answers in a Clarifications section:

```text
/personas.clarify
```

Example additional refinement if needed:

```text
For each sample project or project that you create there should be a variable number of tasks between 5 and 15
tasks for each one randomly distributed into different states of completion. Make sure that there's at least
one task in each stage of completion.
```

You should also ask the AI agent to validate the **Review & Acceptance Checklist**, checking off items that pass the requirements. The following prompt can be used:

```text
Read the review and acceptance checklist, and check off each item in the checklist if the feature spec meets the criteria. Leave it empty if it does not.
```

It's important to use the interaction with the AI agent as an opportunity to clarify and ask questions around the specification - **do not treat its first attempt as final**.

### **STEP 4:** Define system architecture (recommended before planning)

Before creating detailed implementation plans, establish your system's overall architecture using the `/personas.architect` command:

```text
/personas.architect Design a web application with microservices architecture using Docker containers. 
Use PostgreSQL for data persistence, Redis for caching, and RabbitMQ for asynchronous messaging. 
Target MVP product level with basic monitoring and vertical scaling approach.
```

This step creates the `.personas/memory/architecture.md` file that documents:

- System components and their responsibilities
- Technology stack and versions
- Communication patterns between components
- Data architecture and persistence strategy
- Deployment and infrastructure approach
- Quality attribute targets (performance, availability, scalability)

The architecture serves as the technical framework that guides all subsequent implementation planning.

### **STEP 5:** Establish coding standards (recommended before planning)

After defining your architecture, establish consistent coding practices using the `/personas.standardize` command:

```text
/personas.standardize Configure standards for .NET 8 with xUnit for testing, 80% code coverage requirement, 
ESLint for code quality, automated security scanning with OWASP dependency check, and CI/CD pipeline 
with GitHub Actions.
```

This step creates the `.personas/memory/standards.md` file that defines:

- Testing requirements (frameworks, coverage targets, test types)
- Security practices (authentication, authorization, data validation)
- Code quality standards (linters, formatters, complexity limits)
- Documentation requirements
- CI/CD and deployment practices

The standards ensure consistent implementation quality across all features.

### **STEP 6:** Generate a plan

You can now be specific about the tech stack and other technical requirements. You can use the `/personas.plan` command that is built into the project template with a prompt like this:

```text
We are going to generate this using .NET Aspire, using Postgres as the database. The frontend should use
Blazor server with drag-and-drop task boards, real-time updates. There should be a REST API created with a projects API,
tasks API, and a notifications API.
```

The output of this step will include a number of implementation detail documents, with your directory tree resembling this:

```text
.
├── CLAUDE.md
├── memory
│  └── constitution.md
├── scripts
│  ├── check-prerequisites.sh
│  ├── common.sh
│  ├── create-new-feature.sh
│  ├── setup-plan.sh
│  └── update-claude-md.sh
├── specs
│  └── 001-create-taskify
│      ├── contracts
│      │  ├── api-spec.json
│      │  └── signalr-spec.md
│      ├── data-model.md
│      ├── plan.md
│      ├── quickstart.md
│      ├── research.md
│      └── spec.md
└── templates
    ├── CLAUDE-template.md
    ├── plan-template.md
    ├── spec-template.md
    └── tasks-template.md
```

Check the `research.md` document to ensure that the right tech stack is used, based on your instructions. You can ask Claude Code to refine it if any of the components stand out, or even have it check the locally-installed version of the platform/framework you want to use (e.g., .NET).

Additionally, you might want to ask Claude Code to research details about the chosen tech stack if it's something that is rapidly changing (e.g., .NET Aspire, JS frameworks), with a prompt like this:

```text
I want you to go through the implementation plan and implementation details, looking for areas that could
benefit from additional research as .NET Aspire is a rapidly changing library. For those areas that you identify that
require further research, I want you to update the research document with additional details about the specific
versions that we are going to be using in this Taskify application and spawn parallel research tasks to clarify
any details using research from the web.
```

During this process, you might find that Claude Code gets stuck researching the wrong thing - you can help nudge it in the right direction with a prompt like this:

```text
I think we need to break this down into a series of steps. First, identify a list of tasks
that you would need to do during implementation that you're not sure of or would benefit
from further research. Write down a list of those tasks. And then for each one of these tasks,
I want you to spin up a separate research task so that the net results is we are researching
all of those very specific tasks in parallel. What I saw you doing was it looks like you were
researching .NET Aspire in general and I don't think that's gonna do much for us in this case.
That's way too untargeted research. The research needs to help you solve a specific targeted question.
```

>[!NOTE]
>Claude Code might be over-eager and add components that you did not ask for. Ask it to clarify the rationale and the source of the change.

### **STEP 5:** Have Claude Code validate the plan

With the plan in place, you should have Claude Code run through it to make sure that there are no missing pieces. You can use a prompt like this:

```text
Now I want you to go and audit the implementation plan and the implementation detail files.
Read through it with an eye on determining whether or not there is a sequence of tasks that you need
to be doing that are obvious from reading this. Because I don't know if there's enough here. For example,
when I look at the core implementation, it would be useful to reference the appropriate places in the implementation
details where it can find the information as it walks through each step in the core implementation or in the refinement.
```

This helps refine the implementation plan and helps you avoid potential blind spots that Claude Code missed in its planning cycle. Once the initial refinement pass is complete, ask Claude Code to go through the checklist once more before you can get to the implementation.

You can also ask Claude Code (if you have the [GitHub CLI](https://docs.github.com/en/github-cli/github-cli) installed) to go ahead and create a pull request from your current branch to `main` with a detailed description, to make sure that the effort is properly tracked.

>[!NOTE]
>Before you have the agent implement it, it's also worth prompting Claude Code to cross-check the details to see if there are any over-engineered pieces (remember - it can be over-eager). If over-engineered components or decisions exist, you can ask Claude Code to resolve them. Ensure that Claude Code follows the [constitution](base/memory/constitution.md) as the foundational piece that it must adhere to when establishing the plan.

### **STEP 6:** Generate E2E test plan with /personas.test-plan

With the implementation plan validated, generate a comprehensive E2E test plan based on user workflows. Use the `/personas.test-plan` command to automatically create test scenarios from your quickstart guide:

```text
/personas.test-plan
```

This step creates a `test-plan.md` file in your feature specification directory that contains:

- **User workflow analysis** - Extracts and analyzes user workflows from quickstart.md
- **E2E test strategy** - Defines E2E test framework, browser coverage, and execution approach (from standards.md)
- **E2E test scenarios** - Generates test cases for each user workflow including happy paths, edge cases, error handling, and alternative paths
- **Test data requirements** - Defines user accounts, fixtures, and mock services needed for testing
- **Test environment requirements** - Specifies infrastructure, browser matrix, and CI/CD integration (from architecture.md)

The generated test-plan.md ensures comprehensive E2E testing coverage aligned with your architecture and standards.

### **STEP 7:** Generate task breakdown with /personas.tasks

With the test plan in place, you can now break down the implementation plan into specific, actionable tasks that can be executed in the correct order. Use the `/personas.tasks` command to automatically generate a detailed task breakdown from your implementation plan:

```text
/personas.tasks
```

This step creates a `tasks.md` file in your feature specification directory that contains:

- **Task breakdown organized by user story** - Each user story becomes a separate implementation phase with its own set of tasks
- **Dependency management** - Tasks are ordered to respect dependencies between components (e.g., models before services, services before endpoints)
- **Parallel execution markers** - Tasks that can run in parallel are marked with `[P]` to optimize development workflow
- **File path specifications** - Each task includes the exact file paths where implementation should occur
- **Test-driven development structure** - If tests are requested, test tasks are included and ordered to be written before implementation
- **Checkpoint validation** - Each user story phase includes checkpoints to validate independent functionality

The generated tasks.md provides a clear roadmap for the `/personas.implement` command, ensuring systematic implementation that maintains code quality and allows for incremental delivery of user stories.

### **STEP 8:** Implementation

Once ready, use the `/personas.implement` command to execute your implementation plan:

```text
/personas.implement
```

The `/personas.implement` command will:

- Validate that all prerequisites are in place (constitution, spec, plan, and tasks)
- Parse the task breakdown from `tasks.md`
- Execute tasks in the correct order, respecting dependencies and parallel execution markers
- Follow the TDD approach defined in your task plan
- Provide progress updates and handle errors appropriately

>[!IMPORTANT]
>The AI agent will execute local CLI commands (such as `dotnet`, `npm`, etc.) - make sure you have the required tools installed on your machine.

Once the implementation is complete, test the application and resolve any runtime errors that may not be visible in CLI logs (e.g., browser console errors). You can copy and paste such errors back to your AI agent for resolution.

### **STEP 9:** Execute E2E tests with /personas.test

After implementation is complete, run E2E tests to validate user workflows. Use the `/personas.test` command to execute tests according to your test plan:

```text
/personas.test
```

The `/personas.test` command will:

- Validate that the test environment matches test-plan.md requirements
- Execute E2E tests for all user workflows defined in test-plan.md
- Capture test artifacts (screenshots, videos, traces) for failures
- Generate a comprehensive test report in `test-report.md` with:
  - Test results by workflow (pass/fail status)
  - Browser compatibility issues
  - Flaky test identification
  - Performance issues in user workflows
  - Recommendations for fixes and improvements

The test report provides complete traceability from test-plan.md to actual test execution results, helping you identify and fix issues before deployment.

</details>

---

## 🔍 Troubleshooting

### Git Credential Manager on Linux

If you're having issues with Git authentication on Linux, you can install Git Credential Manager:

```bash
#!/usr/bin/env bash
set -e
echo "Downloading Git Credential Manager v2.6.1..."
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.deb
echo "Installing Git Credential Manager..."
sudo dpkg -i gcm-linux_amd64.2.6.1.deb
echo "Configuring Git to use GCM..."
git config --global credential.helper manager
echo "Cleaning up..."
rm gcm-linux_amd64.2.6.1.deb
```

## 👥 Maintainers

- Dau Quang Thanh ([@dauquangthanh](https://github.com/dauquangthanh))

## 💬 Support

For support, please open a [GitHub issue](https://github.com/dauquangthanh/our-personas/issues/new). We welcome bug reports, feature requests, and questions about using Spec-Driven Development.

## 🙏 Acknowledgements

This project is heavily influenced by and based on the work and research of [John Lam](https://github.com/jflam).

## 📄 License

This project is licensed under the terms of the MIT open source license. Please refer to the [LICENSE](./LICENSE) file for the full terms.
