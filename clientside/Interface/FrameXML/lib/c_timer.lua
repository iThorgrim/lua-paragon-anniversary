--[[
    C_Timer Implementation
    Provides a timer functionality similar to Blizzard's C_Timer API in environments
    where it doesn't exist.
]]

local TimerModule = {}

-- Create a frame for OnUpdate handling
local TimerFrame = CreateFrame("Frame")
local Timers = {}

-- Process all active timers on each frame update
TimerFrame:SetScript("OnUpdate", function(self, elapsed)
    for i = #Timers, 1, -1 do
        local timer = Timers[i]
        timer.timeLeft = timer.timeLeft - elapsed

        -- Execute timer when its time is up
        if timer.timeLeft <= 0 then
            table.remove(Timers, i)

            -- Use pcall for error protection
            local success, err = pcall(timer.func)
            if not success then
                print("Timer error:", err)
            end
        end
    end

    -- Hide frame when no timers are active to save resources
    if #Timers == 0 then
        self:Hide()
    end
end)

-- Schedule a function to run after specified delay
local function After(delay, func)
    -- Validate parameters
    if type(func) ~= "function" then
        error("C_Timer.After: Second argument must be a function")
    end

    if type(delay) ~= "number" or delay < 0 then
        error("C_Timer.After: First argument must be a non-negative number")
    end

    -- Add the timer to the queue
    table.insert(Timers, {
        timeLeft = delay,
        func = func,
        created = GetTime() -- Track when timer was created
    })

    -- Ensure the frame is shown to process timers
    TimerFrame:Show()

    -- Return the timer index for potential cancellation
    return #Timers
end

-- Cancel a specific timer by its index
local function Cancel(timerID)
    if type(timerID) ~= "number" or timerID < 1 or timerID > #Timers then
        return false
    end

    table.remove(Timers, timerID)

    if #Timers == 0 then
        TimerFrame:Hide()
    end

    return true
end

-- Cancel all active timers
local function CancelAll()
    wipe(Timers)
    TimerFrame:Hide()
end

-- Get number of active timers
local function GetActiveTimerCount()
    return #Timers
end

-- Check timer queue status
local function GetQueueStatus()
    local oldestTimer = nil
    local totalTime = 0

    for i, timer in ipairs(Timers) do
        totalTime = totalTime + timer.timeLeft

        if not oldestTimer or timer.created < oldestTimer.created then
            oldestTimer = timer
        end
    end

    return {
        count = #Timers,
        totalTimeRemaining = totalTime,
        oldestTimerAge = oldestTimer and (GetTime() - oldestTimer.created) or 0
    }
end

-- Create and expose the C_Timer API
C_Timer = C_Timer or {}
C_Timer.After = After
C_Timer.Cancel = Cancel
C_Timer.CancelAll = CancelAll
C_Timer.GetActiveTimerCount = GetActiveTimerCount
C_Timer.GetQueueStatus = GetQueueStatus