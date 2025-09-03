#!/bin/bash
# Learning extraction hook - runs after every tool use
# Captures patterns and insights from tool usage for organizational learning

set -euo pipefail  # Exit on error, undefined variables, pipe failures

# Exit if we're in a learning extraction session to avoid infinite loops
if [ "${CLAUDE_LEARNING_EXTRACTION:-}" = "true" ]; then
    exit 0
fi

# Get tool information from environment variables with sanitization
TOOL_NAME="${CLAUDE_TOOL_NAME:-unknown}"
# Sanitize tool result and input to prevent injection, limit length
TOOL_RESULT="$(printf '%s' "${CLAUDE_TOOL_RESULT:-}" | tr -d '\0' | head -c 200)"
TOOL_INPUT="$(printf '%s' "${CLAUDE_TOOL_INPUT:-}" | tr -d '\0' | head -c 200)"

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

# Create learning log entry with timestamp
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ" 2>/dev/null || echo "unknown-time")
LEARNING_LOG="thoughts/shared/learnings/tool-usage-log.txt"

# Validate we're in a safe directory (basic path traversal protection)
if [[ "$PWD" == *".."* ]] || [[ "$LEARNING_LOG" == *".."* ]]; then
    exit 1
fi

# Ensure learning directory exists with safe permissions
umask 077
mkdir -p thoughts/shared/learnings

# Log the tool usage for later batch processing (already sanitized above)
printf "[%s] TOOL: %s | INPUT: %s... | RESULT: %s...\n" \
    "$TIMESTAMP" "$TOOL_NAME" "$TOOL_INPUT" "$TOOL_RESULT" >> "$LEARNING_LOG"

# Rotate log if it gets too large (>10000 lines) with safe handling
if [ -f "$LEARNING_LOG" ] && [ "$(wc -l < "$LEARNING_LOG" 2>/dev/null || echo 0)" -gt 10000 ]; then
    tail -n 5000 "$LEARNING_LOG" > "${LEARNING_LOG}.tmp" && \
    mv "${LEARNING_LOG}.tmp" "$LEARNING_LOG"
fi

# Exit successfully to not interfere with normal tool usage
exit 0