---
description: Create or update the software architecture design from interactive or provided inputs, ensuring comprehensive system architecture documentation
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

You are updating the software architecture document at `/memory/architecture.md`. This file is a TEMPLATE containing placeholder tokens in square brackets (e.g. `[System Name]`, `[briefly describe the system's purpose]`). Your job is to (a) collect/derive concrete values, (b) fill the template precisely for the project architecture, and (c) ensure consistency with the project constitution and coding standards.

Follow this execution flow:

1. **Load the existing architecture template** at `/memory/architecture.md`.
   - Identify every placeholder token of the form `[ALL_CAPS_IDENTIFIER]` or `[descriptive text]`.
   - Note: This template follows ISO/IEC/IEEE 42010:2011 standards for architecture description.

2. **Detect project information and technology stack**:
   - **Specs**: Check all files in `specs` folder, especially for `spec.md`
   - **System Name**: Check README.md, package.json, pyproject.toml, or ask user
   - **System Purpose**: Extract from README.md, specifications, or ask user
   - **Technology Stack**:
     - Check for `package.json` (Node.js/JavaScript/TypeScript)
     - Check for `requirements.txt` or `pyproject.toml` (Python)
     - Check for `go.mod` (Go)
     - Check for `pom.xml` or `build.gradle` (Java)
     - Check for `Gemfile` (Ruby)
     - Check for `composer.json` (PHP)
     - Check for `Cargo.toml` (Rust)
   - **Infrastructure**: Check for Docker, Kubernetes, cloud provider configs
   - **Existing Documentation**: Review README.md, design.md, specs for architecture details
   - If unclear, ask user for clarifications

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
     - `[RabbitMQ]` or other technology choices
     - Rationale for architectural style (microservices, monolith, etc.)
     - Alternative approaches considered
     - Trade-offs made

   - **Policies and Patterns (Section 6)**:
     - `[Pattern 1]`, `[Pattern 2]`: Design patterns used
     - System-wide policies (error handling, security, logging)
     - Pattern applications and their rationale

4. **Draft the updated architecture document**:
   - Replace every placeholder with concrete text (no bracketed tokens left)
   - Preserve heading hierarchy and structure
   - Ensure each section has:
     - Clear, specific information relevant to the project
     - Measurable quality attributes (e.g., "99.9% uptime" not "high availability")
     - Concrete technology choices with versions where applicable
     - Diagrams or diagram descriptions
   - Tailor content to detected technology stack and product level
   - Remove ACTION REQUIRED comments
   - Add concrete examples where helpful

5. **Consistency with other project documents**:
   - Read `/memory/constitution.md` if it exists
   - Read `/memory/standards.md` if it exists
   - Ensure architecture aligns with constitutional principles
   - Ensure architecture supports coding standards
   - Flag any conflicts between documents
   - Verify technology choices are consistent across documents

6. **Product level-specific recommendations**:
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

7. **Technology-specific architectural patterns**:
   - **Node.js/TypeScript**:
     - Microservices with Express/Fastify
     - Event-driven architecture with message queues
     - GraphQL or REST API patterns
     - Container-based deployment

   - **Python**:
     - Django/FastAPI for web services
     - Celery for async task processing
     - PostgreSQL/MongoDB for data persistence
     - Docker + Kubernetes deployment

   - **Go**:
     - Lightweight microservices
     - gRPC for inter-service communication
     - Standard library patterns
     - Efficient resource utilization

   - **Java**:
     - Spring Boot microservices
     - Enterprise patterns (Repository, Service Layer)
     - JPA/Hibernate for persistence
     - Container or traditional deployment

   - **Ruby**:
     - Rails monolith or modular monolith
     - Background jobs with Sidekiq
     - PostgreSQL/Redis stack
     - Heroku or container deployment

   - **Rust**:
     - High-performance services
     - Async runtime (Tokio)
     - Memory-safe concurrency patterns
     - Container deployment

8. **Produce a Sync Impact Report** (prepend as HTML comment):
   - System name and purpose identified
   - Product level determined
   - Technology stack detected
   - Key components and their interactions
   - Quality attributes prioritized
   - Infrastructure approach defined
   - Alignment with constitution and coding standards
   - Architectural patterns applied
   - Follow-up TODOs if any information deferred

9. **Validation before final output**:
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

10. **Write the completed architecture document** back to `/memory/architecture.md` (overwrite).

