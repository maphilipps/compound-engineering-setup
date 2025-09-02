# ADR Check

Validate current changes against ADR requirements and suggest ADR creation when needed.

## Process

When invoked (typically from pre-commit hook or CI):

1. **Analyze Current Changes**:
   - Get current git diff: `git diff --cached --name-only`
   - Analyze changed file patterns and types
   - Extract significant code changes and additions
   - Check for architectural or infrastructure changes

2. **Apply Detection Rules**:
   - **Major Dependencies**: Check for new entries in package.json, requirements.txt, go.mod
   - **Core Interfaces**: Look for new API endpoints, database schemas, service interfaces  
   - **Performance Changes**: Detect caching, indexing, or optimization changes
   - **Security Changes**: Find authentication, authorization, or encryption modifications
   - **Infrastructure**: Identify Docker, deployment, or configuration changes

3. **Generate ADR Recommendations**:
   - For each detected pattern, suggest ADR creation
   - Provide proposed ADR title and rationale
   - Indicate urgency level (required, recommended, optional)
   - Link to existing ADRs that might be affected

4. **Check Existing ADR Compliance**:
   - Verify changes align with accepted ADRs
   - Flag potential violations of documented decisions
   - Suggest ADR updates if architectural decisions evolved

5. **Report Results**:
   - Exit with status code 0 if no issues found
   - Exit with status code 1 if ADRs are required but missing
   - Provide clear guidance on next steps for developers

## Detection Rules

### File Pattern Analysis
- `package.json` changes → Check for new major dependencies
- `Dockerfile` modifications → Infrastructure architecture decisions
- `*.migration.sql` → Database schema evolution decisions
- Security-related file changes → Security architecture review

### Code Pattern Analysis
- New service definitions → Service architecture decisions
- New API endpoints → API design decisions
- Performance optimization code → Performance architecture choices
- Authentication/authorization changes → Security decisions

### Integration Analysis
- Changes affecting multiple services → Integration architecture
- Breaking API changes → Backward compatibility decisions
- Database schema changes → Data architecture decisions

## Usage Examples

### Pre-commit Integration
```bash
# Add to .git/hooks/pre-commit
if ! claude-code "/adr_check"; then
    echo "ADR compliance check failed. Please create required ADRs."
    exit 1
fi
```

### CI/CD Integration
```yaml
# Add to GitHub Actions workflow
- name: Check ADR Compliance
  run: claude-code "/adr_check"
```

### Manual Check
```bash
# Check current staged changes
claude-code "/adr_check"

# Check specific commit
claude-code "/adr_check --commit a1b2c3d"
```

## Output Format

### No Issues Found
```
✅ ADR compliance check passed
No architectural decisions requiring documentation found.
```

### ADRs Required
```
❌ ADR compliance check failed

Required ADRs:
- New authentication service (high priority)
- Database migration strategy (medium priority)

Recommended ADRs:
- Performance optimization approach (low priority)

Next steps:
1. Run: claude-code "/adr_new Authentication Service Architecture"
2. Run: claude-code "/adr_new Database Migration Strategy"
```

### Compliance Violations
```
⚠️ ADR compliance issues found

Potential violations:
- ADR-003 (Database Choice): Using MySQL instead of documented PostgreSQL
- ADR-007 (API Versioning): Missing version headers in new endpoints

Please review these decisions and update ADRs if architectural direction has changed.
```

The goal is to catch architectural decisions before they become implicit and ensure all significant technical choices are properly documented and reviewed.