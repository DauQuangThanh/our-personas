---
description: Create or update the project coding standard from interactive or provided inputs, ensuring comprehensive full-stack development guidelines
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

You are updating the project coding standard at `/d-docs/standards.md`. This file is a TEMPLATE containing placeholder tokens in square brackets (e.g. `[PROJECT_NAME]`, `[FRONTEND_FRAMEWORK]`). Your job is to (a) collect/derive concrete values, (b) fill the template precisely for full-stack development, and (c) ensure consistency with the project ground rules.

Follow this execution flow:

1. **Load the existing coding standard template** at `/d-docs/standards.md`.
   - Identify every placeholder token of the form `[ALL_CAPS_IDENTIFIER]`.
   - Note: This template is designed for full-stack development covering frontend, backend, testing, security, performance, DevOps, and database standards.

2. **Detect project technology stack**:
   - Check for `package.json` (Node.js/JavaScript/TypeScript)
   - Check for `requirements.txt` or `pyproject.toml` (Python)
   - Check for `go.mod` (Go)
   - Check for `pom.xml` or `build.gradle` (Java)
   - Check for `Gemfile` (Ruby)
   - Check for `composer.json` (PHP)
   - Check for `Cargo.toml` (Rust)
   - Check existing documentation (README.md, architecture.md, design.md) for tech stack details
   - If multiple technologies detected, ask user which is primary/secondary

3. **Collect/derive values for placeholders**:
   - **Project Information**:
     - `PROJECT_NAME`: From repo name, README, or user input
     - `STANDARD_VERSION`: Start at 1.0.0 or increment from existing
     - `RATIFICATION_DATE`: Original adoption date (ask if unknown)
     - `LAST_AMENDED_DATE`: Today's date if making changes

   - **Frontend Standards** (if frontend detected):
     - `FRONTEND_FRAMEWORK`: React, Vue, Angular, Svelte, etc.
     - `FRONTEND_DESCRIPTION`: Framework-specific best practices
     - `COMPONENT_ARCHITECTURE`: Component design patterns
     - `STATE_MANAGEMENT`: State management approach
     - `STYLING_STANDARDS`: CSS methodology and tools

   - **Backend Standards** (if backend detected):
     - `BACKEND_FRAMEWORK`: Express, Django, FastAPI, Spring Boot, etc.
     - `BACKEND_DESCRIPTION`: Framework-specific patterns
     - `API_DESIGN`: RESTful/GraphQL design principles
     - `DATABASE_STANDARDS`: ORM, naming, migration strategy
     - `AUTH_STANDARDS`: Authentication and authorization approach

   - **Code Quality Standards**:
     - `CODE_STYLE`: Linters, formatters, style guides
     - `TESTING_REQUIREMENTS`: Test frameworks, coverage requirements
     - `DOCUMENTATION_STANDARDS`: Documentation expectations

   - **Security Standards**:
     - `INPUT_VALIDATION`: Validation and sanitization rules
     - `DATA_PROTECTION`: Encryption and data handling
     - `DEPENDENCY_MANAGEMENT`: Dependency security practices

   - **Performance Standards**:
     - `FRONTEND_PERFORMANCE`: Bundle size, loading times, metrics
     - `BACKEND_PERFORMANCE`: Response times, optimization strategies
     - `MONITORING_STANDARDS`: Observability and monitoring tools

   - **DevOps Standards**:
     - `VERSION_CONTROL`: Git workflow and branching strategy
     - `CICD_PIPELINE`: CI/CD requirements and tools
     - `INFRASTRUCTURE_STANDARDS`: IaC and deployment practices

   - **Database Standards**:
     - `SCHEMA_DESIGN`: Schema design principles
     - `MIGRATION_STRATEGY`: Database migration approach
     - `DATA_ACCESS_PATTERNS`: Data access best practices

   - **Project-Specific Standards**:
     - `TECH_STACK_SPECIFIC`: Monorepo, microservices, etc.
     - `DOMAIN_SPECIFIC`: Industry-specific requirements (PCI-DSS, HIPAA, GDPR)

   - **Governance**:
     - `REVIEW_CHECKLIST`: Code review checklist items
     - `REVIEW_PROCESS`: Review workflow and requirements
     - `EXCEPTION_CRITERIA`: When deviations are allowed
     - `EXCEPTION_DOCUMENTATION`: How to document exceptions
     - `ENFORCEMENT_RULES`: How standards are enforced
     - `AMENDMENT_PROCESS`: How to update standards
     - `COMPLIANCE_VERIFICATION`: Compliance checking methods

4. **Draft the updated coding standard content**:
   - Replace every placeholder with concrete text (no bracketed tokens left)
   - Preserve heading hierarchy and structure
   - Ensure each section has:
     - Clear, actionable guidelines
     - Specific tools and versions where applicable
     - Measurable criteria (e.g., "80% test coverage" not "good coverage")
     - Examples where helpful
   - Tailor content to detected technology stack
   - Remove sections not applicable to the project (e.g., frontend sections for backend-only projects)

5. **Consistency with project ground rules** (if exists):
   - Read `/memory/ground-rules.md` if it exists
   - Ensure coding standards align with ground rules principles
   - Flag any conflicts between ground rules and coding standards
   - Ensure testing requirements match ground rules' test-first mandates
   - Verify version control and review processes align

