--[[
    Paragon_Network.lua
    Server communication and data management for Paragon Anniversary system

    This module handles all network communication between the client and server,
    manages the local ParagonData cache, and implements a debounce system to
    batch stat changes and prevent server spam.

    Key responsibilities:
    - Register and handle server responses (7 hooks)
    - Store categories, stats, and available points data
    - Queue and batch stat modifications with 3-second debounce
    - Update UI elements when server data is received

    @module Paragon_Network
    @author Paragon Team
]]

--- Global data store for all Paragon Anniversary information
-- This table is updated by server responses and read by the UI layer
-- @table ParagonData
-- @field categories table Array of category definitions {id, nameKey, order}
-- @field stats table Map of categoryId -> array of stat definitions {id, nameKey, descKey, icon, value}
-- @field availablePoints number Points the player can spend on stats
ParagonData = {
    categories = {},
    stats = {},
    availablePoints = 0
}

--- Pending changes queue for stat modifications
-- Implements a debounce system to batch multiple stat changes into a single
-- server request after 1 seconds of inactivity
-- @table PendingChanges
-- @field stats table Map of "categoryId_statId" -> {categoryId, statId, value}
-- @field timer table|nil C_Timer handle for the debounce timer
-- @field delay number Delay in seconds before sending (default: 1)
-- @field lastUpdate number Timestamp of last modification (unused, reserved for future use)
PendingChanges = {
    stats = {},
    timer = nil,
    delay = 1,
    lastUpdate = 0
}

local Locale = GetLocaleTable()

-- ============================================================================
-- ADDON REGISTRATION
-- ============================================================================

--- Addon registration table for server communication
-- Maps hook IDs to callback function names
-- @table Addon
-- @field Prefix string Protocol identifier used by server ("ParagonAnniversary")
-- @field Functions table Map of hook ID -> function name for server responses
local Addon = {
    Prefix = "ParagonAnniversary",
    Functions = {
        [1] = "UIParagon_OnClientReceiveLevel",       -- Receive player level update
        [2] = "UIParagon_OnClientReceiveXP",          -- Receive XP bar update
        [3] = "UIParagon_OnReceiveAllData",           -- Receive all data in bulk
        [4] = "UIParagon_OnReceiveAvailablePoints",   -- Receive available points to spend
        [5] = "UIParagon_OnReceiveStatistic",         -- Receive amount for specific statistic
    }
}

-- Register all server response handlers with the addon system
RegisterServerResponses(Addon)

-- ============================================================================
-- LOCAL FUNCTIONS
-- ============================================================================

--- Handles individual stat definitions
-- Receives stat data and stores in ParagonData.stats organized by categoryId
-- Looks up localized name/description from Locale.STATISTICS table
-- @param statistics table Nested structure: {[stat_id] = {type, value, icon, assigned, category}}
-- @param cat_id number Category ID to assign these stats to (can be nil if in stat_data)
-- @usage Called by UIParagon_OnReceiveCategories when stats are embedded, or standalone
local function OnReceiveStat(statistics, cat_id)
    for stat_id, stat_data in pairs(statistics) do
        local categoryId = cat_id or stat_data.category
        local statId = stat_id

        -- Look up localized name and description from STATISTICS locale table
        local nameKey = Locale.STATISTICS[stat_data.type][stat_data.value].name
        local descKey = Locale.STATISTICS[stat_data.type][stat_data.value].description

        local icon = stat_data.icon
        local value = stat_data.assigned or 0
        local limit = stat_data.limit or 255  -- Default: no practical limit

        -- Initialize category stats array if it doesn't exist
        if not ParagonData.stats[categoryId] then
            ParagonData.stats[categoryId] = {}
        end

        -- Store stat data in category-specific array
        table.insert(ParagonData.stats[categoryId], {
            id = statId,
            nameKey = nameKey,
            descKey = descKey,
            icon = icon,
            value = value,
            limit = limit  -- Maximum allowed value for this stat
        })
    end
end

