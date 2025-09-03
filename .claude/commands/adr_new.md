# ADR New - Create New Architectural Decision Record

Create a new ADR (Architectural Decision Record) in the `.adrs/` directory with proper sequential numbering.

## Usage
```
/adr_new [Title of the ADR]
```

## Implementation Steps

1. **Validate Input**:
   - Check if title parameter is provided
   - If no title provided, respond with usage instructions and prompt for input
   - Validate title length (must be between 1-80 characters)
   - Sanitize title to prevent path injection (remove ../, special characters)

2. **Ensure ADR system is initialized**:
   - Check if `.adrs/` directory exists
   - If missing, automatically create directory and template file
   - Ensure `template.md` exists (copy from system template if missing)

3. **Find the next ADR number**:
   - List existing ADR files in `.adrs/` directory  
   - Extract numbers from filenames (adr-XXX-*.md)
   - Find the highest number and increment by 1 (start at 001 if none exist)

4. **Create the new ADR file**:
   - Use filename format: `adr-XXX-title-slug.md` (where XXX is zero-padded 3-digit number)
   - Convert title to URL slug (lowercase, hyphens for spaces, remove special chars)

5. **Populate the ADR template**:
   - Read `.adrs/template.md` 
   - Replace `XXX` placeholder with the new ADR number
   - Replace `[Decision Title]` with the provided title
   - Set status to "Proposed"
   - Add creation date and author information

6. **Create and open the file**:
   - Write the populated template to the new ADR file
   - Inform user of the created file path
   - Ask if they want to edit the ADR immediately

## Template Handling

The ADR will be created using the template from `.adrs/template.md` with these substitutions:
- `ADR-XXX` → `ADR-{number}` (e.g., `ADR-002`)
- `[Decision Title]` → Provided title
- Status defaults to "Proposed"

## Example

Input: `/adr_new Choose Database Technology`
Output: `.adrs/adr-002-choose-database-technology.md`

## Error Handling

- **Missing ADR system**: Automatically create `.adrs/` directory and `template.md` if they don't exist
- **No title provided**: Prompt for title with usage instructions
- **Title too long**: Suggest shortening if >80 characters
- **Similar ADR exists**: List similar titles for reference
- **Permission issues**: Provide clear guidance on fixing directory permissions

## Follow-up Actions

After creating the ADR:
1. Show the file path of the created ADR
2. Display a brief reminder of ADR completion workflow
3. Suggest related commands (`/adr_list`, `/adr_search`)