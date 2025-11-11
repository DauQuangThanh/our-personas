# [PROJECT_NAME] Coding Standard
<!-- Example: E-Commerce Platform Coding Standard, Healthcare API Coding Standard, etc. -->

## Template Usage Guidelines

**Section Requirements**: This template contains both mandatory and optional sections. Remove optional sections that don't apply to your project rather than leaving them as placeholders.

### Mandatory Sections (Always Required)

- **Technology-Specific Standards**: At least one of Frontend OR Backend standards (remove sections not applicable to your project)
- **Code Style**: Linting, formatting, and code organization rules
- **Security Standards**: Input validation, data protection, dependency management (critical for all projects)
- **Version Control**: Branching strategy and commit conventions

### Optional Sections (Include When Relevant)

- **Frontend Standards (Entire Section I)**: Remove entirely for backend-only projects (APIs, microservices, CLI tools, workers)
- **Backend Standards (Entire Section II)**: Remove entirely for frontend-only projects (static sites, SPAs with external APIs, mock-ups)
- **Testing Requirements**: Include for production systems; omit for early prototypes, demos, or proof-of-concept projects
- **Documentation Standards**: Include for team projects or production systems; omit for personal projects or short-lived experiments
- **Performance Standards**: Include when performance is critical (high-traffic apps, real-time systems); omit for internal tools or low-traffic applications
- **DevOps & Deployment (CI/CD, Infrastructure)**: Include for deployed applications; omit for libraries, CLI tools, or local-only projects
- **Review Process**: Include for team projects with code reviews; omit for solo development
- **Exception Process**: Include for mature projects with established standards; omit for new projects or experimental codebases
- **Documentation Requirements (in Exception Process)**: Include when exceptions need formal tracking; omit for flexible/agile environments
- **Compliance Verification**: Include for regulated industries or enterprise projects; omit for startups or non-critical applications

### Project Type Guidelines

**Mock-up (Frontend Only)**:

- Keep: Frontend Standards, Code Style, Version Control
- Remove: Backend Standards, Testing Requirements, Performance Standards, DevOps & Deployment, Exception Process, Compliance Verification
- Focus: UI/UX patterns, component structure, basic styling
- Testing: Optional, visual regression only if needed

**Proof of Concept (PoC)**:

- Keep: Frontend/Backend (as applicable), Code Style, Security Standards (basic), Version Control
- Remove: Performance Standards, Exception Process, Compliance Verification
- Optional: Testing Requirements (basic smoke tests), Documentation Standards (minimal)
- Focus: Technical feasibility, core functionality demonstration
- Deployment: Manual/simple deployment acceptable

**Minimum Viable Product (MVP)**:

- Keep: All applicable technology standards, Code Style, Security Standards, Version Control, Testing Requirements (core paths)
- Optional: Performance Standards (basic benchmarks), DevOps & Deployment (basic CI/CD), Documentation Standards
- Remove: Exception Process, Compliance Verification (unless required by domain)
- Focus: Essential features, maintainable code, basic security
- Testing: Unit tests for critical paths, basic integration tests

**Production Systems**:

- Keep: All sections that apply to your context
- Customize based on regulatory requirements, scale, and team size
- Focus: Comprehensive quality, security, performance, monitoring
- Testing: Full coverage (unit, integration, E2E), performance testing
- Required: Security audits, monitoring, incident response

**Backend-Only Systems** (APIs, Microservices, Workers, CLI Tools):

- Keep: Backend Standards, Code Style, Security Standards, Database Standards, Version Control
- Remove: Frontend Standards (entire Section I)
- Optional based on maturity: Testing, Performance, DevOps, Monitoring
- Focus: API design, data layer, service architecture

**Frontend-Only Projects** (Static Sites, SPAs, Component Libraries):

- Keep: Frontend Standards, Code Style, Security Standards (client-side), Version Control
- Remove: Backend Standards (entire Section II), Database Standards (Section VII)
- Optional based on maturity: Testing (visual, unit), Performance (bundle size, loading), DevOps (build/deploy)
- Focus: Component architecture, state management, UI/UX patterns

