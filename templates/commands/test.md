---
description: Execute E2E tests according to the test plan and generate a comprehensive test report capturing results, coverage, and quality metrics.
scripts:
  sh: scripts/bash/setup-test.sh --json
  ps: scripts/powershell/setup-test.ps1 -Json
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for TEST_PLAN, TEST_REPORT, SPECS_DIR, BRANCH. For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").

2. **Load context**: Read TEST_PLAN, `quickstart.md`, `plan.md`, `/d-docs/architecture.md`, and `/d-docs/standards.md`. Load TEST_REPORT template (already copied).

3. **Verify prerequisites**: Ensure test plan exists and contains:
   - E2E test strategy definition (framework, browser coverage)
   - E2E test scenarios from user workflows
   - Test data requirements
   - Test environment configuration
   - ERROR if test-plan.md is missing or incomplete

4. **Execute E2E test workflow**: Follow the test plan to:
   - **Reference Test Plan**: Load E2E test scenarios and test strategy
   - Verify test environment is running and accessible
   - Execute E2E tests according to test-plan scenarios
   - Collect test results (pass/fail, duration, errors)
   - Capture test artifacts (screenshots, videos, traces)
   - **Verify alignment with test-plan**: Compare actual execution with test-plan scenarios
   - Generate test report with results and recommendations

5. **Stop and report**: Command ends after E2E test execution and report generation. Report branch, TEST_REPORT path, test results summary, and recommendations for next steps.

## Phases

### Phase 0: Pre-Test Validation

1. **Verify test environment setup**:
   - From test-plan.md: Required infrastructure (application server, database, services)
   - From test-plan.md: Test data availability
   - From test-plan.md: E2E framework installed
   - Environment is accessible (URLs reachable)
   - ERROR if environment doesn't match test-plan requirements

2. **Validate test prerequisites**:
   - Implementation code is deployed to test environment
   - Test fixtures and data are loaded
   - E2E test framework is installed (from test-plan.md)
   - Browser/platform requirements met
   - ERROR if prerequisites not met

**Output**: Environment validation report

### Phase 1: E2E Test Execution

**Prerequisites:** Phase 0 environment validation complete

1. **Execute E2E test scenarios** (from test-plan.md):
   - Run E2E tests using framework specified in test-plan (Playwright/Cypress/Selenium)
   - Execute tests in order of priority (Critical → High → Medium → Low)
   - For each test scenario from test-plan.md:
     - Set up preconditions
     - Execute test steps
     - Verify expected results
     - Capture screenshots/videos on failure
     - Clean up test data
   - **Reference test-plan.md**: E2E test scenarios and user workflows
   - **Reference quickstart.md**: User workflows being tested

2. **Collect test results**:
   - Pass/fail status for each test
   - Test execution duration
   - Error messages and stack traces
   - Screenshots of failures
   - Videos of test execution (if configured)
   - Browser console logs
   - Network traces

**Output**: E2E test execution results

### Phase 2: Test Analysis

**Prerequisites:** Phase 1 test execution complete

1. **Analyze test results**:
   - Overall pass rate
   - Failed tests by workflow
   - Flaky tests (inconsistent results)
   - Performance issues (slow workflows)
   - Common failure patterns

2. **Compare with test-plan expectations**:
   - **Reference test-plan.md**: Expected test scenarios
   - All planned scenarios executed?
   - Any scenarios skipped?
   - Test execution environment as planned?

3. **Identify issues**:
   - Broken user workflows
   - UI/UX issues discovered
   - Data issues
   - Performance bottlenecks in workflows
   - Browser/platform compatibility issues

**Output**: Test analysis with issues and patterns

### Phase 3: Test Report Generation

**Prerequisites:** Phase 2 test analysis complete

1. **Aggregate test results**:
   - Overall pass/fail status
   - Results by user workflow (from quickstart.md)
   - Failed test details with root cause analysis
   - Test execution duration
   - Browser/platform coverage achieved

2. **Document test coverage**:
   - User workflows tested (from quickstart.md)
   - User workflows not tested
   - Coverage against test-plan scenarios

3. **Generate recommendations**:
   - Tests to fix (failed tests)
   - Workflows to investigate (consistent failures)
   - Performance issues to address
   - **Reference test-plan.md**: Additional scenarios to add
   - Environment issues to resolve

4. **Create artifacts inventory**:
   - Test logs
   - Screenshots (failures)
   - Videos (test execution)
   - Browser traces
   - Performance metrics

**Output**: Comprehensive E2E test report in test-report.md

## Key rules

- Use absolute paths
- ERROR if test-plan.md does not exist
- ERROR if test environment doesn't match test-plan requirements
- ERROR if E2E framework is not installed or configured
- **FOCUS ONLY ON E2E TESTS** - No unit, integration, contract, performance, or security tests
- **WARN if tests fail** (not ERROR - report failures and suggest fixes)
- **WARN if test environment differs from architecture** (document differences)
- Ensure test report references test-plan for traceability (which scenarios were executed)

**Complete workflow context**:
Your response **MUST** suggest the user's next step, following the sequential order below and based on the result of the last action.

```text
1. /personas.regulate      → Establish project principles
2. /personas.specify       → Create feature specifications
3. /personas.clarify       → Clarify requirements (optional)
4. /personas.architect     → Define system architecture
5. /personas.standardize   → Establish coding standards
6. /personas.plan          → Plan feature implementation with design
7. /personas.test-plan     → Generate E2E test plan
8. /personas.tasks         → Break down into tasks
9. /personas.analyze       → Analyze cross-artifact consistency
10. /personas.implement    → Execute implementation
11. /personas.test         → Execute E2E tests and generate report (YOU ARE HERE)
```

**Note**: The test command executes E2E tests ONLY according to the test plan created by `/personas.test-plan`. It runs the tests and generates a test report.
