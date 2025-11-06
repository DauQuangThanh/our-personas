# E2E Test Plan: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Plan**: [link to plan.md]
**Input**: User workflows from `/specs/[###-feature-name]/quickstart.md`

**Note**: This template is filled in by the `/personas.test-plan` command. See `.personas/templates/commands/test-plan.md` for the execution workflow.

## Summary

[Extract from quickstart.md: primary user workflows + E2E testing approach from standards]

## User Workflow Analysis

### Source Documents Review

**User Workflows**: [quickstart.md - User scenarios, workflows, steps]
**Implementation Plan**: [plan.md - Technical context, constraints, platform]
**Architecture**: [/memory/architecture.md - Deployment environment, infrastructure]
**Standards**: [/memory/standards.md - E2E test framework, practices]

### User Workflows Inventory

| Workflow ID | Workflow Name (from quickstart.md) | User Role | Priority | Complexity |
|-------------|-----------------------------------|-----------|----------|------------|
| WF-001 | [User registration] | [Guest] | High | Medium |
| WF-002 | [User login] | [Registered User] | High | Low |
| WF-003 | [Create resource] | [Authenticated User] | High | Medium |
| WF-004 | [Edit resource] | [Resource Owner] | Medium | Medium |

**Note**: Fill this table by extracting workflows from quickstart.md

### Testable Scenarios per Workflow

**Workflow: [Workflow Name from quickstart.md]**

| Scenario Type | Description | Priority |
|---------------|-------------|----------|
| Happy Path | [User successfully completes workflow] | Critical |
| Edge Case | [Boundary condition: e.g., max length input] | High |
| Error Handling | [Validation failure: e.g., invalid email] | High |
| Alternative Path | [User chooses different option] | Medium |

## E2E Test Strategy

### Test Framework

**Framework**: [Extract from standards.md, e.g., Playwright, Cypress, Selenium]
**Reason**: [Why this framework from standards]

### Browser/Platform Coverage

**From architecture.md**: Target platforms and browsers

| Browser | Version | Platform | Priority |
|---------|---------|----------|----------|
| [Chrome] | [Latest] | [Desktop] | High |
| [Firefox] | [Latest] | [Desktop] | Medium |
| [Safari] | [Latest] | [macOS] | Medium |
| [Mobile Safari] | [iOS 15+] | [Mobile] | Low |

### Test Execution Approach

- **Mode**: [Headless / Headed]
- **Parallel Execution**: [Yes/No, number of workers]
- **Test Isolation**: [Independent tests, cleanup between tests]
- **Retry Strategy**: [Retry failed tests X times]

### Test Data Strategy

- **User Accounts**: [Test users for different roles]
- **Test Data**: [Fixtures / Dynamic generation / Database seeding]
- **Data Cleanup**: [After each test / After test suite]
- **Privacy**: [Data masking requirements from standards.md]

### Standards Alignment Check

*GATE:* Must align with standards.md E2E testing requirements

| Standard Requirement | Test Strategy Compliance | Status |
|---------------------|--------------------------|--------|
| [E2E Framework: Playwright] | [Using Playwright for E2E tests] | ✅ PASS |
| [Browser Coverage: Chrome, Firefox] | [Testing Chrome and Firefox] | ✅ PASS |

**Note**: ERROR if any standard requirement is not met.

### Architecture Alignment Check

*GATE:* Must match deployment architecture

| Architecture Component | Test Coverage | Status |
|------------------------|---------------|--------|
| [Deployment URL from architecture.md] | [Test environment URL matches] | ✅ PASS |
| [Required Services from architecture.md] | [Services available in test env] | ✅ PASS |

## E2E Test Scenarios

<!--
  ACTION REQUIRED: Generate E2E test scenarios from quickstart.md user workflows.
  One scenario per workflow, plus additional scenarios for edge cases and errors.
-->

### Workflow: [Workflow Name from quickstart.md]

**Workflow ID**: WF-001
**User Role**: [From quickstart.md]
**Preconditions**: [What must be true before starting, e.g., user not logged in]

#### Test Scenario: Happy Path

| Test ID | E2E-001 |
|---------|---------|
| **Scenario** | [User successfully completes workflow] |
| **Priority** | Critical |
| **Test Steps** | 1. [Step 1 from quickstart.md, e.g., Navigate to registration page]<br>2. [Step 2 from quickstart.md, e.g., Fill in valid registration form]<br>3. [Step 3 from quickstart.md, e.g., Click submit button]<br>4. [Step 4 from quickstart.md, e.g., Verify success message displayed] |
| **Expected Results** | - [Expected outcome at each step]<br>- [Final state: User registered and logged in] |
| **Test Data** | - Username: `testuser001`<br>- Email: `testuser001@example.com`<br>- Password: `ValidPass123!` |

#### Test Scenario: Edge Case

| Test ID | E2E-002 |
|---------|---------|
| **Scenario** | [User enters maximum length inputs] |
| **Priority** | High |
| **Test Steps** | 1. [Navigate to registration page]<br>2. [Fill form with max length values]<br>3. [Submit form]<br>4. [Verify acceptance or appropriate validation] |
| **Expected Results** | - [System accepts max length inputs]<br>- [Or shows helpful validation message] |
| **Test Data** | - Username: `[255 character string]`<br>- Email: `[max length email]` |

#### Test Scenario: Error Handling

| Test ID | E2E-003 |
|---------|---------|
| **Scenario** | [User submits invalid data] |
| **Priority** | High |
| **Test Steps** | 1. [Navigate to registration page]<br>2. [Fill form with invalid email]<br>3. [Attempt to submit]<br>4. [Verify validation error displayed] |
| **Expected Results** | - [Validation error shown]<br>- [Error message is helpful]<br>- [User can correct and resubmit] |
| **Test Data** | - Email: `invalid-email` (missing @domain) |

