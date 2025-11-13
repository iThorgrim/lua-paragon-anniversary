# 🧩 Paragon Modules System

## 📖 Overview

The **Modules System** enables extensibility of the Paragon system through **event-driven architecture** using the **Mediator pattern**. Rather than modifying core hook files, third-party functionality is implemented as independent modules that register event listeners.

This design follows the principle of **Separation of Concerns**: core hooks manage events, business logic is externalized, and modules are optional and composable.

---

## 🎯 Architecture

### Core Principle: Mediator Pattern

```
paragon_hook.lua (Event Source)
         ↓
Mediator.On("EventName", {...})
         ↓
     [Event Bus]
         ↓
module1.lua (Listener)
module2.lua (Listener)
module3.lua (Listener)
```

**Benefits:**
- ✅ **Loose Coupling**: Modules don't depend on each other
- ✅ **Extensibility**: Add functionality without modifying core hooks
- ✅ **Reusability**: Modules can be enabled/disabled independently
- ✅ **Testability**: Each module has isolated responsibility
- ✅ **Maintainability**: Clear separation between event handling and business logic

---

## 📦 Module System

### Module Registration

Each module must register its event handlers with the Mediator:

```lua
-- Example: Custom module
RegisterMediatorEvent("OnUpdatePlayerExperience", function(player, paragon, experience)
    -- Custom logic here
    return paragon  -- Return modified/unmodified paragon
end)
```

### Module Anatomy

A well-designed module follows this structure:

```lua
--[[
    Module Name
    Brief description of functionality

    Registered events:
    - EventName1: Description
    - EventName2: Description

    Dependencies:
    - paragon_config
]]

local Config = require("paragon_config")

-- ============================================================================
-- CATEGORY 1
-- ============================================================================

---
--- Function documentation
---
local function HandlerFunction(...)
    -- Implementation
end

-- ============================================================================
-- MODULE REGISTRATION
-- ============================================================================

RegisterMediatorEvent("EventName", HandlerFunction)
```

---

## 📚 Available Modules

### 🎯 paragon_anniversary.lua

**Status:** ✅ **Included**
**Purpose:** Core experience system with cascading level-ups and business logic examples

**Provides:**
- Experience gain processing with cascading level-ups
- Experience multiplier adjustments
- Level-up notifications framework
- Experience tracking and logging
- Statistic validation with business rules
- Stat application effects

**Registered Events:**
- `OnUpdatePlayerExperience` (REQUIRED)
- `OnExperienceCalculated`
- `OnParagonLevelChanged`
- `OnAfterUpdatePlayerExperience`

---

## 🔌 Creating Custom Modules

### Step 1: Create Module File

Create a new file in the `modules/` directory:

```lua
-- modules/paragon_custom_module.lua

--[[
    Custom Module Name

    Description of what this module does
]]

local Config = require("paragon_config")

-- Implementation here

RegisterMediatorEvent("OnEventName", function(...)
    -- Handler
end)
```

### Step 2: Register with Mediator

Add registration in your module initialization (or in a main loader):

```lua
-- modules/paragon_custom_module.lua

RegisterMediatorEvent("OnUpdatePlayerExperience", function(player, paragon, experience)
    -- Apply custom logic
    return paragon
end)
```

### Step 3: Enable the Module

In your ALE script loader, require the module:

```lua
-- paragon/lib/loader.lua (or your main entry point)

require("paragon.modules.paragon_custom_module")
```

---

## 📋 Module Development Guidelines

### 1. Follow Existing Patterns

- Use Singleton pattern where appropriate
- Implement Object:extend() for classes
- Use method chaining for fluent APIs
- Add comprehensive LuaDoc comments

### 2. Event Handler Returns

Some events expect return values:

```lua
-- Passthrough event (return modified value)
RegisterMediatorEvent("OnExperienceCalculated", function(player, paragon, source, exp)
    return exp * 1.5  -- Return modified experience
end)

-- State-modifying event (return object)
RegisterMediatorEvent("OnUpdatePlayerExperience", function(player, paragon, exp)
    -- Modify paragon state
    paragon:AddLevel(1)
    return paragon  -- Return modified paragon
end)

-- Notification event (no return required)
RegisterMediatorEvent("OnParagonLevelChanged", function(paragon, old_level, new_level)
    -- Side effects only
end)
```

### 3. Error Handling

Always validate inputs:

```lua
RegisterMediatorEvent("OnUpdatePlayerExperience", function(player, paragon, experience)
    if not player or not paragon or not experience or experience <= 0 then
        return paragon
    end

    -- Implementation
    return paragon
end)
```

### 4. Avoid Side Effects

Keep modules pure and predictable:

```lua
-- ❌ BAD: Modifying global state
local function BadHandler(paragon)
    GlobalPlayerData[paragon:GetGUID()] = {}  -- Global state
    paragon._custom_data = {}
    return paragon
end

-- ✅ GOOD: Working with passed parameters
local function GoodHandler(paragon)
    -- Operate on parameters only
    return paragon
end
```

### 5. Documentation

Each event handler should document:
- Parameters and their types
- Return value (if any)
- Side effects
- Dependencies

