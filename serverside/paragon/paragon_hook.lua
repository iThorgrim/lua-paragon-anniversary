local Paragon = require("paragon_class")
local Config = require("paragon_config")
local Constant = require("paragon_constant")

local Hook = {
    Addon = {
        Prefix = "ParagonAnniversary",
        Functions = {
            [1] = "OnClientLoadRequest",
            [2] = "OnClientSendStatistics"
        }
    }
}

-- =================== Local Functions ===================
--- Retrieves a player object if it exists
-- @param guid_low The low part of the player's GUID
-- @return The player object or false if not found
local function GetPlayerIfExist(guid_low)
    local guid = GetPlayerGUID(guid_low)
    if not guid then return false end

    local player = GetPlayerByGUID(guid)
    if not player then return false end

    return player
end

--- Updates player statistics modifiers based on paragon data
-- Applies or removes stat bonuses to the player's character
-- @param player The player object to update
-- @param paragon The paragon instance containing stat data
-- @param apply Boolean indicating whether to apply (true) or remove (false) the bonuses
local function UpdatePlayerStatistics(player, paragon, apply)
    if (not apply) then apply = false end

    local statistics = paragon:GetStatistics()

    for stat_id, stat_value in pairs(statistics) do
        local stat_data = Config:GetByStatId(stat_id)
        local constant_stat_type = Constant.STATISTICS[stat_data.type]

        if (stat_data and constant_stat_type) then
            if (stat_data.type == "UNIT_MODS") then
                player:HandleStatModifier(constant_stat_type[stat_data.value], stat_data.application, stat_value, apply)
            end
        end
    end
end

--- Updates player paragon experience based on source activity
-- Applies experience rewards and handles level ups when experience threshold is reached
-- @param player The player object
-- @param paragon The paragon instance to update
-- @param source_type The source type (1=creature, 2=achievement, 3=skill, 4=quest)
-- @param entry The source entry ID (creature ID, achievement ID, skill ID, or quest ID)
local function UpdatePlayerExperience(player, paragon, source_type, entry)
    local switch_universal_key = {
        [1] = "UNIVERSAL_CREATURE_EXPERIENCE",
        [2] = "UNIVERSAL_ACHIEVEVEMENT_EXPERIENCE",
        [3] = "UNIVERSAL_SKILL_EXPERIENCE",
        [4] = "UNIVERSAL_QUEST_EXPERIENCE"
    }

    local config_key = switch_universal_key[source_type] or "UNIVERSAL_CREATURE_EXPERIENCE"
    local universal_value = Config:GetByField(config_key)

    if (not universal_value) then return false end

    local switch_specific_value = {
        ["UNIVERSAL_CREATURE_EXPERIENCE"] = Config:GetCreatureExperience(entry),
        ["UNIVERSAL_ACHIEVEVEMENT_EXPERIENCE"] = Config:GetAchievementExperience(entry),
        ["UNIVERSAL_SKILL_EXPERIENCE"] = Config:GetSkillExperience(entry),
        ["UNIVERSAL_QUEST_EXPERIENCE"] = Config:GetQuestExperience(entry)
    }

    local specific_experience = switch_specific_value[config_key] or universal_value
    if (not specific_experience) then return false end

    local paragon_experience = paragon:GetExperience()
    local paragon_max_experience = paragon:GetExperienceForNextLevel()

    if (paragon_experience + specific_experience > paragon_max_experience) then
        paragon:AddLevel(1)
        paragon:SetExperience((paragon_experience + specific_experience) - paragon_max_experience)
        player:SendServerResponse(Hook.Addon.Prefix, 1, paragon:GetLevel())
        player:SendServerResponse(Hook.Addon.Prefix, 4, paragon:GetPoints())
    elseif (paragon_experience + specific_experience == paragon_max_experience) then
        paragon:AddLevel(1)
        paragon:SetExperience(0)
        player:SendServerResponse(Hook.Addon.Prefix, 1, paragon:GetLevel())
        player:SendServerResponse(Hook.Addon.Prefix, 4, paragon:GetPoints())
    else
        paragon:AddExperience(specific_experience)
    end

    player:SetData("Paragon", paragon)
    player:SendServerResponse(Hook.Addon.Prefix, 2, paragon:GetExperience(), paragon:GetExperienceForNextLevel())
