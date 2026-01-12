# Game Systems Reference

Quick reference for GameInstance systems used in Cyberpunk 2077 modding.

---

## Getting GameInstance

```swift
// From PlayerPuppet
let gi: GameInstance = player.GetGame();

// From any game object with GetGame()
let gi: GameInstance = this.GetGame();

// From scriptInterface in states
let gi: GameInstance = scriptInterface.GetGameInstance();
```

---

## Core Systems

### StatsSystem
Modify player/NPC stats.

```swift
let statsSystem = GameInstance.GetStatsSystem(gameInstance);
let ownerID: StatsObjectID = Cast<StatsObjectID>(player.GetEntityID());

// Add temporary modifier
statsSystem.AddModifier(ownerID, RPGManager.CreateStatModifier(
    gamedataStatType.Health,
    gameStatModifierType.Additive,
    1000.0
));

// Add persistent modifier (survives save/load)
statsSystem.AddSavedModifier(ownerID, modifier);

// Remove all modifiers of a type
statsSystem.RemoveAllModifiers(ownerID, gamedataStatType.Health);
```

### TransactionSystem
Give/remove items from inventory.

```swift
let TS = GameInstance.GetTransactionSystem(gameInstance);
let player = gameInstance.GetPlayerSystem().GetLocalPlayerMainGameObject() as PlayerPuppet;

// Give item
let itemID: ItemID = ItemID.FromTDBID(t"Items.money");
TS.GiveItem(player, itemID, quantity);

// Remove item
TS.RemoveItem(player, itemID, quantity);

// Check if has item
let hasItem = TS.HasItem(player, itemID);

// Get item data
let itemData: wref<gameItemData> = TS.GetItemData(player, itemID);
```

### QuestsSystem
Manage quest facts (persistent flags).

```swift
let questSystem = GameInstance.GetQuestsSystem(gameInstance);

// Check flag
if questSystem.GetFact(n"redburrito_flag") > 0 { ... }

// Set flag
questSystem.SetFact(n"redburrito_flag", 1);

// Clear flag
questSystem.SetFact(n"redburrito_flag", 0);
```

### PlayerSystem
Get player reference.

```swift
let playerSystem = GameInstance.GetPlayerSystem(gameInstance);
let player = playerSystem.GetLocalPlayerMainGameObject() as PlayerPuppet;
let playerController = playerSystem.GetLocalPlayerControlledGameObject();
```

### TimeSystem
Control game time.

```swift
let timeSystem = GameInstance.GetTimeSystem(gameInstance);

// Set time dilation (slow motion)
timeSystem.SetTimeDilation(n"MySlowMo", 0.1);  // 10% speed

// Remove time dilation
timeSystem.UnsetTimeDilation(n"MySlowMo");

// Get current time
let gameTime = timeSystem.GetGameTime();
```

### StatusEffectSystem
Apply/remove status effects.

```swift
let effectSystem = GameInstance.GetStatusEffectSystem(gameInstance);

// Apply effect
effectSystem.ApplyStatusEffect(player.GetEntityID(), t"BaseStatusEffect.InvisibleFull");

// Remove effect
effectSystem.RemoveStatusEffect(player.GetEntityID(), t"BaseStatusEffect.InvisibleFull");

// Check if has effect
let hasEffect = effectSystem.HasStatusEffect(player.GetEntityID(), t"BaseStatusEffect.InvisibleFull");
```

### GodModeSystem
Toggle god mode.

```swift
let godModeSystem = GameInstance.GetGodModeSystem(gameInstance);

// Enable god mode
godModeSystem.EnableOverride(player.GetEntityID(), gameGodModeType.Invulnerable, n"RedBurrito");

// Disable god mode
godModeSystem.DisableOverride(player.GetEntityID(), n"RedBurrito");
```

### VehicleSystem
Vehicle management.

```swift
let vehicleSystem = GameInstance.GetVehicleSystem(gameInstance);

// Spawn vehicle
vehicleSystem.SpawnPlayerVehicle(vehicleType);

// Toggle summoning mode
vehicleSystem.ToggleSummonMode();
```

### BlackboardSystem
Read/write game state blackboards.

```swift
let blackboardSystem = GameInstance.GetBlackboardSystem(gameInstance);
let playerStateBB = blackboardSystem.GetLocalInstanced(player.GetEntityID(), GetAllBlackboardDefs().PlayerStateMachine);

// Read value
let inCombat = playerStateBB.GetBool(GetAllBlackboardDefs().PlayerStateMachine.Combat);

// Write value
playerStateBB.SetBool(GetAllBlackboardDefs().PlayerStateMachine.Combat, false);
```

### AudioSystem
Play sounds.

```swift
let audioSystem = GameInstance.GetAudioSystem(gameInstance);

// Play sound
audioSystem.Play(n"ui_menu_onpress");

// Stop sound
audioSystem.Stop(n"ui_menu_onpress");
```

---

## Commonly Used Patterns

### Get Player from VendingMachine
```swift
@addMethod(VendingMachine)
protected func DoSomething() -> Void {
    let player = this.GetGame().GetPlayerSystem().GetLocalPlayerMainGameObject() as PlayerPuppet;
    // ...
}
```

### Get Player from State
```swift
protected final func GetPlayer(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> ref<PlayerPuppet> {
    return scriptInterface.owner as PlayerPuppet;
}
```

### Initialize on Game Attach
```swift
@wrapMethod(PlayerPuppet)
protected cb func OnGameAttached() -> Bool {
    wrappedMethod();
    // Initialize your stuff here
    this.myController = new MyController();
    this.myController.Setup(this);
}
```

---

## Getting Entity IDs

```swift
// From player
let playerID = player.GetEntityID();

// For stats system
let statsID: StatsObjectID = Cast<StatsObjectID>(player.GetEntityID());

// For weapon
let weaponID = weapon.GetEntityID();
```

---

## Quick Reference Table

| System | Purpose | Common Methods |
|--------|---------|----------------|
| `StatsSystem` | Player/NPC stats | `AddModifier`, `RemoveAllModifiers` |
| `TransactionSystem` | Items | `GiveItem`, `RemoveItem`, `HasItem` |
| `QuestsSystem` | Flags | `GetFact`, `SetFact` |
| `PlayerSystem` | Player ref | `GetLocalPlayerMainGameObject` |
| `TimeSystem` | Time control | `SetTimeDilation`, `UnsetTimeDilation` |
| `StatusEffectSystem` | Buffs/debuffs | `ApplyStatusEffect`, `RemoveStatusEffect` |
| `GodModeSystem` | Invincibility | `EnableOverride`, `DisableOverride` |
| `VehicleSystem` | Vehicles | `SpawnPlayerVehicle` |
| `BlackboardSystem` | Game state | `GetLocalInstanced`, `SetBool` |
| `AudioSystem` | Sounds | `Play`, `Stop` |
