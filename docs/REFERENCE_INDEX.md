# Reference Index for Cyberpunk 2077 Redscript Modding

Master index of all reference materials. Use this to quickly find where to look.

---

## Quick Links by Topic

### Starting a new session? READ FIRST!
→ `~/Developer/RedBurrito/docs/CODE_MAP.md` - **ALWAYS read this first!**

### New to the project? Read the workflow guide!
→ `~/Developer/RedBurrito/docs/WORKFLOW.md` - Step-by-step guide for humans

### Want to know ALL Redscript capabilities?
→ `~/Developer/RedBurrito/docs/REDSCRIPT_CAPABILITIES.md` - Everything possible

### Need to find a Stat type?
→ `~/Developer/RedBurrito/docs/STATS_REFERENCE.md` (project-specific)
→ `~/Developer/cyberpunk/cyberpunk/` (full API)

### Need input/action names?
→ `~/Developer/RedBurrito/docs/INPUT_AND_CNAMES.md`

### Need Redscript syntax (@wrapMethod, types, etc.)?
→ `~/Developer/RedBurrito/docs/REDSCRIPT_SYNTAX.md`

### Need GameInstance systems?
→ `~/Developer/RedBurrito/docs/GAME_SYSTEMS.md`

### Need to understand a game class?
→ `~/Developer/cyberpunk/cyberpunk/` - organized by category:
  - `player/` - PlayerPuppet, player systems
  - `damage/` - Damage system
  - `items/` - Item handling
  - `ai/` - AI behavior
  - `UI/` - User interface
  - `devices/` - World devices (vending machines, etc.)

### Need Redscript syntax help?
→ `~/Developer/Redscript-Wiki/`
  - `language/` - Syntax, types, annotations
  - `getting-started/` - Setup guides
  - `references-and-examples/` - Code examples

### Need modding guides?
→ `~/Developer/Cyberpunk-Modding-Docs/` (4.6GB, 554 md files!)
  - `for-mod-creators-theory/` - Concepts and theory
  - `modding-guides/` - Practical how-to guides
  - `for-mod-creators-theory/references-lists-and-overviews/` - CHEAT SHEETS!

### Need ALL BaseStats types? (1494 types!)
→ `~/Developer/Cyberpunk-Modding-Docs/for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-tweak-ids/cheat-sheet-base-stats.md`

### Need scripting best practices?
→ `~/Developer/Cyberpunk-Modding-Docs/for-mod-creators-theory/references-lists-and-overviews/scripting/scripting-best-practices-pitfalls.md`

### Need item IDs?
→ External: https://www.nexusmods.com/cyberpunk2077/mods/521
→ Search in `~/Developer/cyberpunk/` for specific items

### Need working mod examples?
→ `~/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/r6/scripts/Other/`
→ `~/Developer/RedBurrito/scripts/` - Your own code

---

## Directory Structure

```
~/Developer/
├── RedBurrito/                    # YOUR PROJECT
│   ├── scripts/                   # Mod source code
│   ├── docs/                      # Cheatsheets
│   │   ├── CODE_MAP.md            # **READ FIRST** - full codebase map
│   │   ├── WORKFLOW.md            # Guide for humans (how to use everything)
│   │   ├── REDSCRIPT_CAPABILITIES.md  # ALL Redscript capabilities
│   │   ├── STATS_REFERENCE.md     # All stat types
│   │   ├── INPUT_AND_CNAMES.md    # Input actions, CNames
│   │   ├── REDSCRIPT_SYNTAX.md    # Annotations, types, syntax
│   │   ├── GAME_SYSTEMS.md        # GameInstance systems
│   │   └── REFERENCE_INDEX.md     # This file
│   └── CLAUDE.md                  # Project rules
│
├── cyberpunk/                     # GAME API (adamsmasher)
│   ├── cyberpunk/                 # Game classes
│   │   ├── player/
│   │   ├── damage/
│   │   ├── items/
│   │   └── ...
│   ├── core/                      # Core types
│   └── samples/                   # Examples
│
├── Redscript-Wiki/                # REDSCRIPT DOCS
│   ├── language/                  # Syntax reference
│   ├── getting-started/           # Tutorials
│   └── references-and-examples/   # Examples
│
└── Cyberpunk-Modding-Docs/        # MODDING GUIDES (4.6GB!)
    ├── for-mod-creators-theory/
    │   └── references-lists-and-overviews/
    │       ├── cheat-sheet-tweak-ids/
    │       │   ├── cheat-sheet-base-stats.md  # 1494 BaseStats!
    │       │   └── weapons/
    │       └── scripting/
    └── modding-guides/
```

---

## Search Commands

### Find a class definition
```bash
grep -r "class ClassName" ~/Developer/cyberpunk/
```

### Find a function
```bash
grep -r "func FunctionName" ~/Developer/cyberpunk/
```

### Find stat type usage
```bash
grep -r "gamedataStatType.StatName" ~/Developer/cyberpunk/
```

### Find all files mentioning something
```bash
grep -rl "SearchTerm" ~/Developer/cyberpunk/ | head -20
```

---

## Common Patterns Location

| Pattern | Example Location |
|---------|-----------------|
| @wrapMethod | `RedBurrito/scripts/RedBurrito.reds` |
| @addMethod | `RedBurrito/scripts/RedBurrito.reds` |
| @replaceMethod | `RedBurrito/scripts/RedBurritoCheats/RedBurritoMovement.reds` |
| @addField | `RedBurrito/scripts/InsaneCamo.reds` |
| Input listener | `RedBurrito/scripts/InsaneCamo.reds` |
| Stat modifiers | `RedBurrito/scripts/RedBurritoCheats/` |
| Quest facts | `RedBurrito/scripts/RedBurritoCheats/RedBurritoMovement.reds` |
| Item injection | `RedBurrito/scripts/RedBurrito.reds` |

---

## Updating This Index

When adding new reference materials:
1. Clone/download to `~/Developer/`
2. Add entry to this index
3. Update CLAUDE.md if needed
