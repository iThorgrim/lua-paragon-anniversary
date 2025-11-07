
local Constants     = require("paragon_constant")

local Repository    = Object:extend()
local Instance      = nil

-- String format shorthand
local sf = string.format

--- Constructor for the Repository
-- Executes database migrations on initialization
function Repository:new()
    self:ExecuteMigration()
end

--- Executes database migrations
-- Creates all necessary tables for configuration and paragon data if they don't exist
function Repository:ExecuteMigration()
    -- Create table for config if needed
    CharDBExecute(sf(Constants.QUERY.CR_TABLE_CONFIG_CAT, Constants.DB_NAME))
    CharDBExecute(sf(Constants.QUERY.CR_TABLE_CONFIG_STAT, Constants.DB_NAME, Constants.DB_NAME))
    CharDBExecute(sf(Constants.QUERY.CR_TABLE_CONFIG, Constants.DB_NAME))

    -- Create table for paragon data if needed
    CharDBExecute(sf(Constants.QUERY.CR_TABLE_PARA, Constants.DB_NAME))
    CharDBExecute(sf(Constants.QUERY.CR_TABLE_PARA_STAT, Constants.DB_NAME))

    -- Create trigger for config
    CharDBExecute(sf(Constants.QUERY.CT_TRIGGER_BU_CONFIG_STAT, Constants.DB_NAME, Constants.DB_NAME))
    CharDBExecute(sf(Constants.QUERY.CT_TRIGGER_BI_CONFIG_STAT, Constants.DB_NAME, Constants.DB_NAME))
end

--- Retrieves all paragon configuration categories from the database
-- @return Table of categories indexed by category ID, or false if query fails
function Repository:GetConfigCategories()
    local results = CharDBQuery(sf(Constants.QUERY.SEL_CONFIG_CAT, Constants.DB_NAME))
    if not results then return false end

    local categories = {}

    repeat
        local cat_id = results:GetUInt32(0)
        local cat_name = results:GetString(1)
        categories[cat_id] = cat_name
    until not results:NextRow()

    return categories
end

--- Retrieves all paragon configuration statistics from the database
-- @return Table of statistics organized by category, or false if query fails
function Repository:GetConfigStatistics()
    local results = CharDBQuery(sf(Constants.QUERY.SEL_CONFIG_STAT, Constants.DB_NAME))
    if not results then return false end

    local statistics = {}

    repeat
        local stat_id           = results:GetUInt32(0)
        local stat_cat          = results:GetUInt32(1)
        local stat_type         = results:GetString(2)
        local stat_value        = results:GetString(3)
        local stat_icon         = results:GetString(4)
        local stat_factor       = results:GetUInt32(5)
        local stat_limit        = results:GetUInt32(6)
        local stat_application  = results:GetUInt32(7)

        statistics[stat_cat] = statistics[stat_cat] or { }
        statistics[stat_cat][stat_id] = {
            type        = stat_type,
            value       = stat_value,
            icon        = stat_icon,
            factor      = stat_factor,
            limit       = stat_limit,
            application = stat_application
        }
    until not results:NextRow()

    return statistics
end

--- Processes experience query results into a key-value table
-- @param results The database query results
-- @return Table mapping entry IDs to experience values
local function ProcessTypeExperience(results)
    local data = {}
    repeat
        local entry = results:GetUInt32(0)
        local experience = results:GetUInt32(1)

        data[entry] = experience
    until not results:NextRow()
    return data
end

--- Retrieves paragon experience rewards for creature kills
-- @return Table mapping creature entry IDs to experience rewards, or false if query fails
function Repository:GetConfigCreatureExperience()
    local results = CharDBQuery(sf(Constants.QUERY.SEL_CONFIG_EXP_CREATURE, Constants.DB_NAME))
    if not results then return false end

    return ProcessTypeExperience(results)
end

--- Retrieves paragon experience rewards for achievements
-- @return Table mapping achievement IDs to experience rewards, or false if query fails
function Repository:GetConfigAchievementExperience()
    local results = CharDBQuery(sf(Constants.QUERY.SEL_CONFIG_EXP_ACHIEVEMENT, Constants.DB_NAME))
    if not results then return false end

    return ProcessTypeExperience(results)
end

--- Retrieves paragon experience rewards for skill increases
-- @return Table mapping skill IDs to experience rewards, or false if query fails
function Repository:GetConfigSkillExperience()
    local results = CharDBQuery(sf(Constants.QUERY.SEL_CONFIG_EXP_SKILL, Constants.DB_NAME))
    if not results then return false end

    return ProcessTypeExperience(results)
end

--- Retrieves paragon experience rewards for quest completion
-- @return Table mapping quest IDs to experience rewards, or false if query fails
function Repository:GetConfigQuestExperience()
    local results = CharDBQuery(sf(Constants.QUERY.SEL_CONFIG_EXP_QUEST, Constants.DB_NAME))
    if not results then return false end

    return ProcessTypeExperience(results)
end

--- Asynchronously retrieves paragon level and experience data for a character
-- @param guid The character's GUID
-- @param callback Function to be called with the retrieved data
function Repository:GetParagonByCharacter(guid, callback)
    CharDBQueryAsync(sf(Constants.QUERY.SEL_PARA, Constants.DB_NAME, guid), function(results)
        local data = {}
        if results then
            repeat
                data.level = results:GetUInt32(0)
                data.current_experience = results:GetUInt32(1)
            until not results:NextRow()
        end

        callback(data)
    end)
end

--- Asynchronously retrieves paragon statistics for a character
-- @param guid The character's GUID
-- @param callback Function to be called with the retrieved statistics data
function Repository:GetParagonStatByCharacter(guid, callback)
    CharDBQueryAsync(sf(Constants.QUERY.SEL_PARA_STAT, Constants.DB_NAME, guid), function(results)
        local data = {}
        if results then
            repeat
                local stat_id = results:GetUInt32(0)
                local stat_value = results:GetUInt32(1)

                data[stat_id] = stat_value
            until not results:NextRow()
        end

        callback(data)
    end)
end

--- Retrieves all general configuration settings
-- @return Table of configuration fields and values, or false if query fails
function Repository:GetConfig()
    local results = CharDBQuery(sf(Constants.QUERY.SEL_CONFIG, Constants.DB_NAME))
    if not results then return false end

    local config = {}

    repeat
        local conf_field = results:GetString(0)
        local conf_value = results:GetString(1)

        config[conf_field] = conf_value
    until not results:NextRow()

    return config
end

--- Saves paragon statistics for a character to the database
-- Persists all stat investments for a character
-- @param guid The character's GUID
-- @param statistics Table of statistics indexed by stat_id with stat_value
function Repository:SaveParagonCharacterStat(guid, statistics)
    for stat_id, stat_value in pairs(statistics) do
        CharDBExecute(sf(Constants.QUERY.INS_PARA_STAT, Constants.DB_NAME, guid, stat_id, stat_value))
    end
end

--- Gets the singleton instance of Repository
-- Creates a new instance if one doesn't exist yet
-- @return The Repository singleton instance
function Repository:GetInstance()
    if (not Instance) then
        Instance = Repository()
    end

    return Instance
end

return Repository:GetInstance()