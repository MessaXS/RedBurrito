# Redscript Syntax Reference

Quick reference for Redscript language syntax used in RedBurrito.

---

## Annotations

### @wrapMethod
Wraps an existing method, allowing code before/after the original.

```swift
@wrapMethod(ClassName)
protected func MethodName(params) -> ReturnType {
    // Code before
    wrappedMethod(params);  // Call original
    // Code after
}
```

**Example:**
```swift
@wrapMethod(VendingMachine)
protected func DispenseItems(request: ref<DispenseRequest>) -> Void {
    wrappedMethod(request);
    this.CustomFunction();
}
```

### @addMethod
Adds a new method to an existing class.

```swift
@addMethod(ClassName)
protected func NewMethodName() -> Void {
    // New functionality
}
```

### @replaceMethod
Completely replaces an existing method (use with caution).

```swift
@replaceMethod(ClassName)
protected func MethodName(params) -> ReturnType {
    // Replacement code (original is NOT called)
}
```

### @addField
Adds a new field (variable) to an existing class.

```swift
@addField(ClassName)
private let fieldName: Type;
```

**Example:**
```swift
@addField(PlayerPuppet)
private let myController: ref<MyController>;
```

---

## Types

### Basic Types
| Type | Description | Example |
|------|-------------|---------|
| `Bool` | Boolean | `true`, `false` |
| `Int32` | 32-bit integer | `42` |
| `Int64` | 64-bit integer | `42l` |
| `Float` | Floating point | `3.14` |
| `String` | Text string | `"Hello"` |
| `CName` | Interned string (fast comparison) | `n"ActionName"` |
| `TweakDBID` | Database ID | `t"Items.money"` |

### Reference Types
| Type | Description |
|------|-------------|
| `ref<T>` | Strong reference (owns the object) |
| `wref<T>` | Weak reference (doesn't own) |
| `array<T>` | Dynamic array |

### Special Types
| Type | Description |
|------|-------------|
| `Void` | No return value |
| `Variant` | Any type (use sparingly) |

---

## Variable Declaration

```swift
// Immutable (preferred)
let name: Type = value;

// Mutable
var name: Type = value;

// Type inference
let player = GetPlayer();  // Type inferred
```

---

## Control Flow

### If/Else
```swift
if condition {
    // code
} else if otherCondition {
    // code
} else {
    // code
}
```

### While Loop
```swift
while condition {
    // code
}

// With index
let i = 0;
while i < ArraySize(array) {
    // use array[i]
    i += 1;
}
```

### For Loop (range)
```swift
// NOT available in Redscript - use while
```

---

## Functions

### Declaration
```swift
public func FunctionName(param1: Type1, param2: Type2) -> ReturnType {
    return value;
}
```

### Visibility
- `public` — accessible from anywhere
- `protected` — accessible from class and subclasses
- `private` — accessible only from class

### Callback Functions
```swift
protected cb func OnEventName(event: ref<EventType>) -> Bool {
    // Handle event
    return true;  // Event handled
}
```

---

## Classes

```swift
public class MyController {
    private let field1: Type;
    private let field2: wref<OtherClass>;

    public func Setup(param: Type) -> Void {
        this.field1 = param;
    }

    private func InternalMethod() -> Void {
        // ...
    }
}
```

---

## Modules

```swift
module ModuleName

// or nested
module Parent.Child.GrandChild
```

All code in the file belongs to this module.

---

## Common Patterns

### Null Check
```swift
if IsDefined(object) {
    // object is not null
}

if !IsDefined(object) {
    return;  // Early exit if null
}
```

### Type Cast
```swift
let puppet = entity as PlayerPuppet;
if IsDefined(puppet) {
    // Use puppet
}

// Direct cast (will crash if wrong type)
let id: StatsObjectID = Cast<StatsObjectID>(entity.GetEntityID());
```

### String Interpolation
```swift
let msg = s"Value: \(variable)";
let msg2 = s"\(count)x " + itemName + " Added";
```

### Array Operations
```swift
let arr: array<Type>;
ArrayPush(arr, item);
ArraySize(arr);
ArrayClear(arr);
ArrayContains(arr, item);
ArrayRemove(arr, item);
```

### CName Comparison
```swift
if Equals(ListenerAction.GetName(action), n"ActionName") {
    // Match
}

// NOT: action.GetName() == n"ActionName"
```

---

## Common Mistakes

1. **Forgetting `wrappedMethod()`** in @wrapMethod — original won't be called
2. **Using `==` instead of `Equals()`** for CName comparison
3. **Using `ref<>` when `wref<>` is needed** — can cause memory issues
4. **Missing `this.`** when accessing class fields
5. **Not checking `IsDefined()`** before using references
