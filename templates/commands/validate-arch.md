---
description: Generate and run a custom checklist to validate architecture design quality and completeness.
scripts:
  sh: scripts/bash/check-prerequisites.sh --json
  ps: scripts/powershell/check-prerequisites.ps1 -Json
---

## Checklist Purpose: "Unit Tests for Architecture Documentation"

**CRITICAL CONCEPT**: Architecture checklists are **UNIT TESTS FOR ARCHITECTURE DOCUMENTATION** - they validate the quality, clarity, completeness, and consistency of architecture design documentation.

**NOT for verification/testing**:

- ❌ NOT "Verify the API endpoint returns correct data"
- ❌ NOT "Test database connection works"
- ❌ NOT "Confirm system handles 1000 concurrent users"
- ❌ NOT checking if implementation matches the architecture

**FOR architecture documentation quality validation**:

- ✅ "Are component responsibilities clearly defined and documented?" (clarity)
- ✅ "Is the rationale for microservices vs monolith architecture documented?" (completeness)
- ✅ "Are quality attributes quantified with specific metrics?" (measurability)
- ✅ "Are security patterns consistent across all components?" (consistency)
- ✅ "Is the disaster recovery strategy documented with concrete procedures?" (coverage)

**Metaphor**: If your architecture document is a blueprint written in English, the checklist is its quality assurance suite. You're testing whether the architecture is well-documented, complete, unambiguous, and ready for implementation planning - NOT whether the system is built correctly.

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Execution Steps

1. **Setup**: Run `{SCRIPT}` from repo root and parse JSON for AVAILABLE_DOCS list.
   - All file paths must be absolute.
   - For single quotes in args like "I'm Groot", use escape syntax: e.g 'I'\''m Groot' (or double-quote if possible: "I'm Groot").
   - Architecture document is expected at `/d-docs/architecture.md`

2. **Clarify intent (dynamic)**: Derive up to THREE initial contextual clarifying questions (no pre-baked catalog). They MUST:
   - Be generated from the user's phrasing + extracted signals from architecture document
   - Only ask about information that materially changes checklist content
   - Be skipped individually if already unambiguous in `$ARGUMENTS`
   - Prefer precision over breadth

   Generation algorithm:
   1. Extract signals: architecture style keywords (microservices, monolith, event-driven, layered), quality attribute priorities (performance, security, scalability, availability), deployment context (cloud provider, on-premise, hybrid), technology stack indicators, compliance requirements
   2. Cluster signals into candidate focus areas (max 4) ranked by relevance
   3. Identify probable product level (Mock-up, PoC, MVP, Production) from architecture document
   4. Detect missing dimensions: architectural views coverage, quality attribute specifications, technology decision rationale, deployment strategy, security design, data architecture
   5. Formulate questions chosen from these archetypes:
      - Scope refinement (e.g., "Should validation focus on logical architecture only, or include deployment and data views?")
      - Risk prioritization (e.g., "Which quality attributes (performance, security, scalability) need deeper validation?")
      - Depth calibration (e.g., "Is this validation for early-stage design review or pre-implementation gate?")
      - Product level alignment (e.g., "What product level (PoC/MVP/Production) should validation criteria target?")
      - Focus area selection (e.g., "Should we emphasize microservices boundaries, data consistency, or security architecture?")

   Question formatting rules:
   - If presenting options, generate a compact table with columns: Option | Focus Area | Why It Matters
   - Limit to A–E options maximum; omit table if a free-form answer is clearer
   - Never ask the user to restate what they already said
   - Avoid speculative categories (no hallucination). If uncertain, ask explicitly: "Confirm whether X belongs in scope."

   Defaults when interaction impossible:
   - Product level: Derive from architecture.md or default to MVP
   - Depth: Standard (comprehensive but not exhaustive)
   - Focus: Balanced across all architectural views
   - Audience: Architecture reviewers and technical leads

   Output the questions (label Q1/Q2/Q3). After answers: if ≥2 critical architectural areas remain unclear, you MAY ask up to TWO more targeted follow‑ups (Q4/Q5) with a one-line justification each (e.g., "Security architecture approach unclear"). Do not exceed five total questions. Skip escalation if user explicitly declines more.

