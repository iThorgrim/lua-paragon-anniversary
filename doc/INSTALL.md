# 📦 Paragon System Installation Guide

Complete installation instructions for the **Paragon System** on AzerothCore with ALE.

---

## 📋 Prerequisites

Before installing the Paragon System, ensure you have:

- ✅ **AzerothCore** 3.3.5a server running
- ✅ **ALE (Azeroth Lua Engine)** installed and configured
- ✅ **Database access** (MySQL/MariaDB) with appropriate credentials
- ✅ **World of Warcraft 3.3.5a client** for testing
- ✅ Git or file explorer for copying files

### Required Dependencies

The system requires these libraries to be present in your ALE scripts directory:
- **classic.lua** - Object-Oriented Programming library
- **CSMH** - Client-Server Message Handler framework
- **Mediator** - Event-driven architecture pattern

All dependencies are included in the project.

---

## 🚀 Server-Side Installation (Lua Scripts)

### Step 1: Copy the Paragon Folder

Copy the entire `paragon` folder to your ALE scripts directory:

```bash
# Typical AzerothCore ALE scripts location:
cp -r paragon /path/to/lua_scripts/
```

**Directory structure after copy:**
```
your_ale_scripts_directory/
└── paragon/
    ├── lib/
    │   ├── classic/
    │   ├── Mediator/
    │   └── CSMH/
    ├── modules/
    │   └── paragon_anniversary.lua
    ├── paragon_class.lua
    ├── paragon_config.lua
    ├── paragon_constant.lua
    ├── paragon_hook.lua
    ├── paragon_repository.lua
    └── HOOKS.md
```

### Step 2: Verify ALE Configuration

Ensure your ALE configuration in `mod-ale.conf` includes:

```ini
# Lua Engine settings
ALE.Enabled = 1
ALE.ScriptPath = "lua_scripts"
```

### Step 3: Start the Server

Restart your AzerothCore server. The system will automatically:

1. ✅ Load the Paragon scripts
2. ✅ Create all required database tables
3. ✅ Initialize default configuration values
4. ✅ Load configuration from the database

```bash
# Restart AzerothCore
./worldserver
```

Monitor the server console for any error messages related to Paragon initialization.

### Step 4: Verify Installation

Check the database to confirm tables were created:

```sql
-- Connect to your AzerothCore database
USE acore_ale;  -- or your world database name

-- Verify paragon configuration tables exist
SHOW TABLES LIKE 'paragon%';

-- Expected tables:
-- paragon_config
-- paragon_config_category
-- paragon_config_experience_achievement
-- paragon_config_experience_creature
-- paragon_config_experience_quest
-- paragon_config_experience_skill
-- paragon_config_statistic
-- character_paragon
-- character_paragon_stats
-- account_paragon  (if using account-linked mode)
```

---

## ⚙️ Initial Configuration

### Access the Database Configuration

The Paragon System configuration is stored in the `paragon_config` table. You can modify settings while the server is running:

```sql
-- View all current configuration
SELECT * FROM paragon_config;

-- Update a specific setting
UPDATE paragon_config SET value = '500' WHERE field = 'BASE_MAX_EXPERIENCE';
```

### Essential Configuration Options

#### Enable/Disable the System

```sql
UPDATE paragon_config
SET value = '1'
WHERE field = 'ENABLE_PARAGON_SYSTEM';

-- 1 = Enabled (default)
-- 0 = Disabled (system won't function)
```

#### Choose Progression Mode

```sql
UPDATE paragon_config
SET value = '0'
WHERE field = 'LEVEL_LINKED_TO_ACCOUNT';

-- 0 = Character-linked (default) - Each character has independent progression
-- 1 = Account-linked - All characters share level/XP but have separate stat investments
```

#### Set Paragon Level Cap

```sql
UPDATE paragon_config
SET value = '999'
WHERE field = 'PARAGON_LEVEL_CAP';

-- 0 = Unlimited (default)
-- Any positive number = Maximum achievable paragon level
```

### Configure Experience Rewards

Set how much paragon experience players earn from different activities:

```sql
-- Creature kills (default: 50)
UPDATE paragon_config SET value = '50' WHERE field = 'UNIVERSAL_CREATURE_EXPERIENCE';

-- Achievements (default: 100)
UPDATE paragon_config SET value = '100' WHERE field = 'UNIVERSAL_ACHIEVEVEMENT_EXPERIENCE';

-- Skill increases (default: 25)
UPDATE paragon_config SET value = '25' WHERE field = 'UNIVERSAL_SKILL_EXPERIENCE';

-- Quest completion (default: 75)
UPDATE paragon_config SET value = '75' WHERE field = 'UNIVERSAL_QUEST_EXPERIENCE';
```

### Configure Progression Speed

```sql
-- Base experience per paragon level (multiplied by level)
UPDATE paragon_config SET value = '1000' WHERE field = 'BASE_MAX_EXPERIENCE';

-- Points awarded per level
UPDATE paragon_config SET value = '1' WHERE field = 'POINTS_PER_LEVEL';

-- Starting level for new characters
UPDATE paragon_config SET value = '1' WHERE field = 'PARAGON_STARTING_LEVEL';
```