--- Updates the points display in the UI
-- Shows formatted text with singular/plural handling based on current locale
-- Only updates if UIParagon frame is visible
-- @usage Called automatically when points are received
local function UpdateAvailablePointsDisplay()
    -- Early exit if UI is not visible or frame doesn't exist
    if not UIParagon then return end

    local pointsFrame = UIParagon.Body.TopSpacer.Points
    if not pointsFrame then return end

    local Locales = GetLocaleTable()
    local points = ParagonData.availablePoints

    -- Choose singular or plural form based on point count
    local pointWord = (points == 1) and Locales.POINTS_SINGULAR or Locales.POINTS_PLURAL
    local text = string.format(Locales.POINTS_TO_SPEND, points, pointWord)

    pointsFrame:SetText(text)
end

-- ============================================================================
-- SERVER RECEIVE FUNCTIONS
-- ============================================================================

--- Handles player level update from server (Hook ID: 1)
-- Updates the level display in the top banner
-- @param player table Player object (provided by server, unused in this context)
-- @param arg_table table Arguments from server: {level}
-- @usage Server call: SendClientRequest("ParagonAnniversary", 1, {500})
function UIParagon_OnClientReceiveLevel(player, arg_table)
    local level = arg_table[1]
    if UIParagon and UIParagon.TopBanner and UIParagon.TopBanner.Level then
        UIParagon.TopBanner.Level.Text:SetText(level)
    end
end

--- Handles experience update from server (Hook ID: 2)
-- Updates the experience bar display with current/max XP values
-- @param player table Player object (provided by server, unused in this context)
-- @param arg_table table Arguments from server: {currentXP, maxXP}
-- @usage Server call: SendClientRequest("ParagonAnniversary", 2, {75, 150})
function UIParagon_OnClientReceiveXP(player, arg_table)
    local currentXP = arg_table[1]
    local maxXP = arg_table[2]
    if UIParagon and UIParagon.TopBanner and UIParagon.TopBanner.ExperienceBar then
        UIParagonExperienceBar_SetExperience(UIParagon.TopBanner.ExperienceBar, currentXP, maxXP)
    end
end

--- Handles category definitions from server (Hook ID: 3)
-- Receives category data line-by-line and stores in ParagonData.categories
-- Automatically triggers UI rebuild after processing all categories
-- @param player table Player object (provided by server, unused)
-- @param arg_table table Nested structure: {[cat_id] = {name = string, statistics = table}}
-- @usage Server sends categories with embedded stats, this function processes both
function UIParagon_OnReceiveAllData(player, arg_table)
    for cat_id, cat_data in pairs(arg_table[1]) do
        local categoryId = cat_id
        local nameKey = cat_data.name
        local order = cat_id

        -- Try to convert name to locale key format (e.g., "defense" -> "DEFENSE_TEXT")
        local localeKey = string.upper(nameKey  .. "_TEXT")
        if (Locale[localeKey]) then
            nameKey = localeKey
        end

        -- Store category data
        table.insert(ParagonData.categories, {
            id = categoryId,
            nameKey = nameKey,
            order = order
        })

        -- Process embedded statistics if present
        if (cat_data.statistics) then
            OnReceiveStat(cat_data.statistics, cat_id)
        end
    end

    -- Sort categories by order field
    table.sort(ParagonData.categories, function(a, b) return a.order < b.order end)

    -- Rebuild UI to reflect new categories
    UIParagon_RebuildStatistics()
end

--- Handles available points update from server (Hook ID: 4)
-- Updates the points counter and refreshes UI display
-- @param player table Player object (provided by server, unused)
-- @param arg_table table Arguments: {points} or {points = number}
-- @usage Called when player spends or earns points
function UIParagon_OnReceiveAvailablePoints(player, arg_table)
    local points = arg_table[1] or arg_table.points or 0
    ParagonData.availablePoints = points
    UpdateAvailablePointsDisplay()
end

function UIParagon_OnReceiveStatistic(player, arg_table)
    local stat_data = arg_table[1]

    local id = stat_data.id
    local category_id = stat_data.category
    local value = stat_data.value

    for _, stat in ipairs(ParagonData.stats[category_id]) do
        if(stat.id == id) then
            stat.value = value
            break
        end
    end

    UIParagon_UpdateStatDisplay(category_id, id, value)
end

-- ============================================================================
-- CLIENT STAT MODIFICATION FUNCTIONS
-- ============================================================================