### When to Remove Optional Sections

**Early-Stage Projects** (Prototypes, POCs, MVPs):

- Remove: Exception Process, Compliance Verification
- Minimal: Testing Requirements (smoke tests only), Performance Standards (basic targets)
- Keep: Code Style, Security Standards (basics), Version Control

**Solo Developer Projects**:

- Remove: Review Process, Exception Process, Documentation Requirements
- Keep: Code Style, Testing (if applicable), Security Standards
- Simplify: Version Control (basic branching), DevOps (simple deployment)

**Internal Tools / Low-Traffic Apps**:

- Remove: Performance Standards, Compliance Verification
- Optional: DevOps & Deployment (if manually deployed)
- Keep: Code Style, Security Standards, Testing Requirements, Version Control

## Development Standards

### I. Frontend Standards (Optional - Remove for backend-only projects)

#### [FRONTEND_FRAMEWORK]

<!-- Example: React, Vue, Angular, Svelte, etc. -->
[FRONTEND_DESCRIPTION]
<!-- Example: 
- Use functional components with hooks (React 18+)
- TypeScript strict mode required
- Component file structure: Component.tsx, Component.module.css, Component.test.tsx
- Props must be typed with interfaces/types
- No any types without explicit justification
-->

#### Component Architecture

[COMPONENT_ARCHITECTURE]
<!-- Example:
- Atomic design principles: atoms → molecules → organisms → templates → pages
- Single Responsibility: One component = one purpose
- Composition over inheritance
- Props drilling max depth: 2 levels (use context/state management beyond)
- Component size: Max 300 lines (excluding types)
-->

#### State Management

[STATE_MANAGEMENT]
<!-- Example:
- Local state: useState for component-specific data
- Global state: Redux Toolkit / Zustand / Jotai for shared application state
- Server state: React Query / SWR for API data caching
- Form state: React Hook Form / Formik with validation schemas
- State naming: descriptive, follows is/has/should pattern for booleans
-->

#### Styling Standards

[STYLING_STANDARDS]
<!-- Example:
- CSS Modules / Styled Components / Tailwind CSS
- BEM naming if using CSS classes
- Theme-based design system with CSS variables
- Responsive: Mobile-first approach
- Accessibility: WCAG 2.1 Level AA minimum
-->

#### Naming Conventions for UI Elements

[UI_NAMING_CONVENTIONS]
<!-- Example:
Component Naming:
- PascalCase for component files: UserProfile.tsx, NavigationBar.tsx
- Prefix with type for specific components: ButtonPrimary, InputEmail, ModalConfirm
- Page components suffix: UserProfilePage, DashboardPage
- Layout components suffix: MainLayout, AuthLayout

Props and State:
- camelCase for props and state variables: userName, isLoading, hasError
- Boolean props: Prefix with is/has/should/can: isVisible, hasPermission, shouldValidate
- Event handlers: Prefix with handle/on: handleClick, onSubmit, handleInputChange
- Callback props: Prefix with on: onSave, onDelete, onCancel

CSS/Style Naming:
- BEM: block__element--modifier (e.g., card__title--large)
- CSS Modules: camelCase for class names (e.g., styles.cardTitle)
- Styled Components: PascalCase for styled components (e.g., StyledButton)
- Tailwind: Use utility classes, avoid custom class names when possible

IDs and Test IDs:
- IDs: kebab-case for HTML IDs: user-profile-form, submit-button
- Test IDs: data-testid in kebab-case: data-testid="login-form-submit"
- Aria labels: Descriptive, human-readable: aria-label="Close navigation menu"

File Organization:
- Component folder: ComponentName/index.tsx, ComponentName.module.css, ComponentName.test.tsx
- Shared components: src/components/shared/ or src/components/common/
- Page-specific components: src/pages/PageName/components/
- Assets: Images in kebab-case: user-avatar-placeholder.png
-->

