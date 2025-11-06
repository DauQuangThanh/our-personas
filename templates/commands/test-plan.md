---
description: Execute the test planning workflow using the test-plan template to generate comprehensive test strategies and test cases from implementation plan outputs.
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

2. **Load context**: Read IMPL_PLAN, `research.md`, `data-model.md`, `quickstart.md`, `/contracts/*`, `/memory/architecture.md`, and `/memory/standards.md`. Load TEST_PLAN template (already copied).

3. **Verify prerequisites**: Ensure implementation plan exists and contains:
   - Technical Context (languages, dependencies, testing frameworks)
   - Architecture alignment checks (passed)
   - Standards alignment checks (passed)
   - Data model definition
   - API contracts
   - ERROR if plan.md is incomplete or alignment checks have unresolved failures

4. **Execute test planning workflow**: Follow the structure in TEST_PLAN template to:
   - Extract test requirements from plan
   - **Reference Implementation Plan**: Analyze technical context, constraints, and design decisions
   - **Reference Architecture**: Identify components, integration points, and architectural patterns to test
   - **Reference Standards**: Extract testing requirements (coverage targets, frameworks, test types, security practices)
   - Define test strategy aligned with architecture and standards
   - Generate test scenarios for each test level
   - Define test data requirements from data-model.md
   - Define contract test specifications from /contracts/
   - Map performance test scenarios from plan performance goals
   - Map security test scenarios from architecture and standards
   - Define test environment requirements from architecture deployment view

5. **Stop and report**: Command ends after test plan generation. Report branch, TEST_PLAN path, and coverage of all test levels.

## Phases

### Phase 0: Test Requirements Analysis

1. **Extract testable elements from implementation plan**:
   - From `data-model.md`: Entities, validation rules, state transitions
   - From `/contracts/*`: API endpoints, request/response schemas, error conditions
   - From `plan.md`: Performance goals, constraints, technical context
   - From `quickstart.md`: User workflows and scenarios

2. **Extract test requirements from foundational documents**:
   - From `/memory/architecture.md`:
     - Component interactions and integration points
     - Communication patterns (sync/async, protocols)
     - Deployment architecture (environments, infrastructure)
     - Quality attributes (performance, reliability, security)
   - From `/memory/standards.md`:
     - Required test frameworks and tools
     - Coverage targets and thresholds
     - Testing practices (TDD, BDD, etc.)
     - Security testing requirements
     - Performance testing requirements

3. **Map requirements to test levels**:
   - Unit tests → Data model, business logic
   - Integration tests → Component interactions, external services
   - Contract tests → API contracts
   - E2E tests → User workflows from quickstart
   - Performance tests → Performance goals from plan
   - Security tests → Security requirements from architecture and standards

**Output**: Comprehensive test requirements matrix

### Phase 1: Test Strategy Definition

**Prerequisites:** Phase 0 requirements analysis complete

1. **Define test strategy aligned with standards**:
   - Test levels and scope (as defined in standards)
   - Test frameworks and tools (as specified in standards)
   - Coverage targets (as required in standards)
   - Test execution approach (manual vs automated)
   - CI/CD integration approach (per architecture deployment view)

2. **Verify strategy alignment**:
   - **Standards Check**: Confirm test frameworks match standards requirements
   - **Standards Check**: Confirm coverage targets meet standards thresholds
   - **Architecture Check**: Confirm test environments match deployment architecture
   - **Architecture Check**: Confirm integration tests cover all component interactions
   - ERROR if strategy conflicts with architecture or standards

**Output**: Test strategy section in test-plan.md

### Phase 2: Test Scenario Generation

**Prerequisites:** Phase 1 test strategy complete

1. **Generate unit test scenarios**:
   - For each entity in data-model.md: validation test cases
   - For each state transition: state change test cases
   - For each business rule: business logic test cases
   - Reference standards for unit test patterns

2. **Generate integration test scenarios**:
   - For each component interaction in architecture: integration test cases
   - For each external service dependency: integration test cases
   - For each data flow: end-to-end data flow test cases
   - Reference architecture for integration patterns

3. **Generate contract test scenarios**:
   - For each API endpoint in /contracts/: contract test cases
   - For each request schema: request validation test cases
   - For each response schema: response validation test cases
   - For each error condition: error handling test cases

4. **Generate E2E test scenarios**:
   - For each user workflow in quickstart.md: E2E test cases
   - For each critical user journey: happy path and edge cases
   - Reference architecture for deployment configuration

5. **Generate performance test scenarios**:
   - For each performance goal in plan.md: load test scenarios
   - For each constraint in plan.md: stress test scenarios
   - Reference architecture for performance baselines

6. **Generate security test scenarios**:
   - For each security requirement in standards: security test cases
   - For each authentication/authorization flow: security test cases
   - For each data validation point: input validation test cases
   - Reference architecture and standards for security patterns

**Output**: Comprehensive test scenarios in test-plan.md

### Phase 3: Test Data & Environment Definition

**Prerequisites:** Phase 2 test scenarios complete

1. **Define test data requirements**:
   - From data-model.md: Test data fixtures
   - From contracts: Test payloads and responses
   - Data privacy and masking requirements (from standards)
   - Test data generation strategies

2. **Define test environment requirements**:
   - From architecture deployment view: Environment configurations
   - From standards: CI/CD pipeline requirements
   - Infrastructure requirements for different test levels
   - Test isolation and cleanup strategies

**Output**: Test data and environment specifications in test-plan.md

## Key rules

- Use absolute paths
- ERROR if plan.md does not exist or is incomplete
- ERROR if alignment checks in plan.md show unresolved failures
- **ERROR if test strategy conflicts with standards** (e.g., different test framework, lower coverage target, missing test types)
- **ERROR if test scenarios don't cover architecture components** (e.g., missing integration tests for key component interactions)
- **WARN if test plan identifies gaps in implementation plan** (document missing test scenarios and suggest updating plan)
- Ensure all test levels reference the appropriate source documents (plan for technical context, architecture for components, standards for practices)

**Complete workflow context**:
Your response **MUST** suggest the user's next step, following the sequential order below and based on the result of the last action.
```
1. /personas.constitution  → Establish project principles
2. /personas.specify       → Create feature specifications
3. /personas.clarify       → Clarify requirements (optional)
4. /personas.architect     → Define system architecture
5. /personas.standardize   → Establish coding standards
6. /personas.plan          → Plan feature implementation with design
7. /personas.test-plan     → Generate comprehensive test plan (YOU ARE HERE)
8. /personas.tasks         → Break down into implementation tasks (NEXT STEP)
9. /personas.analyze       → Analyze cross-artifact consistency
10. /personas.implement    → Execute implementation
```
