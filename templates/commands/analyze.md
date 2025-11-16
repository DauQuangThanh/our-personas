---
description: Perform a non-destructive cross-artifact consistency and quality analysis across spec.md, design.md, and tasks.md after task generation.
scripts:
  sh: scripts/bash/check-prerequisites.sh --json --require-tasks --include-tasks
  ps: scripts/powershell/check-prerequisites.ps1 -Json -RequireTasks -IncludeTasks
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Goal

Identify inconsistencies, duplications, ambiguities, and underspecified items across the core artifacts (`spec.md`, `design.md`, `tasks.md`) and foundational documents (`ground-rules.md`, `architecture.md`, `standards.md`) before implementation. This command MUST run only after `/personas.taskify` has successfully produced a complete `tasks.md`.

## Operating Constraints

**STRICTLY READ-ONLY**: Do **not** modify any files. Output a structured analysis report. Offer an optional remediation plan (user must explicitly approve before any follow-up editing commands would be invoked manually).

## Authority Hierarchy

This analysis enforces a strict authority hierarchy where governance documents have different levels of authority:

### 1. SUPREME AUTHORITY: Ground Rules (`/d-docs/ground-rules.md`)

**The project ground rules are THE AUTHORITATIVE STANDARD and are ABSOLUTELY NON-NEGOTIABLE.**

- Ground rules define the fundamental principles and constraints that govern the entire project
- **NOTHING in any other artifact (spec, design, tasks, architecture, standards, company guidelines) can contradict or violate ground rules**
- Ground rules violations are **ALWAYS CRITICAL** priority and MUST be fixed immediately
- The spec, design, tasks, architecture, standards, and company guidelines must ALL align with ground rules
- If ANY conflict exists between ground rules and any other document, ground rules ALWAYS win
- Ground rules can ONLY be changed through explicit `/personas.regulate` command execution
- **NEVER suggest diluting, reinterpreting, or ignoring a ground rules principle**
- Any deviation from ground rules requires:
  1. Stopping analysis
  2. Flagging as CRITICAL violation
  3. Recommending correction of the violating artifact (never the ground rules)
  4. If ground rules need changing, that's a separate governance decision outside this analysis

### 2. Architecture Authority (`/d-docs/architecture.md`)

- Defines the technical framework and component boundaries (subject to ground rules)
- Conflicts with architectural decisions are HIGH severity
- Must align with ground rules principles

### 3. Standards Authority (`/d-docs/standards.md`)

- Defines implementation practices and quality requirements (subject to ground rules)
- Violations of mandatory standards are MEDIUM-HIGH severity
- Must align with ground rules principles

### 4. Company Guidelines (`/d-docs/company/`)

- Organizational governance and best practices (subject to ground rules)
- Must align with ground rules principles
- Violations are MEDIUM-HIGH severity depending on context

## Execution Steps

### 1. Initialize Analysis Context

Run `{SCRIPT}` once from repo root and parse JSON for FEATURE_DIR and AVAILABLE_DOCS. Derive absolute paths:

- SPEC = FEATURE_DIR/spec.md
- PLAN = FEATURE_DIR/design.md
- TASKS = FEATURE_DIR/tasks.md

Abort with an error message if any required file is missing (instruct the user to run missing prerequisite command).
For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

### 2. Load Company Guidelines

Load organizational governance guidelines from `/d-docs/company/` (if exists):

- **Architecture Guidelines**: `/d-docs/company/architecture/architecture-guidelines.md`
  - Component design standards
  - Technology stack guidelines
  - Communication patterns
  - Quality attribute targets

- **Requirements Guidelines**: `/d-docs/company/requirements/requirements-guidelines.md`
  - Requirements quality standards
  - Documentation requirements
  - Acceptance criteria guidelines
  - Traceability requirements

- **Design Guidelines**: `/d-docs/company/design/design-guidelines.md`
  - Design decision documentation standards
  - Technical design patterns
  - Phase breakdown guidelines
  - Dependency management

- **Coding Guidelines**: `/d-docs/company/coding/coding-guidelines.md`
  - Code quality standards
  - Testing requirements
  - Security practices
  - Documentation standards

