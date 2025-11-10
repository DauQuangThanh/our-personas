---
description: Generate an E2E test plan from user workflows defined in quickstart.md, specifying test scenarios, test data, and test environment requirements.
scripts:
  sh: scripts/bash/setup-test-plan.sh --json
  ps: scripts/powershell/setup-test-plan.ps1 -Json
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for IMPL_PLAN, TEST_PLAN, SPECS_DIR, BRANCH. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

2. **Load context**: Read IMPL_PLAN, `quickstart.md`, `/d-docs/architecture.md`, and `/d-docs/standards.md`. Load TEST_PLAN template (already copied).

3. **Verify prerequisites**: Ensure implementation plan and quickstart exist:
   - `plan.md` exists with technical context
   - `quickstart.md` exists with user workflows
   - Architecture and standards define E2E testing requirements
   - ERROR if required documents are missing

4. **Execute E2E test planning workflow**: Follow the structure in TEST_PLAN template to:
   - **Reference quickstart.md**: Extract user workflows and scenarios
   - **Reference Implementation Plan**: Understand technical context and constraints
   - **Reference Architecture**: Identify deployment environment and infrastructure
   - **Reference Standards**: Extract E2E testing requirements (framework, practices)
   - Define E2E test strategy
   - Generate E2E test scenarios from user workflows
   - Define test data requirements for E2E scenarios
   - Define test environment requirements for E2E execution

5. **Stop and report**: Command ends after E2E test plan generation. Report branch, TEST_PLAN path, and number of E2E test scenarios generated.

## Phases

### Phase 0: User Workflow Analysis

1. **Extract user workflows from quickstart.md**:
   - Primary user workflows (critical paths)
   - Secondary user workflows (important features)
   - User roles and permissions
   - Workflow dependencies and prerequisites

2. **Analyze workflow complexity**:
   - Number of steps in each workflow
   - UI interactions required (clicks, forms, navigation)
   - Data inputs and expected outputs
   - Success and failure conditions

3. **Identify testable scenarios**:
   - Happy path scenarios (successful completion)
   - Edge case scenarios (boundary conditions)
   - Error handling scenarios (validation failures, system errors)
   - Alternative path scenarios (different user choices)

**Output**: User workflow inventory with testable scenarios

### Phase 1: E2E Test Strategy Definition

**Prerequisites:** Phase 0 workflow analysis complete

1. **Define E2E test strategy from standards.md**:
   - E2E test framework (e.g., Playwright, Cypress, Selenium)
   - Browser/platform coverage (from architecture.md)
   - Test execution approach (headless, headed, parallel)
   - Test data strategy (fixtures, dynamic generation, database seeding)
   - Test isolation strategy (independent tests, cleanup between tests)

2. **Verify strategy alignment**:
   - **Standards Check**: Confirm E2E framework matches standards requirements
   - **Architecture Check**: Confirm test environment matches deployment architecture
   - ERROR if strategy conflicts with architecture or standards

**Output**: E2E test strategy section in test-plan.md

### Phase 2: E2E Test Scenario Generation

**Prerequisites:** Phase 1 test strategy complete

1. **Generate E2E test scenarios from quickstart.md workflows**:
   - For each user workflow: Create test scenarios
   - For each critical user journey: Happy path test
   - For each workflow step: Edge case tests
   - For each form/validation: Error handling tests
   - For each workflow: Alternative path tests

2. **Structure test scenarios**:
   - Test ID (e.g., E2E-001, E2E-002)
   - Test name (descriptive, based on user workflow)
   - Preconditions (user logged in, data exists, etc.)
   - Test steps (detailed step-by-step actions)
   - Expected results (what should happen at each step)
   - Priority (Critical, High, Medium, Low)

3. **Reference plan.md for context**:
   - Technical constraints affecting E2E tests
   - Performance expectations for user workflows
   - Platform/browser requirements

**Output**: E2E test scenarios in test-plan.md

### Phase 3: Test Data & Environment Definition

**Prerequisites:** Phase 2 test scenarios complete

1. **Define test data requirements**:
   - User accounts for different roles
   - Test data fixtures for workflows
   - Database seed data
   - File uploads (if applicable)
   - Mock external services (if needed)
   - Data privacy and masking (from standards.md)

2. **Define test environment requirements**:
   - From architecture.md: Deployment configuration
   - Browser/device matrix
   - Environment URLs (staging, test environment)
   - Required services and dependencies
   - CI/CD integration requirements
   - Test isolation and cleanup strategy

**Output**: Test data and environment specifications in test-plan.md

## Key rules

- Use absolute paths
- ERROR if plan.md or quickstart.md do not exist
- **FOCUS ONLY ON E2E TESTS** - No unit, integration, contract, performance, or security tests
- **ERROR if E2E strategy conflicts with standards** (e.g., different E2E framework than specified)
- **ERROR if test environment doesn't match architecture** (e.g., missing required infrastructure)
- **WARN if quickstart.md lacks detailed workflows** (suggest updating quickstart.md)
- Ensure E2E test scenarios map directly to user workflows in quickstart.md

**Complete workflow context**:
Your response **MUST** suggest the user's next step, following the sequential order below and based on the result of the last action.

```text
1. /personas.regulate      → Establish project principles
2. /personas.specify       → Create feature specifications
3. /personas.clarify       → Clarify requirements (optional)
4. /personas.architect     → Define system architecture
5. /personas.standardize   → Establish coding standards
6. /personas.plan          → Plan feature implementation with design
7. /personas.test-plan     → Generate E2E test plan (YOU ARE HERE)
8. /personas.tasks         → Break down into implementation tasks (NEXT STEP)
9. /personas.analyze       → Analyze cross-artifact consistency
10. /personas.implement    → Execute implementation
11. /personas.test         → Execute E2E tests and generate report
```

**Note**: The test-plan command generates an E2E test plan ONLY. It does not execute tests. The `/personas.test` command will execute the E2E tests defined in this plan.
