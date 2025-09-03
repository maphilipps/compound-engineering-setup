# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Quick Actions
- `make setup` - Resolve dependencies and installation issues across the monorepo
- `make check-test` - Run all checks and tests
- `make check` - Run linting and type checking
- `make test` - Run all test suites

### Python Development
- Uses `uv` exclusively - never use pip directly
- Tests are co-located with source as `*_test.py` files
- Commands: `uv sync`, `make check-py`, `make test-py`

### TypeScript Development
- Package managers vary - check `package.json` for npm or bun
- Build/test commands differ - check `package.json` scripts section
- Some use Jest, others Vitest, check `package.json` devDependencies

### Go Development
- Check `go.mod` for Go version (varies between 1.21 and 1.24)
- Check if directory has a `Makefile` for available commands
- Integration tests only in some projects (look for `-tags=integration`)

## Technical Guidelines

### Python
- Strict type hints (mypy strict mode)
- Async/await patterns where established
- Follow existing code style

### TypeScript
- Modern ES6+ features
- Strict TypeScript configuration
- Maintain CommonJS/ESM compatibility

### Go
- Standard Go idioms
- Context-first API design
- Generate mocks with `make mocks` when needed

## AI Evaluation Framework

### 4-Criteria Compound Learning Optimization
*Last synthesis: September 3, 2025*

✅ **Correctness**: Ensure logical soundness and error prevention
✅ **Completeness**: Address all requirements thoroughly  
✅ **Size**: Provide appropriately sized solutions (not over/under-engineered)
✅ **Trajectory**: Contribute to compound learning and knowledge building

#### Compound Workflow Success Pattern
- **Key Finding**: Workflows with compound learning integration show 100% success rates vs 0-43% for basic workflows
- **Application**: Always include learning capture commands (`/capture_learning`, `/learn_from_failure`, `/adr_check`) in AI workflows
- **Evidence**: Claude Compound Code Review (100% success) vs Claude Code Review (43% success)

### Code Quality Checklist
- [ ] Follows established patterns from codebase
- [ ] Includes appropriate error handling
- [ ] Has clear variable naming and structure
- [ ] Integrates properly with existing architecture
- [ ] Includes necessary tests and documentation
- [ ] **Uses learning capture commands when appropriate**
- [ ] **References existing learnings and ADRs when relevant**

### Decision Documentation Standards
- Document WHY not just WHAT in all code changes
- Capture alternatives considered and rejected
- Note any compromises or tradeoffs made
- Record lessons learned for future reference

### Multi-Phase Review Process
1. **Structural Review**: Architecture and patterns alignment
2. **Implementation Review**: Code quality and correctness assessment
3. **Integration Review**: System compatibility and dependencies
4. **Learning Review**: Extractable insights for future development

### Review Quality Gates
- Each phase must pass before proceeding to next
- Document findings and decisions at each gate
- Use opponent processing for critical changes
- Escalate complex decisions to ADR process

## Development Conventions

### TODO Annotations

We use a priority-based TODO annotation system throughout the codebase:

- `TODO(0)`: Critical - never merge
- `TODO(1)`: High - architectural flaws, major bugs
- `TODO(2)`: Medium - minor bugs, missing features
- `TODO(3)`: Low - polish, tests, documentation
- `TODO(4)`: Questions/investigations needed
- `PERF`: Performance optimization opportunities

## Additional Resources
- Check `examples/` for integration patterns
- Consult `docs/` for user-facing documentation