# Memory Operations Guide

## The Four Operations

Based on the AI Memory System pattern, there are four core operations:

### 1. INGEST - Process new sources
When you add new material to `Sources/`:
- AI reads articles, notes, highlights from `Sources/`
- Extracts entities: people, projects, concepts, decisions
- Updates corresponding wiki pages in `Wiki/`
- Adds cross-references and relationships
- Never modifies source files (they remain immutable)

### 2. QUERY - Ask questions
When you ask the AI a question:
- AI searches `Wiki/` for relevant information
- Uses cross-references, tags, and semantic understanding
- Returns answers grounded in the knowledge base
- May suggest new connections or gaps to explore

### 3. LINT - Health check
Periodic maintenance operations:
- Find orphaned pages (no incoming links)
- Detect stale claims (outdated information)
- Identify contradictory statements
- Check for missing cross-references
- Update glossary with new terminology
- Reorganize categories as needed

### 4. LOG - Structured record
Every interaction gets logged:
- Timestamp, operation type, parameters
- What was read from `Sources/`
- What was written to `Wiki/`
- Summary of changes made
- Enables replay and audit of AI's learning process

## File Naming Conventions

Use clear, descriptive names:
- People: `First Last.md` (e.g., `ApaT.md`)
- Projects: `Project Name.md` (e.g., `AI Memory Vault.md`)
- Decisions: `YYYY-MM-DD - Decision Title.md`
- Insights: `YYYY-MM-DD - Insight Topic.md`
- Glossary: `Term Definition.md`

## Frontmatter Standards

Include in every wiki page:
```yaml
---
type: person | project | decision | insight | concept | glossary
status: active | deprecated | superseded
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: [relevant, tags]
related: [[Related Note]]
---
```