### II. Backend Standards (Optional - Remove for frontend-only projects)

#### [BACKEND_FRAMEWORK]

<!-- Example: Node.js/Express, Django/FastAPI, Spring Boot, Go/Gin, etc. -->
[BACKEND_DESCRIPTION]
<!-- Example:
- RESTful API design principles
- OpenAPI/Swagger documentation required
- Express.js with TypeScript
- Layered architecture: Routes → Controllers → Services → Repositories
- Dependency injection for testability
-->

#### API Design

[API_DESIGN]
<!-- Example:
- RESTful endpoints: /api/v1/resources
- HTTP methods: GET (read), POST (create), PUT/PATCH (update), DELETE (delete)
- Status codes: 2xx success, 4xx client errors, 5xx server errors
- Request validation: JSON Schema / Joi / Zod
- Response format: Consistent JSON structure with data/error/meta
- Pagination: limit/offset or cursor-based
- Filtering: Query parameters (?status=active&sort=-createdAt)
-->

#### Database Standards

[DATABASE_STANDARDS]
<!-- Example:
- ORM required: Prisma / TypeORM / Sequelize / Django ORM
- Migration-based schema changes (no manual SQL in production)
- Naming: snake_case for tables/columns, PascalCase for models
- Indexes: Required on foreign keys and frequently queried fields
- Transactions: ACID compliance for multi-step operations
- Soft deletes: Use deleted_at for data retention
-->

#### Authentication & Authorization

[AUTH_STANDARDS]
<!-- Example:
- JWT tokens with refresh token rotation
- bcrypt/argon2 for password hashing (min 12 rounds)
- OAuth 2.0 / OIDC for third-party authentication
- Role-Based Access Control (RBAC) or Attribute-Based (ABAC)
- Rate limiting: 100 req/min per IP, 1000 req/min per authenticated user
- Session management: Redis for session storage
-->

### III. Code Quality & Testing

#### Code Style

[CODE_STYLE]
<!-- Example:
- Linting: ESLint (frontend), Pylint/Black (Python), golangci-lint (Go)
- Formatting: Prettier (JS/TS), Black (Python), gofmt (Go)
- Pre-commit hooks: lint-staged + husky
- EditorConfig for consistent IDE settings
- Max line length: 100 characters
- Max function length: 50 lines
- Max file length: 500 lines
- Cyclomatic complexity: Max 10
-->

#### Testing Requirements (Optional - Remove if not applicable)

[TESTING_REQUIREMENTS]
<!-- Example:
- Unit tests: Jest/Vitest (frontend), pytest (Python), Go test
- Integration tests: Supertest (API), Playwright/Cypress (E2E)
- Test coverage: Minimum 80% for new code
- Test naming: describe("Component/Function", () => { it("should do something", ...) })
- Mocking: jest.mock() / sinon / Go interfaces
- Test data: Factories/fixtures, no hardcoded production data
- TDD encouraged: Write tests first for critical business logic
-->

#### Documentation Standards (Optional - Remove if not applicable)

[DOCUMENTATION_STANDARDS]
<!-- Example:
- Code comments: JSDoc/TSDoc for public APIs
- README.md: Setup, architecture, conventions, contribution guide
- API documentation: OpenAPI/Swagger auto-generated
- Architecture Decision Records (ADRs) for major decisions
- Inline comments: Why, not what (code should be self-explanatory)
- TODO comments: Include ticket number and assignee
-->

### IV. Security Standards

#### Input Validation

[INPUT_VALIDATION]
<!-- Example:
- Validate all user inputs on both client and server
- Sanitize HTML to prevent XSS
- Parameterized queries to prevent SQL injection
- Content Security Policy (CSP) headers
- CORS configured with explicit origins (no wildcards in production)
-->

#### Data Protection

[DATA_PROTECTION]
<!-- Example:
- Encryption at rest: AES-256 for sensitive data
- Encryption in transit: TLS 1.3 minimum
- Secrets management: Environment variables / AWS Secrets Manager / Vault
- PII handling: Comply with GDPR/CCPA requirements
- Logging: Never log passwords, tokens, or sensitive PII
-->

