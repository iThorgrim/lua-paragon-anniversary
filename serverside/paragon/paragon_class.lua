local Repository = require("paragon_repository")
local Config = require("paragon_config")

local Paragon = Object:extend()

--- Local Functions
local function CalculateAvailablePoints(paragon)
    local used_points = 0

    for stat_id, stat_value in pairs(paragon:GetStatistics()) do
        used_points = used_points + stat_value
    end

    paragon.points = (paragon.level * Config:GetByField("POINTS_PER_LEVEL")) - used_points
end

--- Constructor for the Paragon class
-- Initializes a new paragon instance with default values
-- @param player_guid The player's GUID to associate with this paragon instance
function Paragon:new(player_guid)
    self.level              = 1
    self.exp                = { current = 0, max = 50 }
    self.available_points   = self.level
    self.statistics         = {}
    self.guid               = player_guid
end

--- Loads both level and statistics data from the database
-- @param load_level_callback Callback function to be called after level data is loaded
-- @param load_stat_callback Callback function to be called after statistics data is loaded
function Paragon:Load(load_stat_callback)
    self:load_level()
    self:load_stat(load_stat_callback)
end

--- Saves the paragon instance data to the database
-- Persists all paragon statistics for this character
function Paragon:Save()
    Repository:SaveParagonCharacterStat(self.guid, self.statistics)
    -- Repository:SaveParagonCharacter(self.guid, self.level, self.exp)
end

--- Asynchronously loads the paragon level and experience data from the database
-- @param callback Function to be called with (guid, self) after data is loaded
function Paragon:load_level()
    Repository:GetParagonByCharacter(self.guid, function(data)
        if (data) then
            self.level = data.level
            self.exp.current = data.current_experience
            self.exp.max = tonumber(Config:GetByField("BASE_MAX_EXPERIENCE")) * self.level
        end
    end)
end

--- Asynchronously loads the paragon statistics data from the database
-- @param callback Function to be called with (guid, self) after data is loaded
function Paragon:load_stat(callback)
    Repository:GetParagonStatByCharacter(self.guid, function(data)
        if (data) then
            self.statistics = data
        end

        CalculateAvailablePoints(self)
        callback(self.guid, self)
    end)
end

--- Gets the current paragon level
-- @return The current paragon level
function Paragon:GetLevel()
    return self.level
end

--- Sets the paragon level
-- @param level The new level to set
-- @return Self for method chaining
function Paragon:SetLevel(level)
    self.level = level
    self.exp.max = tonumber(Config:GetByField("BASE_MAX_EXPERIENCE")) * self.level
    
    CalculateAvailablePoints(self)
    return self
end

--- Adds levels to the current paragon level
-- @param level The number of levels to add
-- @return Self for method chaining
function Paragon:AddLevel(level)
    return self:SetLevel(self:GetLevel() + level)
end

--- Gets the number of available paragon points
-- @return The number of available points to spend
function Paragon:GetPoints()
    return self.points
end

--- Sets the number of available paragon points
-- @param points The new number of available points
-- @return Self for method chaining
function Paragon:SetPoints(points)
    self.points = points
    return self
end

--- Adds points to the available paragon points
-- @param points The amount of points to add
-- @return Self for method chaining
function Paragon:AddPoints(points)
    return self:SetPoints(self:GetPoints() + points)
end

--- Gets the current experience points
-- @return The current experience value
function Paragon:GetExperience()
    return self.exp.current
end

--- Sets the current experience points
-- @param experience The new experience value to set
-- @return Self for method chaining
function Paragon:SetExperience(experience)
    self.exp.current = experience
    return self
end

--- Adds experience points to the current experience
-- @param experience The amount of experience to add
-- @return Self for method chaining
function Paragon:AddExperience(experience)
    return self:SetExperience(self:GetExperience() + experience)
end

--- Gets the experience required for the next level
-- @return The maximum experience value needed for next level
function Paragon:GetExperienceForNextLevel()
    return self.exp.max
end

--- Sets the experience required for the next level
-- @param experience The new maximum experience value
-- @return Self for method chaining
function Paragon:SetExperienceForNextLevel(experience)
    self.exp.max = experience
    return self
end

--- Gets all paragon statistics
-- @return Table containing all invested statistic values
function Paragon:GetStatistics()
    return self.statistics
end

--- Gets the value of a specific statistic
-- @param statistic The statistic ID to retrieve
-- @return The statistic value or 0 if not set
function Paragon:GetStatValue(statistic)
    return self.statistics[statistic] or 0
end

--- Sets the value of a specific statistic
-- @param statistic The statistic ID to update
-- @param value The new value to set
-- @return Self for method chaining
function Paragon:SetStatValue(statistic, value)
    local old_stat_value = self.statistics[statistic]
    if (old_stat_value) then
        self.statistics[statistic] = value
    end
    return self
end

--- Adds to the value of a specific statistic
-- @param statistic The statistic ID to increment
-- @param value The amount to add
-- @return Self for method chaining
function Paragon:AddStatValue(statistic, value)
    return self:SetStatValue(statistic, self:GetStatValue(statistic) + value)
end

return Paragon