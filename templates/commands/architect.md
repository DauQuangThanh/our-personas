---
description: Create or update the software architecture design from interactive or provided inputs, ensuring comprehensive system architecture documentation
scripts:
  sh: scripts/bash/setup-arch.sh --json
  ps: scripts/powershell/setup-arch.ps1 -Json
agent_scripts:
  sh: scripts/bash/update-agent-context.sh __AGENT__
  ps: scripts/powershell/update-agent-context.ps1 -AgentType __AGENT__
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Key Rules

Before proceeding with the workflow, adhere to these critical rules:

1. **Use Absolute Paths**: All file paths MUST be absolute paths from repository root (e.g., `/d-docs/architecture.md`, `/memory/ground-rules.md`)
2. **ERROR on Missing Ground Rules**: If `/memory/ground-rules.md` does not exist, immediately ERROR and instruct user to run `/personas.regulate` first
3. **WARN on Technology Conflicts**: If detected technology stack conflicts with user input, WARN the user and ask for clarification
4. **Maintain ISO/IEC/IEEE 42010:2011 Standards**: Architecture document MUST follow stakeholder-driven architecture description standards
5. **Product Level Awareness**: Tailor architectural complexity and detail to the specified product level (Mock-up, PoC, MVP, Production)

## Outline

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for ARCH_DOC, REPO_ROOT, CURRENT_BRANCH, HAS_GIT. Validate environment and create necessary directories.

2. **Load context**: Read `/memory/ground-rules.md`, `/d-docs/company/architecture/architecture-guidelines.md` (if exists), `/d-docs/standards.md` (if exists). Detect project information and technology stack. Load ARCH_DOC template.

3. **Execute architecture workflow**: Follow the phase-based execution flow to:
   - **Fill Alignment Checks section**:
     - **Ground Rules Check**: Verify alignment with ground rules principles (governance, values, constraints)
     - **Company Architecture Guidelines Check**: Verify alignment with company architecture standards (if exists)
     - **Technology Stack Consistency Check**: Verify technology choices are compatible and integrated
   - Evaluate gates (ERROR if violations unjustified or conflicts unresolved)
   - Phase 0: Generate architecture-research.md (resolve all architectural unknowns)
   - Phase 1: Fill architecture.md template using research decisions
   - Phase 1: Update agent context by running the agent script
   - **Re-evaluate all Alignment Checks post-architecture** (Ground Rules, Company Guidelines, Technology Consistency)

4. **Stop and report**: Command ends after validation. Report branch, ARCH_DOC path, research document, generated artifacts, and alignment status with all foundational documents.

## Phases

### Phase 1: Setup

1. **Execute setup script** to validate environment and get paths:
   - Run the setup script: `{SCRIPT} --json` (bash) or `{SCRIPT} -Json` (PowerShell)
   - Parse JSON output to extract:
     - `ARCH_DOC`: Path to architecture document (`/d-docs/architecture.md`)
     - `REPO_ROOT`: Repository root directory
     - `CURRENT_BRANCH`: Current git branch (or empty if not in git repo)
     - `HAS_GIT`: Whether repository uses git ("true" or "false")
   - If script fails or ground-rules.md missing, ERROR immediately and instruct user to run `/personas.regulate`

2. **Ensure directories exist**:
   - Verify `/d-docs/` directory exists (script creates it)
   - Verify `/d-docs/checklists/` directory exists (script creates it)

3. **Load the existing architecture template** at `ARCH_DOC` (`/d-docs/architecture.md`):
   - Identify every placeholder token of the form `[ALL_CAPS_IDENTIFIER]` or `[descriptive text]`
   - Note: This template follows ISO/IEC/IEEE 42010:2011 standards for architecture description

### Phase 2: Load Context

1. **Read foundational documents** (use absolute paths):
   - Read `/memory/ground-rules.md` (REQUIRED - already validated by script)
   - Read `/d-docs/company/architecture/architecture-guidelines.md` if exists (company architecture standards)
   - Read `/d-docs/standards.md` if exists (coding standards to align with)

2. **Detect project information and technology stack**:
   - **Specs**: Check all files in `specs/` folder, especially for ALL `spec.md` files
   - **System Name**: Check `README.md`, `package.json`, `pyproject.toml`, or ask user
   - **System Purpose**: Extract from `README.md`, specifications, or ask user
   - **Technology Stack**:
     - Check for `package.json` (Node.js/JavaScript/TypeScript)
     - Check for `requirements.txt` or `pyproject.toml` (Python)
     - Check for `go.mod` (Go)
     - Check for `pom.xml` or `build.gradle` (Java)
     - Check for `Gemfile` (Ruby)
     - Check for `composer.json` (PHP)
     - Check for `Cargo.toml` (Rust)
   - **Infrastructure**: Check for Docker, Kubernetes, cloud provider configs
   - **Existing Documentation**: Review `README.md`, design.md files, specs for architecture details
   - If unclear, WARN user and ask for clarifications