--- Modifies a stat value locally and queues change for server update
-- Updates the stat in ParagonData, adds to pending changes queue, updates UI,
-- and resets the debounce timer (3 seconds before sending to server)
-- @param categoryId number The category ID containing the stat
-- @param statId number The stat ID to modify
-- @param delta number Amount to add/subtract (can be negative)
-- @usage Called by mouse wheel, left click (+1), right click (-1) interactions
function UIParagon_ModifyStatValue(categoryId, statId, delta)
    -- Find the category's stats array
    local categoryStats = ParagonData.stats[categoryId]
    if not categoryStats then return end

    -- Find the specific stat by ID
    local stat = nil
    for _, s in ipairs(categoryStats) do
        if s.id == statId then
            stat = s
            break
        end
    end

    if not stat then return end

    -- Calculate new value (prevent negative values)
    local newValue = stat.value + delta
    if newValue < 0 then newValue = 0 end
    stat.value = newValue

    -- Queue change for server update (using composite key)
    local key = categoryId .. "_" .. statId
    PendingChanges.stats[key] = {
        categoryId = categoryId,
        statId = statId,
        value = newValue
    }

    -- Update UI display immediately for responsive feel
    UIParagon_UpdateStatDisplay(categoryId, statId, newValue)

    -- Reset debounce timer (waits 3 seconds after last change before sending)
    UIParagon_ResetDebounceTimer()
end

--- Updates the visual display of a stat value in the UI
-- Searches through all stat frames to find the matching categoryId/statId,
-- then updates the badge text with dynamic centering based on digit count
-- @param categoryId number The category ID containing the stat
-- @param statId number The stat ID to update
-- @param newValue number The new value to display
-- @usage Called by UIParagon_ModifyStatValue for immediate visual feedback
function UIParagon_UpdateStatDisplay(categoryId, statId, newValue)
    -- Get statistics container frame
    local statisticsList = UIParagon.Body.StatisticsList
    if not statisticsList then return end

    -- Iterate through category lines
    local children = {statisticsList:GetChildren()}
    for _, line in ipairs(children) do
        -- Iterate through stat frames in this line
        local statFrames = {line:GetChildren()}
        for _, statFrame in ipairs(statFrames) do
            -- Check if this is the target stat
            if statFrame.categoryId == categoryId and statFrame.statId == statId then
                if statFrame.Value and statFrame.Value.Text then
                    local valueText = tostring(newValue)
                    statFrame.Value.Text:SetText(valueText)

                    -- Dynamic horizontal offset based on digit count for better centering
                    local numDigits = string.len(valueText)
                    local xStatOffset = -1
                    if (numDigits == 1) then
                        xStatOffset = -0.5  -- Single digits need less offset
                    elseif (numDigits == 2) then
                        xStatOffset = -1    -- Two digits centered properly
                    end

                    -- Reposition text with calculated offset
                    statFrame.Value.Text:ClearAllPoints()
                    statFrame.Value.Text:SetPoint("CENTER", xStatOffset, 1)
                end
                return  -- Found and updated, exit early
            end
        end
    end
end

--- Resets the debounce timer to batch stat changes
-- Cancels any existing timer and creates a new one with 3-second delay
-- Multiple rapid changes reset the timer, so only the final state is sent
-- @usage Called by UIParagon_ModifyStatValue after each stat change
function UIParagon_ResetDebounceTimer()
    -- Cancel existing timer to restart the countdown
    if PendingChanges.timer then
        C_Timer.Cancel(PendingChanges.timer)
        PendingChanges.timer = nil
    end

    -- Create new timer that fires after delay (default: 3 seconds)
    PendingChanges.timer = C_Timer.After(PendingChanges.delay, function()
        UIParagon_SendPendingChanges()
    end)
end

--- Sends all pending stat changes to the server
-- Converts the pending changes map to an array and sends via SendClientRequest
-- Clears the pending changes queue and timer after sending
-- @usage Called automatically by debounce timer after 3 seconds of inactivity
function UIParagon_SendPendingChanges()
    -- Early exit if no pending changes
    if not PendingChanges.stats or not next(PendingChanges.stats) then
        return
    end

    -- Convert map of changes to array format expected by server
    local changes = {}
    for key, change in pairs(PendingChanges.stats) do
        table.insert(changes, {
            categoryId = change.categoryId,
            statId = change.statId,
            value = change.value
        })
    end

    -- Send batched changes to server (function 2)
    SendClientRequest(Addon.Prefix, 2, changes)

    -- Clear queue and timer after successful send
    PendingChanges.stats = {}
    PendingChanges.timer = nil
end