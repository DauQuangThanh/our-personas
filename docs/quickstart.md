# Quick Start Guide

This guide will help you get started with Spec-Driven Development using Our Personas.

> NEW: All automation scripts now provide both Bash (`.sh`) and PowerShell (`.ps1`) variants. The `personas` CLI auto-selects based on OS unless you pass `--script sh|ps`.

## Recommended Workflow

### For New Projects (Greenfield)

1. **Install Personas** - Bootstrap your project structure
2. **Establish Principles** - Define project values with `/personas.regulate`
3. **Specify Features** - Create detailed specifications with `/personas.specify`
4. **Clarify Requirements** - Resolve ambiguities with `/personas.clarify` (optional)
5. **Define Architecture** - Design system architecture with `/personas.architect`
6. **Set Standards** - Establish coding and testing practices with `/personas.standardize`
7. **Design & Implement** - Create plans and build features iteratively

### For Existing Projects (Adding Features)

1. **Install Personas** - Bootstrap your project structure
2. **Establish Principles** - Define project values with `/personas.regulate` (if not done)
3. **Specify Features** - Create feature specifications with `/personas.specify`
4. **Clarify Requirements** - Resolve ambiguities with `/personas.clarify` (optional)
5. **Update Architecture** - Update architecture if needed with `/personas.architect`
6. **Update Standards** - Update standards if needed with `/personas.standardize`
7. **Design & Implement** - Create plans and build features

## The Complete Process

### 1. Install Personas

Initialize your project depending on the coding agent you're using:

```bash
uvx --from git+https://github.com/dauquangthanh/our-personas.git personas init <PROJECT_NAME>
```

Pick script type explicitly (optional):

```bash
uvx --from git+https://github.com/dauquangthanh/our-personas.git personas init <PROJECT_NAME> --script ps  # Force PowerShell
uvx --from git+https://github.com/dauquangthanh/our-personas.git personas init <PROJECT_NAME> --script sh  # Force POSIX shell
```

### 2. Establish Project Principles

Use `/personas.regulate` to define your project's governing principles:

```bash
/personas.regulate Create principles focused on code quality, testing standards, user experience consistency, and performance requirements
```

### 3. Create Feature Specifications

Use `/personas.specify` to create detailed feature specifications:

```bash
/personas.specify Build an application that can help me organize my photos in separate photo albums. Albums are grouped by date and can be re-organized by dragging and dropping on the main page.
```

### 4. Clarify Requirements (Optional)

Use `/personas.clarify` to resolve ambiguities:

```bash
/personas.clarify
```

### 5. Define System Architecture

Use `/personas.architect` to establish your system's architecture:

```bash
/personas.architect Design a system architecture using:
- [List appropriate architectural patterns and components]
- [Database and storage choices]
- [Communication patterns]
- [Deployment and scaling strategy]

Include component interactions, data flows, and scalability considerations.
```

For simpler applications:

```bash
/personas.architect Design a single-page application with local storage, using a modular component architecture
```

### 6. Establish Coding Standards

Use `/personas.standardize` to define coding practices and quality standards:

```bash
/personas.standardize Configure standards for [tech stack], [test framework], [coverage target]%, [linters/formatters], and [CI/CD approach]
```

### 7. Create a Technical Implementation Plan

Use the `/personas.design` command to provide your tech stack and architecture choices.

```bash
/personas.design The application uses Vite with minimal number of libraries. Use vanilla HTML, CSS, and JavaScript as much as possible. Images are not uploaded anywhere and metadata is stored in a local SQLite database.
```

### 8. Generate E2E Test Plan

Use `/personas.design-test` to create comprehensive E2E test scenarios:

```bash
/personas.design-test
```

### 9. Break Down and Implement

Use `/personas.taskify` to create an actionable task list, then use `/personas.implement` to build the feature:

```bash
/personas.taskify
/personas.implement
```

### 10. Execute E2E Tests

Use `/personas.test` to run E2E tests and generate a test report:

```bash
/personas.test
```

## Detailed Example: Building Taskify

Here's a complete example of building a team productivity platform from scratch.

### Phase 1: System-Level Planning

#### Step 1: Establish Principles

```text
/personas.regulate Create principles focused on:
- Code quality: Clean architecture, SOLID principles
- Testing: 80% coverage, TDD approach, E2E for critical paths
- User experience: Responsive design, <200ms interactions, accessibility
- Performance: <100ms real-time updates, efficient database queries
- Security: RBAC, input validation, audit logging
```

#### Step 2: Specify First Feature

```text
/personas.specify Feature 001: Basic user authentication and project creation.

This is a simplified first feature focusing on:
- User login (5 predefined users: 1 PM, 4 engineers)
- No password required (user selection only)
- Create and list projects
- Basic project permissions
```

