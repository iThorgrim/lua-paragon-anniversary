> [!NOTE]
> **Paragon Anniversary** Serverside is now feature-complete and stable!
> Clientside UI is still in development with some features to complete.

___

<div align="center">

<img width="292" height="298" alt="Paragon_AI_Logo" src="https://github.com/user-attachments/assets/27482a85-186e-401a-b493-29622ce739b4" />
</div>

<div align="center">
  
# ⚡ Paragon System
### *for AzerothCore*

<img src="https://img.shields.io/badge/AzerothCore-3.3.5a-blue?style=for-the-badge&logo=world-of-warcraft" alt="AzerothCore Badge">
<img src="https://img.shields.io/badge/Language-Lua-purple?style=for-the-badge&logo=lua" alt="Lua Badge">
<img src="https://img.shields.io/badge/Engine-ALE-orange?style=for-the-badge" alt="ALE Badge">

*Endless progression system - Continue growing beyond max level*

</div>

---

## 📊 Status

| Component | Status | Notes |
|-----------|--------|-------|
| **Serverside** | ⚙️ **Beta** | All core features complete, dual-mode system fully implemented, stabilization in progress |
| **Clientside** | 🎨 **Beta** | Core UI functional, features and refinement in progress |
| **Documentation** | ✅ **Complete** | Full code docs, architecture guides, and hook specifications |

---

## ⚠️ Platform Availability

> [!IMPORTANT]
> **The Paragon System is currently available exclusively for AzerothCore (3.3.5a).**
>
> We are focusing on ensuring all functionality is stable and bug-free on AzerothCore before expanding to other platforms. This allows us to provide a reliable and well-tested experience.
>
> **Future Plans:**
> - 📅 After stabilization on AzerothCore, a port to **ElunaTrinityWotlk** is planned
> - 🔄 Additional emulator support may follow based on community demand
>
> If you're using a different emulator and interested in compatibility, please open an issue on the project repository.

---

## 🌟 What's This?

The **Paragon System** introduces an endgame progression mechanic for AzerothCore servers. After reaching max level, players continue to earn **paragon experience** and unlock **stat bonuses** through a point-based talent system.

### ✨ Key Features

- **📊 Paragon Levels**: Unlimited progression beyond max level
- **⚡ Stat Bonuses**: Invest points in Combat Ratings, Stats, and Special Auras
- **🎯 Three Categories**:
  - **Combat**: Hit, Crit, Haste, Expertise, Armor Penetration
  - **Stats**: Strength, Agility, Stamina, Resistances, HP/Mana
  - **Auras**: Loot, Reputation, and Experience bonuses
- **🎮 Multi-Source Experience**: Gain paragon XP from creatures, achievements, quests, and skills
- **💰 Point System**: Earn points to distribute among available statistics
- **🔄 Client Integration**: In-game interface via custom addon
- **💾 Persistent**: All progress saved to database

---

## 🎬 Preview

<div align="center">

