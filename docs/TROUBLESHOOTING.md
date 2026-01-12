# Troubleshooting Guide for RedBurrito

Common errors, antipatterns, and solutions for Redscript modding.

---

## Quick Diagnostics

**Script not working?**
1. Check game launch — compilation errors appear in terminal/console
2. Verify file is in correct location: `r6/scripts/RedBurrito/`
3. Check for syntax errors (missing semicolons, brackets)
4. Verify module name matches file structure

---

## Common Compilation Errors

### 1. "Class not found" / "Type not found"

**Error:** `error: class 'PlayerPuppet' not found`

**Cause:** Missing import or wrong class name

**Solution:**
```swift
// WRONG - class doesn't exist or wrong name
let player: ref<Player>;

// CORRECT - use actual game class
let player: ref<PlayerPuppet>;
```

**Common class names:**
- `PlayerPuppet` (not `Player`)
- `VendingMachine` (not `Vending`)
- `StatsSystem` (not `StatSystem`)

---

### 2. "Cannot resolve method"

**Error:** `error: cannot resolve method 'GetPlayer'`

**Cause:** Method doesn't exist on that class, or wrong parameters

**Solution:**
```swift
// WRONG - GetPlayer doesn't exist on VendingMachine
let player = this.GetPlayer();

// CORRECT - use GetPlayerSystem
let player = GetPlayer(this.GetGame());
```

---

### 3. "Type mismatch"

**Error:** `error: cannot assign 'Int32' to 'Float'`

**Cause:** Redscript is strictly typed

**Solution:**
```swift
// WRONG
let speed: Float = 100;

// CORRECT - explicit float
let speed: Float = 100.0;

// Or cast
let speed: Float = Cast<Float>(someInt);
```

---

### 4. "Duplicate definition"

**Error:** `error: duplicate definition of 'FunctionName'`

**Cause:** Same function/class defined twice (maybe in different files)

**Solution:**
- Check all .reds files for duplicates
- Use unique module names
- Remove duplicate @wrapMethod if exists

---

### 5. "@wrapMethod target not found"

**Error:** `error: cannot find method to wrap`

**Cause:** Method signature doesn't match exactly

**Solution:**
```swift
// WRONG - missing 'protected' or wrong params
@wrapMethod(VendingMachine)
func DispenseItems(request: ref<DispenseRequest>) -> Void

// CORRECT - exact signature match
@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void
```

**Tip:** Check `~/Developer/cyberpunk/` for exact method signatures.

---

## Antipatterns — How NOT to Write Code

### 1. DON'T: Use CET/Codeware syntax

```swift
// WRONG - CET style (won't work in pure Redscript)
Observe("PlayerPuppet", "OnAction", function(action) { ... });
Override("ClassName", "MethodName", function() { ... });

// CORRECT - Redscript annotations
@wrapMethod(PlayerPuppet)
protected cb func OnAction(action: ListenerAction, ...) -> Bool
```

---

### 2. DON'T: Forget wrappedMethod() call

```swift
// WRONG - breaks original functionality
@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
    this.DoMyStuff();
    // Missing wrappedMethod(request)!
}

// CORRECT - always call original
@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
    wrappedMethod(request);
    this.DoMyStuff();
}
```

---

### 3. DON'T: Use hardcoded player references

```swift
// WRONG - crashes if player not found
let player = GetPlayer(this.GetGame());
player.SetWarningMessage("Hello"); // Crash if player is null!

// CORRECT - null check
let player = GetPlayer(this.GetGame());
if IsDefined(player) {
    player.SetWarningMessage("Hello");
}
```

---

### 4. DON'T: Mix tabs and spaces

```swift
// WRONG - inconsistent indentation
public func DoSomething() -> Void {
    let a = 1;
        let b = 2;  // Space indentation mixed with tabs
}

// CORRECT - consistent tabs
public func DoSomething() -> Void {
	let a = 1;
	let b = 2;
}
```

---

### 5. DON'T: Create infinite loops in callbacks

```swift
// WRONG - can freeze game
@wrapMethod(SomeClass)
protected cb func OnTick(delta: Float) -> Bool {
    while true {
        // Infinite loop in tick = freeze
    }
}

// CORRECT - do work and return
@wrapMethod(SomeClass)
protected cb func OnTick(delta: Float) -> Bool {
    this.DoQuickCheck();
    return wrappedMethod(delta);
}
```

---

### 6. DON'T: Forget module declaration

```swift
// WRONG - no module, potential conflicts
// SomeFile.reds
public class MyHelper { ... }

// CORRECT - namespaced module
// SomeFile.reds
module RedBurrito.Helpers

public class MyHelper { ... }
```

---

### 7. DON'T: Use @replaceMethod unless necessary

```swift
// WRONG - completely replaces original, may break things
@replaceMethod(SomeClass)
protected func ImportantMethod() -> Void {
    // Original code is GONE
}

// CORRECT - wrap and extend
@wrapMethod(SomeClass)
protected func ImportantMethod() -> Void {
    wrappedMethod();
    // Add your code
}
```

**Use @replaceMethod ONLY when:**
- You need to completely change behavior
- @wrapMethod doesn't give enough control
- You understand what original method does

---

## Common Problems & Solutions

### Problem: Mod works in new game but not in existing save

**Cause:** Quest facts persist in save file

**Solution:**
```swift
// Reset fact on activation
questSystem.SetFact(n"my_fact", 0);
// Then set new value
questSystem.SetFact(n"my_fact", 1);
```

---

### Problem: Stat modifier doesn't apply

**Cause:** Wrong StatType or ModifierType

**Solution:**
```swift
// Check STATS_REFERENCE.md for correct types
// Use RemoveModifier before AddModifier if updating
statsSystem.RemoveAllModifiers(ownerID, gamedataStatType.Health);
statsSystem.AddModifier(ownerID, RPGManager.CreateStatModifier(
    gamedataStatType.Health,
    gameStatModifierType.Additive,  // or Multiplier
    1000.0
));
```

---

### Problem: Input listener doesn't trigger

**Cause:** Wrong action name or not registered

**Solution:**
```swift
// Check INPUT_AND_CNAMES.md for correct action names
// Must register in OnPlayerAttach
this.player.RegisterInputListener(this, n"Choice1_Hold");

// And implement callback
protected cb func OnAction(action: ListenerAction, ...) -> Bool {
    if Equals(ListenerAction.GetName(action), n"Choice1_Hold") {
        // Handle action
    }
}
```

---

### Problem: Game crashes on load

**Cause:** Usually null reference or infinite loop

**Solution:**
1. Comment out new code, test
2. Add null checks (`IsDefined()`)
3. Check for infinite loops
4. Verify method signatures match exactly

---

## Debugging Without Logs

Since CET is not available on Mac, use these techniques:

### 1. Player messages as debug output
```swift
player.SetWarningMessage("Debug: value = " + ToString(someValue));
```

### 2. Quest facts as state indicators
```swift
// Set fact to track state
questSystem.SetFact(n"debug_reached_point_1", 1);

// Check in another place
if questSystem.GetFact(n"debug_reached_point_1") > 0 {
    player.SetWarningMessage("Point 1 was reached");
}
```

### 3. Binary search debugging
1. Comment out half of new code
2. If works — problem in commented half
3. Repeat until found

---

## See Also

- `REDSCRIPT_SYNTAX.md` — Language syntax reference
- `GAME_SYSTEMS.md` — GameInstance systems
- `CODE_MAP.md` — Project structure
- `~/Developer/cyberpunk/` — Game API for method signatures
