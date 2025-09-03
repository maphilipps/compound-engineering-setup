# Process Learning Logs

Batch process accumulated tool usage logs to extract meaningful patterns and insights.

## Process

This command analyzes the tool-usage-log.txt file created by the PostToolUse hook:

1. **Read Tool Usage Log**:
   - Load accumulated tool usage entries from `thoughts/shared/learnings/tool-usage-log.txt`
   - Parse timestamps, tool names, inputs, and results
   - Identify patterns in tool usage over time

2. **Pattern Recognition**:
   - Look for repeated tool usage patterns
   - Identify common error scenarios and their resolutions
   - Find successful workflow sequences
   - Detect efficiency improvements over time

3. **Extract Significant Learnings**:
   - Identify tools that frequently produce errors
   - Find successful code patterns that are reused
   - Discover workflow improvements
   - Note tools that are being used in innovative ways

4. **Create Learning Documents**:
   - Generate learning documents for significant patterns
   - Use the standard learning document template
   - Focus on actionable insights and improvements
   - Tag with relevant categories (workflow, tooling, efficiency)

5. **Update Development Standards**:
   - Suggest updates to CLAUDE.md based on discoveries
   - Propose new best practices from successful patterns
   - Identify anti-patterns to avoid
   - Recommend process improvements

6. **Clean Up Processed Logs**:
   - Archive processed log entries
   - Maintain rolling window of recent activity
   - Reset log file to prevent unbounded growth

## Usage Scenarios

### Daily Learning Review
Run this command at the end of development sessions:
- `claude-code "/process_learning_logs"`

### Weekly Pattern Analysis  
Analyze accumulated patterns weekly:
- `claude-code "/process_learning_logs --deep-analysis"`

### After Major Features
Process learnings after completing significant work:
- `claude-code "/process_learning_logs --feature-retrospective"`

## Learning Categories Detected

### Workflow Efficiency
- Tool usage sequences that work well together
- Common development patterns and their success rates
- Time-saving shortcuts and techniques

### Error Patterns
- Tools that frequently encounter issues
- Common mistake patterns and their fixes
- Recovery strategies that work consistently

### Best Practices
- Code patterns that consistently produce good results
- Testing strategies that catch issues early
- Documentation approaches that prove helpful

### Process Improvements
- Development workflows that increase velocity
- Quality gates that prevent issues
- Coordination patterns that work well

The goal is to automatically capture and codify the tacit knowledge gained through daily development work.