3. **Understand user request**: Combine `$ARGUMENTS` + clarifying answers:
   - Derive checklist theme (e.g., component design, security architecture, deployment strategy, data architecture)
   - Determine product level and adjust validation rigor accordingly
   - Consolidate explicit must-have items mentioned by user
   - Map focus selections to category scaffolding
   - Infer any missing context from architecture.md (do NOT hallucinate)

4. **Load architecture context**: Read from `/d-docs/`:
   - `architecture.md`: Primary architecture documentation
   - `standards.md` (if exists): Coding standards that architecture must support
   - `/memory/ground-rules.md` (if exists): Project principles for alignment check
   - Relevant spec files (if exists): To ensure architecture supports requirements

   **Context Loading Strategy**:
   - Load only necessary portions relevant to active focus areas
   - Prefer summarizing long sections into concise architecture points
   - Use progressive disclosure: add follow-on retrieval only if gaps detected
   - If architecture doc is large, generate interim summary items instead of embedding raw text

5. **Generate checklist** - Create "Unit Tests for Architecture":
   - Create `/d-docs/checklists/` directory if it doesn't exist
   - Generate unique checklist filename:
     - Use short, descriptive name based on focus area (e.g., `component-design.md`, `security-arch.md`, `deployment.md`, `data-architecture.md`)
     - Format: `[architecture-aspect].md`
     - If file exists, append incremental suffix (e.g., `component-design-2.md`)
   - Number items sequentially starting from ARCH001
   - Each `/personas.validate-arch` run creates a NEW file (never overwrites existing checklists)

   **CORE PRINCIPLE - Test the Architecture Documentation, Not the Implementation**:
   Every checklist item MUST evaluate the ARCHITECTURE DOCUMENTATION for:
   - **Completeness**: Are all necessary architectural elements documented?
   - **Clarity**: Are architectural decisions unambiguous and specific?
   - **Consistency**: Do architectural elements align without conflicts?
   - **Measurability**: Are quality attributes quantified with specific metrics?
   - **Traceability**: Are architectural decisions linked to requirements/constraints?
   - **Rationality**: Is rationale documented for key architectural choices?

   **Category Structure** - Group items by ISO/IEC/IEEE 42010:2011 architectural views and concerns:
   - **Architectural Representation** (Are stakeholders and their concerns documented?)
   - **Goals and Constraints** (Are business goals and constraints clear and measurable?)
   - **Logical View / Component Design** (Are components and their responsibilities defined?)
   - **Process View / Runtime Behavior** (Are runtime processes and interactions documented?)
   - **Deployment View / Physical Architecture** (Is infrastructure and deployment strategy defined?)
   - **Data View / Information Architecture** (Is data model and data flow documented?)
   - **Architectural Decisions** (Are key decisions documented with rationale?)
   - **Quality Attributes** (Are NFRs quantified: performance, security, scalability, etc.?)
   - **Technology Stack** (Are technology choices documented and justified?)
   - **Cross-Cutting Concerns** (Are security, logging, error handling patterns defined?)
   - **Evolution and Scalability** (Is growth strategy and technical debt management documented?)

   **HOW TO WRITE CHECKLIST ITEMS - "Unit Tests for Architecture Documentation"**:

   ❌ **WRONG** (Testing implementation/system behavior):
   - "Verify API Gateway routes traffic correctly"
   - "Test database scales to 10,000 transactions/sec"
   - "Confirm microservices communicate via RabbitMQ"
   - "Check Redis cache improves response time"

   ✅ **CORRECT** (Testing architecture documentation quality):
   - "Are API Gateway routing rules and patterns documented? [Completeness, Arch §4.2]"
   - "Is database scalability target quantified with specific TPS metrics? [Measurability, Arch §3.2]"
   - "Is the rationale for choosing RabbitMQ over alternatives documented? [Rationality, Arch §5.3]"
   - "Are caching strategies and invalidation patterns defined? [Clarity, Arch §6.2]"
   - "Is the data consistency model explicitly documented for distributed components? [Completeness, Gap]"

   **ITEM STRUCTURE**:
   Each item should follow this pattern:
   - Question format asking about architecture documentation quality
   - Focus on what's DOCUMENTED (or not documented) in architecture.md
   - Include quality dimension in brackets [Completeness/Clarity/Consistency/Measurability/Rationality/etc.]
   - Reference architecture section `[Arch §X.Y]` when checking existing documentation
   - Use `[Gap]` marker when checking for missing architectural elements
   - Consider product level: Mock-up/PoC items are lighter; MVP/Production require rigor

   **EXAMPLES BY QUALITY DIMENSION**:

   **Completeness**:
   - "Are all system components identified and documented? [Completeness]"
   - "Is disaster recovery strategy documented with specific procedures? [Gap]"
   - "Are monitoring and observability approaches defined? [Completeness, Arch §6.1]"
   - "Is data backup and retention policy documented? [Gap]"

   **Clarity**:
   - "Are component responsibilities clearly defined without overlap? [Clarity, Arch §4.1]"
   - "Is 'high availability' quantified with specific uptime percentages? [Clarity, Arch §3.2]"
   - "Are inter-component communication patterns explicitly documented? [Clarity, Arch §4.3]"
   - "Is the deployment topology diagram clear and complete? [Clarity, Arch §4.4]"

   **Consistency**:
   - "Are security patterns consistently applied across all components? [Consistency, Arch §6.3]"
   - "Do error handling strategies align across all architectural layers? [Consistency]"
   - "Are naming conventions consistent in component and interface definitions? [Consistency, Arch §4.1]"
   - "Is authentication approach consistent between services? [Consistency, Gap]"

   **Measurability**:
   - "Are performance targets quantified with specific latency/throughput metrics? [Measurability, Arch §3.2]"
   - "Can scalability requirements be objectively measured? [Measurability, Arch §3.2]"
   - "Are availability SLAs specified numerically (e.g., 99.9%)? [Measurability, Arch §3.2]"
   - "Is database capacity growth quantified? [Measurability, Gap]"

   **Rationality** (Architecture-specific):
   - "Is the rationale for microservices vs monolith documented? [Rationality, Arch §5.1]"
   - "Are alternatives considered for critical technology choices documented? [Rationality, Arch §5.2]"
   - "Is the trade-off analysis for architectural style documented? [Rationality, Arch §5.1]"
   - "Are pros/cons documented for chosen database technology? [Rationality, Gap]"

   **Traceability**:
   - "Are architectural decisions traced back to business goals? [Traceability, Arch §5]"
   - "Can quality attributes be traced to stakeholder concerns? [Traceability, Arch §2]"
   - "Are component designs traceable to functional requirements? [Traceability]"
   - "Is technology stack aligned with documented constraints? [Traceability, Arch §3.3]"

   **Product Level Considerations**:
   - **Mock-up**: Focus on high-level structure, basic component identification
   - **PoC**: Emphasize technical feasibility, core architectural decisions
   - **MVP**: Require clear component design, basic quality attributes, deployment strategy
   - **Production**: Demand comprehensive coverage of all views, detailed quality attributes, operational excellence

   **Architecture-Specific Scenario Coverage**:
   - **Normal Operation**: Is steady-state architecture clearly documented?
   - **Scale-Up Scenarios**: Are horizontal/vertical scaling strategies defined?
   - **Failure Scenarios**: Are failure modes and recovery procedures documented?
   - **Deployment Scenarios**: Are deployment procedures and rollback strategies defined?
   - **Maintenance Scenarios**: Is approach to updates, patches, and migrations documented?
   - **Security Scenarios**: Are threat mitigation strategies and security controls defined?

   **Traceability Requirements**:
   - MINIMUM: ≥80% of items MUST include at least one traceability reference
   - Each item should reference: architecture section `[Arch §X.Y]`, or use markers: `[Gap]`, `[Ambiguity]`, `[Conflict]`, `[Assumption]`
   - If no section numbering exists: "Is architecture document structured with numbered sections for traceability? [Gap]"

   **Surface & Resolve Issues** (Architecture Documentation Problems):
   Ask questions about the architecture documentation itself:
   - **Ambiguities**: "Is 'eventually consistent' data model defined with specific time windows? [Ambiguity, Arch §4.5]"
   - **Conflicts**: "Do deployment requirements conflict with scalability targets? [Conflict, Arch §3.2 vs §4.4]"
   - **Assumptions**: "Is the assumption of AWS availability zones validated? [Assumption, Arch §4.4]"
   - **Missing Decisions**: "Is service discovery mechanism documented? [Gap]"
   - **Vague Specifications**: "Is 'cloud-native' approach defined with concrete patterns? [Ambiguity, Arch §4.4]"

   **Content Consolidation**:
   - Soft cap: If raw candidate items > 50, prioritize by architectural risk/impact
   - Merge near-duplicates checking the same architectural aspect
   - Group related items under single category (e.g., "Security Architecture" items together)
   - If >5 minor details missing, create one item: "Are minor deployment details (X, Y, Z) documented? [Gap]"

   **🚫 ABSOLUTELY PROHIBITED** - These make it an implementation/system test, not an architecture documentation test:
   - ❌ Any item starting with "Verify", "Test", "Confirm", "Check" + system behavior
   - ❌ References to code execution, runtime behavior, actual system performance
   - ❌ "Works correctly", "performs well", "scales properly", "functions as expected"
   - ❌ "Deploy", "build", "compile", "run", "execute"
   - ❌ Testing actual system functionality
   - ❌ Implementation-specific code details (unless documenting them is the architectural concern)

   **✅ REQUIRED PATTERNS** - These test architecture documentation quality:
   - ✅ "Are [architectural element] defined/specified/documented with [detail level]?"
   - ✅ "Is [vague architectural term] quantified/clarified with specific criteria?"
   - ✅ "Are [architectural aspects] consistent between [view A] and [view B]?"
   - ✅ "Can [quality attribute] be objectively measured with documented metrics?"
   - ✅ "Is rationale documented for [architectural decision]?"
   - ✅ "Are [architectural scenarios/views] addressed in documentation?"
   - ✅ "Does the architecture document define [missing element]?"

