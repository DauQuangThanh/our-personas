# Test Plan: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Plan**: [link to plan.md]
**Input**: Implementation plan from `/specs/[###-feature-name]/plan.md` and related artifacts

**Note**: This template is filled in by the `/personas.test-plan` command. See `.personas/templates/commands/test-plan.md` for the execution workflow.

## Summary

[Extract from plan.md: primary feature + technical approach + testing requirements from standards]

## Test Requirements Analysis

### Source Documents Review

**Implementation Plan**: [plan.md - Technical context, constraints, performance goals]
**Architecture**: [/memory/architecture.md - Components, integration points, deployment]
**Standards**: [/memory/standards.md - Test frameworks, coverage targets, testing practices]
**Data Model**: [data-model.md - Entities, validation rules, state transitions]
**API Contracts**: [/contracts/* - Endpoints, schemas, error conditions]
**User Workflows**: [quickstart.md - User scenarios and workflows]

### Testable Elements Matrix

| Source | Element | Test Level | Priority |
|--------|---------|-----------|----------|
| data-model.md | [Entity: User] | Unit | High |
| data-model.md | [Validation: Email format] | Unit | High |
| contracts/ | [Endpoint: POST /api/users] | Contract | High |
| architecture.md | [Component: Auth Service ↔ User Service] | Integration | High |
| quickstart.md | [Workflow: User registration] | E2E | High |
| plan.md | [Performance: <200ms response] | Performance | Medium |
| standards.md | [Security: Input validation] | Security | High |

**Note**: Fill this matrix by extracting concrete elements from the source documents.

## Test Strategy

### Test Levels & Scope

<!--
  ACTION REQUIRED: Define test levels based on standards.md requirements and
  architecture.md structure. Map each level to the components/layers it tests.
-->

#### 1. Unit Tests
- **Scope**: Individual functions, classes, and modules
- **Framework**: [Extract from standards.md, e.g., pytest, Jest, JUnit]
- **Coverage Target**: [Extract from standards.md, e.g., 80% line coverage]
- **Focus Areas**:
  - Data model validation (from data-model.md)
  - Business logic
  - Utility functions
  - [Add domain-specific areas]

#### 2. Integration Tests
- **Scope**: Component interactions and external service integrations
- **Framework**: [Extract from standards.md]
- **Coverage Target**: [Extract from standards.md]
- **Focus Areas**:
  - [Component A ↔ Component B interaction from architecture.md]
  - [External service: Database, Cache, Queue from architecture.md]
  - [Add architecture-specific integration points]

#### 3. Contract Tests
- **Scope**: API contract compliance
- **Framework**: [Extract from standards.md, e.g., Pact, Spring Cloud Contract]
- **Coverage Target**: 100% of API endpoints
- **Focus Areas**:
  - Request/response schema validation (from /contracts/)
  - Error response validation
  - Breaking change detection

#### 4. End-to-End Tests
- **Scope**: Complete user workflows
- **Framework**: [Extract from standards.md, e.g., Playwright, Cypress, Selenium]
- **Coverage Target**: Critical user journeys
- **Focus Areas**:
  - [User workflow 1 from quickstart.md]
  - [User workflow 2 from quickstart.md]
  - [Add critical paths]

#### 5. Performance Tests
- **Scope**: System performance under load
- **Framework**: [Extract from standards.md, e.g., k6, JMeter, Locust]
- **Baselines**: [Extract from architecture.md performance requirements]
- **Focus Areas**:
  - [Performance goal 1 from plan.md]
  - [Performance goal 2 from plan.md]
  - [Constraint 1 from plan.md]

#### 6. Security Tests
- **Scope**: Security vulnerabilities and compliance
- **Framework**: [Extract from standards.md, e.g., OWASP ZAP, Burp Suite]
- **Standards**: [Extract from architecture.md and standards.md]
- **Focus Areas**:
  - Authentication/authorization flows
  - Input validation and sanitization
  - [Security requirement 1 from standards.md]
  - [Security requirement 2 from standards.md]

### Standards Alignment Check

*GATE: Must align with standards.md requirements*

| Standard Requirement | Test Strategy Compliance | Status |
|---------------------|--------------------------|--------|
| [Test Framework: pytest] | [Using pytest for unit tests] | ✅ PASS |
| [Coverage: 80% line] | [Target: 80% line coverage] | ✅ PASS |
| [Security: OWASP Top 10] | [Security tests cover OWASP Top 10] | ✅ PASS |

**Note**: ERROR if any standard requirement is not met. WARN if deviation is necessary and document justification.

### Architecture Alignment Check

*GATE: Must cover all architectural components*

| Architecture Component | Test Coverage | Status |
|------------------------|---------------|--------|
| [Component 1 from architecture.md] | [Integration tests defined] | ✅ PASS |
| [Component 2 from architecture.md] | [Integration tests defined] | ✅ PASS |
| [Integration Point 1] | [Integration tests defined] | ✅ PASS |

**Note**: ERROR if critical components lack test coverage. WARN if optional components are not tested.

## Test Scenarios

### Unit Test Scenarios

<!--
  ACTION REQUIRED: Generate unit test scenarios from data-model.md entities
  and business logic defined in plan.md. Follow the test patterns from standards.md.
-->

#### Data Model Tests

**Entity: [EntityName from data-model.md]**

| Test ID | Scenario | Input | Expected Output | Priority |
|---------|----------|-------|----------------|----------|
| UT-DM-001 | Valid entity creation | [Valid field values] | Entity created successfully | High |
| UT-DM-002 | Invalid field validation | [Invalid email format] | ValidationError raised | High |
| UT-DM-003 | State transition: [State A → State B] | [Trigger condition] | State changed to B | Medium |

**Note**: Generate similar tables for each entity in data-model.md

#### Business Logic Tests

**Module: [ModuleName from plan.md]**

| Test ID | Scenario | Input | Expected Output | Priority |
|---------|----------|-------|----------------|----------|
| UT-BL-001 | [Business rule 1] | [Input data] | [Expected behavior] | High |
| UT-BL-002 | [Business rule 2] | [Input data] | [Expected behavior] | High |

### Integration Test Scenarios

<!--
  ACTION REQUIRED: Generate integration test scenarios from architecture.md
  component interactions and external service dependencies.
-->

#### Component Integration Tests

**Integration: [Component A ↔ Component B from architecture.md]**

| Test ID | Scenario | Setup | Action | Expected Result | Priority |
|---------|----------|-------|--------|----------------|----------|
| IT-CI-001 | [Component A calls Component B] | [Setup state] | [API call] | [Expected response] | High |
| IT-CI-002 | [Component B unavailable] | [Mock B down] | [API call] | [Fallback behavior] | High |

#### External Service Integration Tests

**Service: [External Service from architecture.md]**

| Test ID | Scenario | Setup | Action | Expected Result | Priority |
|---------|----------|-------|--------|----------------|----------|
| IT-ES-001 | [Database connection] | [DB available] | [Query execution] | [Data returned] | High |
| IT-ES-002 | [Database timeout] | [Mock timeout] | [Query execution] | [Timeout handled] | Medium |

### Contract Test Scenarios

<!--
  ACTION REQUIRED: Generate contract test scenarios from /contracts/ API specifications.
  One test scenario per endpoint covering request/response validation.
-->

**API: [Service Name from contracts/]**

| Test ID | Endpoint | Method | Scenario | Request | Expected Response | Status Code | Priority |
|---------|----------|--------|----------|---------|------------------|-------------|----------|
| CT-001 | /api/[resource] | POST | Valid request | [Schema from contract] | [Schema from contract] | 201 | High |
| CT-002 | /api/[resource] | POST | Invalid request | [Invalid schema] | [Error response] | 400 | High |
| CT-003 | /api/[resource] | GET | Resource found | [Valid ID] | [Resource schema] | 200 | High |
| CT-004 | /api/[resource] | GET | Resource not found | [Invalid ID] | [Error response] | 404 | Medium |

**Note**: Generate one table per API service/resource from /contracts/

### End-to-End Test Scenarios

<!--
  ACTION REQUIRED: Generate E2E test scenarios from quickstart.md user workflows.
  Cover happy paths and critical edge cases.
-->

**User Workflow: [Workflow Name from quickstart.md]**

| Test ID | Scenario | Preconditions | Steps | Expected Outcome | Priority |
|---------|----------|---------------|-------|-----------------|----------|
| E2E-001 | [Happy path: Workflow completion] | [User logged in] | 1. [Step 1]<br>2. [Step 2]<br>3. [Step 3] | [Successful completion] | High |
| E2E-002 | [Edge case: Validation error] | [User logged in] | 1. [Step 1 with invalid data]<br>2. [Error displayed] | [User sees error, can retry] | Medium |

**Note**: Generate similar tables for each workflow in quickstart.md

### Performance Test Scenarios

<!--
  ACTION REQUIRED: Generate performance test scenarios from plan.md performance
  goals and constraints. Reference architecture.md for system baselines.
-->

**Performance Goal: [Goal from plan.md]**

| Test ID | Scenario | Load Profile | Success Criteria | Priority |
|---------|----------|--------------|-----------------|----------|
| PT-001 | [Goal 1: Response time < 200ms] | [100 concurrent users] | [P95 < 200ms] | High |
| PT-002 | [Constraint 1: Memory < 100MB] | [Sustained load] | [Memory stays < 100MB] | Medium |

**Baseline**: [Extract from architecture.md performance requirements]

### Security Test Scenarios

<!--
  ACTION REQUIRED: Generate security test scenarios from standards.md security
  requirements and architecture.md security controls.
-->

**Security Requirement: [Requirement from standards.md]**

| Test ID | Scenario | Attack Vector | Expected Behavior | Priority |
|---------|----------|---------------|-------------------|----------|
| ST-001 | [SQL injection prevention] | [Malicious SQL input] | [Input sanitized, attack blocked] | High |
| ST-002 | [XSS prevention] | [Malicious script input] | [Script escaped, not executed] | High |
| ST-003 | [Authentication bypass] | [Unauthenticated request] | [401 Unauthorized] | High |

**Standards Compliance**: [OWASP Top 10, etc. from standards.md]

## Test Data Requirements

<!--
  ACTION REQUIRED: Define test data requirements based on data-model.md and
  contracts/. Include data generation strategies and privacy considerations.
-->

### Test Data Fixtures

**Entity: [EntityName from data-model.md]**

```json
{
  "fixture_name": "valid_user",
  "data": {
    "field1": "value1",
    "field2": "value2"
  },
  "usage": ["unit tests", "integration tests"]
}
```

**Note**: Define fixtures for each entity in data-model.md

### Test Data Generation

- **Strategy**: [Faker, factory_boy, or custom generators]
- **Seed Data**: [Specify seed data requirements for E2E tests]
- **Privacy**: [Data masking/anonymization requirements from standards.md]

### Test Data Management

- **Storage**: [Where test data is stored: fixtures/, test database]
- **Refresh Strategy**: [How test data is reset between tests]
- **Isolation**: [How tests maintain data isolation]

## Test Environment Requirements

<!--
  ACTION REQUIRED: Define test environment requirements based on architecture.md
  deployment view and standards.md CI/CD requirements.
-->

### Environment Configurations

| Environment | Purpose | Infrastructure | Data | Users |
|-------------|---------|----------------|------|-------|
| **Local Dev** | Developer testing | [Docker Compose] | [Fixtures] | [Test accounts] |
| **CI/CD** | Automated testing | [GitHub Actions / Jenkins] | [Fixtures] | [Service accounts] |
| **Staging** | Pre-production validation | [Match production from architecture.md] | [Sanitized prod copy] | [Test accounts] |

**Reference**: [architecture.md deployment view]

### Infrastructure Requirements

**From architecture.md**:
- [Infrastructure component 1: e.g., Database: PostgreSQL 14]
- [Infrastructure component 2: e.g., Cache: Redis 7]
- [Infrastructure component 3: e.g., Message Queue: RabbitMQ]

### CI/CD Integration

**From standards.md**:
- **Pipeline**: [CI/CD tool and configuration]
- **Test Stages**: [unit → integration → contract → E2E]
- **Quality Gates**: [Coverage threshold, test pass rate]
- **Deployment Triggers**: [When tests pass, deploy to staging]

### Test Isolation & Cleanup

- **Isolation Strategy**: [How tests run independently: transactions, containers]
- **Cleanup Strategy**: [How test data is cleaned up: rollback, reset]
- **Parallel Execution**: [Can tests run in parallel: yes/no, considerations]

## Risk Assessment

<!--
  ACTION REQUIRED: Identify testing risks and mitigation strategies based on
  plan.md constraints and architecture.md quality attributes.
-->

| Risk | Impact | Likelihood | Mitigation |
|------|--------|------------|------------|
| [Flaky E2E tests] | High | Medium | [Use retry logic, improve selectors] |
| [Performance test environment differs from prod] | Medium | High | [Match prod config from architecture.md] |
| [Test data privacy violation] | High | Low | [Follow standards.md data masking] |

## Test Execution Plan

### Test Schedule

1. **Unit Tests**: Continuous (on every commit)
2. **Integration Tests**: On PR creation
3. **Contract Tests**: On PR creation
4. **E2E Tests**: Pre-merge (required for merge)
5. **Performance Tests**: Weekly + pre-release
6. **Security Tests**: Weekly + pre-release

**Reference**: [standards.md testing practices]

### Test Reporting

- **Coverage Reports**: [Tool: Coverage.py, Istanbul, JaCoCo]
- **Test Results**: [Format: JUnit XML, JSON]
- **Dashboard**: [Where results are displayed: CI/CD, SonarQube]

### Exit Criteria

- ✅ All unit tests pass (100%)
- ✅ Integration tests pass (100%)
- ✅ Contract tests pass (100%)
- ✅ Critical E2E tests pass (100%)
- ✅ Code coverage meets target ([X%] from standards.md)
- ✅ No high-severity security vulnerabilities
- ✅ Performance tests meet goals (from plan.md)

## Appendix

### References

- **Implementation Plan**: `/specs/[###-feature-name]/plan.md`
- **Architecture**: `/memory/architecture.md`
- **Standards**: `/memory/standards.md`
- **Data Model**: `/specs/[###-feature-name]/data-model.md`
- **API Contracts**: `/specs/[###-feature-name]/contracts/`
- **User Workflows**: `/specs/[###-feature-name]/quickstart.md`

### Test Automation Roadmap

[If not all tests are automated initially, document the automation roadmap]

| Test Level | Current State | Target State | Timeline |
|------------|---------------|--------------|----------|
| Unit | [100% automated] | [100% automated] | [Complete] |
| Integration | [50% automated] | [100% automated] | [Sprint +2] |
| E2E | [Manual] | [80% automated] | [Sprint +3] |