3. **Collect/derive values for placeholders**:
   - **Introduction (Section 1)**:
     - `[System Name]`: Project/product name
     - `[briefly describe the system's purpose]`: One-sentence system description
     - `[select one: Mock-up, Proof of Concept (PoC), Minimum Viable Product (MVP), Full-fledged Production]`: Current product level
     - `[Specify the current level]`: Concrete product level
     - `[Describe architectural scope]`: Scope implications for current level
     - `[Note quality priorities]`: Quality attribute priorities
     - `[Note infrastructure implications]`: Infrastructure approach
     - `[Note scalability approach]`: Scalability strategy
     - Technical terms and acronyms specific to the project
     - Reference documents (SRS, project plan, etc.)

   - **Architectural Representation (Section 2)**:
     - Stakeholders relevant to this project
     - Their specific concerns
     - Which architectural views will be used (Logical, Process, Deployment, Data)

   - **Goals and Constraints (Section 3)**:
     - `[Goal 1]`, `[Goal 2]`, `[Goal 3]`: Business goals driving architecture
     - Performance targets: `[500ms]`, `[3x]`, `[99.99%]`: Specific metrics
     - Technology constraints: `[e.g., Python, AWS, PostgreSQL]`: Tech stack
     - Budget constraints: `[$X,XXX]`: Cost limitations
     - Legacy integration requirements: `[e.g., legacy mainframe system]`: Integration needs

   - **Architectural Views (Section 4)**:
     - `[Component A]`, `[Component B]`, `[Component C]`, `[Component D]`: System components
     - Component descriptions and responsibilities
     - Inter-component communication mechanisms: `[e.g., RESTful APIs, RabbitMQ]`
     - Infrastructure details: `[e.g., AWS]`
     - Data stores: `[Data Store 1]`, `[Data Store 2]`
     - Diagram placeholders (create or reference actual diagrams if possible)

   - **Architectural Decisions (Section 5)**:
     - Rationale for technological choices
     - Rationale for architectural style (microservices, monolith, etc.)
     - Alternative approaches considered
     - Trade-offs made

   - **Policies and Patterns (Section 6)**:
     - `[Pattern 1]`, `[Pattern 2]`: Design patterns used
     - System-wide policies (error handling, security, logging)
     - Pattern applications and their rationale

### Phase 3: Research & Discovery

1. **Identify architectural unknowns** from template placeholders and project context:
   - Extract all "NEEDS CLARIFICATION" markers from architecture template
   - Identify technology stack options (if not already detected)
   - List architectural style alternatives (monolith, microservices, serverless, etc.)
   - Enumerate infrastructure options (cloud providers, deployment strategies)
   - Document data store strategy options (SQL, NoSQL, caching, persistence)
   - Note communication pattern choices (REST, GraphQL, gRPC, message queues)
   - List authentication/authorization strategy options

2. **Research each unknown systematically**:
   - For each technology option: evaluate 2-3 alternatives
   - Use the latest stable versions of frameworks/libs/guidelines
   - Document pros and cons for the specific use case
   - Consider constraints from `/memory/ground-rules.md`
   - Consider product level requirements (Mock-up/PoC/MVP/Production)
   - Research industry best practices and proven patterns
   - Evaluate team expertise and learning curve
   - Consider cost implications and licensing
   - Assess ecosystem maturity and community support

3. **Make informed architectural decisions**:
   - Select best-fit technologies with detailed rationale
   - Choose architectural style based on requirements analysis
   - Document all alternatives considered
   - Record trade-offs explicitly
   - Map decisions back to business goals and quality attributes
   - Ensure consistency across all technology choices