6. **Structure Reference**: Generate the checklist following the canonical template in `templates/checklist-arch-template.md` if available, otherwise use: H1 title, purpose/created/product-level meta lines, `##` category sections containing `- [ ] ARCH### <architecture item>` lines with globally incrementing IDs starting at ARCH001.

7. **Report**: Output full path to created checklist, item count, and remind user that each run creates a new file. Summarize:
   - Product level detected/specified (Mock-up/PoC/MVP/Production)
   - Focus areas selected (which architectural views/concerns)
   - Validation depth level
   - Audience (architecture reviewer, technical lead, etc.)
   - Any explicit user-specified must-have items incorporated
   - Suggest next step: review and address checklist items before `/personas.design`

**Important**: Each `/personas.validate-arch` command invocation creates a checklist file using short, descriptive names. This allows:

- Multiple architecture checklists for different aspects (e.g., `component-design.md`, `security-arch.md`, `deployment.md`)
- Simple, memorable filenames that indicate validation focus
- Easy identification and navigation in the `/d-docs/checklists/` folder

To avoid clutter, use descriptive names and clean up obsolete checklists when done.

## Example Checklist Types & Sample Items

**Component Design Architecture:** `component-design.md`

Sample items (testing the architecture documentation, NOT the implementation):

- "Are all system components identified with clear names and purposes? [Completeness, Arch §4.1]"
- "Is each component's responsibility clearly defined without overlap? [Clarity, Arch §4.1]"
- "Are inter-component dependencies explicitly documented? [Completeness, Arch §4.1]"
- "Are component interfaces defined with data contracts? [Gap]"
- "Is the rationale for component decomposition documented? [Rationality, Arch §5.1]"
- "Are shared components identified and their usage patterns documented? [Completeness, Gap]"