### Configure Experience Multipliers

```sql
-- Bonus for low-level paragons
UPDATE paragon_config SET value = '1.5' WHERE field = 'EXPERIENCE_MULTIPLIER_LOW_LEVEL';

-- Paragon level threshold for low-level bonus
UPDATE paragon_config SET value = '5' WHERE field = 'LOW_LEVEL_THRESHOLD';

-- Penalty for high-level paragons
UPDATE paragon_config SET value = '0.8' WHERE field = 'EXPERIENCE_MULTIPLIER_HIGH_LEVEL';

-- Paragon level threshold for high-level penalty
UPDATE paragon_config SET value = '100' WHERE field = 'HIGH_LEVEL_THRESHOLD';
```

---

## 🎮 Client-Side Installation (UI/Addon)

### Status
The client-side UI is currently **in development**. Basic functionality is working, but some advanced features are still being completed.

### Installation (When Available)

#### As a Patch/FrameXML

1. Copy the client-side files to a `Patch-4.MPQ` patch directory
2. Test in game

---

## 🧪 Testing the Installation

### Verify Server-Side is Working

1. **Create a test character** on your server
2. **Gain experience** by:
   - Killing creatures
   - Completing quests
   - Completing achievements
   - Increasing skills
3. **Check database** for paragon progression:

```sql
-- Check character paragon data
SELECT * FROM character_paragon WHERE guid = YOUR_CHARACTER_GUID;

-- Check invested statistics
SELECT * FROM character_paragon_stats WHERE guid = YOUR_CHARACTER_GUID;
```

### Expected Server Output

When a player gains paragon experience, you should see:
- Level increases reflected in the database
- Experience accumulation toward the next level
- Points awarded per level
- Stat modifiers applied

### Verify Client-Side is Working

Once the client addon is complete:
1. Log in to the game
2. Verify you can see:
   - Current paragon level
   - Experience progress bar
   - Available points
   - Stat allocation interface

---

## 🔧 Troubleshooting

### Tables Not Created

**Problem**: Database tables don't exist after server restart

**Solutions**:
```sql
-- Check if tables exist
SHOW TABLES LIKE 'paragon%';

-- If missing, manually run creation script
-- (Usually auto-created, but you can run the SQL from paragon_constant.lua)
```

### Experience Not Being Awarded

**Problem**: Players gain creature kills but no paragon XP

**Solutions**:
1. Check if system is enabled:
```sql
SELECT value FROM paragon_config WHERE field = 'ENABLE_PARAGON_SYSTEM';
-- Should return: 1
```

2. Verify player meets minimum level requirement:
```sql
SELECT value FROM paragon_config WHERE field = 'MINIMUM_LEVEL_FOR_PARAGON_XP';
```

3. Check ALE logs for errors

### Configuration Changes Not Taking Effect

**Problem**: Config updates don't apply immediately

**Solutions**:
- The system caches config on server startup
- For changes to take effect immediately, either:
  - Reload Lua scripts: `.reload ale` (if command is available)
  - Restart the server

### Player Data Not Saving

**Problem**: Paragon progress is lost on logout

**Solutions**:
1. Check character_paragon table exists
2. Verify player logout hook is firing
3. Check database permissions (INSERT/UPDATE rights)

### Addon Communication Errors

**Problem**: Client-server communication failing

**Solutions**:
- Verify addon prefix matches: `ParagonAnniversary`
- Check CSMH library is properly loaded
- Review ALE error logs

---

## 📚 Additional Configuration

### Adding Custom Statistics

See [README.md](../README.md#adding-custom-stats) for detailed instructions on adding custom paragon statistics.

### Configuring Experience Per Creature/Achievement/Quest

You can set custom experience rewards for specific creatures, achievements, quests, or skills:

```sql
-- Add custom experience reward for a creature (overrides universal default)
INSERT INTO paragon_config_experience_creature (entry, experience)
VALUES (1, 500);  -- Creature entry 1 grants 500 paragon XP

-- Same for other sources:
-- paragon_config_experience_achievement
-- paragon_config_experience_quest
-- paragon_config_experience_skill
```

---

## 📖 Next Steps

1. **Read the main documentation**: [README.md](../README.md)
2. **Learn about hooks/extensibility**: [HOOKS](HOOKS.md)
3. **Create custom modules**: [MODULES](MODULES.md)
4. **Configure your server** according to your needs
5. **Test thoroughly** before deploying to production

---

## 🆘 Getting Help

If you encounter issues:

1. **Check the documentation**: README.md, HOOKS.md, modules/README.md
2. **Review server console** for error messages
3. **Check database tables** to verify installation
4. **Open an issue** on the project repository with:
   - Your AzerothCore version
   - ALE version
   - Error messages (full stack trace)
   - Steps to reproduce the problem

---

<div align="center">

### 🎉 **Installation Complete!**

Your Paragon System is now ready for use. Enjoy endless progression!

**[Back to README](../README.md)**

</div>