- **Testing Guidelines**: `/d-docs/company/testing/testing-guidelines.md`
  - Test coverage requirements
  - Test scenario standards
  - Test automation guidelines
  - Quality gates

Apply these company guidelines throughout the analysis to validate compliance with organizational governance.

### 3. Load Artifacts (Progressive Disclosure)

Load only the minimal necessary context from each artifact:

**From spec.md:**

- Overview/Context
- Functional Requirements
- Non-Functional Requirements
- User Stories
- Edge Cases (if present)

**From design.md:**

- Architecture/stack choices
- Data Model references
- Phases
- Technical constraints

**From tasks.md:**

- Task IDs
- Descriptions
- Phase grouping
- Parallel markers [P]
- Referenced file paths

**From ground rules:**

- Load `/d-docs/ground-rules.md` for principle validation
- **CRITICAL**: Ground rules are THE AUTHORITATIVE STANDARD - extract ALL principles, constraints, and MUST/SHOULD requirements
- Every principle in ground rules is non-negotiable and must be validated against all artifacts

**From architecture (if exists):**

- Load `/d-docs/architecture.md` for:
  - System components and their responsibilities
  - Technology stack and versions
  - Communication patterns between components
  - Data architecture and persistence strategy
  - Deployment and infrastructure approach
  - Quality attribute targets (performance, availability, scalability)

**From standards (if exists):**

- Load `/d-docs/standards.md` for:
  - Testing requirements (frameworks, coverage targets, test types)
  - Security practices (authentication, authorization, data validation)
  - Code quality standards (linters, formatters, complexity limits)
  - Documentation requirements
  - CI/CD and deployment practices

### 4. Build Semantic Models

Create internal representations (do not include raw artifacts in output):

- **Requirements inventory**: Each functional + non-functional requirement with a stable key (derive slug based on imperative phrase; e.g., "User can upload file" → `user-can-upload-file`)
- **User story/action inventory**: Discrete user actions with acceptance criteria
- **Task coverage mapping**: Map each task to one or more requirements or stories (inference by keyword / explicit reference patterns like IDs or key phrases)
- **Ground rules rule set**: Extract ALL principle names and MUST/SHOULD normative statements - this is THE AUTHORITATIVE STANDARD against which everything else is validated
- **Architecture constraints**: Extract component definitions, technology choices, communication patterns, and quality targets (if architecture.md exists) - must not conflict with ground rules
- **Standards requirements**: Extract mandatory testing, security, and code quality requirements (if standards.md exists) - must not conflict with ground rules
- **Company guidelines alignment**: Extract company-specific governance requirements from loaded guidelines (if company guidelines exist) - must not conflict with ground rules

### 5. Detection Passes (Token-Efficient Analysis)

Focus on high-signal findings. Limit to 50 findings total; aggregate remainder in overflow summary.

#### A. Duplication Detection

- Identify near-duplicate requirements
- Mark lower-quality phrasing for consolidation

#### B. Ambiguity Detection

- Flag vague adjectives (fast, scalable, secure, intuitive, robust) lacking measurable criteria
- Flag unresolved placeholders (TODO, TKTK, ???, `<placeholder>`, etc.)

#### C. Underspecification

- Requirements with verbs but missing object or measurable outcome
- User stories missing acceptance criteria alignment
- Tasks referencing files or components not defined in spec/plan

#### D. Ground Rules Alignment (SUPREME AUTHORITY - HIGHEST PRIORITY)

**Ground rules violations are ALWAYS CRITICAL and must be fixed immediately.**

- Any requirement, plan element, or task conflicting with a ground rules MUST principle
- Missing mandated sections or quality gates from ground rules
- Any terminology, constraint, or decision that contradicts ground rules
- Any attempt to dilute, reinterpret, or work around ground rules principles
- Violations of ground rules SHOULD principles (document as HIGH severity)

**REMEMBER**: Ground rules are THE STANDARD. If there's a conflict:

- ❌ DO NOT suggest modifying ground rules
- ❌ DO NOT suggest "exceptions" or "workarounds"
- ✅ ALWAYS recommend fixing the spec/design/tasks to align with ground rules
- ✅ If ground rules need changing, that requires explicit `/personas.regulate` command

#### E. Company Guidelines Alignment (if company guidelines exist)

- **Architecture Guidelines**: Plan or tasks conflicting with company architecture standards
- **Requirements Guidelines**: Requirements not meeting company quality standards or traceability requirements
- **Design Guidelines**: Design decisions not following company design patterns or documentation standards
- **Coding Guidelines**: Tasks not reflecting company code quality or testing requirements
- **Testing Guidelines**: Test scenarios or coverage not meeting company testing standards

#### F. Architecture Alignment (if architecture.md exists)

- Plan or tasks referencing components not defined in architecture
- Technology choices conflicting with architecture's technology stack
- Communication patterns not matching architecture's defined patterns
- Tasks adding new components without architectural justification
- Quality targets in spec not aligned with architecture's targets
- Data model in plan conflicting with architecture's data strategy

#### G. Standards Compliance (if standards.md exists)

- Tasks missing required testing tasks (unit tests, integration tests)
- Testing coverage targets not met in task breakdown
- Security practices not reflected in tasks (auth, validation, encryption)
- Code quality checks not included in task workflow
- Documentation tasks missing when required by standards
- CI/CD tasks not aligned with standards' deployment practices

#### H. Coverage Gaps

- Requirements with zero associated tasks
- Tasks with no mapped requirement/story
- Non-functional requirements not reflected in tasks (e.g., performance, security)

#### I. Inconsistency

- Terminology drift (same concept named differently across files)
- Data entities referenced in plan but absent in spec (or vice versa)
- Task ordering contradictions (e.g., integration tasks before foundational setup tasks without dependency note)
- Conflicting requirements (e.g., one requires Next.js while other specifies Vue)

### 6. Severity Assignment

Use this heuristic to prioritize findings (in order of severity):

**AUTHORITY HIERARCHY FOR VIOLATIONS:**

1. **Ground Rules** (SUPREME) → Always CRITICAL
2. **Company Guidelines MUST** → CRITICAL
3. **Architecture** → HIGH
4. **Company Guidelines SHOULD** → HIGH
5. **Standards** → MEDIUM-HIGH
6. **Other Issues** → MEDIUM/LOW

**Severity Definitions:**

- **CRITICAL**:
  - **ANY violation of ground rules MUST principles** (ground rules are THE STANDARD - no exceptions)
  - Violation of ground rules SHOULD principles (if HIGH impact)
  - Violation of company guidelines MUST requirements
  - Missing core spec artifact
  - Requirement with zero coverage that blocks baseline functionality
  - **Action Required**: MUST be fixed before proceeding - ground rules violations cannot be deployed

- **HIGH**:
  - Violation of ground rules SHOULD principles (if MEDIUM impact)
  - Violation of architecture decisions (wrong component, incompatible tech stack)
  - Duplicate or conflicting requirements
  - Ambiguous security/performance attributes
  - Untestable acceptance criteria
  - Violation of company guidelines SHOULD requirements

- **MEDIUM**:
  - Violation of standards (missing tests, inadequate coverage)
  - Terminology drift
  - Missing non-functional task coverage
  - Underspecified edge cases

- **LOW**:
  - Style/wording improvements
  - Minor redundancy not affecting execution order

**CRITICAL RULE**: If ground rules and any other document conflict, ground rules ALWAYS win. Recommend fixing the other document, NEVER the ground rules.

### 7. Produce Compact Analysis Report

Output a Markdown report (no file writes) with the following structure:

## Specification Analysis Report

| ID | Category | Severity | Location(s) | Summary | Recommendation |
|----|----------|----------|-------------|---------|----------------|
| A1 | Duplication | HIGH | spec.md:L120-134 | Two similar requirements ... | Merge phrasing; keep clearer version |

(Add one row per finding; generate stable IDs prefixed by category initial.)

**Coverage Summary Table:**

| Requirement Key | Has Task? | Task IDs | Notes |
|-----------------|-----------|----------|-------|