**Security Architecture Quality:** `security-arch.md`

Sample items:

- "Are authentication and authorization mechanisms documented for all components? [Completeness, Arch §6.3]"
- "Is data encryption approach defined for data at rest and in transit? [Completeness, Arch §6.3]"
- "Are security threat models documented with mitigation strategies? [Gap]"
- "Is the security boundary between components clearly defined? [Clarity, Arch §4.1]"
- "Are security monitoring and incident response procedures documented? [Gap]"
- "Is compliance with security standards (e.g., OWASP) documented? [Gap]"

**Deployment Architecture Quality:** `deployment.md`

Sample items:

- "Is the deployment topology documented with infrastructure diagram? [Completeness, Arch §4.4]"
- "Are deployment procedures documented with step-by-step instructions? [Gap]"
- "Is rollback strategy defined for failed deployments? [Gap]"
- "Are environment configurations (dev, staging, prod) documented? [Completeness, Arch §4.4]"
- "Is CI/CD pipeline architecture documented? [Gap]"
- "Are infrastructure scaling procedures defined? [Gap]"

**Data Architecture Quality:** `data-architecture.md`

Sample items:

- "Is the data model documented with entity relationships? [Completeness, Arch §4.5]"
- "Are data consistency requirements defined (ACID vs eventual)? [Clarity, Arch §4.5]"
- "Is data flow between components documented? [Completeness, Arch §4.5]"
- "Are data retention and archival policies defined? [Gap]"
- "Is database sharding/partitioning strategy documented? [Gap]"
- "Are data migration procedures documented? [Gap]"

