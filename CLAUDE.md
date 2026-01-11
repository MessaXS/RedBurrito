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

### Search Priority (ALWAYS follow this order!)
1. **Check project cheatsheets first** (`docs/`) - instant, no tokens
2. **Search with Grep** - targeted search, low tokens
3. **Use Explore subagent** - for complex searches across multiple dirs
4. **Read specific files** - only after locating them

### DO NOT
- Read entire API files when searching for one thing
- Re-read the same reference files repeatedly
- Search without checking cheatsheets first

### Subagent Strategy
When searching for something in the reference materials:
- Use `Task` tool with `subagent_type=Explore` for broad searches
- Always specify: "search in ~/Developer/cyberpunk/ for [topic]"
- Request only file paths first, then read specific files

### Example Search Workflow
```
User: "How do I modify vehicle speed?"

1. Check docs/STATS_REFERENCE.md → Not there
2. Grep: grep -r "vehicle.*speed" ~/Developer/cyberpunk/
3. If many results → use Explore subagent
4. Read only the relevant file(s) found
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
