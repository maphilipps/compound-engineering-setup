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