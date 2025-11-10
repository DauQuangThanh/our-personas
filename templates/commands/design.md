---
description: Execute the implementation design workflow using the design template to generate design artifacts.
scripts:
  sh: scripts/bash/setup-design.sh --json
  ps: scripts/powershell/setup-design.ps1 -Json
agent_scripts:
  sh: scripts/bash/update-agent-context.sh __AGENT__
  ps: scripts/powershell/update-agent-context.ps1 -AgentType __AGENT__
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for FEATURE_SPEC, IMPL_PLAN, SPECS_DIR, BRANCH. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

2. **Load context**: Read FEATURE_SPEC and `/memory/ground-rules.md`, `/d-docs/architecture.md`, `/d-docs/standards.md`. Load IMPL_PLAN template (already copied).

3. **Execute design workflow**: Follow the structure in IMPL_PLAN template to:
   - Fill Technical Context (mark unknowns as "NEEDS CLARIFICATION")
   - **Fill Alignment Checks section**:
     - **Ground Rules Check**: Verify alignment with ground rules principles (governance, values, constraints)
     - **Architecture Check**: Verify alignment with system architecture (components, patterns, infrastructure, deployment)
     - **Standards Check**: Verify alignment with coding standards (tools, testing requirements, security practices, code quality)
   - Evaluate gates (ERROR if violations unjustified or conflicts unresolved)
   - Phase 0: Generate research.md (resolve all NEEDS CLARIFICATION)
   - Phase 1: Generate data-model.md, contracts/, quickstart.md
   - Phase 1: Update agent context by running the agent script
   - **Re-evaluate all Alignment Checks post-design** (Ground Rules, Architecture, Standards)

4. **Stop and report**: Command ends after Phase 2 planning. Report branch, IMPL_PLAN path, generated artifacts, and alignment status with all foundational documents.

## Phases

### Phase 0: Outline & Research

1. **Extract unknowns from Technical Context** above:
   - For each NEEDS CLARIFICATION → research task
   - For each dependency → best practices task
   - For each integration → patterns task

2. **Generate and dispatch research agents**:

   ```text
   For each unknown in Technical Context:
     Task: "Research {unknown} for {feature context}"
   For each technology choice:
     Task: "Find best practices for {tech} in {domain}"
   ```

3. **Consolidate findings** in `research.md` using format:
   - Decision: [what was chosen]
   - Rationale: [why chosen]
   - Alternatives considered: [what else evaluated]

**Output**: research.md with all NEEDS CLARIFICATION resolved

### Phase 1: Design & Contracts

**Prerequisites:** `research.md` complete

1. **Extract entities from feature spec** → `data-model.md`:
   - Entity name, fields, relationships
   - Validation rules from requirements
   - State transitions if applicable
   - **Verify data model aligns with architecture's data strategy** (data stores, schemas, persistence patterns)

2. **Generate API contracts** from functional requirements:
   - For each user action → endpoint
   - **Use communication patterns defined in architecture** (REST/GraphQL/gRPC/message queues)
   - Output OpenAPI/GraphQL schema to `/contracts/`
   - **Verify API design follows architecture's component interaction patterns**
   - **Ensure contract structure aligns with architectural views** (logical, process, deployment)

3. **Verify implementation approach follows coding standards**:
   - **Check testing requirements** match standards (coverage targets, test frameworks, test types)
   - **Check security practices** align with standards (authentication, authorization, data validation, encryption)
   - **Check tooling choices** align with standards (linters, formatters, build tools, CI/CD)
   - **Check code organization** follows standards (file structure, naming conventions, module patterns)

4. **Agent context update**:
   - Run `{AGENT_SCRIPT}`
   - These scripts detect which AI agent is in use
   - Update the appropriate agent-specific context file
   - Add only new technology from current plan
   - Preserve manual additions between markers

**Output**: data-model.md, /contracts/*, quickstart.md, agent-specific file

## Key rules

- Use absolute paths
- ERROR on gate failures or unresolved clarifications
- **ERROR if design conflicts with architecture** (e.g., adding components not defined in architecture, using different communication patterns)
- **ERROR if implementation approach violates coding standards** (e.g., different test framework, lower coverage target, prohibited libraries)
- **WARN if feature requires architecture/standards updates** (document what needs updating and why, suggest running `/personas.architect` or `/personas.standardize` to update)

**Complete workflow context**:
Your response **MUST** suggest the user's next step, following the sequential order below and based on the result of the last action.

```text
1. /personas.regulate      → Establish project principles
2. /personas.specify       → Create feature specifications
3. /personas.clarify       → Clarify requirements (optional)
4. /personas.architect     → Define system architecture
5. /personas.standardize   → Establish coding standards
6. /personas.design          → Plan feature implementation with design (YOU ARE HERE)
7. /personas.design-test   → Generate E2E test spec (NEXT STEP)
8. /personas.taskify       → Break down into tasks
9. /personas.analyze       → Analyze cross-artifact consistency
10. /personas.implement    → Execute implementation
11. /personas.test         → Execute E2E tests and generate report
```
