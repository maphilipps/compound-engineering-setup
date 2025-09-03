# Capture Learning

Extract permanent lessons from development decisions and failures to build organizational knowledge.

## Process

When this command is invoked with a context parameter (commit hash, PR number, or description):

1. **Identify the Learning Context**:
   - If commit hash provided, analyze the commit diff
   - If PR number provided, examine the full PR conversation
   - If description provided, use as context for manual learning capture
   - If no parameter, prompt user for the learning scenario

2. **Extract the Core Learning**:
   - Use TodoWrite to track analysis steps
   - Identify what specific insight was gained
   - Determine what went right or wrong
   - Extract the underlying pattern or principle
   - Note the context and constraints that led to the learning

3. **Generalize the Pattern**:
   - Transform specific instance into general principle
   - Identify where else this pattern might apply
   - Consider what category of learning this represents
   - Determine impact level (local, team, organizational)

4. **Update Standards if Needed**:
   - Check if CLAUDE.md should be updated with new guidelines
   - Determine if an ADR should be created for architectural learnings
   - Identify if TODO priority system needs adjustment
   - Consider if new development conventions are needed

5. **Document the Learning**:
   - Create structured document in `thoughts/shared/learnings/`
   - Use consistent filename: `learning-YYYY-MM-DD-brief-description.md`
   - Include YAML frontmatter with metadata
   - Structure content with clear sections

6. **Sync and Reference**:
   - Index the learning in the thoughts directory structure
   - Create cross-references to related ADRs if applicable
   - Tag with relevant categories for future discovery
   - Add to searchable learning database

## Learning Document Template

```markdown
---
date: [ISO timestamp with timezone]
learning_trigger: [commit_hash | pr_number | manual | failure_analysis]
category: [architecture | code_quality | process | tooling | security]
impact_level: [local | team | organizational]
related_adrs: [list of related ADR numbers]
tags: [relevant, searchable, keywords]
status: captured
---

# Learning: [Brief Description]

## Context
[What was happening? What problem were we solving?]

## What We Learned
[The specific insight or principle discovered]

## Why This Matters
[Impact and implications of this learning]

## Pattern Recognition
[General principle that can be applied elsewhere]

## Action Items
- [ ] Update CLAUDE.md with new guideline
- [ ] Create ADR for architectural decision
- [ ] Share with team in next review
- [ ] Add to relevant documentation

## Related Work
- ADR: [links to related architectural decisions]
- Issues: [links to related GitHub issues]
- Documentation: [links to relevant docs]
```

## Auto-Triggers
This command should be used:
- After debugging a production issue
- When discovering better implementation patterns
- After code review identifies recurring problems
- When architectural decisions prove successful/unsuccessful
- Following any significant "aha moment" in development