end

--- Handles client request to load paragon data
-- Sends the player's paragon level and experience information to the client addon
-- @param player The player object making the request
-- @param _ Unused parameter
function OnClientLoadRequest(player, _)
    local paragon = player:GetData("Paragon")
    if (not paragon) then
        Hook.OnPlayerLogin(3, player)
        return false
    end

    player:SendServerResponse(Hook.Addon.Prefix, 1, paragon:GetLevel())
    player:SendServerResponse(Hook.Addon.Prefix, 4, paragon:GetPoints())
    player:SendServerResponse(Hook.Addon.Prefix, 2, paragon:GetExperience(), paragon:GetExperienceForNextLevel())

    local temp = Config:GetCategories()
    for _, category_data in pairs(temp) do
        local cat_stat = category_data.statistics
        if (cat_stat) then
            for stat_id, stat_data in pairs(cat_stat) do
                stat_data.assigned = paragon:GetStatValue(stat_id)
            end
        end
    end

    player:SendServerResponse(Hook.Addon.Prefix, 3, temp)
end

--- Handles client request to update paragon statistics
-- Validates and applies updated statistic values from the client addon
-- @param player The player object making the request
-- @param arg_table Table containing the statistics data to update
function OnClientSendStatistics(player, arg_table)
    local data = arg_table[1]
    if (not data) then
        -- Player attempted to send an empty packet
        player:SendNotification("ERROR.")
        return false
    end

    local paragon = player:GetData("Paragon")
    if (not paragon) then return false end

    -- Remove statistics temporarily during processing
    UpdatePlayerStatistics(player, paragon, false)

    for _, updated_data in pairs(data) do
        local category_id = updated_data.categoryId
        if (not category_id) then return false end

        local categories = Config:GetCategories()
        local category_data = categories[category_id]
        if (not category_data) then return false end

        local statistic_id = updated_data.statId
        if (not statistic_id) then return false end

        local statistic_data = category_data.statistics[statistic_id]
        if (not statistic_data) then return false end

        local statistic_value = updated_data.value
        if (not statistic_value or statistic_value < 0) then return false end

        if (statistic_data.limit > 0 and statistic_value > statistic_data.limit) then return false end

        -- TODO: Verify that the number of points spent matches available points
        local available_points = paragon:GetPoints()
        if (statistic_value > available_points) then return false end

        paragon:SetStatValue(statistic_id, statistic_value)
        paragon:SetPoints(available_points - statistic_value)
    end

    player:SetData("Paragon", paragon)
    -- Reapply statistics after processing
    UpdatePlayerStatistics(player, paragon, true)
    player:SendServerResponse(Hook.Addon.Prefix, 4, paragon:GetPoints())
end

--- Callback executed when player statistics data has been loaded from the database
-- @param guid_low The low part of the player's GUID
-- @param paragon The loaded paragon instance
function Hook.OnPlayerStatLoad(guid_low, paragon)
    local player = GetPlayerIfExist(guid_low)
    if (not player) then
        return false
    end

    player:SetData("Paragon", paragon)

    UpdatePlayerStatistics(player, paragon, true)

    -- Final step, update the UI
    OnClientLoadRequest(player)
end

--- Event handler triggered when a player logs into the server
-- Creates a new paragon instance and loads data from the database
-- @param event The event ID (3 = PLAYER_EVENT_ON_LOGIN)
-- @param player The player object that logged in
function Hook.OnPlayerLogin(event, player)
    local paragon = Paragon(player:GetGUIDLow())
    paragon:Load(Hook.OnPlayerStatLoad)

end

--- Event handler triggered when a player logs out of the server
-- Removes stat bonuses and saves paragon progress to the database
-- @param event The event ID (4 = PLAYER_EVENT_ON_LOGOUT)
-- @param player The player object that logged out
function Hook.OnPlayerLogout(event, player)
    local paragon = player:GetData("Paragon")
    if (not paragon) then return end

    UpdatePlayerStatistics(player, paragon, false)
    paragon:Save()
end

