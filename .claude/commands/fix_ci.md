# Fix CI - Automated CI Failure Resolution

Analyze and automatically fix CI/CD pipeline failures with targeted solutions.

## Usage
```
/fix_ci [run_url] [--job job_name] [--pr pr_number]
```

## Implementation Process

When invoked (typically by auto-fix workflow):

### 1. **Failure Analysis**
- Fetch CI run details and failed job logs
- Parse error messages and identify failure patterns
- Categorize failure types: build, test, lint, dependency, configuration
- Extract relevant error context and stack traces

### 2. **Root Cause Investigation**
- Examine recent code changes that may have caused failures
- Check for dependency updates or configuration changes
- Analyze file modifications in the failing commit range
- Identify environmental factors (OS, runtime versions, etc.)

### 3. **Pattern Recognition & Diagnosis**
Apply systematic analysis for common CI failure patterns:

#### **Dependency Issues**
- Missing or conflicting package versions
- Lock file inconsistencies (package-lock.json, uv.lock, Cargo.lock)
- Outdated or incompatible dependencies
- Platform-specific dependency conflicts

#### **Build Failures**  
- Compiler errors from syntax or type issues
- Missing build tools or incorrect versions
- Configuration file syntax errors
- Asset or resource file issues

#### **Test Failures**
- Unit test failures from broken logic
- Integration test environment issues
- Missing test fixtures or mock data
- Test timeout or performance issues

#### **Linting/Style Issues**
- Code style violations (ESLint, Prettier, Black)
- Type checking errors (TypeScript, mypy)
- Import/export statement issues
- Unused variable or dead code warnings

#### **Configuration Problems**
- Incorrect workflow YAML syntax
- Missing environment variables or secrets
- Tool configuration errors (.eslintrc, tsconfig.json, etc.)
- Version mismatch between local and CI environments

### 4. **Targeted Solution Application**

#### **File Modifications**
- Fix syntax errors and type issues
- Update dependency versions and lock files
- Correct configuration file syntax
- Add missing imports or exports

#### **Test Fixes**
- Update failing test assertions
- Fix mock data or test fixtures
- Adjust test timeouts or async handling
- Update test configurations

#### **Build Configuration**
- Update build tool configurations
- Fix asset paths and resource references
- Correct compilation flags or options
- Update CI workflow configurations

### 5. **Validation & Testing**
- Run local builds/tests where possible to verify fixes
- Check that fixes don't introduce new issues
- Validate configuration syntax
- Ensure compatibility with existing code

### 6. **Change Documentation**
- Create clear commit messages explaining the fix
- Document any significant changes or workarounds
- Add inline comments for complex fixes
- Update relevant documentation if needed

## Error Handling & Escalation

### **Auto-Fixable Issues** ✅
- Simple syntax errors and typos
- Dependency version conflicts with clear resolution
- Code style violations (formatting, linting)
- Missing imports or basic configuration errors
- Test assertion updates for expected behavior changes

### **Manual Review Required** ⚠️
- Complex logic errors requiring domain knowledge
- Breaking API changes affecting multiple components
- Security vulnerabilities requiring careful consideration
- Performance issues requiring optimization strategy
- Architectural changes affecting system design

### **Escalation Triggers**
- Multiple failure types in single run
- Recursive or circular dependency issues
- Platform-specific problems without clear workaround
- Test failures requiring business logic understanding
- Configuration conflicts with external services

## Output Format

### **Success Response**
```markdown
## ✅ CI Fixes Applied

### Issues Resolved
- [Type] Description of fix applied
- [Type] Another fix with file references

### Changes Made
- `file/path.js` - Fixed TypeScript type error
- `package.json` - Updated conflicting dependency versions  
- `.github/workflows/ci.yml` - Corrected workflow syntax

### Validation
- ✅ Local build successful
- ✅ Tests passing
- ✅ Linting clean

Ready to commit and push fixes.
```

### **Partial Success Response**
```markdown
## ⚠️ CI Fixes - Partial Success

### Issues Fixed
- [Type] Successfully resolved issues

### Issues Requiring Manual Review
- [Type] Complex issue requiring domain knowledge
- [Type] Breaking change requiring architectural decision

### Recommended Next Steps
1. Review the manual issues listed above
2. Consider architectural implications
3. Test edge cases specific to business logic
```

### **Failure Response**
```markdown
## ❌ Unable to Auto-Fix CI Issues

### Analysis Completed
- Root cause identified: [specific issue]
- Complexity level: [high/architectural/security]

### Manual Investigation Required
[Detailed explanation of why auto-fix cannot resolve]

### Recommended Actions
1. [Specific manual steps]
2. [Additional investigation needed]
3. [Expert consultation if needed]
```

## Integration Notes
- Designed to work with GitHub Actions auto-fix workflow
- Supports multiple CI platforms (GitHub Actions, GitLab CI, etc.)
- Can be invoked manually for local CI debugging
- Integrates with existing learning capture system