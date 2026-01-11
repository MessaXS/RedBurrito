# Stats Reference for RedBurrito

Quick reference for `gamedataStatType` used in this project.

## Usage Pattern
```swift
let statsSystem = GameInstance.GetStatsSystem(gameInstance);
let ownerID: StatsObjectID = Cast<StatsObjectID>(player.GetEntityID());

// Add modifier
statsSystem.AddModifier(ownerID, RPGManager.CreateStatModifier(
    gamedataStatType.StatName,
    gameStatModifierType.Additive,    // or Multiplier
    value
));

// Persistent modifier (survives save/load)
statsSystem.AddSavedModifier(ownerID, modifier);
```

## Modifier Types
- `gameStatModifierType.Additive` — adds flat value
- `gameStatModifierType.Multiplier` — multiplies (1.0 = 100%, 2.0 = 200%)

---

## Player Stats (Survival)

| Stat | Description | Example Value |
|------|-------------|---------------|
| `Health` | Max health | Additive: 1000.0 |
| `Armor` | Damage reduction | Additive: 500.0 |
| `CanIgnoreStamina` | Infinite stamina | Additive: 1.0 |
| `CanBreatheUnderwater` | Infinite oxygen | Additive: 1.0 |
| `CarryCapacity` | Inventory weight | Additive: 20000.0 |
| `MaxSpeed` | Movement speed | Multiplier: 3.0 |
| `FallDamageReduction` | Fall damage reduction % | Additive: 100.0 |
| `HealthInCombatRegenEnabled` | Regen in combat | Additive: 1.0 |
| `HealthGeneralRegenRateMult` | Regen speed | Multiplier: 10.0 |

## Resistance Stats

| Stat | Description |
|------|-------------|
| `PhysicalResistance` | Physical damage resistance |
| `ThermalResistance` | Fire/heat resistance |
| `ElectricResistance` | Electric damage resistance |
| `ChemicalResistance` | Poison/chemical resistance |
| `ExplosionResistance` | Explosion damage resistance |
| `MeleeResistance` | Melee attack resistance |

## Combat Stats

| Stat | Description | Example Value |
|------|-------------|---------------|
| `CritChance` | Critical hit chance | Additive: 50.0 |
| `CritDamage` | Critical damage multiplier | Multiplier: 2.0 |
| `DamagePerHit` | Base damage | Multiplier: 5.0 |
| `HitDismembermentFactor` | Dismemberment chance | Multiplier: 10.0 |
| `CanWeaponIgnoreArmor` | Armor piercing | Additive: 1.0 |
| `CanMeleeInfinitelyCombo` | No melee combo limit | Additive: 1.0 |

## Weapon Stats

| Stat | Description |
|------|-------------|
| `ReloadTimeBase` | Reload time |
| `EmptyReloadTime` | Empty mag reload time |
| `CycleTime` | Fire rate |
| `EffectiveRange` | Accuracy range |
| `MaximumRange` | Max bullet range |
| `NumShotsToFire` | Burst count |
| `ProjectilesPerShot` | Pellets per shot |
| `RecoilKickMin/Max` | Recoil amount |
| `SpreadMinX/Y`, `SpreadMaxX/Y` | Hip fire spread |
| `SpreadAdsMinX/Y`, `SpreadAdsMaxX/Y` | ADS spread |
| `TechPierceEnabled` | Tech weapon piercing |
| `ZoomLevel` | Scope zoom |

## Smart Weapon Stats

| Stat | Description |
|------|-------------|
| `SmartGunHipMaxLockedTargets` | Hip fire targets |
| `SmartGunAdsMaxLockedTargets` | ADS targets |
| `SmartGunHipTimeToLock` | Hip lock time |
| `SmartGunAdsTimeToLock` | ADS lock time |
| `SmartGunHitProbability` | Hit chance |
| `SmartGunTargetAcquisitionRange` | Lock range |
| `SmartGunPlayerProjectileVelocity` | Bullet speed |

## Cyberware Stats

### Optical Camo
| Stat | Description |
|------|-------------|
| `OpticalCamoDuration` | Camo duration |
| `OpticalCamoDurationMultiplier` | Duration multiplier |
| `OpticalCamoRechargeDuration` | Cooldown |
| `OpticalCamoChargesRegenRate` | Charge regen |

### Sandevistan
| Stat | Description |
|------|-------------|
| `TimeDilationSandevistanDuration` | Sandy duration |
| `TimeDilationSandevistanRechargeDuration` | Sandy cooldown |

### Berserk
| Stat | Description |
|------|-------------|
| `BerserkChargesRegenRate` | Charge regen |

### Cyberdeck
| Stat | Description |
|------|-------------|
| `Memory` | RAM capacity |
| `MemoryRegenRate` | RAM regen |
| `MemoryRegenRateMult` | RAM regen multiplier |
| `MemoryCostReduction` | Quickhack cost reduction |
| `DurationBonusQuickhack` | Quickhack duration |
| `QuickhacksCooldownReduction` | Quickhack cooldown |
| `CyberdeckOverclockCooldown` | Overclock cooldown |
| `CyberdeckOverclockRegenRate` | Overclock regen |
| `CWMaskChargesRegenRate` | Mask regen |
| `CWMaskRechargeDuration` | Mask cooldown |

### Movement Abilities
| Stat | Description |
|------|-------------|
| `HasDoubleJump` | Has double jump (read-only check) |
| `HasChargeJump` | Has charge jump (read-only check) |
| `HasAirHover` | Has hover ability (read-only check) |
| `HasDodge` | Has dodge ability (read-only check) |
| `IsDodging` | Currently dodging (flag) |
| `KerenzikovCooldownDuration` | Kerenzikov cooldown |

### Consumables
| Stat | Description |
|------|-------------|
| `HealingItemsChargesRegenMult` | Healing item regen |
| `GrenadesChargesRegenMult` | Grenade regen |
| `ProjectileLauncherChargesRegenMult` | Launcher regen |
| `StaminaCostReduction` | Stamina cost reduction |

---

## Notes
- Boolean stats use `Additive: 1.0` to enable
- Multipliers: `0.01` = 1%, `1.0` = 100%, `20.0` = 2000%
- Use `AddSavedModifier` for persistent effects (survives save/load)
- Use `AddModifier` for temporary effects