4. **Generate architecture research document** at `REPO_ROOT/d-docs/architecture-research.md`:
   - Use format:

     ```markdown
     # Architecture Research & Decisions
     
     **Created**: [DATE] |
     **Product Level**: [Mock-up/PoC/MVP/Production] |
     **Architecture Document**: [/d-docs/architecture.md](architecture.md)
     
     ## Executive Summary
     - Brief overview of major architectural decisions
     - Key technology stack selections
     - Architectural style chosen
     
     ## Research Areas
     
     ### 1. [Research Area Name, e.g., "Technology Stack"]
     
     **Question**: [What needed to be decided?]
     
     **Options Evaluated**:
     1. **[Option 1]**: [Description]
        - Pros: [List advantages]
        - Cons: [List disadvantages]
        - Fit for use case: [Analysis]
     
     2. **[Option 2]**: [Description]
        - Pros: [List advantages]
        - Cons: [List disadvantages]
        - Fit for use case: [Analysis]
     
     **Decision**: [What was chosen]
     
     **Rationale**: [Why this choice is best for the specific context, considering ground rules, product level, and constraints]
     
     **Trade-offs**: [What was sacrificed to gain what benefits]
     
     **Alternatives Considered**: [Summary of why other options were not selected]
     
     [Repeat for each research area]
     ```

   - Include research areas:
     - Technology Stack Selection
     - Architectural Style
     - Infrastructure & Deployment
     - Data Store Strategy
     - Communication Patterns
     - Authentication & Authorization
     - Security Approach
     - Monitoring & Observability
     - Any other areas with "NEEDS CLARIFICATION"

5. **Validate research completeness**:
   - Ensure all "NEEDS CLARIFICATION" markers are resolved
   - Verify all major architectural decisions are documented
   - Confirm rationale addresses ground rules principles
   - Check that decisions align with product level
   - Ensure technology choices are compatible with each other

**Output**: `/d-docs/architecture-research.md` with all architectural unknowns resolved

### Phase 4: Execute Architecture

**Prerequisites**: `architecture-research.md` complete with all decisions documented

1. **Fill Alignment Checks section** in architecture document:
   - Create or update the "Alignment Checks" section BEFORE drafting architecture content
   - Include these three alignment validations:

   **a. Ground Rules Alignment**:
   - Review `/memory/ground-rules.md` principles and constraints
   - Document how architecture respects each ground rule
   - Flag any violations with justification
   - Example: "Library-First Principle → Using established frameworks (Express, PostgreSQL) rather than custom solutions"

   **b. Company Architecture Guidelines Alignment**:
   - Review `/d-docs/company/architecture/architecture-guidelines.md` if exists
   - Document alignment with company architecture standards
   - Note any deviations with business justification
   - If file doesn't exist, state "No company architecture guidelines found - skipping check"

   **c. Technology Stack Consistency**:
   - Ensure all technology choices are compatible and work together
   - Verify versions are specified and compatible
   - Document integration points between technologies
   - Flag any technology conflicts or gaps

2. **Evaluate alignment gates**:
   - If Ground Rules violations exist without clear justification: ERROR
   - If Company Guidelines violations exist without business justification: ERROR
   - If Technology Stack has critical incompatibilities: ERROR
   - For non-critical issues: WARN and document in alignment section

3. **Draft the updated architecture document**:
   - Use decisions from `architecture-research.md` to fill placeholders
   - Replace every placeholder with concrete text (no bracketed tokens left)
   - Preserve heading hierarchy and structure
   - Ensure each section has:
     - Clear, specific information relevant to the project
     - Measurable quality attributes (e.g., "99.9% uptime" not "high availability")
     - Concrete technology choices with versions where applicable
     - Diagrams or diagram descriptions
   - Reference research document for rationale
   - Tailor content to detected technology stack and product level
   - Remove ACTION REQUIRED comments
   - Add concrete examples where helpful

4. **Product level-specific recommendations**:
   - **Mock-up**:
     - Simple single-component architecture
     - Focus on UI/UX flows
     - Minimal infrastructure requirements
     - No scaling considerations needed

   - **Proof of Concept (PoC)**:
     - Core components only
     - Single-server deployment acceptable
     - Basic error handling
     - Focus on technical feasibility
     - Defer performance optimization

   - **Minimum Viable Product (MVP)**:
     - Essential components for user value
     - Vertical scaling approach
     - Basic monitoring and logging
     - Security essentials implemented
     - Performance baseline established
     - Designed for future horizontal scaling

   - **Full-fledged Production**:
     - Complete component architecture
     - Multi-region, high-availability setup
     - Comprehensive security hardening
     - Horizontal scaling capabilities
     - Full observability stack
     - Disaster recovery planning
     - Performance optimization

5. **Produce a Sync Impact Report** (prepend as HTML comment):
   - System name and purpose identified
   - Product level determined
   - Technology stack detected
   - Key components and their interactions
   - Quality attributes prioritized
   - Infrastructure approach defined
   - Alignment with ground rules and coding standards
   - Architectural patterns applied
   - Follow-up TODOs if any information deferred

