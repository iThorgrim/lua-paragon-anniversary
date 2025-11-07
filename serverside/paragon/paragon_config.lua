local Repository = require("paragon_repository")

local Config = Object:extend()
local Instance = nil

--- Constructor for the Config
-- Initializes the service by building paragon data and loading configuration
function Config:new()
    -- Build category / stat data
    self:BuildParagonData()
    -- Build experience data
    self:BuildParagonExperience()

    local config_data = Repository:GetConfig()
    self.config = config_data
end

--- Retrieves a configuration value by field name
-- @param field The configuration field name to retrieve
-- @return The configuration value or nil if not found
function Config:GetByField(field)
    return self.config[field] or nil
end

--- Retrieves all paragon categories
-- @return Table containing all categories with their statistics
function Config:GetCategories()
    return self.categories
end

--- Retrieves a specific category by its ID
-- @param id The category ID to retrieve
-- @return The category data or nil if not found
function Config:GetByCategoryId(id)
    return self.categories[id] or nil
end

--- Retrieves a specific statistic by its ID across all categories
-- @param id The statistic ID to search for
-- @return The statistic data or nil if not found
function Config:GetByStatId(id)
    for cat_id, cat_data in pairs(self.categories) do
        local stat_data = cat_data.statistics[id]
        if(stat_data) then
            return stat_data
        end
    end
    return nil
end

--- Builds the paragon data structure by combining categories and statistics
-- Retrieves data from the repository and organizes it into a unified structure
function Config:BuildParagonData()
    local statistics_data = Repository:GetConfigStatistics()
    local categories_data = Repository:GetConfigCategories()

    local data = {}
    for cat_id, cat_name in pairs(categories_data) do
        data[cat_id] = {
            name = cat_name,
            statistics = statistics_data[cat_id]
        }
    end
    self.categories = data
end

--- Builds the experience data structure from database sources
-- Retrieves experience multipliers for creatures, achievements, skills, and quests
function Config:BuildParagonExperience()
    local creature_data = Repository:GetConfigCreatureExperience()
    local achievement_data = Repository:GetConfigAchievementExperience()
    local skill_data = Repository:GetConfigSkillExperience()
    local quest_data = Repository:GetConfigQuestExperience()

    self.experience = {
        creature = creature_data or {},
        achievement = achievement_data or {},
        skill = skill_data or {},
        quest = quest_data or {}
    }
end

--- Retrieves the paragon experience reward for a creature by entry ID
-- @param entry The creature entry ID
-- @return The experience reward value or nil if not configured
function Config:GetCreatureExperience(entry)
    return self.experience.creature[entry]
end

--- Retrieves the paragon experience reward for an achievement by ID
-- @param entry The achievement ID
-- @return The experience reward value or nil if not configured
function Config:GetAchievementExperience(entry)
    return self.experience.achievement[entry]
end

--- Retrieves the paragon experience reward for a skill by skill ID
-- @param entry The skill ID
-- @return The experience reward value or nil if not configured
function Config:GetSkillExperience(entry)
    return self.experience.skill[entry]
end

--- Retrieves the paragon experience reward for a quest by quest ID
-- @param entry The quest ID
-- @return The experience reward value or nil if not configured
function Config:GetQuestExperience(entry)
    return self.experience.quest[entry]
end

--- Gets the singleton instance of Config
-- Creates a new instance if one doesn't exist yet
-- @return The Config singleton instance
function Config:GetInstance()
    if (not Instance) then
        Instance = Config()
    end

    return Instance
end

return Config:GetInstance()