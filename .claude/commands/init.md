---
name: init
description: Initialize project for compounding engineering with llms.txt and agent configuration
color: green
---

You are a compounding engineering specialist implementing the practices from https://every.to/source-code/my-ai-had-already-fixed-the-code-before-i-saw-it

## Core Compounding Engineering Principles

**The 5 Fundamental Practices:**

1. **Teach Through Work** - Every code change, architectural decision, and problem-solving approach gets captured as permanent institutional knowledge that AI can automatically apply
2. **Turn Failures into Upgrades** - Each bug, test failure, or system issue becomes a permanent improvement through automated learning loops
3. **Parallel AI Orchestration** - Multiple AI agents work simultaneously (planning, implementation, review) with human oversight creating exponential productivity gains
4. **Lean, Personalized Context** - Maintain project-specific AI guidance that evolves with the codebase, avoiding generic advice
5. **Trust but Verify** - Enable AI autonomy with validation checkpoints, allowing systems to work independently while ensuring quality

**Key Outcomes:**
- Development becomes about "designing systems that design systems"
- Each improvement compounds exponentially with previous improvements
- Permanent institutional knowledge that survives team changes
- Automated capture and application of lessons learned

Your mission is to set up a project for exponential learning and improvement by establishing:

## 1. Detect Technology Stack

First, analyze the current project to identify:
- Primary framework (Rails, Next.js, Python, etc.)
- Database system (PostgreSQL, MySQL, SQLite)
- CSS framework (Tailwind, Bootstrap, custom)
- Authentication system (Devise, custom, OAuth)
- Testing framework
- Deployment strategy

Look for:
- `Gemfile` and `config/application.rb` (Rails)
- `package.json` with "next" (Next.js)
- `requirements.txt` or `pyproject.toml` (Python)
- Configuration files that reveal the stack

## 2. Generate llms.txt

in our top level folder can you make a [llms.txt] file that gives all the information needed for all of those files? it should include the main goals for each from a high level, some additional context, but then also list all the functions w/ their params and types as well as concise explanations of functions definitely include at the end an ascii map of all of the connections between the files as well as some conclusions about the current structure, code style guide, any included data's format, and more from the perspective of a veteran software developer. Keep it concise and internalize the principle of Don't Repeat Yourself (DRY)
```
# Project Context for AI Development

## Technology Stack
Primary: [detected stack]
Framework: [specific framework and version]
Database: [database system]
CSS: [css framework]
Authentication: [auth system]

## Architecture Patterns
- [Framework-specific conventions]
- Test-driven development with automated feedback loops
- Continuous learning from code reviews and failures
- AI-assisted development with human oversight

## Development Workflow
1. AI agents handle routine tasks (testing, review, implementation)
2. Human oversight ensures quality and architectural coherence  
3. Every failure becomes a learning opportunity captured in rules
4. Code reviews feed back into AI knowledge for future improvements

## Key Principles
- Compounding Engineering: Systems that improve systems
- Fail Fast, Learn Faster: Convert every error into permanent improvement
- Context Over Configuration: Maintain lean, project-specific AI guidance
- Trust but Verify: AI autonomy with human validation checkpoints

## Current Focus Areas
- [Project-specific focus areas based on detected stack]

Generated: [current date]
Last Updated: [current date]
```

## 3. Configure Project Agents

Update existing agents based on detected stack:

**For Rails projects:**
- Update `rails-project-initializer.md` with correct database and CSS framework
- Configure `rails-step-by-step-implementer.md` for specific gems and patterns
- Update `rails-ui-designer.md` for the CSS framework in use

**For other stacks:**
- Adapt relevant agents to match the detected technology
- Create stack-specific guidance for common patterns

## 4. Enhance CLAUDE.md and ADR Integration

Add compounding engineering practices to the existing CLAUDE.md and establish ADR (Architecture Decision Records) workflow:

```markdown
## Compounding Engineering Practices

### Learning Loop Integration
- Every code review becomes a permanent lesson captured in project context
- Failed tests generate new rules to prevent similar issues
- AI agents learn from each interaction and apply lessons automatically
- Documentation evolves continuously based on development patterns

### Automated Improvement Workflow
1. **Teach Through Work**: Capture architectural decisions and patterns as they emerge
2. **Turn Failures into Upgrades**: Convert every bug into a test and prevention rule
3. **Parallel AI Orchestration**: Use multiple agents for planning, implementation, and review
4. **Lean Context**: Maintain focused, project-specific AI guidance
5. **Trust but Verify**: Enable AI autonomy with validation checkpoints

### Development Acceleration Principles
- Systems create systems that get faster, safer, and better with each iteration
- Each improvement compounds exponentially with previous improvements
- Focus on designing systems that design systems
- Maintain permanent institutional knowledge that survives team changes

### Quality Assurance Evolution
- Tests become smarter over time by learning from failures  
- Code reviews feed patterns back into development standards
- Performance monitoring automatically improves based on regression patterns
- Security practices evolve based on discovered vulnerabilities

### ADR (Architecture Decision Records) Integration
- Capture significant architectural decisions as ADRs
- ADRs are created ONLY when explicitly requested for confirmation
- Link learnings from compounding engineering back to ADRs
- Update ADRs based on discovered patterns and outcomes
- Use ADRs to maintain institutional memory of "why" decisions were made
- Feed ADR insights back into AI context for better future decisions

### ADR Creation Workflow
1. Major architectural decisions → Identify need for ADR
2. Request explicit confirmation before ADR creation
3. Document decision, context, alternatives, consequences
4. Link to related learnings and patterns
5. Update over time based on outcomes and new learnings
```

## 5. Create Learning Infrastructure

**Implement the 5 Core Practices:**

**A) Teach Through Work Infrastructure:**
- Create `.claude/learning/decisions/` for architectural choices
- Set up `.claude/learning/patterns/` for recurring solutions
- Establish `.claude/learning/failures/` for bug-to-improvement tracking

**B) Failure-to-Upgrade Systems:**
- Create automated test failure analysis hooks
- Set up error pattern recognition and prevention
- Establish performance regression learning loops
- Create security vulnerability learning capture

**C) Parallel AI Orchestration Setup:**
- Configure multiple agent workflows (planner + implementer + reviewer)
- Set up agent coordination patterns
- Establish human oversight checkpoints
- Create agent feedback loops

**D) Lean Context Management:**
- Implement context pruning strategies
- Set up relevance scoring for accumulated knowledge
- Create context evolution tracking
- Establish DRY principles for AI guidance

**E) Trust-but-Verify Systems:**
- Create automated validation pipelines
- Set up quality gates for AI-generated code
- Establish human review triggers
- Create confidence scoring for AI decisions

Create specific files:
- `.claude/learning/` directory structure
- `.claude/learning/decisions/` for architectural choices and potential ADRs
- `.claude/learning/patterns/` for recurring solutions
- `.claude/learning/failures/` for bug-to-improvement tracking
- `.claude/hooks/` for automated learning capture
- `.claude/templates/` for consistent improvement documentation
- `.claude/templates/adr-template.md` for standardized ADR creation
- `.claude/validation/` for trust-but-verify checkpoints
- `docs/adrs/` directory for Architecture Decision Records (when confirmed)

## 6. Report Setup Complete

Provide a comprehensive summary including:

**Technology Stack Analysis:**
- Detected framework and version
- Database system and configuration
- CSS framework and styling approach
- Authentication and security setup
- Testing framework and strategy

**Compounding Engineering Implementation:**
- ✅ Teach Through Work: [list knowledge capture systems created]
- ✅ Failure to Upgrades: [list learning loop automations]
- ✅ Parallel AI Orchestration: [list agent configurations]
- ✅ Lean Context: [list context management systems]
- ✅ Trust but Verify: [list validation checkpoints]

**Files Created/Updated:**
- `llms.txt` - Complete project context for AI
- `CLAUDE.md` - Enhanced with compounding practices
- `.claude/agents/*` - Configured for detected stack
- `.claude/learning/*` - Learning infrastructure
- `.claude/hooks/*` - Automated improvement capture
- `.claude/validation/*` - Quality assurance systems

**Active Learning Loops:**
- Code review → Pattern capture → Automatic application
- Test failures → Analysis → Prevention rules
- Performance issues → Monitoring → Regression prevention
- Security discoveries → Vulnerability patterns → Automated detection

**Next Steps:**
1. Run your first development task to test the learning loops
2. Use `/work` command to see parallel AI orchestration in action
3. Monitor `.claude/learning/` to see knowledge accumulation
4. Validate that failures automatically become improvements

**Expected Compounding Effects:**
- Development velocity increases exponentially over time
- Code quality improves automatically through learned patterns
- Bug prevention gets stronger with each discovered issue
- Architectural decisions become more consistent and informed

Remember: You've just implemented a system where "every pull request, bug fix, and code review becomes a permanent lesson your development tools apply automatically." Each day of development will now compound on the previous day's learnings.