11. **Architecture Quality Validation**: After writing the initial architecture document, validate it against quality criteria:

   a. **Create Architecture Quality Checklist**:
      - Copy `templates/checklist-arch-template.md` to `/memory/checklists/architecture.md`
      - Replace template placeholders:
        - `[DATE]` → Current date
        - `[Mock-up/PoC/MVP/Production]` → Actual product level from architecture document
      - This checklist contains validation items appropriate for all product levels
      - Product level determines which sections are mandatory vs optional

   b. **Run Validation Check**: Review the architecture document against each checklist item, considering the product level

   c. **Handle Validation Results**:
      - **If all required items pass**: Mark checklist complete and proceed
      - **If items fail**:
        1. List the failing items and specific issues with context
        1. Determine if failures are blockers based on product level:
           - Mock-up: Only basic completeness required
           - PoC: Core technical approach must be clear
           - MVP: Security + performance baselines required
           - Production: All quality attributes must be comprehensive
        1. Update the architecture to address blocking issues
        1. Re-run validation until all blocking items pass (max 3 iterations)
        1. If still failing after 3 iterations:
           - Document remaining issues in checklist notes
           - Warn user about incomplete areas
           - Suggest specific improvements needed

   d. **Update Checklist**: After each validation iteration, update `/memory/checklists/architecture.md` with:
      - Mark items as checked `[x]` or unchecked `[ ]`
      - Fill in the "Validation Iterations" section with:
        - Timestamp for the iteration
        - Pass/Fail status
        - Issues found (or "None")
        - Fixes applied (or "N/A")
      - Update "Overall Assessment" section with:
        - Final status (Ready for Planning / Needs Updates)
        - Any blockers identified
        - Recommendations for improvement
      - Add notes for context or additional observations

1. **Output a final summary to the user** with:
   - System name and purpose
   - Product level and architectural implications
   - Technology stack configured
   - Key architectural decisions and rationale
   - Components and their interactions
   - Quality attributes and targets
   - Infrastructure and deployment approach
   - Alignment status with constitution and coding standards
   - **Checklist validation results**: Pass/fail status with details
   - **Readiness for planning**: Confirm if ready for `/personas.plan` or needs updates
   - **Next recommended step**: Run `/personas.standardize` to establish coding standards aligned with this architecture
   - Suggested commit message (e.g., `docs: establish architecture for [System Name] v1.0 (MVP microservices)`)

## Key Guidelines

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
- [ ] Aligned with project constitution and coding standards
- [ ] No template comments or placeholders remain
- [ ] Document reads as cohesive project documentation

## Next Steps

After completing the architecture document and checklist validation:

1. **Review checklist results**: Check `/memory/checklists/architecture.md` for any remaining issues
2. **Commit architecture**: Use suggested commit message to save the architecture document
3. **Establish coding standards**: Run `/personas.standardize` to create technology-specific coding standards that align with this architecture
   - This ensures consistent development practices across all features
   - Standards will be based on the technology stack defined in this architecture
   - Required before running `/personas.plan` to ensure implementation plans follow established standards
4. **Create architectural diagrams**: Use tools like Mermaid, Draw.io, or Lucidchart (can be done in parallel with standards)
5. **Review with stakeholders**: Get feedback from team, product, and ops
6. **Document ADRs**: Create Architecture Decision Records for key choices
7. **Update related docs**: Ensure README, design docs align with architecture
8. **Ready for feature work**: After standards are established, proceed to `/personas.plan` and `/personas.tasks` for feature development
9. **Set up infrastructure**: Provision cloud resources, containers, etc. (after planning)
10. **Establish monitoring**: Set up observability for quality attribute tracking
11. **Create runbooks**: Document operational procedures for the architecture

**Complete workflow context**:
Your response **MUST** suggest the user's next step, following the sequential order below and based on the result of the last action.

```text
1. /personas.constitution  → Establish project principles
2. /personas.specify       → Create feature specifications
3. /personas.clarify       → Clarify requirements (optional)
4. /personas.architect     → Define system architecture (YOU ARE HERE)
5. /personas.standardize   → Establish coding standards (NEXT STEP)
6. /personas.plan          → Plan feature implementation with design
7. /personas.test-plan     → Generate E2E test plan
8. /personas.tasks         → Break down into tasks
9. /personas.analyze       → Analyze cross-artifact consistency
10. /personas.implement    → Execute implementation
11. /personas.test         → Execute E2E tests and generate report
```
