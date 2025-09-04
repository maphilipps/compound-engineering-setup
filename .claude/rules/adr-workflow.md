---
description: Architecture Decision Record (ADR) workflow for capturing and tracking architectural decisions in compound engineering projects.
author: Compound Engineering Team
version: 1.0
tags: ["adr", "architecture", "decision-tracking", "documentation", "compound-engineering"]
globs: ["docs/adr/**/*.md", "*"]
---
# Architecture Decision Record (ADR) Workflow

**Objective:** Systematically capture architectural decisions to build institutional knowledge that compounds over time, preventing repeated discussions and enabling faster, smarter future decisions.

## When to Create ADRs

Create an ADR for any decision that:
- **Affects system structure** or component relationships
- **Impacts multiple teams** or future development
- **Involves trade-offs** between alternatives
- **Sets precedents** for similar future decisions
- **Changes existing architectural patterns**
- **Introduces new technologies** or frameworks

## ADR Creation Process

### 1. Decision Trigger Recognition
When you encounter a decision point, **MUST**:
- Pause implementation
- Assess architectural impact
- Check existing ADRs for related decisions
- Determine if new ADR is needed

### 2. ADR Document Creation
Create ADR in `docs/adr/NNNN-decision-title.md` format:

```markdown
# ADR-NNNN: [Decision Title]

## Status
[Proposed | Accepted | Rejected | Deprecated | Superseded by ADR-XXXX]

## Context
[What is the issue motivating this decision? 
What architectural factors led to this decision point?
What constraints exist?]

## Decision
[What is the specific decision being made?
What exact approach will we take?]

## Consequences
### Positive
- [Benefit 1: How this improves the system]
- [Benefit 2: What this enables for future work]

### Negative
- [Cost 1: What we give up or complicate]
- [Risk 1: What could go wrong]

### Neutral
- [Impact 1: Changes that are neither positive nor negative]

## Alternatives Considered
### Option A: [Alternative approach]
- **Pros**: [Benefits]
- **Cons**: [Drawbacks]
- **Why rejected**: [Specific reason]

### Option B: [Another alternative]
- **Pros**: [Benefits]
- **Cons**: [Drawbacks]
- **Why rejected**: [Specific reason]

## Implementation Notes
[Specific implementation details, patterns to follow, or constraints]

## Related Decisions
- [ADR-XXXX: Related decision]
- [Link to relevant documentation]

## Compound Engineering Impact
[How does this decision improve our ability to make similar decisions faster in the future?
What patterns does this establish for reuse?]
```

### 3. ADR Numbering System
- Start with ADR-0001
- Use sequential numbering (NNNN format with leading zeros)
- Never reuse numbers, even for deleted ADRs

### 4. Review and Approval Process
**MUST** follow this sequence:
1. **Draft ADR** with status "Proposed"
2. **Technical Review** by relevant stakeholders
3. **Impact Assessment** on existing systems
4. **Status Update** to "Accepted" or "Rejected"
5. **Implementation Tracking** if accepted

## ADR Management

### Status Transitions
- **Proposed** → **Accepted**: Decision approved and being implemented
- **Proposed** → **Rejected**: Decision rejected, document preserved for context
- **Accepted** → **Deprecated**: Decision no longer applies but not replaced
- **Accepted** → **Superseded**: Decision replaced by newer ADR (link required)

### ADR Updates
**NEVER** modify accepted ADRs. Instead:
- Create new ADR that supersedes the old one
- Update old ADR status to "Superseded by ADR-XXXX"
- Link new ADR in "Related Decisions" section

### Periodic Review
**Quarterly ADR Review Process**:
1. Review all "Accepted" ADRs for continued relevance
2. Mark outdated decisions as "Deprecated"
3. Identify patterns across ADRs for systematic improvement
4. Update compound engineering rules based on decision patterns

## Integration with Development Workflow

### During Planning
- **MUST** check existing ADRs before architectural decisions
- Reference relevant ADRs in planning documents
- Create placeholder ADRs for identified decision points

### During Implementation
- Reference ADR number in commit messages for architectural changes
- Update implementation notes in ADRs as needed
- Create follow-up ADRs for discovered architectural issues

### During Review
- Verify implementation matches ADR decisions
- Flag deviations for ADR updates or new ADRs
- Capture lessons learned for future ADR improvements

## Compound Learning Integration

### Pattern Recognition
Track recurring decision patterns:
- **Technology Selection**: Build decision matrices that improve over time
- **Architecture Patterns**: Document which patterns work in which contexts
- **Trade-off Analysis**: Develop better trade-off evaluation frameworks

### Decision Acceleration
Use ADRs to speed up future decisions:
- **Precedent Search**: Quickly find similar past decisions
- **Context Reuse**: Leverage previously analyzed contexts
- **Alternative Elimination**: Skip already-rejected alternatives

### Knowledge Distribution
- Link ADRs from relevant code comments
- Include ADR references in system documentation
- Create ADR summaries for new team members

## Quality Requirements

Every ADR **MUST**:
- [ ] Have clear, specific decision statement
- [ ] Document at least 2 alternatives considered
- [ ] Include concrete consequences (positive and negative)
- [ ] Provide implementation guidance
- [ ] Connect to compound engineering improvement

## Tools and Automation

### ADR Number Management
Use this command to get next ADR number:
```bash
ls docs/adr/ADR-*.md | wc -l | awk '{printf "ADR-%04d\n", $1+1}'
```

### ADR Templates
Maintain ADR templates for common decision types:
- `docs/adr/templates/technology-selection.md`
- `docs/adr/templates/architecture-pattern.md`
- `docs/adr/templates/integration-approach.md`

### ADR Linking
- Automatically link related ADRs in documentation
- Generate decision timeline views
- Create architecture decision maps

**Remember**: ADRs are not just documentation - they are the foundation of our compound engineering approach, turning every architectural decision into permanent institutional wisdom that accelerates future work.