```lua
---
--- Modifies experience gain based on player conditions.
---
--- Applies bonuses for low-level characters (tutorial phase).
--- Applies penalties for high-level characters (scaling).
---
--- @param player The player object
--- @param paragon The paragon instance
--- @param source_type The experience source type
--- @param experience The calculated experience value
--- @return The modified experience value
---
local function OnExperienceCalculated(player, paragon, source_type, experience)
    -- Implementation
    return experience
end
```

---

## 📊 Event Ordering

Events execute in order of registration. Be aware of dependencies:

```
Order of Execution:
1. OnBeforeUpdatePlayerExperience    (Validation phase)
2. OnExperienceCalculated             (Modification phase)
3. OnUpdatePlayerExperience           (Core processing)
4. OnParagonStateSync                 (Sync phase)
5. OnAfterUpdatePlayerExperience      (Cleanup phase)
```

**Important:** If you need strict ordering, document it in your module.

---

## 🔄 Data Flow Examples

### Example 1: Experience Gain Flow

```
Player kills creature
    ↓
Hook.OnPlayerKillCreature
    ↓
OnBeforeCreatureExperience (Module hook)
    ↓
Calculate experience reward
    ↓
OnExperienceCalculated (paragon_anniversary)
    ↓
OnUpdatePlayerExperience (paragon_anniversary - CORE)
    ↓
ProcessMultipleLevelUps (cascading level-ups)
    ↓
Paragon:SetLevel (triggers OnParagonLevelChanged)
    ↓
OnParagonLevelChanged (paragon_anniversary)
    ↓
OnParagonStateSync (Custom module hooks)
    ↓
OnAfterUpdatePlayerExperience (paragon_anniversary)
    ↓
Send data to client
```

### Example 2: Statistic Change Flow

```
Client updates statistic
    ↓
OnParagonClientSendStatistics
    ↓
OnBeforeClientStatisticsUpdate
    ↓
OnBeforeStatisticChange (paragon_anniversary)
    ↓
Paragon:SetStatValue (triggers OnParagonStatChanged)
    ↓
OnBeforeUpdatePlayerStatistics
    ↓
Apply stat bonuses
    ↓
OnAfterUpdatePlayerStatistics (paragon_anniversary)
    ↓
OnAfterClientStatisticsUpdate
```

---

## 🚀 Best Practices

### ✅ DO:

- ✅ Register handlers for specific events only
- ✅ Use meaningful handler names
- ✅ Validate all inputs
- ✅ Document event parameters and return values
- ✅ Keep handlers focused on single responsibility
- ✅ Use try-catch patterns for robust error handling
- ✅ Test handlers independently

### ❌ DON'T:

- ❌ Modify paragon_hook.lua directly
- ❌ Create hard dependencies between modules
- ❌ Perform expensive operations in handlers
- ❌ Rely on execution order (unless documented)
- ❌ Store mutable state in paragon metadata (use getters/setters)
- ❌ Suppress error messages
- ❌ Leak handler internals to global scope

---

## 📦 Example Custom Module

### Investment Bonus Module

```lua
--[[
    Paragon Investment Bonus Module

    Grants experience bonuses when players invest statistic points
    Rewards engagement with the paragon system
]]

local Config = require("paragon_config")

---
--- Grants experience bonus when points are invested
---
local function OnBeforeStatisticChange(player, paragon, stat_id, stat_value)
    if not player or not paragon or not stat_id then
        return paragon, stat_id, stat_value
    end

    -- Don't reward on initial allocation (value 0)
    local current_value = paragon:GetStatValue(stat_id)
    if current_value == 0 then
        return paragon, stat_id, stat_value
    end

    return paragon, stat_id, stat_value
end

---
--- Apply bonus experience after investment
---
local function OnAfterStatisticChange(player, paragon, stat_id, stat_value)
    if not player or not paragon then
        return
    end

    -- Reward 100 paragon experience per point invested
    local bonus_experience = 100
    paragon:AddExperience(bonus_experience)

    -- Notify player
    -- player:SendBroadcastMessage("Investment bonus: +" .. bonus_experience .. " XP")
end

-- ============================================================================
-- MODULE REGISTRATION
-- ============================================================================

RegisterMediatorEvent("OnBeforeStatisticChange", OnBeforeStatisticChange)
RegisterMediatorEvent("OnAfterStatisticChange", OnAfterStatisticChange)
```

---

## 🔗 Integration Checklist

- [ ] Create module file in `modules/` directory
- [ ] Follow naming convention: `paragon_*.lua`
- [ ] Document module header with description
- [ ] Register all event handlers with Mediator
- [ ] Validate all input parameters
- [ ] Add comprehensive LuaDoc comments
- [ ] Test with isolated environment
- [ ] Verify no side effects on other modules
- [ ] Update project documentation if needed

---

## 📚 Related Documentation

- **[HOOKS.md](HOOKS.md)** - Complete list of all available hooks
- **[README.md](../README.md)** - Main Paragon system documentation
- **paragon_hook.lua** - Core event sources and hook points

---

<div align="center">

### 🎯 **Ready to extend the Paragon system?**

*Use the Mediator pattern to add unlimited functionality without modifying core files*

</div>