#### Dependency Management

[DEPENDENCY_MANAGEMENT]
<!-- Example:
- Lock files required: package-lock.json, poetry.lock, go.sum
- Automated dependency updates: Dependabot / Renovate
- Security scanning: npm audit, Snyk, OWASP Dependency Check
- License compliance: Approved licenses only (MIT, Apache 2.0, BSD)
- No deprecated or unmaintained packages
-->

### V. Performance Standards (Optional - Remove if not applicable)

#### Frontend Performance

[FRONTEND_PERFORMANCE]
<!-- Example:
- Bundle size: Max 300KB gzipped initial load
- Code splitting: Route-based and component-based lazy loading
- Image optimization: WebP format, lazy loading, responsive images
- Caching: Service Workers for offline support
- Lighthouse score: Performance >90, Accessibility >95
- Core Web Vitals: LCP <2.5s, FID <100ms, CLS <0.1
-->

#### Backend Performance

[BACKEND_PERFORMANCE]
<!-- Example:
- API response time: p95 <500ms, p99 <1s
- Database queries: N+1 prevention, eager loading where appropriate
- Caching strategy: Redis for frequently accessed data (TTL-based)
- Rate limiting and throttling on all public endpoints
- Background jobs: Use queues (Bull, Celery) for async processing
- Connection pooling for database and external services
-->

### VII. Database & Data Standards (Optional - Remove if no database)

#### Schema Design
-->

#### Monitoring & Observability

[MONITORING_STANDARDS]
<!-- Example:
- Application Performance Monitoring: New Relic / DataDog / Sentry
- Logging: Structured JSON logs with correlation IDs
- Metrics: Prometheus + Grafana or CloudWatch
- Distributed tracing: OpenTelemetry / Jaeger
- Error tracking: Sentry / Rollbar with stack traces
- Health checks: /health and /ready endpoints
-->

### VI. DevOps & Deployment (Optional - Remove if not applicable)

#### Version Control

[VERSION_CONTROL]
<!-- Example:
- Git branching: GitFlow or trunk-based development
- Branch naming: feature/TICKET-description, bugfix/TICKET-description
- Commit messages: Conventional Commits (feat:, fix:, docs:, etc.)
- PR requirements: At least 1 approval, passing CI/CD, no merge conflicts
- No direct commits to main/master branch
-->

#### CI/CD Pipeline

[CICD_PIPELINE]
<!-- Example:
- Automated builds on every commit
- Test suite runs on every PR
- Code quality gates: Linting, formatting, coverage checks
- Security scanning: SAST, dependency vulnerabilities
- Automated deployment: Staging on merge to develop, Production on release tags
- Rollback capability: Blue-green or canary deployments
-->

#### Infrastructure as Code

[INFRASTRUCTURE_STANDARDS]
<!-- Example:
- Terraform / AWS CloudFormation / Pulumi for infrastructure
- Docker for containerization
- Kubernetes / ECS for orchestration
- Environment parity: Dev, Staging, Production configs
- Configuration management: Environment variables, not hardcoded
- Secrets rotation: Automated via AWS/GCP secret managers
-->

### VII. Database & Data Standards

#### Schema Design

[SCHEMA_DESIGN]
<!-- Example:
- Normalization: 3NF minimum for OLTP databases
- Naming conventions: snake_case for tables/columns
- Primary keys: UUIDs or auto-increment integers
- Foreign keys: Always with ON DELETE/UPDATE constraints
- Timestamps: created_at, updated_at, deleted_at (UTC)
- Indexes: On foreign keys, frequently queried columns, unique constraints
-->

#### Migration Strategy

[MIGRATION_STRATEGY]
<!-- Example:
- All schema changes via migrations (no manual SQL)
- Migrations must be reversible (up/down scripts)
- Test migrations in staging before production
- Zero-downtime deployments: Backward-compatible changes only
- Backup before destructive migrations
- Migration naming: timestamp_description.sql
-->

