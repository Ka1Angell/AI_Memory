# AI Memory System

## Three-Layer Architecture

This system uses the proven three-layer pattern for AI memory:

```
Sources/     ← Layer 1: Raw inputs (immutable)
Wiki/        ← Layer 2: AI-maintained knowledge
Schema/      ← Layer 3: Rules and identity
```

### Layer 1: Sources (sources/)
**Who owns it:** You (the human)  
**What:** Raw inputs - articles, notes, assets, book highlights, clips  
**Rules:** 
- You add them
- AI reads but never modifies
- Never delete or modify (append-only inbox approach)

### Layer 2: Wiki (wiki/)
**Who owns it:** The AI (you direct and read)  
**What:** Structured, cross-linked knowledge base that the AI builds and maintains  
**Components:**
- `people/` - biographical notes
- `projects/` - project documentation  
- `decisions/` - important decisions with rationale
- `insights/` - valuable conclusions and learnings
- `glossary/` - terminology and definitions
**Operations:**
- **Ingest:** Process new sources → extract entities → update wiki
- **Query:** Ask questions → get answers from wiki
- **Lint:** Health check - find contradictions, stale claims, gaps
- **Log:** Structured chronological record of all operations

### Layer 3: Schema (schema/)
**Who owns it:** You and the AI co-evolve  
**What:** Identity, interaction rules, loading instructions  
**Files:**
- `README.md` - this document (system overview)
- `memory-operations.md` - detailed guide to the four operations
- `loading-instructions.md` - tells AI what to load first
- `persona.md` - your identity and preferences
- `working-context.md` - current state and active topics

## Core Principle

**Human-readable memory first:** Your vault is your second brain *first*, and the AI's memory *second*. You browse it, link it, search it, think with it. A vector store is opaque to you - this is transparent and editable.

**Compounding knowledge:** The AI doesn't just store raw data - it builds a structured wiki that gets richer with every session. Each source is processed once, insights are filed back, and the knowledge compounds over time.

## Workflow

1. **You** add raw material to `Sources/`
2. **AI** reads from `Sources/` during ingest operations
3. **AI** processes and extracts structured knowledge
4. **AI** writes to `Wiki/` (people/, projects/, decisions/, etc.)
5. **You** review and direct the AI's work
6. **Repeat** - knowledge accumulates and becomes more valuable over time