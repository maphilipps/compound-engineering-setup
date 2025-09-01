## PART I - IF A TICKET IS MENTIONED

0c. use GitHub CLI to fetch the selected item into thoughts with the issue number - ./thoughts/shared/issues/issue-xxxx.md
0d. read the ticket and all comments to learn about past implementations and research, and any questions or concerns about them


### PART I - IF NO TICKET IS MENTIONED

0.  read .claude/commands/github-issues.md
0a. fetch the top 10 priority items from GitHub Issues with label "status: ready-for-plan" using gh CLI, noting all items
0b. select the highest priority SMALL or XS issue from the list (if no SMALL or XS issues exist, EXIT IMMEDIATELY and inform the user)
0c. use GitHub CLI to fetch the selected item into thoughts with the issue number - ./thoughts/shared/issues/issue-xxxx.md
0d. read the ticket and all comments to learn about past implementations and research, and any questions or concerns about them

### PART II - NEXT STEPS

think deeply

1. move the item to "plan in progress" using the MCP tools
1a. read ./claude/commands/create_plan.md
1b. determine if the item has a linked implementation plan document based on the `links` section
1d. if the plan exists, you're done, respond with a link to the ticket
1e. if the research is insufficient or has unaswered questions, create a new plan document following the instructions in ./claude/commands/create_plan.md

think deeply

2. when the plan is complete, `humanlayer thoughts sync` and attach the doc to the issue using gh CLI and create a terse comment with a link to it (re-read .claude/commands/github-issues.md if needed)
2a. move the item to "plan in review" using the MCP tools

think deeply, use TodoWrite to track your tasks. When fetching from GitHub Issues, get the top 10 items by priority but only work on ONE item - specifically the highest priority small-sized issue.