#### Data Access Patterns

[DATA_ACCESS_PATTERNS]
<!-- Example:
- Repository pattern for data access abstraction
- Read replicas for read-heavy operations
- Write-through caching for frequently updated data
- Bulk operations for large datasets (avoid N+1 queries)
- Pagination required for collections (max 100 items per page)
- Database connection pooling with appropriate limits
-->

## Project-Specific Standards

### [TECH_STACK_SPECIFIC]
<!-- Example: Microservices Architecture, Monorepo Structure, etc. -->
[TECH_STACK_DESCRIPTION]
<!-- Example:
- Monorepo managed with Nx / Turborepo / Lerna
- Shared packages: common, types, utils, config
- Package naming: @company/package-name
- Cross-package dependencies managed via workspace protocol
-->

### [DOMAIN_SPECIFIC]
<!-- Example: E-Commerce Specific, Healthcare Compliance, etc. -->
[DOMAIN_DESCRIPTION]
<!-- Example:
- PCI-DSS compliance for payment processing
- HIPAA compliance for health data
- GDPR requirements for EU users
- Audit logging for all data modifications
-->

## Code Review Guidelines (Optional - Remove if not applicable)

### Review Checklist

[REVIEW_CHECKLIST]
<!-- Example:
- [ ] Code follows project coding standards
- [ ] Tests are included and passing
- [ ] Documentation is updated
- [ ] No security vulnerabilities introduced
- [ ] Performance impact assessed
- [ ] Breaking changes are documented
- [ ] Error handling is comprehensive
- [ ] Logging is appropriate (no sensitive data)
- [ ] Database migrations are reversible
- [ ] API changes are backward compatible
-->

### Review Process

[REVIEW_PROCESS]
<!-- Example:
- Self-review before requesting PR review
- At least 1 approving review required
- Senior review required for architectural changes
- Security review for authentication/authorization changes
- Performance testing for high-traffic endpoints
- 24-hour review SLA for non-urgent PRs
-->

## Exception Process (Optional - Remove if not applicable)

### When to Deviate

[EXCEPTION_CRITERIA]
<!-- Example:
- Technical debt must be documented with ticket number
- Security exceptions require security team approval
- Performance exceptions require benchmarks proving necessity
- All exceptions documented in code comments with justification
- Exceptions reviewed quarterly for remediation opportunities
-->

### Documentation Requirements (Optional - Remove if not applicable)

[EXCEPTION_DOCUMENTATION]
<!-- Example:
- Create ADR (Architecture Decision Record) for major deviations
- Link to ticket tracking technical debt
- Set timeline for remediation
- Tag with TECH-DEBT or SECURITY-EXCEPTION label
-->

## Governance

### Standard Enforcement

[ENFORCEMENT_RULES]
<!-- Example:
- All PRs must pass automated checks (linting, tests, security scans)
- Code reviews verify standard compliance
- Quarterly standard review meetings
- Standards updated based on team retrospectives
- New technologies require RFC (Request for Comments) process
-->

### Amendment Process

[AMENDMENT_PROCESS]
<!-- Example:
- Propose changes via RFC document
- Team discussion and consensus required
- Update documentation and tooling
- Version bump: MAJOR (breaking), MINOR (additions), PATCH (clarifications)
- Communicate changes to all team members
- Grace period for adopting new standards
-->

### Compliance Verification (Optional - Remove if not applicable)

[COMPLIANCE_VERIFICATION]
<!-- Example:
- Automated checks in CI/CD pipeline
- Monthly code quality reports
- Security audits quarterly
- Performance benchmarks tracked over time
- Technical debt tracked and prioritized in backlog
-->

**Version**: [STANDARD_VERSION] | **Ratified**: [RATIFICATION_DATE] | **Last Amended**: [LAST_AMENDED_DATE]
<!-- Example: Version: 1.0.0 | Ratified: 2025-01-15 | Last Amended: 2025-11-05 -->
