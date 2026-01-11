# Input Actions & CNames Reference

## Custom Input Actions (Used in RedBurrito)

These require corresponding entries in `r6/input/inputUserMappings.xml`:

| Action Name | Type | Used In |
|-------------|------|---------|
| `n"OpticalCamoBoost_Hold"` | BUTTON_HOLD_COMPLETE | InsaneCamo.reds |
| `n"CyberdeckBoost_Hold"` | BUTTON_HOLD_COMPLETE | InsaneCyberdeck.reds |
| `n"CyberdeckInterruptTrace_Hold"` | BUTTON_HOLD_COMPLETE | InsaneCyberdeck.reds |

## Input Listener Pattern
```swift
// Register in Setup
this.player.RegisterInputListener(this, n"ActionName_Hold");

// Handle in callback
protected cb func OnAction(action: ListenerAction, consumer: ListenerActionConsumer) -> Bool {
    if Equals(ListenerAction.GetName(action), n"ActionName_Hold") &&
       Equals(ListenerAction.GetType(action), gameinputActionType.BUTTON_HOLD_COMPLETE) {
        this.DoSomething();
    }
}
```

## Action Types
- `gameinputActionType.BUTTON_PRESSED` — on press
- `gameinputActionType.BUTTON_RELEASED` — on release
- `gameinputActionType.BUTTON_HOLD_COMPLETE` — after hold duration

---

## Game Input Actions (Built-in)

| CName | Description |
|-------|-------------|
| `n"Jump"` | Jump button |
| `n"Dodge"` | Dodge/dash |
| `n"ToggleCrouch"` | Crouch toggle |

---

## Locomotion States

| CName | Description |
|-------|-------------|
| `n"Locomotion"` | State machine name |
| `n"crouch"` | Crouching |
| `n"crouchSprint"` | Crouch sprinting |
| `n"slide"` | Sliding |
| `n"chargeJump"` | Charging jump |
| `n"superheroFall"` | Superhero landing |
| `n"dash"` | Dashing |

---

## State Parameters

| CName | Type | Description |
|-------|------|-------------|
| `n"CrouchToggled"` | Bool | Crouch state |
| `n"JumpPressed"` | Bool | Jump input held |
| `n"DodgeDirection"` | Float | Dodge angle |
| `n"DodgeWhileCrouching"` | Bool | Crouch dodge |
| `n"currentNumberOfJumps"` | Int | Jump counter |
| `n"LandingType"` | Int | Landing type enum |
| `n"ImpactSpeed"` | Float | Fall impact speed |
| `n"InAirDuration"` | Float | Time in air |
| `n"isGravityAffectedByChargedJump"` | Bool | Charge jump gravity |
| `n"TemporarySpeedLimitIgnore"` | Bool | Speed limit bypass |

---

## Landing Parameters

| CName | Description |
|-------|-------------|
| `n"RegularLandingFallingSpeed"` | Normal landing threshold |
| `n"SafeLandingFallingSpeed"` | Safe landing threshold |
| `n"HardLandingFallingSpeed"` | Hard landing threshold |
| `n"VeryHardLandingFallingSpeed"` | Very hard landing |
| `n"DeathLandingFallingSpeed"` | Death threshold |

---

## Quest Facts (Flags)

Used for persistent state that survives save/load:

| CName | Description |
|-------|-------------|
| `n"redburrito_no_fall_damage"` | No fall damage enabled |
| `n"RedBurritoDisablePolice"` | Police disabled |
| `n"gmpl_player_dodged"` | Dodge counter (game) |

### Usage
```swift
let questSystem = scriptInterface.GetQuestsSystem();

// Check flag
if questSystem.GetFact(n"redburrito_flag") > 0 { ... }

// Set flag
questSystem.SetFact(n"redburrito_flag", 1);

// Clear flag
questSystem.SetFact(n"redburrito_flag", 0);
```

---

## Audio CNames

| CName | Description |
|-------|-------------|
| `n"lcm_player_double_jump"` | Double jump sound |
| `n"lcm_dash"` | Dash sound |
| `n"lcm_falling_wind_loop"` | Falling wind |
| `n"EnterCrouch"` | Crouch sound |
| `n"RTPC_Vertical_Velocity"` | Vertical velocity param |
| `n"RTPC_Landing_Type"` | Landing type param |

---

## Animation Events

| CName | Description |
|-------|-------------|
| `n"DoubleJump"` | Double jump animation |
| `n"Dodge"` | Dodge animation |
| `n"Landing"` | Landing animation |
| `n"falling"` | Falling effect |
