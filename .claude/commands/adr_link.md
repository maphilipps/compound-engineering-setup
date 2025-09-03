# ADR Link

Create bidirectional links between ADRs and captured learnings for comprehensive knowledge management.

## Process

When invoked with ADR and learning references:
`/adr_link adr-001 learning-2024-12-01-database-performance`

1. **Validate References**:
   - Check that ADR exists in `.adrs/` directory
   - Verify learning document exists in `thoughts/shared/learnings/`
   - Confirm both documents have proper metadata structure

2. **Update ADR Document**:
   - Add "Related Learnings" section if it doesn't exist
   - Link to relevant learning documents
   - Update ADR metadata to include learning references
   - Preserve existing ADR structure and format

3. **Update Learning Document**:
   - Add ADR reference to learning metadata
   - Include ADR link in "Related Work" section
   - Ensure bidirectional referencing is complete

4. **Update Cross-Reference Index**:
   - Maintain searchable index of ADR-learning relationships
   - Enable discovery of related decisions and insights
   - Support knowledge navigation and exploration

5. **Validate Links**:
   - Check all links are functional and accessible
   - Verify cross-references are complete
   - Report any broken references or orphaned documents

## Enhanced ADR Template Extensions

Add to existing `.adrs/template.md`:

```markdown
## Related Learnings
[Links to captured learnings that influenced this decision]

## Implementation Notes
[Technical details and discoveries during implementation]

## Effectiveness Review
- **Review Date**: [When this decision should be reviewed]
- **Success Metrics**: [How we'll measure effectiveness]
- **Known Issues**: [Any problems discovered with this decision]

## Learning Updates
[Placeholder for future learning references - managed by /adr_link command]
```

## Batch Linking Operations

### Link All Related Items
`/adr_link --discover adr-001`
- Automatically find learnings related to the ADR topic
- Suggest potential links based on content analysis
- Create bidirectional references for confirmed links

### Learning Discovery
`/adr_link --find-learnings database performance`
- Search for learnings related to specific topics
- Identify ADRs that should be linked to those learnings
- Generate link recommendations for manual review

### Broken Link Repair
`/adr_link --repair`  
- Scan all ADRs and learnings for broken references
- Report orphaned links and missing documents
- Provide repair suggestions for broken relationships

## Usage Examples

### Manual Linking
```bash
# Link specific ADR to learning
claude-code "/adr_link adr-003 learning-2024-09-01-auth-patterns"

# Link multiple learnings to one ADR
claude-code "/adr_link adr-005 learning-2024-09-01-performance learning-2024-08-15-caching"
```

### Discovery Operations
```bash
# Find all learnings related to an ADR
claude-code "/adr_link --discover adr-002"

# Find ADRs related to specific topics
claude-code "/adr_link --find-learnings authentication security"
```

### Maintenance Operations
```bash
# Check for broken links
claude-code "/adr_link --repair"

# Generate cross-reference report
claude-code "/adr_link --report"
```

## Cross-Reference Index

Maintains searchable indexes in `thoughts/shared/learnings/indexes/`:

### by-adr.md
Maps each ADR to its related learnings:
```markdown
## ADR-001: Database Architecture
- learning-2024-09-01-postgresql-performance.md
- learning-2024-08-20-migration-strategy.md

## ADR-002: API Design
- learning-2024-09-02-rest-patterns.md
- learning-2024-08-25-error-handling.md
```

### by-topic.md
Groups learnings and ADRs by technical topic:
```markdown
## Database
### ADRs
- ADR-001: Database Architecture
- ADR-005: Data Migration Strategy

### Learnings
- learning-2024-09-01-postgresql-performance.md
- learning-2024-08-30-query-optimization.md
```

The goal is to create a navigable knowledge network where architectural decisions and experiential learnings reinforce each other.