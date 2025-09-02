#!/bin/bash
# Learning extraction hook - runs after every tool use
# Captures patterns and insights from tool usage for organizational learning

# Exit if we're in a learning extraction session to avoid infinite loops
if [ "$CLAUDE_LEARNING_EXTRACTION" = "true" ]; then
    exit 0
fi

# Get tool information from environment variables
TOOL_NAME="${CLAUDE_TOOL_NAME:-unknown}"
TOOL_RESULT="${CLAUDE_TOOL_RESULT:-}"
TOOL_INPUT="${CLAUDE_TOOL_INPUT:-}"

# Only extract learnings from significant tools
case "$TOOL_NAME" in
    "Write"|"Edit"|"MultiEdit"|"Bash"|"Task")
        # These are significant development actions worth learning from
        ;;
    *)
        # Skip learning extraction for read-only or trivial operations
        exit 0
        ;;
esac

# Create learning log entry
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
LEARNING_LOG="thoughts/shared/learnings/tool-usage-log.txt"

# Ensure learning directory exists
mkdir -p thoughts/shared/learnings

# Log the tool usage for later batch processing
echo "[$TIMESTAMP] TOOL: $TOOL_NAME | INPUT: $(echo "$TOOL_INPUT" | head -c 200)... | RESULT: $(echo "$TOOL_RESULT" | head -c 200)..." >> "$LEARNING_LOG"

# Rotate log if it gets too large (>10000 lines)
if [ -f "$LEARNING_LOG" ] && [ $(wc -l < "$LEARNING_LOG") -gt 10000 ]; then
    tail -n 5000 "$LEARNING_LOG" > "${LEARNING_LOG}.tmp"
    mv "${LEARNING_LOG}.tmp" "$LEARNING_LOG"
fi

# Exit successfully to not interfere with normal tool usage
exit 0