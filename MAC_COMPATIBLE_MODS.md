# Mac Compatible Redscript Mods for Cyberpunk 2077

A curated list of mods that work on macOS with pure Redscript (no CET/RED4ext required).

---

## Requirements for Mac Compatibility
- **Redscript only** - No CET, TweakXL, RED4ext, ArchiveXL
- **No .dll files** - Mac cannot load Windows DLLs
- **.reds files only** - Pure script mods

---

## RedBurrito Collection (by MessaXS)

| Mod | Description | Link |
|-----|-------------|------|
| RedBurrito | Main mod - item injection via vending machines | [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/26375) |
| Insane Optical Camo | x20 camo duration boost | [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/26637) |
| Insane Sandevistan | Enhanced time dilation | [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/26689) |
| Insane Cyberdeck | Boosted hacking abilities | [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/26690) |

---

## Movement & Traversal

| Mod | Description | Link |
|-----|-------------|------|
| Better Dash - Air Dash | Infinite air dash | [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/15911) |
| Infinite Double Jump | Unlimited double jumps | [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/15054) |
| Disable Fall Damage | No fall damage + screen effects | [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/16008) |

---

## Verified Working (TODO: Add more)

<!--
Add mods here as you verify them working on Mac.
Format:
| Mod Name | What it does | [Nexus](link) |
-->

---

## How to Verify Mac Compatibility

1. Check mod page for dependencies:
   - If requires CET/RED4ext/TweakXL → **NOT compatible**
   - If "Redscript only" or no dependencies → **Likely compatible**

2. Check file contents:
   - Only `.reds` files → **Compatible**
   - Contains `.dll` files → **NOT compatible**
   - Contains `.archive` files → **Needs testing**

3. Install and test:
   - Check `r6/logs/redscript.log` for errors
   - If game launches and mod works → **Confirmed compatible**

---

## Contributing

Found a Mac-compatible mod? Add it to this list!

1. Verify it works on Mac
2. Add to appropriate category
3. Include Nexus link