#### Test Scenario: Alternative Path

| Test ID | E2E-004 |
|---------|---------|
| **Scenario** | [User chooses OAuth login instead] |
| **Priority** | Medium |
| **Test Steps** | 1. [Navigate to registration page]<br>2. [Click "Sign up with Google" button]<br>3. [Complete OAuth flow]<br>4. [Verify user registered via OAuth] |
| **Expected Results** | - [OAuth flow completes successfully]<br>- [User is logged in]<br>- [Profile created with OAuth data] |
| **Test Data** | - OAuth provider: Google<br>- Test Google account |

**Note**: Generate similar scenario tables for each workflow in quickstart.md

### All E2E Test Scenarios Summary

| Test ID | Workflow | Scenario Type | Priority | Status |
|---------|----------|---------------|----------|--------|
| E2E-001 | [Workflow 1] | Happy Path | Critical | Planned |
| E2E-002 | [Workflow 1] | Edge Case | High | Planned |
| E2E-003 | [Workflow 1] | Error Handling | High | Planned |
| E2E-004 | [Workflow 1] | Alternative Path | Medium | Planned |
| E2E-005 | [Workflow 2] | Happy Path | Critical | Planned |
| ... | ... | ... | ... | ... |

**Total Scenarios**: [X]
**Critical**: [Y]
**High**: [Z]

## Test Data Requirements

<!--
  ACTION REQUIRED: Define test data requirements based on quickstart.md workflows
  and plan.md data model.
-->

### User Accounts

| User Role | Username | Email | Password | Purpose |
|-----------|----------|-------|----------|---------|
| Guest | N/A | N/A | N/A | Unauthenticated workflows |
| Registered User | testuser001 | `testuser001@example.com` | ValidPass123! | Basic workflows |
| Admin User | testadmin | `admin@example.com` | AdminPass123! | Admin workflows |

### Test Data Fixtures

**Entity: [EntityName from data-model.md]**

```json
{
  "fixture_name": "test_user_data",
  "data": {
    "field1": "value1",
    "field2": "value2"
  },
  "usage": ["E2E-001", "E2E-005"]
}
```

### Database Seed Data

- **Strategy**: [Seed database before test suite / before each test]
- **Cleanup**: [Clean up after each test / after test suite]
- **Isolation**: [Each test uses unique data / Shared reference data]

### Mock External Services

| Service | Mock Type | Reason |
|---------|-----------|--------|
| [Payment API] | [Stub responses] | [Avoid real transactions in tests] |
| [Email Service] | [Capture emails] | [Verify email sending without actual delivery] |

## Test Environment Requirements

<!--
  ACTION REQUIRED: Define test environment requirements based on architecture.md
  deployment view.
-->

### Environment Configuration

| Component | Configuration | Notes |
|-----------|---------------|-------|
| **Application Server** | [URL: https://test.example.com] | [From architecture.md] |
| **Database** | [PostgreSQL 14, test DB] | [Seeded with test data] |
| **Cache** | [Redis 7, test instance] | [Isolated from other environments] |
| **File Storage** | [S3 bucket: test-uploads] | [Cleaned after tests] |

**Reference**: [architecture.md deployment view]

### Browser/Platform Requirements

**E2E Framework**: [Playwright/Cypress/Selenium from standards.md]
**Framework Version**: [X.Y.Z]

**Browsers to Install**:

- Chrome (latest)
- Firefox (latest)
- Safari (if on macOS)

### CI/CD Integration

**From standards.md**:

- **Pipeline**: [GitHub Actions / Jenkins / GitLab CI]
- **Trigger**: [On PR / On commit to main / Nightly]
- **Test Stages**: [E2E tests run after build and deployment to test environment]
- **Artifacts**: [Screenshots and videos uploaded on failure]

### Test Isolation & Cleanup

- **Isolation Strategy**: [Each test runs independently, no shared state]
- **Cleanup Strategy**: [Database reset between tests / Transaction rollback]
- **Parallel Execution**: [Yes, X workers / No, sequential]

## Test Execution Plan

### Test Schedule

- **On Development**: Run critical E2E tests locally
- **On PR**: Run all E2E tests against test environment
- **Pre-Merge**: All E2E tests must pass
- **Post-Deploy**: Run smoke E2E tests in production
- **Nightly**: Full E2E test suite against staging

**Reference**: [standards.md testing practices]

### Test Reporting

- **Results Format**: [JUnit XML / JSON / HTML report]
- **Screenshots/Videos**: [Captured on failure, stored in test-artifacts/]
- **Dashboard**: [Where results are displayed: CI/CD, TestRail, etc.]

### Exit Criteria

- ✅ All critical E2E tests pass (100%)
- ✅ All high priority E2E tests pass (100%)
- ✅ Medium/Low E2E tests pass rate >= 90%
- ✅ No blocker issues discovered

## Appendix

### References

- **User Workflows**: `/specs/[###-feature-name]/quickstart.md`
- **Implementation Plan**: `/specs/[###-feature-name]/plan.md`
- **Architecture**: `/memory/architecture.md`
- **Standards**: `/memory/standards.md`

### Test Coverage Matrix

| Workflow (from quickstart.md) | Test Scenarios | Happy Path | Edge Cases | Error Handling | Alt Paths |
|-------------------------------|----------------|------------|------------|----------------|-----------|
| [Workflow 1] | [X scenarios] | ✅ | ✅ | ✅ | ✅ |
| [Workflow 2] | [Y scenarios] | ✅ | ✅ | ✅ | ⚠️ Partial |
| [Workflow 3] | [Z scenarios] | ✅ | ❌ Missing | ✅ | N/A |

**Coverage**: [X/Y workflows fully covered]
