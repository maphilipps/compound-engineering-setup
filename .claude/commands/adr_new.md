# ADR New - Create New Architectural Decision Record

Create a new ADR (Architectural Decision Record) in the `.adrs/` directory with proper sequential numbering.

## Usage
```
/adr_new [Title of the ADR]
```

## Implementation Steps

1. **Find the next ADR number**:
   - List existing ADR files in `.adrs/` directory
   - Extract numbers from filenames (adr-XXX-*.md)
   - Find the highest number and increment by 1

2. **Create the new ADR file**:
   - Use filename format: `adr-XXX-title-slug.md` (where XXX is zero-padded 3-digit number)
   - Convert title to URL slug (lowercase, hyphens for spaces, remove special chars)

3. **Populate the ADR template**:
   - Read `.adrs/template.md` 
   - Replace `XXX` placeholder with the new ADR number
   - Replace `[Decision Title]` with the provided title
   - Set status to "Proposed"
   - Add creation date and author information

4. **Create and open the file**:
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

- If `.adrs/` directory doesn't exist, inform user to run ADR system initialization first
- If no title provided, prompt for title
- If title is too long (>80 chars), suggest shortening it
- If similar ADR already exists, list similar titles for reference

## Follow-up Actions

After creating the ADR:
1. Show the file path of the created ADR
2. Display a brief reminder of ADR completion workflow
3. Suggest related commands (`/adr_list`, `/adr_search`)