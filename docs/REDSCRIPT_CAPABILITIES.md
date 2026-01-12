# Redscript Capabilities - Full Reference

**Purpose:** Complete list of what's possible with Redscript, NOT just what RedBurrito does.

---

## External Resources

| Resource | URL | Description |
|----------|-----|-------------|
| NativeDB | https://nativedb.red4ext.com/ | Database of ALL game classes/functions |
| Redscript Wiki | https://wiki.redmodding.org/redscript | Official documentation |
| Scripting Cyberpunk | https://wiki.redmodding.org/scripting-cyberpunk | General scripting guide |
| Item IDs | https://www.nexusmods.com/cyberpunk2077/mods/521 | All TweakDBIDs |
| Example Mods | https://github.com/djkovrik/CP77Mods | Open source mods |

---

## Annotations (All Available)

| Annotation | Purpose | Can Chain? |
|------------|---------|------------|
| `@wrapMethod(Class)` | Wrap existing method, call original with `wrappedMethod()` | YES |
| `@addMethod(Class)` | Add new method to existing class | N/A |
| `@replaceMethod(Class)` | Completely replace method (original NOT called) | NO |
| `@replaceGlobal()` | Replace global function | NO |
| `@addField(Class)` | Add new field to existing class | N/A |
| `@if(ModuleExists("..."))` | Conditional compilation | N/A |

---

## Hookable Events (What You Can Intercept)

### Player Lifecycle
```swift
@wrapMethod(PlayerPuppet)
protected cb func OnGameAttached() -> Bool               // Player spawned
protected cb func OnMakePlayerVisibleAfterSpawn(...)     // After spawn grace period
protected cb func OnDetach() -> Bool                     // Player despawned
```

### Player Actions
```swift
@wrapMethod(PlayerPuppet)
protected cb func OnAction(action: ListenerAction, consumer: ListenerActionConsumer) -> Bool
protected cb func OnStatusEffectApplied(evt: ref<ApplyStatusEffectEvent>) -> Bool
protected cb func OnStatusEffectRemoved(evt: ref<RemoveStatusEffect>) -> Bool
```

### Items & Inventory
```swift
@wrapMethod(ItemActionsHelper)
public final static func ProcessItemAction(...) -> Bool      // Any item action
public final static func ConsumeItem(...) -> Void           // Quickslot consume
public final static func PerformItemAction(...) -> Void     // Backpack consume

@wrapMethod(EquipmentSystemPlayerData)
private final func UnequipItem(...) -> Void                 // Item unequipped
private final func EquipItem(...) -> Void                   // Item equipped
```

### Combat
```swift
@wrapMethod(PlayerPuppet)
protected cb func OnHit(evt: ref<gameHitEvent>) -> Bool
protected cb func OnDamageReceived(...) -> Bool

@wrapMethod(WeaponObject)
protected cb func OnGameAttached() -> Bool
```

### Vehicles
```swift
@wrapMethod(VehicleComponent)
protected cb func OnVehicleSpawned() -> Bool
protected cb func OnMountingEvent(evt: ref<MountingEvent>) -> Bool
```

### UI Menus
```swift
@wrapMethod(SingleplayerMenuGameController)
protected cb func OnInitialize() -> Bool                    // ESC menu
private func PopulateMenuItemList()                         // Add menu buttons

@wrapMethod(BackpackMainGameController)
protected cb func OnInitialize() -> Bool                    // Inventory screen

@wrapMethod(gameuiInventoryGameController)
protected cb func OnInitialize() -> Bool                    // Full inventory
```

### Devices
```swift
@wrapMethod(VendingMachine)
protected func DispenseItems(...) -> Void                   // Vending machine use

@wrapMethod(Computer)
protected cb func OnInitialize() -> Bool                    // Computer terminals
```

### Time & World
```swift
@wrapMethod(TimeskipGameController)
private final func Apply() -> Void                          // Time skip

@wrapMethod(WeatherSystem)
// Weather changes
```

---

## Game Systems Available

### StatsSystem - Modify ANY stat
```swift
let statsSystem = GameInstance.GetStatsSystem(gi);
// See STATS_REFERENCE.md for 100+ stats
```

### StatusEffectSystem - Apply/remove buffs
```swift
let effectSystem = GameInstance.GetStatusEffectSystem(gi);
effectSystem.ApplyStatusEffect(entityID, t"BaseStatusEffect.XXX");
```