#### Step 3: Clarify and Refine

```text
/personas.clarify
```

After clarification, add any refinements:

```text
Each project should have 3 sample projects created with basic metadata.
```

#### Step 4: Define Architecture

```text
/personas.architect Design a system architecture for "Taskify" based on Feature 001 requirements:

ARCHITECTURE:
- Microservices: Auth Service, Project Service, Task Service, Notification Service, Analytics Service
- API Gateway with rate limiting and authentication
- PostgreSQL for transactional data (projects, tasks, users)
- Redis for caching and real-time presence
- RabbitMQ for asynchronous task processing (notifications, analytics)
- SignalR/WebSockets for real-time updates
- Azure Blob Storage for file attachments
- Elasticsearch for advanced search

DEPLOYMENT:
- Kubernetes on Azure AKS
- Initial: Vertical scaling
- Future: Horizontal scaling with service replication
- CI/CD: GitHub Actions with automated testing

SECURITY:
- OAuth2/OpenID Connect for SSO
- JWT tokens for API authentication
- Row-level security in PostgreSQL
- HTTPS everywhere with TLS 1.3

DATA FLOWS:
- Task updates: Client → API Gateway → Task Service → PostgreSQL + Redis + SignalR
- Notifications: Task Service → RabbitMQ → Notification Service → Email/Push providers
- Search: Task Service → Elasticsearch sync → Search Service
```

#### Step 4: Establish Coding Standards

```text
/personas.standardize Configure standards for:

TECHNOLOGY STACK:
- Backend: .NET 8 with ASP.NET Core
- Frontend: React 18 with TypeScript
- Database: PostgreSQL 15
- Testing: xUnit (backend), Vitest + React Testing Library (frontend), Playwright (E2E)

QUALITY STANDARDS:
- Code coverage: 80% minimum
- Complexity: Max cyclomatic complexity of 10
- Linting: ESLint (frontend), StyleCop (backend)
- Formatting: Prettier (frontend), EditorConfig (backend)

TESTING APPROACH:
- Unit tests for business logic
- Integration tests for API endpoints
- E2E tests for critical user workflows
- Performance tests for real-time updates

CI/CD:
- GitHub Actions for build, test, deploy
- Automated security scanning (OWASP Dependency Check)
- Automated accessibility testing (axe-core)
- Blue-green deployment strategy
```

### Phase 2: Implement First Feature

**Note**: After establishing ground rules, architecture, and standards, you can now implement features using the full workflow.

#### Step 1: Design Feature Plan

```text
/personas.design Use Blazor Server for UI, SignalR for real-time, REST API for CRUD operations, EF Core for data access

This is a simplified first feature focusing on:
- User login (5 predefined users: 1 PM, 4 engineers)
- No password required (user selection only)
- Create and list projects
- Basic project permissions
```

#### Step 2: Clarify and Refine

```text
/personas.clarify
```

After clarification, add any refinements:

```text
Each project should have 3 sample projects created with basic metadata.
```

Validate the specification checklist:

```text
Read the review and acceptance checklist, and check off each item in the checklist if the feature spec meets the criteria. Leave it empty if it does not.
```

#### Step 3: Create Implementation Plan

Be specific about implementation details for this feature:

```text
/personas.design For Feature 002, implement:
- .NET 8 Auth Service with in-memory user store (5 predefined users)
- React frontend with user selection screen
- PostgreSQL database for projects
- REST API for project CRUD operations
- Basic project listing UI

Follow the architecture defined in memory/architecture.md and standards in memory/standards.md.
```

#### Step 4: Generate Test Plan

```text
/personas.design-test
```

#### Step 5: Break Down Into Tasks

```text
/personas.taskify
```

#### Step 6: Validate and Implement

Have your AI agent audit the implementation plan:

```text
Audit the implementation plan and tasks to ensure all steps are clear and properly sequenced.
```

Implement the feature:

```text
/personas.implement
```

#### Step 7: Run E2E Tests

```text
/personas.test
```

### Phase 3: Iterate With More Features

Repeat Phase 2 for each additional feature (003, 004, etc.):

- Feature 003: Kanban boards with drag-and-drop
- Feature 004: Task comments and assignments
- Feature 005: Real-time collaboration
- Feature 006: File attachments
- And so on...

Each feature builds on the established architecture and standards from Phase 1.

## Key Principles

- **System overview first** for new projects - understand the full scope before architecting
- **Architecture before features** - design the system based on all planned features
- **Be explicit** about what you're building and why
- **Don't focus on tech stack** during specification phase (except in system overview)
- **Iterate and refine** your specifications before implementation
- **Validate** the plan before coding begins
- **Let the AI agent handle** the implementation details

## Next Steps

- Read the complete methodology for in-depth guidance
- Check out more examples in the repository
- Explore the source code on GitHub
