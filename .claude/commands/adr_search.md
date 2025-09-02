# ADR Search - Search Architectural Decision Records

Search through all ADRs for specific terms or concepts.

## Usage
```
/adr_search [search_term]
/adr_search [search_term] --status [status]
/adr_search [search_term] --section [section]
```

## Implementation Steps

1. **Parse search parameters**:
   - Extract main search term (required)
   - Extract optional status filter (`--status proposed|accepted|deprecated|superseded`)
   - Extract optional section filter (`--section title|context|decision|consequences`)

2. **Scan and filter ADR files**:
   - List all ADR files in `.adrs/` directory (excluding template.md and README.md)
   - Apply status filter if specified
   - Read content of each qualifying ADR

3. **Perform search**:
   - **Full-text search** (default): Search entire ADR content
   - **Section search**: Search only in specified section
   - Case-insensitive matching
   - Support for partial word matches

4. **Collect and rank results**:
   - Count matches per ADR
   - Extract context around matches (surrounding lines)
   - Rank by relevance (number of matches + title matches get higher priority)

5. **Display formatted results**:
   - Show match count and ADR summary
   - Include context snippets with highlighted search terms
   - Provide file paths for easy access

## Output Format

```
🔍 Search results for "database" (3 matches in 2 ADRs)

ADR-002: Choose Database Technology              [Proposed]    📍 3 matches
├─ Context: "...need to select a database technology that scales..."
├─ Decision: "We will evaluate PostgreSQL, MongoDB, and database performance..."
└─ File: .adrs/adr-002-choose-database.md

ADR-005: Implement Database Migration System    [Accepted]    📍 1 match  
├─ Consequences: "...will require database schema versioning..."
└─ File: .adrs/adr-005-database-migration.md

💡 Use '/adr_show XXX' to view full ADRs
```

## Search Options

### Status Filter
- `--status proposed`: Show only proposed ADRs
- `--status accepted`: Show only accepted ADRs  
- `--status deprecated`: Show only deprecated ADRs
- `--status superseded`: Show only superseded ADRs

### Section Filter
- `--section title`: Search only in ADR titles
- `--section context`: Search only in Context sections
- `--section decision`: Search only in Decision sections  
- `--section consequences`: Search only in Consequences sections

## Advanced Features

### Smart Matching
- Fuzzy matching for typos
- Synonym recognition (e.g., "DB" matches "database")
- Phrase searching with quotes: `"exact phrase"`

### Result Ranking
1. Title matches (highest priority)
2. Decision section matches
3. Context section matches  
4. Consequences section matches
5. Multiple matches in same ADR

## Error Handling
- If no search term provided, prompt for input
- If `.adrs/` directory doesn't exist, show initialization message
- If no matches found, suggest broader search terms
- Handle malformed ADR files gracefully
- Validate status and section filter options

## Follow-up Actions
After showing search results:
1. Suggest viewing specific ADRs with `/adr_show`
2. Suggest refining search with filters if many results
3. Offer to create new ADR if search suggests missing topic