### TransactionSystem - Items
```swift
let TS = GameInstance.GetTransactionSystem(gi);
TS.GiveItem(player, itemID, count);
TS.RemoveItem(player, itemID, count);
```

### QuestsSystem - Persistent flags
```swift
let questSystem = GameInstance.GetQuestsSystem(gi);
questSystem.SetFact(n"my_flag", 1);
```

### TimeSystem - Time control
```swift
let timeSystem = GameInstance.GetTimeSystem(gi);
timeSystem.SetTimeDilation(n"MyMod", 0.5);  // Slow motion
```

### VehicleSystem - Vehicles
```swift
let VS = GameInstance.GetVehicleSystem(gi);
VS.EnablePlayerVehicle("Vehicle.XXX", true, false);
VS.SpawnPlayerVehicle(vehicleType);
```

### PreventionSystem - Police
```swift
let prevention = player.GetPreventionSystem();
prevention.TogglePreventionSystem(false);  // Disable police
```

### TeleportationFacility - Teleport
```swift
let tf = GameInstance.GetTeleportationFacility(gi);
tf.Teleport(player, position, rotation);
```

### AudioSystem - Sound
```swift
let audio = GameInstance.GetAudioSystem(gi);
audio.Play(n"sound_name");
```

### BlackboardSystem - Game state
```swift
let bb = GameInstance.GetBlackboardSystem(gi);
// Read/write game state variables
```

---

## Mod Ideas NOT in RedBurrito

### UI Modifications
- [ ] Custom HUD elements
- [ ] New menu buttons in ESC menu
- [ ] Inventory sorting/filtering
- [ ] Custom notifications
- [ ] Minimap modifications

### Gameplay Mechanics
- [ ] New consumable effects
- [ ] Custom status effects
- [ ] Weapon behavior changes
- [ ] New crafting recipes
- [ ] Skill tree modifications

### World Interactions
- [ ] Custom device interactions
- [ ] New computer terminal content
- [ ] Environmental hazard changes
- [ ] Weather control

### NPCs & Combat
- [ ] NPC behavior modifications
- [ ] Enemy spawn changes
- [ ] Loot drop modifications
- [ ] Combat AI adjustments

### Economy
- [ ] Price modifications
- [ ] Vendor inventory changes
- [ ] Crafting cost changes

### Quality of Life
- [ ] Auto-loot settings
- [ ] Skip animations
- [ ] Fast travel modifications
- [ ] Notification filtering

### Photo Mode
- [ ] New poses
- [ ] Camera settings
- [ ] Effect additions

---

## Important Limitations

1. **Cannot modify native functions** - only scripted ones
2. **@replaceMethod cannot chain** - only one per method
3. **No direct memory access** - unlike RED4ext
4. **Save compatibility** - AddSavedModifier persists, AddModifier doesn't
5. **Mac limitations** - some features may not work on Mac port

---

## Pattern Templates

### Add Menu Button
```swift
@wrapMethod(SingleplayerMenuGameController)
private func PopulateMenuItemList() {
    wrappedMethod();
    this.AddMenuItem("MY BUTTON", n"OnMyCallback");
}
```

### React to Item Use
```swift
@wrapMethod(ItemActionsHelper)
public final static func ConsumeItem(executor: wref<GameObject>, itemID: ItemID, fromInventory: Bool) -> Void {
    wrappedMethod(executor, itemID, fromInventory);
    // Check what item was used and react
}
```

### Modify Weapon Behavior
```swift
@wrapMethod(WeaponObject)
protected cb func OnGameAttached() -> Bool {
    wrappedMethod();
    // Modify weapon stats here
}
```

### Time Skip Hook
```swift
@wrapMethod(TimeskipGameController)
private final func Apply() -> Void {
    wrappedMethod();
    // React to time skip
}
```

---

## Where to Find More

1. **NativeDB** - Search for class/function names
2. **Redscript Wiki** - Language syntax and patterns
3. **Cyberpunk-Modding-Docs** - `/Developer/Cyberpunk-Modding-Docs/`
4. **Game API** - `/Developer/cyberpunk/`
5. **Other mods** - `/Library/.../Cyberpunk 2077/r6/scripts/Other/`
