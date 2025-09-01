## PART I - IF AN ISSUE IS MENTIONED

0c. use GitHub CLI to fetch the selected item into thoughts with the issue number - ./thoughts/shared/issues/issue-xxxx.md
0d. read the issue and all comments to understand the implementation plan and any concerns

## PART I - IF NO TICKET IS MENTIOND

0.  read .claude/commands/github-issues.md
0a. fetch the top 10 priority items from GitHub Issues with label "status: ready-for-dev" using gh CLI, noting all items
0b. select the highest priority small issue from the list (if no small issues exist, EXIT IMMEDIATELY and inform the user)
0c. use GitHub CLI to fetch the selected item into thoughts with the issue number - ./thoughts/shared/issues/issue-xxxx.md
0d. read the issue and all comments to understand the implementation plan and any concerns

## PART II - NEXT STEPS

think deeply

1. move the item to "in dev" by updating GitHub issue labels
1a. identify the linked implementation plan document from the `links` section
1b. if no plan exists, move the issue back to "spec needed" and EXIT with an explanation

think deeply about the implementation

2. set up worktree for implementation:
2a. read `hack/create_worktree.sh` and create a new worktree with the GitHub issue branch name: `./hack/create_worktree.sh issue-XXXX BRANCH_NAME`
2b. launch implementation session: `npx humanlayer launch --model opus -w ~/wt/humanlayer/issue-XXXX "/implement_plan and when you are done implementing and all tests pass, read ./claude/commands/commit.md and create a commit, then read ./claude/commands/describe_pr.md and create a PR, then add a comment to the GitHub issue with the PR link"`

think deeply, use TodoWrite to track your tasks. When fetching from GitHub Issues, get the top 10 items by priority but only work on ONE item - specifically the highest priority small-sized issue.