[![Watch Paragon Anniversary Demo](https://img.youtube.com/vi/JEyiI8Y-l8M/maxresdefault.jpg)](https://www.youtube.com/watch?v=6ZtVBOo93YI)

**Click to watch the Paragon Anniversary demo on YouTube** 🎥

</div>

---

## 🏗️ Architecture

<table>
<tr>
<td width="50%">

### 📦 **Core Components**

- `paragon_constant.lua` - Constants & SQL queries
- `paragon_repository.lua` - Database access layer (Singleton)
- `paragon_config.lua` - Configuration service (Singleton)
- `paragon_class.lua` - Paragon business logic & state
- `paragon_hook.lua` - Event handlers & client communication

### 🧩 **Module System**

- `modules/paragon_anniversary.lua` - Experience & level-up mechanics
- Extensible via Mediator pattern for custom features

</td>
<td width="50%">

### 🗄️ **Database**

**Configuration Tables:**
- `paragon_config_category` - Stat categories
- `paragon_config_statistic` - Available stats
- `paragon_config` - General settings (key-value pairs)
- `paragon_config_experience_*` - Experience rewards by source

**Character Data (Character-Linked Mode):**
- `character_paragon` - Player levels & XP per character
- `character_paragon_stats` - Invested points per character

**Account Data (Account-Linked Mode):**
- `account_paragon` - Account-wide levels & XP
- `character_paragon_stats` - Stats always per character

</td>
</tr>
</table>

### 🔄 **Dual-Mode System**

Configure `LEVEL_LINKED_TO_ACCOUNT` in `paragon_config`:
- **`0` (Default)**: Character-linked - Each character has independent progression
- **`1`**: Account-linked - All characters on account share level/XP but have separate stat investments

---

## 🚀 Quick Installation

### Quick Start (3 Steps)

1. 📁 Copy the `paragon` folder to your ALE scripts directory
2. 🔄 Restart your AzerothCore server (tables auto-create)
3. ⚙️ Configure `paragon_config` table with your desired settings

> **📝 Note**: Requires ALE engine installed on AzerothCore

### 📖 Detailed Installation Guide

For complete installation instructions including:
- ✅ Prerequisites and dependencies
- ✅ Step-by-step server setup
- ✅ Database configuration
- ✅ Client-side addon installation
- ✅ Testing and troubleshooting

**👉 [Read the Full Installation Guide](doc/INSTALL.md)**

---

## ⚙️ Configuration

Configure the system via database entries in `paragon_config`:

### System Control

| Field | Description | Default |
|-------|-------------|---------|
| `ENABLE_PARAGON_SYSTEM` | Enable/disable the entire system | `1` |
| `LEVEL_LINKED_TO_ACCOUNT` | Character-linked (0) vs Account-linked (1) mode | `0` |
| `PARAGON_LEVEL_CAP` | Maximum paragon level (0 = unlimited) | `999` |
| `MINIMUM_LEVEL_FOR_PARAGON_XP` | Minimum character level to earn paragon XP | `0` |

### Progression Settings

| Field | Description | Default |
|-------|-------------|---------|
| `BASE_MAX_EXPERIENCE` | Base XP per level (multiplied by level) | `1000` |
| `POINTS_PER_LEVEL` | Points awarded per paragon level | `1` |
| `PARAGON_STARTING_LEVEL` | Starting paragon level for new characters | `1` |
| `PARAGON_STARTING_EXPERIENCE` | Starting experience value | `0` |

### Experience Rewards

| Field | Description | Default |
|-------|-------------|---------|
| `UNIVERSAL_CREATURE_EXPERIENCE` | Default XP for creature kills | `50` |
| `UNIVERSAL_ACHIEVEVEMENT_EXPERIENCE` | Default XP for achievements | `100` |
| `UNIVERSAL_SKILL_EXPERIENCE` | Default XP for skill increases | `25` |
| `UNIVERSAL_QUEST_EXPERIENCE` | Default XP for quest completion | `75` |

### Experience Multipliers

| Field | Description | Default |
|-------|-------------|---------|
| `EXPERIENCE_MULTIPLIER_LOW_LEVEL` | Bonus multiplier for low-level paragons | `1.5` |
| `EXPERIENCE_MULTIPLIER_HIGH_LEVEL` | Penalty multiplier for high-level paragons | `0.8` |
| `LOW_LEVEL_THRESHOLD` | Paragon level below which bonus applies | `5` |
| `HIGH_LEVEL_THRESHOLD` | Paragon level above which penalty applies | `100` |

### Other Settings

| Field | Description | Default |
|-------|-------------|---------|
| `DEFAULT_STAT_LIMIT` | Maximum points per individual stat (1-255) | `255` |

### Adding Custom Stats

1. Add categories to `paragon_config_category`
2. Define statistics in `paragon_config_statistic`
3. Configure `type`, `factor`, and `limit` for each stat

**Stat Configuration Fields:**
- `type`: `AURA`, `COMBAT_RATING`, or `UNIT_MODS`
- `type_value`: The specific stat ID from Constants
- `factor`: Multiplier for each point invested
- `limit`: Maximum points that can be invested (max 255)
- `application`: How the stat bonus is applied

---

## 🎮 Stat Types

<table>
<tr>
<td width="33%">

### ⚔️ **Combat Rating**
- Weapon Skill
- Defense / Dodge / Parry / Block
- Hit (Melee/Ranged/Spell)
- Crit (Melee/Ranged/Spell)
- Haste (Melee/Ranged/Spell)
- Expertise
- Armor Penetration

</td>
<td width="33%">

### 💪 **Unit Modifiers**
- Primary Stats (Str/Agi/Sta/Int/Spi)
- Resources (HP/Mana/Rage/Energy/etc)
- Armor & Resistances
- Attack Power
- Damage (Mainhand/Offhand/Ranged)

</td>
<td width="33%">

### ✨ **Aura Bonuses**
- Loot Bonus (1900000)
- Reputation Gain (1900001)
- Experience Gain (1900002)

*Custom aura IDs: 1900000+*

</td>
</tr>
</table>

---

## 🔧 Technical Details

### Design Patterns
- **Singleton Pattern**: Config and Repository services
- **Repository Pattern**: Database abstraction layer
- **Object-Oriented**: Using classic.lua library

### Database
- **Async Queries**: Non-blocking database operations
- **Auto-Migration**: Tables created automatically on startup
- **Normalized Schema**: Separated config and character data

### Client Communication
- **Protocol**: `ParagonAnniversary` addon prefix
- **Commands**:
  - `1`: Load paragon data (sends level, experience, and all statistics)
  - `2`: Update statistics (receives updated stat values from client)

### Event Hooks
- **PLAYER_EVENT_ON_LOGIN (3)**: Load paragon data on login
- **PLAYER_EVENT_ON_LOGOUT (4)**: Save paragon data on logout
- **PLAYER_EVENT_ON_KILL_CREATURE (7)**: Award paragon experience for creature kills
- **PLAYER_EVENT_ON_ACHIEVEMENT_COMPLETE (45)**: Award paragon experience for achievements
- **PLAYER_EVENT_ON_QUEST_COMPLETE (54)**: Award paragon experience for quests
- **PLAYER_EVENT_ON_SKILL_UPDATE (62)**: Award paragon experience for skill increases
- **SERVER_EVENT_ON_LUA_STATE_OPEN (33)**: Reload paragon data for all players when Lua state opens
- **SERVER_EVENT_ON_LUA_STATE_CLOSE (16)**: Save paragon data for all players when Lua state closes

---

## 🎓 Experience & Points System

### Experience Sources
Paragon experience is awarded from multiple activities:
- **🐉 Creatures**: Kill monsters and bosses
- **🏆 Achievements**: Complete achievement goals
- **📜 Quests**: Complete quests
- **🎯 Skills**: Increase character skills

Experience rewards are configurable per source with:
- **Universal default**: Base experience reward value for each source type
- **Specific rewards**: Custom experience values per creature/achievement/quest/skill ID (overrides universal default)

### Points System
- **Earning**: Players earn a configurable number of points per paragon level (`POINTS_PER_LEVEL`)
- **Available Points**: Points = (Level × Points Per Level) - (Total Points Spent)
- **Investing**: Allocate points to statistics with configured limits per stat (max 255 points each)
- **Validation**: Server validates all point allocations before applying stat bonuses

---

## 📚 Documentation

The Paragon System includes comprehensive documentation:

### Code Documentation

All code is fully documented with **LuaDoc** comments:

```lua
--- Adds points to the available paragon points
-- @param points The amount of points to add
-- @return Self for method chaining
function Paragon:AddPoints(points)
    return self:SetPoints(self:GetPoints() + points)
end

--- Retrieves the paragon experience reward for a creature by entry ID
-- @param entry The creature entry ID
-- @return The experience reward value or nil if not configured
function Config:GetCreatureExperience(entry)
    return self.experience.creature[entry]
end
```

### Documentation Files

Complete guides and API documentation are available in the `doc/` directory:

- **[Installation Guide](doc/INSTALL.md)** - Step-by-step installation and configuration
- **[Hook Reference](doc/HOOKS.md)** - Complete Mediator hooks specification
- **[Module Development](doc/MODULES.md)** - Guide for creating custom modules
- **[Libraries](doc/LIBRARIES.md)** - Documentation for Classic, CSMH, and Mediator
- **[Development Roadmap](doc/TODO.md)** - Planned features and development tasks

---

## 📊 Compatibility

### Emulator Support

| Emulator | Version | Status | Notes |
|----------|---------|--------|-------|
| 🎮 **AzerothCore** | 3.3.5a | ✅ **Supported** | Primary development platform |
| 🌙 **ElunaTrinityWotlk** | 3.3.5a | 📅 **Planned** | Port scheduled after AzerothCore stabilization |

### Required Dependencies

| Component | Version | Status |
|-----------|---------|--------|
| 🔧 **ALE** | Latest | ✅ **Required** |
| 📚 **Classic** | Any | ✅ **Required** |
| 🔌 **CSMH** | Any | ✅ **Required** |

---

## 📁 Project Structure

```
paragon/
├── lib/
│   ├── classic/
│   │   └── classic.ext             # OOP library
│   ├── Mediator/
│   │   └── mediator.lua            # Event system
│   └── CSMH/
│       └── SMH.ext
├── modules/
│   ├── paragon_anniversary.lua     # Experience & level-up mechanics
│   └── README.md                   # Module documentation
├── paragon_constant.lua            # Constants, SQL queries, stat enums
├── paragon_repository.lua          # Database access layer (Singleton)
├── paragon_config.lua              # Configuration service (Singleton)
├── paragon_class.lua               # Paragon entity & business logic
├── paragon_hook.lua                # Event handlers & entry point
└── README.md                       # This file

doc/
├── INSTALL.md                      # Installation guide
├── HOOKS.md                        # Complete hook documentation
├── MODULES.md                      # Module development guide
└── LIBRARIES.md                    # Libraries documentation (Classic, CSMH, Mediator)
```

---

## 🔄 Data Flow

```
Player Login
    ↓
Hook.OnPlayerLogin (paragon_hook.lua)
    ↓
Create Paragon Instance (paragon_class.lua)
    ↓
Load Level & Statistics from DB (paragon_repository.lua)
    ↓
Callback: Hook.OnPlayerStatLoad
    ↓
Apply Statistics to Player & Send Data to Client (ParagonAnniversary addon)
```

---

## 🎯 Recent Improvements

### Latest Features (Latest Release)
- ✅ **Dual-Mode System**: Character-linked and account-linked paragon progression
- ✅ **Mediator Pattern Integration**: Extensible event system for custom modules
- ✅ **Module System**: Modular business logic via `paragon_anniversary.lua`
- ✅ **Robust Error Handling**: Fallback defaults for all configuration values
- ✅ **Complete Documentation**: HOOKS.md with all Mediator events documented
- ✅ **Advanced Routing**: Runtime table selection based on LEVEL_LINKED_TO_ACCOUNT

### Architecture Highlights
- **Singleton Pattern**: Config and Repository are single instances
- **Repository Pattern**: Clean database abstraction layer
- **Mediator Pattern**: Decoupled event-driven architecture
- **Object-Oriented Design**: Using classic.lua for OOP

---

## 🏆 Credits

- 🔧 **Development**: Custom system for AzerothCore
- 🎨 **Concept**: Inspired by Diablo 3 Paragon systems
- 🙏 **Thanks**: AzerothCore & ALE communities

---

<div align="center">

### ⚡ **Ready to add endless progression?**

*Stable serverside system ready for production use on AzerothCore with ALE*

</div>