6. **Technology-specific recommendations**:
   - **Node.js/TypeScript**:
     - ESLint + Prettier configuration
     - TypeScript strict mode
     - Jest/Vitest for testing
     - pnpm/npm/yarn for package management

   - **Python**:
     - Black + isort for formatting
     - Pylint/Flake8 for linting
     - pytest for testing
     - Poetry/pip for dependency management

   - **Go**:
     - gofmt for formatting
     - golangci-lint for linting
     - Standard library testing
     - Go modules for dependencies

   - **Java**:
     - Checkstyle/PMD for code quality
     - JUnit 5 for testing
     - Maven/Gradle for builds
     - Spring Boot conventions if applicable

   - **Ruby**:
     - RuboCop for style
     - RSpec/Minitest for testing
     - Bundler for dependencies

   - **Rust**:
     - rustfmt for formatting
     - clippy for linting
     - cargo test for testing
     - Cargo for dependencies

7. **Produce a Sync Impact Report** (prepend as HTML comment):
   - Version change: old → new
   - Technology stack detected
   - Sections filled vs. removed (and why)
   - Alignment with ground rules (if exists)
   - Tool recommendations based on stack
   - Follow-up TODOs if any placeholders deferred

8. **Validation before final output**:
   - No remaining unexplained bracket tokens
   - All guidelines are specific and measurable
   - Version line matches report
   - Dates in ISO format YYYY-MM-DD
   - No vague language (replace "should consider" with "MUST" or "RECOMMENDED")
   - All tools/frameworks mentioned are current and actively maintained
   - Security standards meet industry best practices
   - Performance targets are realistic for the project type

9. **Write the completed coding standard** back to `/d-docs/standards.md` (overwrite).

10. **Output a final summary to the user** with:
    - New version and bump rationale
    - Technology stack detected and configured for
    - Key standards established (frontend, backend, testing, security)
    - Tools and frameworks configured
    - Any sections removed as not applicable
    - Alignment status with project ground rules
    - Suggested commit message (e.g., `docs: establish coding standard v1.0.0 (full-stack guidelines)`)

## Key Guidelines

1. **Full-Stack Coverage**:
   - Ensure both frontend and backend standards are comprehensive
   - Cover the entire development lifecycle
   - Include DevOps and infrastructure standards
   - Address security at every layer

2. **Technology-Specific**:
   - Tailor recommendations to detected tech stack
   - Use industry-standard tools for each technology
   - Reference official style guides (e.g., Airbnb for JavaScript, PEP 8 for Python)
   - Stay current with ecosystem best practices

3. **Measurable Standards**:
   - Use specific numbers (80% coverage, <500ms response time)
   - Define clear pass/fail criteria
   - Provide automated checking where possible
   - Set realistic but challenging targets

4. **Practical Enforcement**:
   - Every standard should be checkable via CI/CD
   - Prefer automated checks over manual review
   - Provide tooling configurations (e.g., .eslintrc, .prettierrc)
   - Make violations easy to identify and fix

5. **Security First**:
   - Security standards are non-negotiable
   - Cover OWASP Top 10 vulnerabilities
   - Include dependency security scanning
   - Require security review for sensitive changes

6. **Performance Aware**:
   - Set performance budgets
   - Define monitoring requirements
   - Require performance testing for critical paths
   - Track metrics over time

7. **Living Document**:
   - Standards evolve with project and ecosystem
   - Regular review and updates
   - Team input on improvements
   - Clear amendment process

## Formatting & Style Requirements

- Use Markdown headings exactly as in the template
- Keep examples concrete and project-relevant
- Use bullet points for lists of requirements
- Use checkboxes for review checklists
- Wrap long lines for readability (<100 chars)
- Single blank line between sections
- No trailing whitespace

## Completion Criteria

The coding standard is complete when:

- [ ] All placeholders replaced with project-specific values
- [ ] Technology stack fully configured
- [ ] All applicable sections filled with concrete guidelines
- [ ] Non-applicable sections removed with justification
- [ ] All standards are measurable and enforceable
- [ ] Tooling and automation specified
- [ ] Security requirements comprehensive
- [ ] Performance targets defined
- [ ] Review process documented
- [ ] Exception handling process clear
- [ ] Governance and amendment process specified
- [ ] Aligned with project ground rules (if exists)
- [ ] Version and dates correctly set
- [ ] No template comments or placeholders remain

## Next Steps

After completing the coding standard:

1. **Configure tooling**: Set up linters, formatters, test runners
2. **Update CI/CD**: Add automated checks for all enforceable standards
3. **Create configuration files**: .eslintrc, .prettierrc, etc.
4. **Document exceptions**: Create ADR for any intentional deviations
5. **Team review**: Get team buy-in and feedback
6. **Training**: Brief team on new or updated standards
7. **Monitor compliance**: Set up dashboards for tracking adherence

**Complete workflow context**:
Your response **MUST** suggest the user's next step, following the sequential order below and based on the result of the last action.

```text
1. /personas.regulate      → Establish project principles
2. /personas.specify       → Create feature specifications
3. /personas.clarify       → Clarify requirements (optional)
4. /personas.architect     → Define system architecture
5. /personas.standardize   → Establish coding standards (YOU ARE HERE)
6. /personas.plan          → Plan feature implementation with design (NEXT STEP)
7. /personas.design-test   → Generate E2E test spec
8. /personas.taskify       → Break down into tasks
9. /personas.analyze       → Analyze cross-artifact consistency
10. /personas.implement    → Execute implementation
11. /personas.test         → Execute E2E tests and generate report
```
