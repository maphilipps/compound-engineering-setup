#!/bin/bash

# Compounding Engineering Initialization Script
# Based on learnings from https://every.to/source-code/my-ai-had-already-fixed-the-code-before-i-saw-it

set -e

TECHSTACK=${1:-"detect"}
PROJECT_ROOT=$(pwd)

echo "🚀 Initializing Compounding Engineering Setup..."

# Detect techstack if not provided
detect_techstack() {
    if [[ -f "Gemfile" && -f "config/application.rb" ]]; then
        echo "rails"
    elif [[ -f "package.json" ]] && grep -q "next" package.json; then
        echo "nextjs"
    elif [[ -f "requirements.txt" || -f "pyproject.toml" ]]; then
        echo "python"
    elif [[ -f "package.json" ]]; then
        echo "nodejs"
    else
        echo "unknown"
    fi
}

if [[ "$TECHSTACK" == "detect" ]]; then
    TECHSTACK=$(detect_techstack)
    echo "📋 Detected techstack: $TECHSTACK"
fi

# Generate llms.txt
generate_llms_txt() {
    echo "📝 Generating llms.txt..."
    
    cat > llms.txt << EOF
# Project Context for AI Development

## Technology Stack
Primary: $TECHSTACK
$(if [[ "$TECHSTACK" == "rails" ]]; then
    echo "Framework: Ruby on Rails"
    echo "Database: $(grep -o 'adapter: [^"]*' config/database.yml 2>/dev/null | head -1 | cut -d' ' -f2 || echo 'sqlite3')"
    echo "CSS: $(grep -o 'gem.*tailwind\|gem.*bootstrap\|gem.*sass' Gemfile 2>/dev/null || echo 'standard')"
    echo "Authentication: $(grep -o 'gem.*devise\|gem.*omniauth' Gemfile 2>/dev/null || echo 'custom')"
fi)

## Architecture Patterns
- Follows Rails conventions and best practices
- Test-driven development with automated feedback loops
- Continuous learning from code reviews and failures
- AI-assisted development with human oversight

## Development Workflow
1. AI agents handle routine tasks (testing, review, implementation)
2. Human oversight ensures quality and architectural coherence  
3. Every failure becomes a learning opportunity captured in rules
4. Code reviews feed back into AI knowledge for future improvements

## Key Principles
- Compounding Engineering: Systems that improve systems
- Fail Fast, Learn Faster: Convert every error into permanent improvement
- Context Over Configuration: Maintain lean, project-specific AI guidance
- Trust but Verify: AI autonomy with human validation checkpoints

## Current Focus Areas
- Implementing robust testing patterns
- Establishing clear architectural boundaries
- Creating feedback loops for continuous improvement
- Maintaining code quality through automated reviews

Generated: $(date)
Last Updated: $(date)
EOF

    echo "✅ Created llms.txt"
}

# Configure Rails agents for specific setup
configure_rails_agents() {
    echo "🔧 Configuring Rails agents for $TECHSTACK..."
    
    if [[ "$TECHSTACK" == "rails" ]]; then
        # Update rails agents with detected configuration
        local db_adapter=$(grep -o 'adapter: [^"]*' config/database.yml 2>/dev/null | head -1 | cut -d' ' -f2 || echo 'sqlite3')
        local css_framework="tailwind"
        
        if grep -q "gem.*bootstrap" Gemfile 2>/dev/null; then
            css_framework="bootstrap"
        fi
        
        # Update rails-project-initializer
        sed -i.bak "s/--database=sqlite3/--database=$db_adapter/g" .claude/agents/rails-project-initializer.md 2>/dev/null || true
        sed -i.bak "s/Tailwind CSS/$css_framework/g" .claude/agents/rails-project-initializer.md 2>/dev/null || true
        
        echo "📋 Configured Rails agents for:"
        echo "   Database: $db_adapter"
        echo "   CSS: $css_framework"
    fi
}

# Update CLAUDE.md with compounding engineering practices
update_claude_md() {
    echo "📚 Updating CLAUDE.md with compounding engineering practices..."
    
    cat >> CLAUDE.md << 'EOF'

## Compounding Engineering Practices

### Learning Loop Integration
- Every code review becomes a permanent lesson captured in project context
- Failed tests generate new rules to prevent similar issues
- AI agents learn from each interaction and apply lessons automatically
- Documentation evolves continuously based on development patterns

### Automated Improvement Workflow
1. **Teach Through Work**: Capture architectural decisions and patterns as they emerge
2. **Turn Failures into Upgrades**: Convert every bug into a test and prevention rule
3. **Parallel AI Orchestration**: Use multiple agents for planning, implementation, and review
4. **Lean Context**: Maintain focused, project-specific AI guidance
5. **Trust but Verify**: Enable AI autonomy with validation checkpoints

### Development Acceleration Principles
- Systems create systems that get faster, safer, and better with each iteration
- Each improvement compounds exponentially with previous improvements
- Focus on designing systems that design systems
- Maintain permanent institutional knowledge that survives team changes

### Quality Assurance Evolution
- Tests become smarter over time by learning from failures  
- Code reviews feed patterns back into development standards
- Performance monitoring automatically improves based on regression patterns
- Security practices evolve based on discovered vulnerabilities

Updated: $(date) - Compounding Engineering Integration
EOF

    echo "✅ Updated CLAUDE.md with compounding practices"
}

# Create learning hooks
create_learning_hooks() {
    echo "🎣 Creating learning hooks..."
    
    mkdir -p .claude/hooks
    
    cat > .claude/hooks/post-merge.sh << 'EOF'
#!/bin/bash
# Post-merge learning hook
echo "🧠 Capturing merge learnings..."
# Analyze changes and update patterns
git log --oneline -1 >> .claude/learning/merge-patterns.log
EOF

    cat > .claude/hooks/test-failure.sh << 'EOF'
#!/bin/bash
# Test failure learning hook  
echo "📚 Learning from test failure..."
# Convert failures into permanent improvements
mkdir -p .claude/learning
echo "$(date): $1" >> .claude/learning/test-failures.log
EOF

    chmod +x .claude/hooks/*.sh
    echo "✅ Created learning hooks"
}

# Main execution
main() {
    generate_llms_txt
    configure_rails_agents
    update_claude_md
    create_learning_hooks
    
    echo ""
    echo "🎉 Compounding Engineering setup complete!"
    echo "📁 Files created/updated:"
    echo "   - llms.txt (AI context)"
    echo "   - CLAUDE.md (enhanced with compounding practices)"
    echo "   - .claude/agents/* (configured for $TECHSTACK)"
    echo "   - .claude/hooks/* (learning automation)"
    echo ""
    echo "🚀 Your development workflow is now set up for exponential improvement!"
    echo "📖 Read more: https://every.to/source-code/my-ai-had-already-fixed-the-code-before-i-saw-it"
}

main "$@"