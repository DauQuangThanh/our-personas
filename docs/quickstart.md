# Quick Start Guide

This guide will help you get started with Spec-Driven Development using Our Personas.

> NEW: All automation scripts now provide both Bash (`.sh`) and PowerShell (`.ps1`) variants. The `personas` CLI auto-selects based on OS unless you pass `--script sh|ps`.

## Recommended Workflow

### For New Projects (Greenfield)

1. **Install Personas** - Bootstrap your project structure
2. **Establish Principles** - Define project values with `/personas.constitution`
3. **Create System Overview** - List all features and requirements (Feature 001)
4. **Define Architecture** - Design system based on Feature 001
5. **Set Standards** - Establish coding and testing practices
6. **Implement Features** - Build features 002, 003, 004... iteratively

### For Existing Projects (Adding Features)

1. **Install Personas** - Bootstrap your project structure
2. **Establish Principles** - Define project values with `/personas.constitution` (if not done)
3. **Define Architecture** - Document existing architecture with `/personas.architect` (if not done)
4. **Set Standards** - Document current standards with `/personas.standardize` (if not done)
5. **Implement Features** - Add new features using the spec-plan-implement cycle

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

Use `/personas.constitution` to define your project's governing principles:

```bash
/personas.constitution Create principles focused on code quality, testing standards, user experience consistency, and performance requirements
```

### 3. Create System Overview (For New Projects)

For greenfield projects, create a comprehensive system overview before defining architecture:

```bash
/personas.specify Create [Your Project Name] - [brief description].

COMPLETE FEATURE LIST:
1. [Feature 1 name and description]
2. [Feature 2 name and description]
3. [Feature 3 name and description]
...

HIGH-LEVEL REQUIREMENTS:
- Scale: [expected users, data volume, concurrent operations]
- Security: [authentication, authorization, encryption needs]
- Performance: [response time targets, throughput requirements]
- Compliance: [regulatory requirements like GDPR, HIPAA, etc.]
- Integrations: [third-party services needed]

This system overview will guide architecture decisions. Do not implement yet.
```

This creates `.personas/specs/001-system-overview/spec.md` that serves as the blueprint for your architecture.

**Skip this step** if you're adding features to an existing system with established architecture.

### 4. Define System Architecture

Use `/personas.architect` to establish your system's architecture. **If you created a system overview (Feature 001), reference it:**

```bash
/personas.architect Based on the features in specs/001-system-overview/spec.md, design a system architecture using:
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

### 5. Establish Coding Standards

Use `/personas.standardize` to define coding practices and quality standards:

```bash
/personas.standardize Configure standards for [tech stack], [test framework], [coverage target]%, [linters/formatters], and [CI/CD approach]
```

### 6. Create Individual Feature Specifications

Use the `/personas.specify` command to describe what you want to build. Focus on the **what** and **why**, not the tech stack.

```bash
/personas.specify Build an application that can help me organize my photos in separate photo albums. Albums are grouped by date and can be re-organized by dragging and dropping on the main page. Albums are never in other nested albums. Within each album, photos are previewed in a tile-like interface.
```

**Note**: This step creates detailed specifications for individual features. Each feature gets its own branch and spec directory (002-feature-name, 003-feature-name, etc., since 001 is the system overview).

### 7. Create a Technical Implementation Plan

Use the `/personas.plan` command to provide your tech stack and architecture choices.

```bash
/personas.plan The application uses Vite with minimal number of libraries. Use vanilla HTML, CSS, and JavaScript as much as possible. Images are not uploaded anywhere and metadata is stored in a local SQLite database.
```

### 8. Generate E2E Test Plan

Use `/personas.test-plan` to create comprehensive E2E test scenarios:

```bash
/personas.test-plan
```

### 9. Break Down and Implement

Use `/personas.tasks` to create an actionable task list, then use `/personas.implement` to build the feature:

```bash
/personas.tasks
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
/personas.constitution Create principles focused on:
- Code quality: Clean architecture, SOLID principles
- Testing: 80% coverage, TDD approach, E2E for critical paths
- User experience: Responsive design, <200ms interactions, accessibility
- Performance: <100ms real-time updates, efficient database queries
- Security: RBAC, input validation, audit logging
```

#### Step 2: Create System Overview (Feature 001)

```text
/personas.specify Create "Taskify" - a team productivity platform.

COMPLETE FEATURE LIST:
1. Multi-tenant workspace management
2. User authentication and authorization (roles: admin, PM, engineer)
3. Project management (create, archive, permissions)
4. Kanban boards with drag-and-drop
5. Task management (create, assign, comment, move, tags)
6. Real-time collaboration (live updates, presence indicators)
7. File attachments (images, documents)
8. Advanced search and filtering (by assignee, status, tags, dates)
9. Activity feed and notifications (in-app, email, push)
10. Analytics dashboard (velocity, burndown, team metrics)
11. Mobile-responsive UI
12. REST API for integrations

HIGH-LEVEL REQUIREMENTS:
- Scale: 1000 concurrent users, 10K projects, 100K tasks
- Security: SSO support, RBAC, audit logging, data encryption at rest
- Performance: <200ms API response time, <100ms real-time update latency
- Compliance: GDPR-compliant data handling, SOC 2 considerations
- Integrations: Slack notifications, Microsoft Teams, Jira import/export

This is Feature 001 (System Overview) for architecture planning. Do not implement yet.
```

#### Step 3: Define Architecture

```text
/personas.architect Based on the features in specs/001-system-overview/spec.md, design:

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

#### Step 4: Set Standards

```text
/personas.standardize

TECHNOLOGY STACK:
- Backend: .NET 8 with ASP.NET Core
- Frontend: React 18 with TypeScript
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

#### Step 1: Define Feature 002

```text
/personas.specify Feature 002: Basic user authentication and project creation.

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
/personas.plan For Feature 002, implement:
- .NET 8 Auth Service with in-memory user store (5 predefined users)
- React frontend with user selection screen
- PostgreSQL database for projects
- REST API for project CRUD operations
- Basic project listing UI

Follow the architecture defined in memory/architecture.md and standards in memory/standards.md.
```

#### Step 4: Generate Test Plan

```text
/personas.test-plan
```

#### Step 5: Break Down Into Tasks

```text
/personas.tasks
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
