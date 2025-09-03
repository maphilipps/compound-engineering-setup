# ADR List - Display All Architectural Decision Records

List all ADRs in the `.adrs/` directory with their status and brief summary.

## Usage
```
/adr_list [status_filter]
```

Optional status filter: `proposed`, `accepted`, `deprecated`, `superseded`

## Implementation Steps

1. **Validate input and scan ADR directory**:
   - If status filter provided, validate it's one of: `proposed`, `accepted`, `deprecated`, `superseded`
   - If invalid status provided, show error and available options
   - Check if `.adrs/` directory exists, provide setup guidance if missing
   - List all `.md` files in `.adrs/` directory
   - Exclude `template.md` and `README.md`
   - Handle empty directory gracefully
   - Sort files by ADR number (extracted from filename)

2. **Parse ADR metadata**:
   - For each ADR file, read the content
   - Extract the title from the first `# ADR-XXX:` line
   - Extract status from the `## Status` section
   - Extract first line of Context section for brief summary

3. **Display formatted list**:
   - Show in table format: Number | Title | Status | Brief Summary
   - Highlight different statuses with appropriate formatting
   - Include file paths for easy navigation

4. **Apply status filtering** (if provided):
   - Filter results to show only ADRs with matching status
   - Case-insensitive matching
   - Show count of filtered vs total ADRs

## Output Format

```
📋 Architectural Decision Records

ADR-001: Implement ADR System                    [Accepted]    .adrs/adr-001-example.md
        Brief: We will implement a systematic way to capture...

ADR-002: Choose Database Technology              [Proposed]    .adrs/adr-002-choose-database.md  
        Brief: We need to select a database technology that...

📊 Total: 2 ADRs (2 shown)
```

## Status Formatting
- ✅ **Accepted**: Green/positive indicator
- 🔄 **Proposed**: Yellow/pending indicator  
- ❌ **Deprecated**: Red/negative indicator
- ⬆️ **Superseded**: Blue with reference to superseding ADR

## Error Handling
- If `.adrs/` directory doesn't exist, show initialization message
- If no ADRs found, show friendly "no ADRs yet" message
- If invalid status filter provided, show available options
- Handle malformed ADR files gracefully

## Follow-up Actions
After displaying the list:
1. Suggest using `/adr_show XXX` to view specific ADRs
2. If filtered, mention using `/adr_list` without filter to see all
3. Suggest `/adr_new` to create new ADRs