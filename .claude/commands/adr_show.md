# ADR Show - Display Specific Architectural Decision Record

Display the full content of a specific ADR with enhanced formatting and navigation.

## Usage
```
/adr_show [number]
/adr_show [number] --section [section]
```

Examples:
- `/adr_show 001` - Show ADR-001 in full
- `/adr_show 2` - Show ADR-002 (leading zeros optional)
- `/adr_show 001 --section decision` - Show only the Decision section

## Implementation Steps

1. **Parse ADR identifier**:
   - Accept number with or without leading zeros (001, 01, 1)
   - Normalize to 3-digit format for file lookup
   - Handle both `ADR-XXX` and just `XXX` formats

2. **Locate ADR file**:
   - Look for file matching pattern `adr-{number}-*.md` in `.adrs/` directory
   - Handle case where multiple files match (should not happen but be safe)
   - Provide helpful error if ADR not found

3. **Parse and format content**:
   - Read the ADR file content
   - Parse markdown structure (title, status, sections)
   - Apply enhanced formatting with emojis and visual separators
   - Highlight important information (status, dates, decisions)

4. **Section filtering** (if specified):
   - Extract only the requested section
   - Support section names: title, status, context, decision, consequences
   - Show section name and provide context about full ADR

## Output Format

### Full ADR Display
```
📋 ADR-001: Implement ADR System
🏷️  Status: Accepted
📅 Created: 2025-09-01
👤 Author: System

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 🔍 Context
We need a systematic way to capture and maintain Architectural Decision Records (ADRs) 
in the project to document important architectural decisions and their rationale...

## ✅ Decision  
We will implement a comprehensive ADR system following the Cognitect methodology...

## 📊 Consequences
This decision will result in:
- Better documentation of architectural decisions
- Improved team alignment on technical choices
...

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📂 File: .adrs/adr-001-implement-adr-system.md
```

### Section-only Display
```
📋 ADR-001: Implement ADR System
🎯 Showing: Decision section only

## ✅ Decision
We will implement a comprehensive ADR system following the Cognitect methodology...

💡 Use '/adr_show 001' to see the full ADR
```

## Enhanced Formatting Features

### Status Indicators
- ✅ **Accepted**: Green checkmark
- 🔄 **Proposed**: Orange circle
- ❌ **Deprecated**: Red X
- ⬆️ **Superseded**: Blue arrow with reference

### Section Icons
- 🔍 **Context**: Magnifying glass
- ✅ **Decision**: Checkmark
- 📊 **Consequences**: Chart
- 🏷️ **Status**: Tag
- 📅 **Date**: Calendar

### Smart Links
- Detect references to other ADRs (`ADR-XXX`) and highlight them
- Show file references as clickable paths
- Highlight URLs and make them accessible

## Section Filter Options
- `title` - Show only the ADR title and number
- `status` - Show only the status information
- `context` - Show only the Context section
- `decision` - Show only the Decision section  
- `consequences` - Show only the Consequences section
- `metadata` - Show only metadata (dates, authors, etc.)

## Error Handling
- If ADR number not provided, list available ADRs
- If ADR not found, suggest similar numbers and show available ADRs
- If invalid section specified, list available sections
- If `.adrs/` directory doesn't exist, show initialization message
- Handle malformed ADR files gracefully with partial display

## Follow-up Actions
After displaying an ADR:
1. Suggest related ADRs if references are found
2. Offer to search for related topics
3. If ADR is "Proposed", mention review/acceptance workflow
4. If ADR is "Deprecated" or "Superseded", show replacement information