**Performance Architecture Quality:** `performance-arch.md`

Sample items:

- "Are performance targets quantified with specific latency/throughput metrics? [Measurability, Arch §3.2]"
- "Is caching strategy documented with cache invalidation patterns? [Clarity, Arch §6.2]"
- "Are performance bottlenecks identified and mitigation strategies defined? [Completeness, Arch §5.2]"
- "Is load balancing approach documented? [Gap]"
- "Are performance monitoring metrics and thresholds defined? [Gap]"
- "Is performance testing strategy aligned with architecture? [Gap]"

**Scalability Architecture Quality:** `scalability-arch.md`

Sample items:

- "Are horizontal scaling procedures documented? [Gap]"
- "Is vertical scaling strategy defined with resource limits? [Gap]"
- "Are database scalability approaches documented (replication, sharding)? [Gap]"
- "Is auto-scaling configuration and triggers documented? [Gap]"
- "Are capacity planning procedures defined? [Gap]"
- "Is the architecture stateless or is session management strategy documented? [Clarity, Arch §4.2]"

## Anti-Examples: What NOT To Do

**❌ WRONG - These test system implementation/behavior, not architecture documentation:**

```markdown
- [ ] ARCH001 - Verify API Gateway routes requests to correct microservices [Arch §4.2]
- [ ] ARCH002 - Test database handles 10,000 concurrent connections [Arch §3.2]
- [ ] ARCH003 - Confirm Redis cache reduces response time by 50% [Arch §6.2]
- [ ] ARCH004 - Check Kubernetes auto-scales pods under load [Arch §4.4]
```

**✅ CORRECT - These test architecture documentation quality:**

```markdown
- [ ] ARCH001 - Are API Gateway routing rules and patterns documented? [Completeness, Arch §4.2]
- [ ] ARCH002 - Is database connection pooling strategy documented with capacity limits? [Clarity, Arch §4.5]
- [ ] ARCH003 - Are caching strategies and performance targets quantified? [Measurability, Arch §6.2]
- [ ] ARCH004 - Is auto-scaling policy documented with trigger thresholds? [Completeness, Arch §4.4]
- [ ] ARCH005 - Is the rationale for choosing Kubernetes documented? [Rationality, Arch §5.3]
- [ ] ARCH006 - Are failure handling procedures documented for each component? [Gap]
```

**Key Differences:**

- Wrong: Tests if the system works correctly
- Correct: Tests if the architecture is documented correctly
- Wrong: Verification of runtime behavior
- Correct: Validation of architecture documentation quality
- Wrong: "Does the system do X?"
- Correct: "Is X clearly documented in the architecture?"

## Recommended Workflow

The `/personas.validate-arch` command can be run after architecture creation:

**After architecture definition (architecture quality checklist)**:

```text
/personas.architect → /personas.validate-arch (YOU ARE HERE) → /personas.standardize
```

**Before planning (pre-design validation)**:

```text
/personas.architect → /personas.validate-arch (YOU ARE HERE) → /personas.design
```

**Complete workflow context**:
Your response **MUST** suggest the user's next step, following the sequential order below and based on the result of the last action.

```text
1. /personas.regulate      → Establish project principles
2. /personas.specify       → Create feature specifications
3. /personas.clarify       → Clarify requirements (optional)
4. /personas.architect     → Define system architecture
   ↳ /personas.validate-arch → Validate architecture (YOU ARE HERE)
5. /personas.standardize   → Establish coding standards
6. /personas.design        → Plan feature implementation with design
7. /personas.design-test   → Generate E2E test spec
8. /personas.taskify       → Break down into tasks
9. /personas.analyze       → Analyze cross-artifact consistency
10. /personas.implement    → Execute implementation
11. /personas.test         → Execute E2E tests and generate report
```

**Note**: Architecture validation ensures quality and completeness before proceeding to coding standards and feature design. You can generate multiple architecture checklists for different concerns (component design, security, deployment, data, performance, etc.).
