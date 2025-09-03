# Parallel Development

Execute development tasks across multiple Claude instances for team-scale productivity.

## Usage

When invoked with a feature description:
`/parallel_development implement user authentication system`

## Process

1. **Task Analysis & Decomposition**:
   - Use TodoWrite to track decomposition progress
   - Analyze the overall feature requirements
   - Identify natural parallelization boundaries
   - Consider dependencies between components
   - Determine optimal agent assignment strategy

2. **Create Coordination Plan**:
   - Break feature into independent workstreams
   - Define integration points between streams
   - Establish shared interfaces and contracts
   - Set up coordination checkpoints
   - Plan merge and integration strategy

3. **Spawn Parallel Agents**:
   - Use Task tool to spawn multiple specialized agents
   - Assign each agent a focused workstream:
     - **Agent 1**: Database schema and migrations
     - **Agent 2**: API endpoints and business logic
     - **Agent 3**: Frontend components and integration
     - **Agent 4**: Tests, documentation, and deployment
   - Provide each agent with:
     - Specific workstream requirements
     - Interface contracts they must implement
     - Integration points with other agents
     - Success criteria and deliverables

4. **Coordinate Integration**:
   - Monitor agent progress using TodoWrite
   - Facilitate communication between agents about interface changes
   - Resolve integration conflicts as they arise
   - Ensure consistency across all workstreams

5. **Quality Gates & Review**:
   - Run opponent processor agent on critical components
   - Validate integration between all workstreams
   - Execute comprehensive testing across all components
   - Document architectural decisions made during development

6. **Merge & Finalization**:
   - Coordinate systematic merging of all workstreams
   - Validate end-to-end functionality
   - Update documentation with final architecture
   - Capture learnings from parallel development process

## Workstream Templates

### Database Workstream
- Schema design and migrations
- Data access layer implementation
- Database performance optimization
- Migration testing and rollback procedures

### API Workstream  
- Endpoint design and implementation
- Business logic and validation
- API documentation and testing
- Error handling and edge cases

### Frontend Workstream
- Component design and implementation
- State management and data flow
- User experience and accessibility
- Frontend testing and validation

### Infrastructure Workstream
- Deployment and configuration
- Monitoring and observability
- Security and performance testing
- Documentation and operational procedures

## Coordination Mechanisms

### Interface Contracts
Each agent must define and implement clear interfaces:
- API contracts (OpenAPI specs)
- Database schemas (migration files)
- Component interfaces (TypeScript interfaces)
- Event schemas (for async communication)

### Integration Checkpoints
Regular coordination points:
- Initial design review (interfaces and approaches)
- Mid-development sync (progress and blockers)
- Pre-integration review (testing and validation)
- Final integration and testing

### Conflict Resolution
When agents need to coordinate:
- Interface changes require coordination checkpoint
- Breaking changes must be communicated to all agents
- Architecture decisions escalate to main coordinator
- Integration issues trigger immediate resolution session

## Success Metrics

### Velocity Improvements
- Feature delivery time compared to sequential development
- Quality of final integration (bugs, rework needed)
- Developer satisfaction with parallel workflow

### Coordination Effectiveness
- Number of integration conflicts
- Time spent on coordination vs development
- Quality of inter-agent communication

## Error Handling

### Agent Failures
- If an agent fails, reassign work to backup agent
- Maintain progress tracking to resume from checkpoint
- Document failures for process improvement

### Integration Failures
- Roll back to last known good integration state
- Debug integration issues systematically
- Update coordination procedures based on learnings