6. **Validation before final output**:
   - No remaining unexplained bracket tokens or ACTION REQUIRED comments
   - All quality attributes have specific, measurable targets
   - Technology stack is fully specified with versions
   - All components have clear responsibilities
   - Communication patterns between components defined
   - Infrastructure and deployment approach documented
   - Security considerations addressed
   - Scalability approach appropriate for product level
   - Diagrams referenced or described
   - Alternative approaches and trade-offs documented

7. **Write the completed architecture document** back to `ARCH_DOC` (typically `/d-docs/architecture.md`) - overwrite the file.

8. **Re-evaluate all Alignment Checks**:
   - Review the completed architecture against Ground Rules
   - Review against Company Architecture Guidelines (if exists)
   - Review Technology Stack Consistency
   - Update alignment check sections with final status
   - If critical violations found: ERROR and list specific issues
   - If warnings remain: Document them clearly for stakeholder review

9. **Update agent context** (if applicable):
   - Run `{AGENT_SCRIPT}`
   - These scripts detect which AI agent is in use
   - Update the appropriate agent-specific context file
   - Add only new technology from current plan
   - Preserve manual additions between markers

### Phase 5: Report

### Phase 6: Report

1. **Output a final summary to the user** with:
   - Current branch: `CURRENT_BRANCH` (or "Not in git repository")
   - Architecture document path: `ARCH_DOC`
   - Research document path: `REPO_ROOT/d-docs/architecture-research.md`
   - Checklist path: `REPO_ROOT/d-docs/checklists/architecture.md`
   - System name and purpose
   - Product level and architectural implications
   - Technology stack configured
   - Key architectural decisions and rationale
   - Components and their interactions
   - Quality attributes and targets
   - Infrastructure and deployment approach
   - **Alignment status**:
     - Ground Rules: [Pass/Fail with details]
     - Company Architecture Guidelines: [Pass/Fail/N/A with details]
     - Technology Stack Consistency: [Pass/Fail with details]
   - **Agent context updates**: List which agent files were updated (or "None found")
   - **Readiness for next phase**: Confirm if ready for `/personas.standardize` or needs updates
   - **Next recommended step**:
     - **Recommended**: Run `/personas.validate-arch` to generate custom architecture validation checklists for deeper quality assurance
     - **Alternative**: Run `/personas.standardize` to establish coding standards aligned with this architecture
   - Suggested commit message (e.g., `docs: establish architecture for [System Name] v1.0 (MVP microservices)`)

## General Guidelines

### Quick Guidelines

- Focus on **system structure and component interactions**, not implementation details
- Address **stakeholder concerns** through multiple architectural views
- Make **quality attributes measurable** (performance, availability, scalability)
- Document **architectural decisions** with rationale and trade-offs
- Align architecture with **product maturity level** (Mock-up, PoC, MVP, Production)
- Ensure **technology stack is specific** with versions and justifications

### For AI Generation

When creating architecture from user input:

1. **Make informed architectural choices**: Use industry best practices and proven patterns
2. **Document assumptions**: Record technology choices and their rationale
3. **Tailor to product level**: Don't over-engineer for PoC, don't under-specify for Production
4. **Be specific about quality attributes**: Use concrete numbers (99.9% uptime, <500ms latency)
5. **Choose appropriate patterns**: Match architectural style to requirements and constraints
6. **Common areas requiring attention**:
   - Component boundaries and responsibilities
   - Inter-component communication mechanisms
   - Data storage and persistence strategies
   - Security and authentication approach
   - Scalability and performance targets
   - Deployment and infrastructure strategy

**Examples of good architectural specifications**:

- "API Gateway handles authentication using JWT tokens with 15-minute expiration"
- "PostgreSQL 15.x for relational data with read replicas for scaling"
- "Microservices communicate via RESTful APIs with circuit breaker pattern"
- "Target: 99.9% uptime (8.76 hours downtime/year)"

**Examples of poor architectural specifications** (too vague):

- "Use a database for storage" (which database? why?)
- "High availability required" (what percentage? how achieved?)
- "Services talk to each other" (synchronous? asynchronous? protocol?)
- "Secure authentication" (how? what mechanism? what tokens?)

### Key Architecture Principles

1. **Stakeholder-Driven Architecture**:
   - Address concerns of all stakeholders (developers, ops, product, QA, security)
   - Use multiple views (Logical, Process, Deployment, Data) as appropriate
   - Make trade-offs explicit and documented
   - Align architecture with business goals

2. **Product Level Appropriate**:
   - Tailor complexity to product maturity
   - PoC focuses on core technical feasibility
   - MVP balances features with maintainability
   - Production requires comprehensive operational excellence
   - Document evolution path to next level

