# Learn from Failure

Transform any failure into systematic improvements and preventative measures.

## Usage

Invoke when encountering failures:
- `/learn_from_failure production_bug issue-123`
- `/learn_from_failure test_failure "authentication service"`
- `/learn_from_failure performance_issue "database query timeout"`

## Process

1. **Failure Context Analysis**:
   - Use TodoWrite to track analysis progress
   - Gather comprehensive failure information:
     - Error messages and stack traces
     - System logs and metrics
     - Reproduction steps
     - Environment and configuration details
   - Identify immediate impact and affected systems

2. **Root Cause Investigation**:
   - Apply systematic root cause analysis
   - Use "5 Whys" technique to dig deeper
   - Examine contributing factors and conditions
   - Identify human factors and process issues
   - Look for systemic patterns and underlying causes

3. **Pattern Recognition Analysis**:
   - Check if this failure type has occurred before
   - Search existing learnings and ADRs for related patterns
   - Identify category of failure (code, process, environment, communication)
   - Determine if this represents a new failure mode
   - Assess if existing prevention measures failed

4. **Preventative Solution Design**:
   - Design specific fixes for the immediate issue
   - Create broader prevention strategies for the failure category
   - Identify early warning systems or monitoring needed
   - Design testing strategies that would catch similar issues
   - Consider process changes to prevent recurrence

5. **Standards and Process Updates**:
   - Update CLAUDE.md with new coding standards if needed
   - Create or update ADRs for architectural decisions
   - Update testing strategies and requirements
   - Modify development process to include new checks
   - Add monitoring and alerting for similar failure modes

6. **Implementation and Verification**:
   - Implement immediate fixes
   - Deploy prevention measures
   - Update documentation and procedures
   - Test prevention measures with simulated failures
   - Monitor for effectiveness over time

7. **Learning Documentation**:
   - Create comprehensive failure analysis document
   - Link to related ADRs and previous learnings
   - Include specific prevention measures implemented
   - Add to searchable knowledge base
   - Schedule follow-up review for effectiveness

## Failure Analysis Document Template

Creates structured document in `thoughts/shared/learnings/failure-analyses/`:

```markdown
---
date: [ISO timestamp]
failure_type: [production_bug | test_failure | performance_issue | security_incident | deployment_failure]
severity: [critical | high | medium | low]
system_impact: [description of affected systems]
related_adrs: [list of related ADRs]
prevention_measures: [list of implemented prevention steps]
tags: [failure, analysis, prevention, relevant_system_tags]
status: [analyzed | fixed | prevented]
follow_up_date: [when to review effectiveness]
---

# Failure Analysis: [Brief Description]

## Failure Summary
- **What**: [Description of what failed]
- **When**: [Timestamp and duration]
- **Where**: [Affected systems and components]
- **Impact**: [User and business impact]

## Root Cause Analysis

### Immediate Cause
[Direct technical cause of the failure]

### Contributing Factors
1. [Factor 1 - e.g., insufficient testing]
2. [Factor 2 - e.g., configuration drift]
3. [Factor 3 - e.g., monitoring gaps]

### Root Cause
[Fundamental issue that allowed this failure to occur]

### 5 Whys Analysis
1. Why did [immediate cause] happen? [Answer]
2. Why did [answer 1] happen? [Answer]
3. Why did [answer 2] happen? [Answer]
4. Why did [answer 3] happen? [Answer]
5. Why did [answer 4] happen? [Root cause]

## Pattern Recognition
- **Previous Occurrences**: [Similar failures in the past]
- **Failure Category**: [Type of failure this represents]
- **Warning Signs**: [Indicators that could have predicted this failure]

## Prevention Strategy

### Immediate Fixes
- [ ] [Specific fix 1]
- [ ] [Specific fix 2]

### Systemic Prevention
- [ ] [Broader prevention measure 1]
- [ ] [Process improvement 1]
- [ ] [Monitoring enhancement 1]

### Standards Updates
- [ ] Update CLAUDE.md with new guideline: [specific guideline]
- [ ] Create/update ADR for architectural decision
- [ ] Modify testing requirements: [specific test requirements]
- [ ] Add monitoring: [specific monitoring requirements]

## Implementation Plan
1. [Action item 1 with owner and timeline]
2. [Action item 2 with owner and timeline]
3. [Action item 3 with owner and timeline]

## Effectiveness Review
- **Review Date**: [3 months from implementation]
- **Success Metrics**: [How we'll know prevention is working]
- **Follow-up Actions**: [What to do if prevention isn't effective]

## Related Work
- ADRs: [links to architectural decisions]
- Previous Failures: [links to similar failure analyses]
- Prevention Measures: [links to implemented solutions]
```

## Integration Points

### GitHub Issues Integration
- Automatically detect failure-related issues
- Link failure analysis to issue tracking
- Update issue status based on analysis progress

### Monitoring Integration
- Capture failure context automatically
- Pre-populate analysis templates
- Trigger analysis workflows

### Development Process Integration
- Update development standards based on findings
- Create prevention measures in code review checklists
- Add monitoring and alerting requirements

The goal is to transform every failure into organizational learning that prevents entire categories of similar issues.