--- Event handler triggered when a player kills a creature
-- Awards paragon experience based on creature entry configuration
-- @param event The event ID (7 = PLAYER_EVENT_ON_KILL_CREATURE)
-- @param player The player object that killed the creature
-- @param creature The creature object that was killed
function Hook.OnPlayerKillCreature(event, player, creature)
    local paragon = player:GetData("Paragon")
    if (not paragon) then return end

    UpdatePlayerExperience(player, paragon, 1, creature:GetEntry())
end

--- Event handler triggered when a player completes an achievement
-- Awards paragon experience based on achievement configuration
-- @param event The event ID (45 = PLAYER_EVENT_ON_ACHIEVEMENT_COMPLETE)
-- @param player The player object that completed the achievement
-- @param achievement The achievement object that was completed
function Hook.OnPlayerAchievementComplete(event, player, achievement)
    local paragon = player:GetData("Paragon")
    if (not paragon) then return end

    UpdatePlayerExperience(player, paragon, 2, achievement:GetId())
end

--- Event handler triggered when a player completes a quest
-- Awards paragon experience based on quest configuration
-- @param event The event ID (54 = PLAYER_EVENT_ON_QUEST_COMPLETE)
-- @param player The player object that completed the quest
-- @param quest The quest object that was completed
function Hook.OnPlayerQuestComplete(event, player, quest)
    local paragon = player:GetData("Paragon")
    if (not paragon) then return end

    UpdatePlayerExperience(player, paragon, 4, quest:GetId())
end

--- Event handler triggered when a player increases a skill
-- Awards paragon experience based on skill configuration
-- @param event The event ID (62 = PLAYER_EVENT_ON_SKILL_UPDATE)
-- @param player The player object whose skill was updated
-- @param skill_id The skill ID that was updated
-- @param value Current skill value (unused)
-- @param max Maximum skill value (unused)
-- @param step Skill step increase (unused)
-- @param new_value New skill value (unused)
function Hook.OnPlayerSkillUpdate(event, player, skill_id, value, max, step, new_value)
    local paragon = player:GetData("Paragon")
    if (not paragon) then return end

    UpdatePlayerExperience(player, paragon, 3, skill_id)
end

--- Event handler triggered when the Lua state (world) is opened
-- Reloads paragon data for all players currently in the world
-- @param event The event ID (33 = SERVER_EVENT_ON_LUA_STATE_OPEN)
function Hook.OnLuaStateOpen(event)
    for _, player in pairs(GetPlayersInWorld()) do
        Hook.OnPlayerLogin(3, player)
    end
end

--- Event handler triggered when the Lua state (world) is closed
-- Saves paragon data for all players currently in the world
-- @param event The event ID (16 = SERVER_EVENT_ON_LUA_STATE_CLOSE)
function Hook.OnLuaStateClose(event)
    for _, player in pairs(GetPlayersInWorld()) do
        Hook.OnPlayerLogout(4, player)
    end
end

--- Event handler triggered when a player enters a command
-- Handles test command for paragon system debugging
-- @param event The event ID (42 = PLAYER_EVENT_ON_COMMAND)
-- @param player The player object executing the command
-- @param command The command string entered by the player
function Hook.OnPlayerCommand(event, player, command)
    if (command == "test") then
        local paragon = player:GetData("Paragon")
        UpdatePlayerStatistics(player, paragon, false)

        paragon:AddStatValue(1, 150)
        player:SetData("Paragon", paragon)

        local constant_stat_type = Constant.STATISTICS["UNIT_MODS"]
        UpdatePlayerStatistics(player, paragon, true)
        return false
    end
end
RegisterPlayerEvent(42, Hook.OnPlayerCommand)

-- ================= REGISTER ALE/ELUNA EVENT =================

-- Player Events
RegisterPlayerEvent(3, Hook.OnPlayerLogin)
RegisterPlayerEvent(4, Hook.OnPlayerLogout)
RegisterPlayerEvent(7, Hook.OnPlayerKillCreature)
RegisterPlayerEvent(45, Hook.OnPlayerAchievementComplete)
RegisterPlayerEvent(54, Hook.OnPlayerQuestComplete)
RegisterPlayerEvent(62, Hook.OnPlayerSkillUpdate)

-- Server Events
RegisterServerEvent(33, Hook.OnLuaStateOpen)
RegisterServerEvent(16, Hook.OnLuaStateClose)

-- CSMH Events
RegisterClientRequests(Hook.Addon)