3. **Technology Specific**:
   - Use ecosystem-appropriate patterns
   - Reference well-known architectural styles
   - Consider team expertise in technology choices
   - Balance innovation with proven approaches

4. **Measurable Quality Attributes**:
   - Specific performance targets (latency, throughput)
   - Concrete availability requirements (uptime SLAs)
   - Defined scalability metrics
   - Quantified security requirements
   - Budget constraints clearly stated

5. **Clear Component Responsibilities**:
   - Single responsibility per component
   - Well-defined interfaces
   - Explicit dependencies
   - Communication patterns documented
   - Data ownership clarified

6. **Infrastructure as Architecture**:
   - Deployment strategy defined
   - Scaling approach documented
   - Monitoring and observability planned
   - Disaster recovery considered
   - Cost implications understood

7. **Security by Design**:
   - Security policies system-wide
   - Data protection at rest and in transit
   - Access control mechanisms defined
   - Threat mitigation strategies documented
   - Compliance requirements addressed

8. **Evolution-Friendly**:
   - Architecture can evolve with product
   - Clear extension points
   - Refactoring strategy for growth
   - Technical debt acknowledged
   - Migration paths documented

## Formatting & Style Requirements

- Use Markdown headings exactly as in the template
- Keep descriptions concrete and project-specific
- Use bullet points for lists
- Use tables for structured data (stakeholders, definitions)
- Reference diagrams (create if possible, or describe in detail)
- Wrap long lines for readability (<100 chars)
- Single blank line between sections
- No trailing whitespace
- Remove all ACTION REQUIRED comments

## Completion Criteria

The architecture document is complete when:

- [ ] All placeholders replaced with project-specific values
- [ ] System name and purpose clearly defined
- [ ] Product level specified with architectural implications
- [ ] Technology stack fully documented
- [ ] All stakeholders and concerns identified
- [ ] Appropriate architectural views selected and described
- [ ] Business goals documented
- [ ] Quality attributes specified with measurable targets
- [ ] Design constraints identified
- [ ] All components defined with clear responsibilities
- [ ] Component interactions and communication patterns documented
- [ ] Deployment view describes infrastructure
- [ ] Data architecture documented
- [ ] Key architectural decisions recorded with rationale
- [ ] Alternative approaches and trade-offs discussed
- [ ] System-wide policies defined
- [ ] Design patterns identified and applied
- [ ] Security considerations addressed
- [ ] Scalability approach documented
- [ ] Aligned with project ground rules and coding standards
- [ ] No template comments or placeholders remain
- [ ] Document reads as cohesive project documentation

## Next Steps

After completing the architecture document and checklist validation:

1. **Commit architecture**: Use suggested commit message to save the architecture document
2. **Validate architecture**: Run `/personas.validate-arch` to generate custom architecture validation checklists for deeper quality assurance
   - Creates focused checklists for specific architectural concerns (component design, security, deployment, data, performance)
   - Complements the built-in architecture.md validation with targeted, context-specific checks
   - Recommended for MVP and Production levels
3. **Establish coding standards**: Run `/personas.standardize` to create technology-specific coding standards that align with this architecture
   - This ensures consistent development practices across all features
   - Standards will be based on the technology stack defined in this architecture
   - Required before running `/personas.design` to ensure implementation designs follow established standards
4. **Review with stakeholders**: Get feedback from team, product, and ops
5. **Document ADRs**: Create Architecture Decision Records for key choices
6. **Update related docs**: Ensure README, design docs align with architecture
7. **Ready for feature work**: After standards are established, proceed to `/personas.design` and `/personas.taskify` for feature development
8. **Set up infrastructure**: Provision cloud resources, containers, etc. (after planning)
9. **Establish monitoring**: Set up observability for quality attribute tracking
10. **Create runbooks**: Document operational procedures for the architecture

**Complete workflow context**:
Your response **MUST** suggest the user's next step, following the sequential order below and based on the result of the last action.

```text
1. /personas.regulate      → Establish project principles
2. /personas.specify       → Create feature specifications
3. /personas.clarify       → Clarify requirements (optional)
4. /personas.architect     → Define system architecture (YOU ARE HERE)
   ↳ /personas.validate-arch → Validate architecture (optional - recommended for MVP/Production)
5. /personas.standardize   → Establish coding standards (NEXT STEP)
6. /personas.design        → Design feature implementation plan
7. /personas.design-test   → Generate E2E test scenario
8. /personas.taskify       → Break down into tasks
9. /personas.analyze       → Analyze cross-artifact consistency
10. /personas.implement    → Execute implementation
11. /personas.test         → Execute E2E tests and generate report
```
