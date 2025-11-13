# 📋 Paragon System - Development Roadmap

Development tasks and planned features for the Paragon Anniversary system.

---

## 🎯 Priority Features

### 🔴 High Priority

#### Spell Management Without DBC

Create a dynamic spell system that doesn't rely on DBC files.

**Tasks:**
- [ ] Implement spell using spell_dbc table
- [ ] Apply spell bonuses correctly based on paragon stat investments
- [ ] **Ensure spell removal** when player removes invested points
  - [ ] Remove spells when points are deallocated
  - [ ] Handle edge cases (player logout/login during deallocation)
  - [ ] Test spell reapplication after character login

**Status:** Not Started

---

#### Client Anti-Spam System

Implement protection against spam requests from the client-side addon.

**Tasks:**
- [ ] Add `CLIENT_SPAM_PROTECTION_COOLDOWN` field to `paragon_config` table
  - [ ] Default value: 1s (seconds for making requests)
  - [ ] Make configurable per server needs
- [ ] **Send error messages to client**
  - [ ] Create error message system (error codes or text)
  - [ ] Provide feedback to user

**Status:** Not Started

---

### 🟡 Medium Priority

#### Module Configuration Extension

Allow custom modules to register and manage their own database fields.

**Tasks:**
- [ ] Design config field registration API
- [ ] Add module configuration system
  - [ ] Modules can declare required config fields
  - [ ] Automatic table schema updates
  - [ ] Version management for schema changes
- [ ] Document module config API
  - [ ] Update MODULES.md with config examples
  - [ ] Provide working examples
- [ ] Test with multiple modules simultaneously
- [ ] Handle config conflicts and validation

**Status:** Not Started

---

#### Production Testing & Stability

Comprehensive testing on high-population server environment.

**Tasks:**
- [ ] **Stability Testing**
  - [ ] Test with multiple online players

- [ ] **Reliability Testing**
  - [ ] Test with long uptime (48+ hours)

- [ ] **Performance Optimization** (if needed)
  - [ ] Optimize database queries
  - [ ] Consider caching strategies
  - [ ] Optimize Mediator event handling
  - [ ] Review Lua memory allocations

- [ ] **Bug Fixes**
  - [ ] Document and fix any issues found
  - [ ] Validate fixes in production environment

**Status:** Not Started

---

## 🟢 Low Priority / Future Features

### Code Refactoring & Quality

- [ ] Review code for optimization opportunities
- [ ] Simplify complex functions
- [ ] Reduce code duplication
- [ ] Improve error handling consistency
- [ ] Add more comprehensive logging

### Client-Side Enhancements

- [ ] Improve UI code
- [ ] Add animations for stat changes
- [ ] Create visual feedback for level-ups
- [ ] Implement profil menu
- [ ] Add talent tree visualization (Dragonflight UI / Wolcen UI)

### Server Features

- [ ] Add seasonal resets (optional)
- [ ] Create leaderboards
- [ ] Add achievement system integration
- [ ] Implement PvP-specific paragon adjustments

---

## 📊 Task Status Legend

| Symbol | Status | Description |
|--------|--------|-------------|
| ☐ | Not Started | Waiting to be implemented |
| ⚡ | In Progress | Currently being worked on |
| ✅ | Completed | Done and tested |
| ⚠️ | On Hold | Blocked or waiting for something |
| ❌ | Cancelled | Decided not to implement |

---

## 🔗 Related Documentation

- **[MODULES.md](MODULES.md)** - Module development guide (for module config extension)
- **[HOOKS.md](HOOKS.md)** - Hooks reference (useful for understanding interaction points)
- **[INSTALL.md](INSTALL.md)** - Installation guide (for production environment setup)
- **[README.md](../README.md)** - Main documentation

---

## 📈 Version Tracking

### Current Version: Beta

**Next Milestone:** v1.0.0 Stable Release

**Release Criteria:**
- ✅ All high priority features completed
- ✅ Production stability verified
- ✅ Performance optimizations done
- ✅ Documentation complete and accurate
- ✅ No critical bugs remaining

---

## 💬 Contributing

If you'd like to help with any of these tasks:

1. **Check the status** - Pick a task that's "Not Started"
2. **Claim the task** - Update the "Assigned to" field
3. **Create a branch** - Use task name (e.g., `feature/spell-management`)
4. **Update status** - Change to "In Progress" when working
5. **Submit PR** - When complete, change to "Completed"

---

<div align="center">

### 🚀 **Help Build the Future**

*Contributions welcome! Help us make Paragon Anniversary production-ready*

</div>
