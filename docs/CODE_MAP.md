# RedBurrito Code Map

**Purpose:** Quick reference for AI to understand codebase without reading all files.
**Total:** 17 .reds files, ~6200 lines of code.

---

## File Overview

| File | Lines | Purpose | Read Priority |
|------|-------|---------|---------------|
| `RedBurrito.reds` | 51 | Core item injection template | HIGH - read for patterns |
| `InsaneCamo.reds` | 68 | Optical camo boost (hold-to-activate) | HIGH - controller pattern |
| `InsaneCyberdeck.reds` | 137 | Cyberdeck boost + trace interrupt | HIGH - controller pattern |
| `InsaneSandevistan.reds` | 57 | Sandevistan boost (toggle) | MEDIUM - toggle pattern |
| **RedBurritoCheats/** | | | |
| `RedBurritoMovement.reds` | 430 | Infinite jump, dash, no fall damage | LOW - complex replaceMethod |
| `RedBurritoSurvival.reds` | 184 | God mode, invisibility, police | MEDIUM - stat modifiers |
| `RedBurritoMoney.reds` | 34 | Money injection | LOW - simple |
| `RedBurritoVehicles.reds` | 121 | Vehicle unlock (list only) | SKIP - just TweakDBIDs |
| `RedBurritoWeaponCheats.reds` | 398 | Weapon stat modifiers | MEDIUM - many stats |
| `RedBurritoProgress.reds` | 181 | Level up + items | LOW - template |
| `RedBurritoRemoveCDs.reds` | 131 | Remove cooldowns | MEDIUM - cyberware stats |
| **RedBurritoItems/** | | | |
| `RedBurritoWeapons.reds` | 1399 | Weapon TweakDBIDs | SKIP - list only |
| `RedBurritoClothes.reds` | 1850 | Clothing TweakDBIDs | SKIP - list only |
| `RedBurritoCrafting.reds` | 959 | Crafting items TweakDBIDs | SKIP - list only |
| `RedBurritoMods.reds` | 309 | Weapon mod TweakDBIDs | SKIP - list only |
| `RedBurritoCW.reds` | 1430 | Cyberware TweakDBIDs | SKIP - list only |
| `RedBurritoStuff.reds` | 209 | Materials, boosters | LOW - template |

---

## Architecture Patterns

### Pattern 1: Vending Machine Trigger (most common)
Used by: ALL cheats and item scripts
```swift
@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
    wrappedMethod(request);
    this.GiveMeRedBurritoXXX();  // Call custom function
}

@addMethod(VendingMachine)
protected func GiveMeRedBurritoXXX() -> Void {
    let player = this.GetGame().GetPlayerSystem().GetLocalPlayerMainGameObject() as PlayerPuppet;
    // ... do stuff
}
```

### Pattern 2: Hold-to-Activate Controller
Used by: InsaneCamo.reds, InsaneCyberdeck.reds
```swift
public class XXXController {
    private let player: wref<PlayerPuppet>;
    private let isActive: Bool;

    public func Setup(player: wref<PlayerPuppet>) -> Void {
        this.player = player;
        this.player.RegisterInputListener(this, n"ActionName_Hold");
    }

    protected cb func OnAction(action: ListenerAction, consumer: ListenerActionConsumer) -> Bool {
        if Equals(ListenerAction.GetName(action), n"ActionName_Hold") &&
           Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
            this.ActivateBoost();
        }
    }
}

@addField(PlayerPuppet)
private let xxxController: ref<XXXController>;

@wrapMethod(PlayerPuppet)
protected cb func OnGameAttached() -> Bool {
    wrappedMethod();
    if !IsDefined(this.xxxController) {
        this.xxxController = new XXXController();
        this.xxxController.Setup(this);
    }
}
```

### Pattern 3: Toggle with Flag Stat
Used by: InsaneSandevistan.reds
```swift
// Use unused stat as flag
let flagValue = statsSystem.GetStatValue(ownerID, gamedataStatType.IsItemCrafted);

if flagValue >= 1.0 {
    // DISABLE - remove modifiers
    statsSystem.RemoveAllModifiers(ownerID, gamedataStatType.XXX, true);
    statsSystem.RemoveAllModifiers(ownerID, gamedataStatType.IsItemCrafted, true);
} else {
    // ENABLE - add modifiers
    statsSystem.AddSavedModifier(ownerID, flagMod);
    statsSystem.AddSavedModifier(ownerID, boostMod);
}
```

### Pattern 4: Item Injection
Used by: All RedBurritoItems/*.reds
```swift
let TS = GameInstance.GetTransactionSystem(this.GetGame());
let player = this.GetGame().GetPlayerSystem().GetLocalPlayerMainGameObject();

let items: array<TweakDBID>;
let counts: array<Int32>;

ArrayPush(items, t"Items.XXX"); ArrayPush(counts, 1);
// ... more items

let i = 0;
while i < ArraySize(items) {
    let id: ItemID = ItemID.FromTDBID(items[i]);
    if TDBID.IsValid(ItemID.GetTDBID(id)) {
        TS.GiveItem(player, id, counts[i]);
    };
    i += 1;
};
```

### Pattern 5: Replace Locomotion Method
Used by: RedBurritoMovement.reds (complex!)
```swift
@replaceMethod(ClassName)
protected func MethodName(...) -> ReturnType {
    // Complete replacement - original NOT called
    // Copy original logic + add modifications
}
```

---

## Modified Classes

| Class | Modifications | Files |
|-------|--------------|-------|
| `VendingMachine` | @wrapMethod DispenseItems, @addMethod GiveMeXXX | ALL |
| `PlayerPuppet` | @addField, @wrapMethod OnGameAttached | InsaneCamo, InsaneCyberdeck |
| `DoubleJumpEvents` | @replaceMethod OnEnter | RedBurritoMovement |
| `DoubleJumpDecisions` | @replaceMethod EnterCondition | RedBurritoMovement |
| `DodgeEvents` | @replaceMethod OnEnter | RedBurritoMovement |
| `LocomotionTransition` | @replaceMethod WantsToDodge | RedBurritoMovement |
| `LocomotionAirEvents` | @replaceMethod OnUpdate | RedBurritoMovement |
| `BaseScriptableAction` | @wrapMethod GetActivationTime | InsaneCyberdeck |

---

## Feature Summary

### Cheats (Vending Machine activated, persistent)
- **God Mode** - Health, armor, resistances, regen
- **Invisibility** - Cloaked status effect
- **Infinite Stamina/Oxygen** - CanIgnoreStamina, CanBreatheUnderwater
- **No Fall Damage** - Quest fact flag + LocomotionAirEvents replace
- **Infinite Double Jump** - Reset jump counter in DoubleJumpEvents
- **Infinite Air Dash** - Remove cooldown check in WantsToDodge
- **Fast Reload** - ReloadTimeBase multiplier
- **Ultra Crit** - CritChance + CritDamage
- **Remove Cooldowns** - Sandevistan, Berserk, Camo, etc.
- **Disable Police** - PreventionSystem toggle
- **Max Speed** - MaxSpeed multiplier
- **Carry Capacity** - CarryCapacity additive

### Boost Controllers (Hold-to-activate, session only)
- **Optical Camo Boost** - Duration x20, Recharge x100
- **Cyberdeck Boost** - RAM cost reduction, regen, upload time
- **Trace Interrupt** - Apply malfunction to netrunners

### Item Injection
- Weapons, Clothes, Cyberware, Mods, Crafting materials
- Level up all skills
- Money, vehicles unlock

---

## When to Read Specific Files

**Adding new cheat (stat modifier):**
→ Read: RedBurritoSurvival.reds (ApplyGodMode pattern)

**Adding new hold-to-activate feature:**
→ Read: InsaneCamo.reds (controller pattern)

**Adding new items to inject:**
→ Read: RedBurritoStuff.reds (item injection template)

**Modifying locomotion (jump, dash, fall):**
→ Read: RedBurritoMovement.reds (WARNING: complex, 430 lines)

**Adding new toggle feature:**
→ Read: InsaneSandevistan.reds (flag stat pattern)

**Adding new cyberware boost:**
→ Read: RedBurritoRemoveCDs.reds (cyberware stats)

---

## Files in Other/ (Reference Only)

| File | Description |
|------|-------------|
| `0_InfiniteDoubleJump.reds` | Original infinite jump mod |
| `BetterDash.reds` | Original infinite dash mod |
| `disableFallDamageAndFallOnScreenEffects.reds` | Original no fall damage |
| `ResetAttributesAlwaysAvailable.reds` | Reset attributes mod |
| `Shadowfax_*.reds` | Other reference mods |

These are NOT part of RedBurrito - used as reference only.