**Ground Rules Alignment Issues:** (CRITICAL PRIORITY - MUST BE FIXED)

If any ground rules violations found, list them here with:

- Specific ground rules principle violated
- Artifact and location where violation occurs
- Why this is a violation (reference exact ground rules text)
- Required remediation (fix the artifact, NOT the ground rules)
- **Deployment blocker**: Indicate this MUST be resolved before proceeding

**Company Guidelines Alignment Issues:** (if company guidelines exist and issues found)

**Architecture Alignment Issues:** (if architecture.md exists and issues found)

**Standards Compliance Issues:** (if standards.md exists and issues found)

**Unmapped Tasks:** (if any)

**Metrics:**

- Total Requirements
- Total Tasks
- Coverage % (requirements with >=1 task)
- Ambiguity Count
- Duplication Count
- Critical Issues Count

### 7. Provide Next Actions

At end of report, output a concise Next Actions block:

- **If CRITICAL issues exist (especially ground rules violations)**:
  - **STOP**: Do NOT proceed to implementation
  - List all CRITICAL issues with required fixes
  - Ground rules violations MUST be resolved first
  - Recommend specific commands to fix violations (e.g., `/personas.specify`, `/personas.design`, `/personas.taskify`)
  - User must re-run `/personas.analyze` after fixes to confirm resolution

- **If only HIGH issues exist**:
  - Strongly recommend resolving before implementation
  - Provide prioritized remediation steps
  - Note: Implementation may proceed at user's risk, but issues should be addressed

- **If only MEDIUM/LOW issues exist**:
  - User may proceed to implementation
  - Provide improvement suggestions for future refinement
  - Provide explicit command suggestions: e.g., "Run /personas.specify with refinement", "Run /personas.design to adjust architecture", "Manually edit tasks.md to add coverage for 'performance-metrics'"

**REMEMBER**: Ground rules violations are ALWAYS blocking - never suggest proceeding with ground rules violations.

### 8. Offer Remediation

Ask the user: "Would you like me to suggest concrete remediation edits for the top N issues?" (Do NOT apply them automatically.)

## Operating Principles

### Context Efficiency

- **Minimal high-signal tokens**: Focus on actionable findings, not exhaustive documentation
- **Progressive disclosure**: Load artifacts incrementally; don't dump all content into analysis
- **Token-efficient output**: Limit findings table to 50 rows; summarize overflow
- **Deterministic results**: Rerunning without changes should produce consistent IDs and counts

### Analysis Guidelines

- **NEVER modify files** (this is read-only analysis)
- **NEVER hallucinate missing sections** (if absent, report them accurately)
- **Ground rules are SUPREME AUTHORITY** (violations are ALWAYS CRITICAL and blocking)
- **NEVER suggest modifying ground rules** (only the artifacts that violate them)
- **Prioritize ground rules violations above all else** (these block deployment)
- **Use examples over exhaustive rules** (cite specific instances, not generic patterns)
- **Report zero issues gracefully** (emit success report with coverage statistics)
- **When conflicts exist**: Ground rules > Company Guidelines > Architecture > Standards > Spec/Design/Tasks

**Complete workflow context**:
Your response **MUST** suggest the user's next step, following the sequential order below and based on the result of the last action.

```text
1. /personas.regulate      → Establish project principles
2. /personas.specify       → Create feature specifications
3. /personas.clarify       → Clarify requirements (optional)
4. /personas.architect     → Define system architecture
5. /personas.standardize   → Establish coding standards
6. /personas.design        → Design feature implementation plan
7. /personas.design-test   → Generate E2E test scenario
8. /personas.taskify       → Break down into tasks
9. /personas.analyze       → Analyze cross-artifact consistency (YOU ARE HERE)
10. /personas.implement    → Execute implementation (NEXT STEP)
11. /personas.test         → Execute E2E tests and generate report
```

**Note**: `/personas.analyze` should run AFTER `/personas.taskify` to validate the complete artifact chain (ground rules, architecture, standards, spec, plan, design-test, tasks) for consistency and alignment before implementation begins.

## Context

{ARGS}
