# Architecture Quality Checklist

**Purpose**: Validate architecture completeness and quality before implementation planning
**Created**: [DATE]
**Product Level**: [Mock-up/PoC/MVP/Production]
**Architecture Document**: /memory/architecture.md

<!-- 
  ============================================================================
  IMPORTANT: This checklist template is designed for /personas.architect command.
  
  The command MUST:
  - Replace [DATE] with actual creation date
  - Replace [Mock-up/PoC/MVP/Production] with actual product level
  - Mark items as checked [x] or unchecked [ ] based on validation
  - Add notes for any failures or issues found
  - Update this file after each validation iteration
  
  Product level determines which sections are mandatory vs optional.
  ============================================================================
-->

## Completeness (All Levels)

- [ ] All placeholder tokens replaced with concrete values
- [ ] System name and purpose clearly defined
- [ ] Product level specified with architectural implications
- [ ] Technology stack documented (versions required for MVP+)
- [ ] All stakeholders and their concerns identified
- [ ] Appropriate architectural views selected and described
- [ ] No ACTION REQUIRED comments remain

## Quality Attributes (Level-Appropriate)

- [ ] Business goals documented with measurable outcomes
- [ ] Quality attributes appropriate for product level:
  - Mock-up: Basic functional requirements only
  - PoC: Core technical feasibility metrics
  - MVP: Performance baseline + security essentials
  - Production: Comprehensive SLAs with specific targets
- [ ] Performance targets quantified (if MVP+)
- [ ] Availability requirements specified (if MVP+)
- [ ] Scalability approach defined and appropriate for level:
  - Mock-up/PoC: Not required
  - MVP: Vertical scaling planned
  - Production: Horizontal scaling with auto-scaling
- [ ] Security requirements addressed:
  - Mock-up: Not required
  - PoC: Basic authentication
  - MVP: Essential security controls
  - Production: Comprehensive security hardening

## Design Decisions

- [ ] All components defined with clear responsibilities
- [ ] Component interactions and communication patterns documented
- [ ] Key architectural decisions recorded with rationale
- [ ] Alternative approaches considered and documented
- [ ] Trade-offs explicitly stated
- [ ] Technology choices justified
- [ ] Architectural complexity matches product level:
  - Mock-up: Single component acceptable
  - PoC: Core components only
  - MVP: Essential components for user value
  - Production: Complete component architecture

## Infrastructure & Operations (Level-Appropriate)

- [ ] Deployment view describes infrastructure
- [ ] Infrastructure approach appropriate for product level:
  - Mock-up: Local/simple hosting acceptable
  - PoC: Single-server deployment
  - MVP: Basic cloud deployment with monitoring
  - Production: Multi-region, high-availability setup
- [ ] Data architecture documented
- [ ] Monitoring approach defined (if MVP+)
- [ ] Disaster recovery planned (if Production)
- [ ] Cost implications understood and documented

## Alignment & Consistency

- [ ] Architecture aligns with project constitution (if exists)
- [ ] Architecture supports coding standards (if exists)
- [ ] No conflicts with existing documentation
- [ ] Technology choices consistent across documents

## Documentation Quality

- [ ] Diagrams referenced or described in detail
- [ ] Document reads as cohesive project documentation
- [ ] Evolution path to next product level documented
- [ ] Section structure follows template exactly

## Product Level Specific Validation

**If Mock-up:**
- [ ] Focus on UI/UX flows documented
- [ ] Minimal infrastructure requirements specified
- [ ] No complex scaling/performance requirements

**If Proof of Concept (PoC):**
- [ ] Core technical risks identified and addressed
- [ ] Technical feasibility demonstrated in architecture
- [ ] Performance optimization explicitly deferred
- [ ] Single-server deployment acceptable

**If Minimum Viable Product (MVP):**
- [ ] Essential components for user value identified
- [ ] Security essentials implemented
- [ ] Basic monitoring and logging planned
- [ ] Performance baseline established
- [ ] Path to production documented

**If Full-fledged Production:**
- [ ] Comprehensive security hardening documented
- [ ] High availability architecture (multi-AZ/region)
- [ ] Full observability stack planned
- [ ] Horizontal scaling with auto-scaling
- [ ] Disaster recovery and backup strategy
- [ ] Performance optimization documented
- [ ] Cost optimization strategy included

## Validation Iterations

### Iteration 1
**Date**: [TIMESTAMP]
**Status**: [Pass/Fail]
**Issues Found**: 
- [List issues or "None"]

**Fixes Applied**:
- [List fixes or "N/A"]

### Iteration 2 (if needed)
**Date**: [TIMESTAMP]
**Status**: [Pass/Fail]
**Issues Found**: 
- [List issues or "None"]

**Fixes Applied**:
- [List fixes or "N/A"]

### Iteration 3 (if needed)
**Date**: [TIMESTAMP]
**Status**: [Pass/Fail]
**Issues Found**: 
- [List issues or "None"]

**Fixes Applied**:
- [List fixes or "N/A"]

## Overall Assessment

**Final Status**: [Ready for Planning / Needs Updates]
**Blockers**: [None / List blockers]
**Recommendations**: [Any suggestions for improvement]

## Notes

- Items marked incomplete require architecture updates before proceeding
- Product level determines which optional sections are mandatory
- Add any additional observations or context here
