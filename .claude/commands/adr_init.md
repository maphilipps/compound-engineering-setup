# ADR Init - Initialize Architectural Decision Records System

Initialize the complete ADR (Architectural Decision Records) and Learning Management system in the current project.

## Usage
```
/adr_init
```

## Process

When invoked, this command performs comprehensive system initialization:

1. **Validate Environment**:
   - Check if we're in a Git repository (warn if not, but continue)
   - Verify we have write permissions in the current directory
   - Check if ADR system already exists (offer to skip or recreate)

2. **Create ADR Directory Structure**:
   - Create `.adrs/` directory if it doesn't exist
   - Copy `template.md` for new ADR creation
   - Create comprehensive `README.md` with usage instructions
   - Generate example ADR (`adr-001-example.md`) documenting the ADR system itself

3. **Initialize Learning System**:
   - Create `thoughts/shared/learnings/` directory structure
   - Set up category directories: `by-category/{architecture,code-quality,performance,security,process,tooling}/`
   - Create `failure-analyses/` directory for systematic failure learning
   - Set up `indexes/` directory with initial index files
   - Create learning management `README.md`

4. **Create Index Files**:
   - Generate `indexes/by-topic.md` for topic-based learning navigation
   - Create `indexes/by-impact.md` for impact-level categorization
   - Initialize `indexes/by-adr.md` for ADR cross-referencing
   - Set up proper markdown templates in each index

5. **Verify Hook Configuration**:
   - Check if `.claude/settings.json` has PostToolUse hook configured
   - Verify `hack/extract_learning_hook.sh` exists and is executable
   - Test basic hook functionality (if possible without triggering actual hooks)
   - Display hook status and configuration guidance

6. **Generate Initial Documentation**:
   - Create comprehensive getting-started guide
   - Document available slash commands (`/adr_new`, `/adr_list`, etc.)
   - Provide workflow examples for common scenarios
   - Include troubleshooting section

## Directory Structure Created

```
.
├── .adrs/
│   ├── README.md           # ADR system documentation
│   ├── template.md         # Template for new ADRs
│   └── adr-001-example.md  # Example ADR documenting the system
├── thoughts/shared/learnings/
│   ├── README.md           # Learning system overview
│   ├── by-category/
│   │   ├── architecture/   # Architectural insights
│   │   ├── code-quality/   # Code quality learnings
│   │   ├── performance/    # Performance optimization insights
│   │   ├── security/       # Security-related learnings
│   │   ├── process/        # Development process improvements
│   │   └── tooling/        # Tool usage and configuration learnings
│   ├── failure-analyses/   # Systematic failure analysis documents
│   ├── indexes/
│   │   ├── by-topic.md     # Topic-based learning index
│   │   ├── by-impact.md    # Impact-level categorization
│   │   └── by-adr.md       # ADR cross-reference index
│   └── tool-usage-log.txt  # Automated tool usage tracking (created by hook)
└── .claude/settings.json   # Hook configuration (verified/created)
```

## Output Format

```
🚀 Initializing AI Development Standards Enhancement System...

✅ Environment Check
   • Git repository: ✅ Found (.git directory exists)  
   • Write permissions: ✅ Confirmed
   • Existing system: ❌ None found, proceeding with full initialization

✅ ADR System Setup  
   • Created .adrs/ directory structure
   • Generated template.md and README.md
   • Created adr-001-example.md documenting the system

✅ Learning System Setup
   • Created thoughts/shared/learnings/ structure
   • Initialized 6 category directories
   • Set up indexes and cross-reference system

✅ Hook Configuration
   • PostToolUse hook: ✅ Already configured in .claude/settings.json
   • Hook script: ✅ Found at hack/extract_learning_hook.sh
   • Permissions: ✅ Script is executable

📋 Next Steps:
   1. Create your first ADR: /adr_new "Your Decision Title"
   2. List all commands: /adr_list
   3. Capture learnings: /capture_learning "Your insight"
   4. Review system: /adr_show 001

🎯 System ready! Your development decisions will now be systematically captured and organized.
```

## Error Handling

- **Permission Issues**: Provide clear guidance on fixing directory permissions
- **Existing System**: Offer options to skip, merge, or completely recreate
- **Git Repository**: Warn but continue if not in Git repo, explain benefits of version control
- **Hook Configuration**: Detailed troubleshooting if hook setup fails

## Integration Notes

- Designed to be idempotent (safe to run multiple times)
- Preserves existing ADRs and learnings if they exist
- Compatible with existing Git workflows
- Sets up foundation for all other ADR and learning commands

This command transforms a regular project into a systematic knowledge capture and architectural decision management system.