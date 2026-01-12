# RedBurrito - Project Rules for Claude Code

## Language
- Communication with user: Russian
- All code, comments, variable names: English only

## Technology Stack
**CRITICAL: Use ONLY Redscript**
- NO CET (Cyber Engine Tweaks)
- NO TweakXL
- NO Codeware
- NO RED4ext
- NO ArchiveXL
- NO any other frameworks or dependencies

This mod must work with pure Redscript only.

## Project Structure
```
~/Developer/RedBurrito/           <- Main project (Git repo)
└── scripts/                      <- Symlinked to game
    ├── RedBurrito.reds           <- Core: item injection via vending machines
    ├── InsaneCamo.reds           <- Optical camo boost (hold to activate)
    ├── InsaneSandevistan.reds    <- Sandevistan boost
    ├── InsaneCyberdeck.reds      <- Cyberdeck boost
    ├── RedBurritoCheats/         <- Permanent cheats (activated via vending)
    │   ├── RedBurritoMovement.reds   <- Infinite jump, dash, no fall damage
    │   ├── RedBurritoMoney.reds      <- Money cheats
    │   ├── RedBurritoSurvival.reds   <- God mode, stamina, oxygen
    │   ├── RedBurritoVehicles.reds   <- Vehicle cheats
    │   ├── RedBurritoWeaponCheats.reds
    │   ├── RedBurritoProgress.reds
    │   └── RedBurritoRemoveCDs.reds
    └── RedBurritoItems/          <- Item injection scripts
        ├── RedBurritoWeapons.reds
        ├── RedBurritoClothes.reds
        ├── RedBurritoCrafting.reds
        ├── RedBurritoMods.reds
        ├── RedBurritoCW.reds
        └── RedBurritoStuff.reds
```

**Game symlink location:**
`~/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/r6/scripts/RedBurrito`

## Code Style

### File Header Format
```swift
// Module Name Ver.X.X – DD Mon YYYY @MessaXS
// Brief description
module ModuleName
```

### Naming Conventions
- Modules: PascalCase (`OpticalCamoBoost`, `EnhancedMachines.VendingMachine.RedBurrito`)
- Classes: PascalCase (`OpticalCamoBoostController`)
- Functions: PascalCase (`ActivateBoost`, `GiveMeRedBurrito`)
- Variables: camelCase (`statsSystem`, `ownerID`, `isActive`)
- Constants/Flags: camelCase with descriptive names

### Section Comments
```swift
// =============================================
// SECTION NAME
// =============================================
```

### Common Patterns Used
1. **Vending machine trigger** - Most cheats activate when player uses vending machine:
```swift
@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
    wrappedMethod(request);
    this.CustomFunction();
}
```

2. **Input listener pattern** - For hold-to-activate features:
```swift
this.player.RegisterInputListener(this, n"ActionName_Hold");
```

3. **Stat modifiers** - For player buffs:
```swift
let statsSystem = GameInstance.GetStatsSystem(this.gameInstance);
let ownerID: StatsObjectID = Cast<StatsObjectID>(player.GetEntityID());
statsSystem.AddModifier(ownerID, RPGManager.CreateStatModifier(...));
```

4. **Quest facts as flags**:
```swift
questSystem.GetFact(n"redburrito_flag_name") > 0
questSystem.SetFact(n"redburrito_flag_name", 1)
```

5. **Player messages**:
```swift
player.SetWarningMessage("Message\nSecond Line");
```

## Reference Locations

### Project Cheatsheets (CHECK FIRST!)
`~/Developer/RedBurrito/docs/`
- `STATS_REFERENCE.md` - All gamedataStatType with descriptions
- `INPUT_AND_CNAMES.md` - Input actions, CNames, quest facts
- `REFERENCE_INDEX.md` - Master index of all references

### Game API (adamsmasher/cyberpunk)
`~/Developer/cyberpunk/`
- `cyberpunk/` - Game classes by category:
  - `player/` - PlayerPuppet, player systems
  - `damage/` - Damage calculations
  - `items/` - Item handling
  - `devices/` - VendingMachine, etc.
  - `UI/` - User interface
- `core/` - Core Swift types
- `samples/` - Example code

### Redscript Documentation
`~/Developer/Redscript-Wiki/`
- `language/` - Syntax, annotations (@wrapMethod, etc.)
- `getting-started/` - Setup tutorials
- `references-and-examples/` - Code examples

### General Modding Guides
`~/Developer/Cyberpunk-Modding-Docs/`
- `for-mod-creators-theory/` - Concepts
- `modding-guides/` - How-to guides

### Other Mods for Reference (NOT in repo)
`~/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/r6/scripts/Other/`
- BetterDash.reds
- InfiniteDoubleJump.reds
- disableFallDamageAndFallOnScreenEffects.reds

---

## Token Economy Strategy

### CRITICAL: Read Order for New Sessions
1. **ALWAYS read `docs/CODE_MAP.md` first** - full codebase overview (~200 lines)
2. **Check `docs/` cheatsheets** for specific info (stats, syntax, systems)
3. **Read specific .reds file** only when modifying it
4. **NEVER read RedBurritoItems/*.reds** - they're just TweakDBID lists

### File Read Priority
| Priority | Files | When to Read |
|----------|-------|--------------|
| ALWAYS | `docs/CODE_MAP.md` | Start of every session |
| AS NEEDED | `docs/STATS_REFERENCE.md` | When adding stat modifiers |
| AS NEEDED | `docs/REDSCRIPT_SYNTAX.md` | When unsure about syntax |
| AS NEEDED | `docs/GAME_SYSTEMS.md` | When using GameInstance |
| ONLY IF EDITING | `scripts/*.reds` | When modifying that file |
| NEVER | `scripts/RedBurritoItems/*.reds` | Just TweakDBID lists |

### DO NOT
- Read RedBurritoItems files (1000+ lines of just item IDs)
- Re-read files already in context
- Read entire API directories
- Search without checking docs/ first

### Subagent Strategy (for API searches)
```
Task: "Find how to modify [X]"
→ Use Explore subagent with model=haiku
→ Search in ~/Developer/cyberpunk/
→ Return only file paths, not content
```

### Example: Adding New Feature (Minimal Tokens)
```
1. Read docs/CODE_MAP.md → understand architecture
2. Check "When to Read Specific Files" section
3. Read ONE template file (e.g., InsaneCamo.reds for controller)
4. Write new code using documented patterns
5. DON'T read files you're not modifying
```

### Example: Adding New Items
```
1. DON'T read existing Items files
2. Copy pattern from CODE_MAP.md (Pattern 4)
3. Add TweakDBIDs to appropriate file
4. Items can be found at: https://www.nexusmods.com/cyberpunk2077/mods/521
```

---

## Adding New References

When downloading new reference materials:
1. Clone to `~/Developer/`
2. Add to `docs/REFERENCE_INDEX.md`
3. If frequently used → create cheatsheet in `docs/`
4. Update this section of CLAUDE.md

## Important Notes
- This mod targets **Mac version** of Cyberpunk 2077
- All features are **modular** - each script works independently
- Cheats triggered via vending machines are **permanent** per save
- Hold-to-activate features (Camo, Sandevistan) need input bindings

## When Writing New Code
1. Follow existing patterns from the codebase
2. Check `~/Developer/cyberpunk/` for API reference
3. Check `r6/scripts/Other/` for working examples
4. Use descriptive module names with `RedBurrito` prefix for new features
5. Add proper credits if code is based on other mods
