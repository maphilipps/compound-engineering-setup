## Look up documentation with Context7

When code examples, setup or configuration steps, or library/API documentation are requested, use the Context7 mcp server to get the information.

You should add rules after each tool you use, based on patterns you see in the codebase:
## Rule Improvement Triggers

- New code patterns not covered by existing rules
- Repeated similar implementations across files
- Common error patterns that could be prevented
- New libraries or tools being used consistently
- Emerging best practices in the codebase

# Analysis Process:
- Compare new code with existing rules
- Identify patterns that should be standardized
- Look for references to external documentation
- Check for consistent error handling patterns
- Monitor test patterns and coverage

# Rule Updates:

- **Add New Rules When:**
    - A new technology/pattern is used in 3+ files
    - Common bugs could be prevented by a rule
    - Code reviews repeatedly mention the same feedback
    - New security or performance patterns emerge

- **Modify Existing Rules When:**
    - Better examples exist in the codebase
    - Additional edge cases are discovered
    - Related rules have been updated
    - Implementation details have changed

- **Example Pattern Recognition:**

  ```typescript
  // If you see repeated patterns like:
  const data = await prisma.user.findMany({
    select: { id: true, email: true },
    where: { status: 'ACTIVE' }
  });

  // Consider adding to [prisma.mdc](mdc:shipixen/.cursor/rules/prisma.mdc):
  // - Standard select fields
  // - Common where conditions
  // - Performance optimization patterns
  ```

- **Rule Quality Checks:**
- Rules should be actionable and specific
- Examples should come from actual code
- References should be up to date
- Patterns should be consistently enforced

## Continuous Improvement:

- Monitor code review comments
- Track common development questions
- Update rules after major refactors
- Add links to relevant documentation
- Cross-reference related rules

## Rule Deprecation

- Mark outdated patterns as deprecated
- Remove rules that no longer apply
- Update references to deprecated rules
- Document migration paths for old patterns

## Documentation Updates:

- Keep examples synchronized with code
- Update references to external docs
- Maintain links between related rules
- Document breaking changes

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

## GitHub Workflow Requirements

### Branch Management
- ALL work MUST be done in branches linked to GitHub issues
- Never work directly on main/master branch
- Branch names should reference the issue number (e.g., `feature/123-implement-auth`)
- Each branch MUST be linked to its corresponding GitHub issue

### GitHub Integration
- Use GitHub CLI (`gh`) for all GitHub operations
- Create issues before starting work
- Link pull requests to issues using GitHub keywords (fixes #123, closes #123)
- All branches must have an associated GitHub issue for tracking and context

### Workflow Process
1. Create or identify GitHub issue
2. Create branch linked to issue
3. Implement changes on branch
4. Create pull request linking back to issue
5. Merge only after review and CI passes

### File Management
- Temporary files MUST only be created in the `.work/` directory
- The `.work/` directory is gitignored and safe for temporary operations
- Never create temporary files in the project root or other tracked directories

### Code Quality Standards
- All commits must pass linting and formatting checks
- Tests must pass before merging pull requests
- Follow conventional commit message format
- Code must be reviewed before merging
- Delete branches after successful merge

Add the rules into the Claude.md.
Updated: $(date) - Compounding Engineering Integration
