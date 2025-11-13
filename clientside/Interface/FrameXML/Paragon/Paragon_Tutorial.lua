--[[
    Paragon_Tutorial.lua
    Interactive tutorial system for Paragon Anniversary addon

    Provides a step-by-step guided tour of the UI with highlights and tooltips.
    Disables interactions while tutorial is active and shows explanations for
    each section of the interface.

    Compatible with WoW 3.3.5 API (2008-2010 era)

    @module Paragon_Tutorial
    @author Paragon Team
]]

-- ============================================================================
-- TUTORIAL STATE
-- ============================================================================

--- Tutorial state management
-- @field active boolean Whether tutorial is currently running
-- @field currentStep number Current step index (1-based)
-- @field steps table Array of tutorial step definitions
local TutorialState = {
    active = false,
    currentStep = 1,
    steps = {}
}

-- ============================================================================
-- TUTORIAL STEP DEFINITIONS
-- ============================================================================

--- Defines all tutorial steps with their targets and text keys
-- Each step highlights a specific UI element and shows an explanation
-- @return table Array of step definitions
local function GetTutorialSteps()
    local L = GetLocaleTable()

    return {
        -- Step 1: Help Button
        {
            frame = function() return UIParagon.HelpButton end,
            textKey = "TUTORIAL_HELP_BUTTON",
            position = "CENTER",
            xOffset = 0,
            yOffset = -110
        },

        -- Step 2: Level Display
        {
            frame = function() return UIParagon.TopBanner.Level end,
            textKey = "TUTORIAL_LEVEL",
            position = "RIGHT",
            xOffset = 250,
            yOffset = -150
        },

        -- Step 3: Experience Bar
        {
            frame = function() return UIParagon.TopBanner.ExperienceBar end,
            textKey = "TUTORIAL_XP_BAR",
            position = "BOTTOM",
            xOffset = 0,
            yOffset = -210
        },

        -- Step 4: Statistics Section (title area)
        {
            frame = function() return UIParagon.Body.TopSpacer.Title end,
            textKey = "TUTORIAL_CATEGORIES",
            position = "RIGHT",
            xOffset = 150,
            yOffset = -110
        },

        -- Step 5: Available Points
        {
            frame = function() return UIParagon.Body.TopSpacer.Points end,
            textKey = "TUTORIAL_POINTS",
            position = "RIGHT",
            xOffset = 150,
            yOffset = -110
        },

        -- Step 6: Stat Items (interaction explanation)
        {
            frame = function() return UIParagon.Body.StatisticsList end,
            textKey = "TUTORIAL_STATS",
            position = "TOP",
            xOffset = 0,
            yOffset = -150
        }
    }
end

-- ============================================================================
-- TUTORIAL UI FRAMES
-- ============================================================================

--- Creates the tutorial overlay frame
-- Invisible frame that blocks interactions during tutorial
-- @return Frame The overlay frame
local function CreateTutorialOverlay()
    local overlay = CreateFrame("Frame", "ParagonTutorialOverlay", UIParagon)
    overlay:SetFrameStrata("FULLSCREEN_DIALOG")
    overlay:SetFrameLevel(100)
    overlay:SetAllPoints(UIParagon)
    overlay:EnableMouse(true)
    overlay:EnableMouseWheel(true)
    overlay:Hide()

    -- No background texture - we'll use alpha manipulation instead

    return overlay
end

--- Creates the highlight frame around a UI element
-- Uses OnUpdate-based animation compatible with WoW 3.3.5
-- @return Frame The highlight frame
local function CreateTutorialHighlight()
    local highlight = CreateFrame("Frame", "ParagonTutorialHighlight", UIParent)
    highlight:SetFrameStrata("FULLSCREEN_DIALOG")
    highlight:SetFrameLevel(101)
    highlight:Hide()

    -- Glowing border effect
    local border = highlight:CreateTexture(nil, "OVERLAY")
    border:SetAllPoints()
    border:SetTexture("Interface\\QuestFrame\\UI-QuestLogTitleHighlight")
    border:SetBlendMode("ADD")
    border:SetVertexColor(1, 0.82, 0, 0.8)
    highlight.border = border

    -- Animation state (using OnUpdate instead of AnimationGroup)
    highlight.pulseAlpha = 0.5
    highlight.pulseDirection = 1  -- 1 = increasing, -1 = decreasing
    highlight.pulseSpeed = 1.0    -- Duration for full cycle

    -- OnUpdate handler for pulsing animation
    highlight:SetScript("OnUpdate", function(self, elapsed)
        if not self:IsShown() then return end

        -- Calculate alpha change based on elapsed time
        local alphaChange = elapsed / self.pulseSpeed
        self.pulseAlpha = self.pulseAlpha + (alphaChange * self.pulseDirection)

        -- Reverse direction at boundaries
        if self.pulseAlpha >= 1.0 then
            self.pulseAlpha = 1.0
            self.pulseDirection = -1
        elseif self.pulseAlpha <= 0.5 then
            self.pulseAlpha = 0.5
            self.pulseDirection = 1
        end

        -- Apply alpha to border
        self.border:SetVertexColor(1, 0.82, 0, self.pulseAlpha)
    end)

    return highlight
end

--- Creates the tutorial tooltip frame
-- Displays step-by-step instructions and navigation buttons with improved design
-- @return Frame The tooltip frame
local function CreateTutorialTooltip()
    local tooltip = CreateFrame("Frame", "ParagonTutorialTooltip", UIParent)
    tooltip:SetFrameStrata("FULLSCREEN_DIALOG")
    tooltip:SetFrameLevel(102)
    tooltip:SetSize(420, 180)
    tooltip:Hide()

    -- Beautiful background with gradient effect
    tooltip:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    tooltip:SetBackdropColor(0.05, 0.05, 0.1, 1)
    tooltip:SetBackdropBorderColor(0.90, 0.80, 0.50, 1)

    local title = tooltip:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 12, -12)
    title:SetTextColor(1, 0.82, 0)
    tooltip.Title = title

    -- Divider line
    local divider = tooltip:CreateTexture(nil, "ARTWORK")
    divider:SetPoint("TOPLEFT", 12, -38)
    divider:SetPoint("TOPRIGHT", -12, -38)
    divider:SetHeight(1)
    divider:SetTexture(1, 1, 1, 0.1)

    -- Description text (with more space)
    local description = tooltip:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    description:SetPoint("TOPLEFT", 16, -48)
    description:SetPoint("TOPRIGHT", -16, -48)
    description:SetJustifyH("LEFT")
    description:SetJustifyV("TOP")
    description:SetSpacing(3)
    tooltip.Description = description

    -- Step counter with icon
    local stepIcon = tooltip:CreateTexture(nil, "OVERLAY")
    stepIcon:SetSize(16, 16)
    stepIcon:SetPoint("BOTTOMLEFT", 15, 42)
    stepIcon:SetTexture("Interface\\Buttons\\UI-GuildButton-PublicNote-Up")

    local stepCounter = tooltip:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    stepCounter:SetPoint("LEFT", stepIcon, "RIGHT", 5, 0)
    stepCounter:SetTextColor(0.9, 0.85, 0.6)
    tooltip.StepCounter = stepCounter

    -- Button separator line
    local buttonDivider = tooltip:CreateTexture(nil, "ARTWORK")
    buttonDivider:SetPoint("BOTTOMLEFT", 12, 38)
    buttonDivider:SetPoint("BOTTOMRIGHT", -12, 38)
    buttonDivider:SetHeight(1)
    buttonDivider:SetTexture(1, 1, 1, 0.1)

    -- Previous button
    local prevButton = CreateFrame("Button", nil, tooltip, "UIPanelButtonTemplate")
    prevButton:SetSize(110, 24)
    prevButton:SetPoint("BOTTOMLEFT", 15, 8)
    prevButton:SetScript("OnClick", function() Paragon_TutorialPrevious() end)
    tooltip.PrevButton = prevButton

    -- Next button (styled differently when it's "Finish")
    local nextButton = CreateFrame("Button", nil, tooltip, "UIPanelButtonTemplate")
    nextButton:SetSize(110, 24)
    nextButton:SetPoint("BOTTOM", 0, 8)
    nextButton:SetScript("OnClick", function() Paragon_TutorialNext() end)
    tooltip.NextButton = nextButton

    -- Close button
    local closeButton = CreateFrame("Button", nil, tooltip, "UIPanelButtonTemplate")
    closeButton:SetSize(110, 24)
    closeButton:SetPoint("BOTTOMRIGHT", -15, 8)
    closeButton:SetScript("OnClick", function() Paragon_TutorialEnd() end)
    tooltip.CloseButton = closeButton

    return tooltip
end

-- ============================================================================
-- ALPHA MANAGEMENT FUNCTIONS
-- ============================================================================

--- Restores original alpha values for all UIParagon elements
local function RestoreUIParagonAlpha()
    for _, data in pairs(GetTutorialSteps()) do
        local frame = data.frame()
        if (frame) then
            frame:SetAlpha(1)
        end
    end
end

-- ============================================================================
-- TUTORIAL CONTROL FUNCTIONS
-- ============================================================================

--- Starts the tutorial sequence
-- Creates UI elements if needed and shows the first step
function Paragon_TutorialStart()
    if TutorialState.active then return end

    -- Create frames if they don't exist
    if not ParagonTutorialOverlay then
        CreateTutorialOverlay()
    end
    if not ParagonTutorialHighlight then
        CreateTutorialHighlight()
    end
    if not ParagonTutorialTooltip then
        CreateTutorialTooltip()
    end

    -- Initialize state
    TutorialState.active = true
    TutorialState.currentStep = 1
    TutorialState.steps = GetTutorialSteps()

    -- Show overlay
    ParagonTutorialOverlay:Show()

    for _, data in pairs(GetTutorialSteps()) do
        local frame = data.frame()
        if (frame) then
            frame:SetAlpha(0.5)
        end
    end

    -- Show first step
    Paragon_TutorialShowStep(1)
end

--- Ends the tutorial and hides all UI elements
function Paragon_TutorialEnd()
    if not TutorialState.active then return end

    TutorialState.active = false
    TutorialState.currentStep = 1

    -- Restore all alpha values
    RestoreUIParagonAlpha()

    -- Hide all tutorial frames
    if ParagonTutorialOverlay then ParagonTutorialOverlay:Hide() end
    if ParagonTutorialHighlight then ParagonTutorialHighlight:Hide() end
    if ParagonTutorialTooltip then ParagonTutorialTooltip:Hide() end
end

--- Advances to the next tutorial step
function Paragon_TutorialNext()
    if not TutorialState.active then return end

    local nextStep = TutorialState.currentStep + 1
    if nextStep > #TutorialState.steps then
        -- Reached end of tutorial
        Paragon_TutorialEnd()
        return
    end

    Paragon_TutorialShowStep(nextStep)
end

--- Goes back to the previous tutorial step
function Paragon_TutorialPrevious()
    if not TutorialState.active then return end

    local prevStep = TutorialState.currentStep - 1
    if prevStep < 1 then return end

    Paragon_TutorialShowStep(prevStep)
end

--- Shows a specific tutorial step
-- @param stepIndex number The step index to show (1-based)
function Paragon_TutorialShowStep(stepIndex)
    if not TutorialState.active then return end
    if stepIndex < 1 or stepIndex > #TutorialState.steps then return end

    local L = GetLocaleTable()
    local step = TutorialState.steps[stepIndex]
    TutorialState.currentStep = stepIndex

    -- Get target frame
    local targetFrame = step.frame()
    if not targetFrame then
        -- Frame doesn't exist, skip to next step
        Paragon_TutorialNext()
        return
    end

    for index, data in pairs(GetTutorialSteps()) do
        local frame = data.frame()
        if (frame) then
            if (index == stepIndex) then
                frame:SetAlpha(1)
            else
                frame:SetAlpha(0.5)
            end
        end
    end

    -- Position and show highlight
    ParagonTutorialHighlight:ClearAllPoints()
    ParagonTutorialHighlight:SetPoint("TOPLEFT", targetFrame, "TOPLEFT", -5, 5)
    ParagonTutorialHighlight:SetPoint("BOTTOMRIGHT", targetFrame, "BOTTOMRIGHT", 5, -5)
    ParagonTutorialHighlight:Show()

    if (stepIndex == 6) then
        ParagonTutorialTooltip:SetSize(420, 260)
    else
        ParagonTutorialTooltip:SetSize(420, 180)
    end

    -- Update tooltip content
    ParagonTutorialTooltip.Title:SetText(L.TUTORIAL_TITLE or "Aide - Interface Paragon")
    ParagonTutorialTooltip.Description:SetText(L[step.textKey] or "Description manquante")
    ParagonTutorialTooltip.StepCounter:SetText(string.format(
        L.TUTORIAL_STEP_COUNTER or "Étape %d/%d",
        stepIndex,
        #TutorialState.steps
    ))

    -- Update button states and text
    if (stepIndex > 1) then
        ParagonTutorialTooltip.PrevButton:Enable()
    else
        ParagonTutorialTooltip.PrevButton:Disable()
    end
    ParagonTutorialTooltip.PrevButton:SetText(L.TUTORIAL_BUTTON_PREVIOUS or "Previous")

    if stepIndex == #TutorialState.steps then
        ParagonTutorialTooltip.NextButton:SetText(L.TUTORIAL_BUTTON_FINISH or "Finish")
    else
        ParagonTutorialTooltip.NextButton:SetText(L.TUTORIAL_BUTTON_NEXT or "Next")
    end

    ParagonTutorialTooltip.CloseButton:SetText(L.TUTORIAL_BUTTON_CLOSE or "Close")

    -- Smart positioning of tooltip relative to highlighted frame
    ParagonTutorialTooltip:ClearAllPoints()

    local position = step.position or "BOTTOM"
    local xOffset = step.xOffset or 0
    local yOffset = step.yOffset or -15

    -- Map positions to their opposite anchors for proper placement
    local anchorMap = {
        ["TOP"] = "BOTTOM",
        ["BOTTOM"] = "TOP",
        ["LEFT"] = "RIGHT",
        ["RIGHT"] = "LEFT",
        ["TOPLEFT"] = "BOTTOMRIGHT",
        ["TOPRIGHT"] = "BOTTOMLEFT",
        ["BOTTOMLEFT"] = "TOPRIGHT",
        ["BOTTOMRIGHT"] = "TOPLEFT"
    }

    local targetAnchor = anchorMap[position] or position

    ParagonTutorialTooltip:SetPoint(position, targetFrame, targetAnchor, xOffset, yOffset)
    ParagonTutorialTooltip:Show()

    -- Ensure tooltip stays within UIParagon bounds (not screen bounds)
    local paragonLeft = UIParagon:GetLeft()
    local paragonRight = UIParagon:GetRight()
    local paragonTop = UIParagon:GetTop()
    local paragonBottom = UIParagon:GetBottom()

    local tooltipLeft = ParagonTutorialTooltip:GetLeft()
    local tooltipRight = ParagonTutorialTooltip:GetRight()
    local tooltipTop = ParagonTutorialTooltip:GetTop()
    local tooltipBottom = ParagonTutorialTooltip:GetBottom()

    -- Adjust horizontally if needed
    if tooltipLeft and paragonLeft and tooltipLeft < paragonLeft then
        local adjustment = paragonLeft - tooltipLeft + 10
        ParagonTutorialTooltip:ClearAllPoints()
        ParagonTutorialTooltip:SetPoint(position, targetFrame, targetAnchor, xOffset + adjustment, yOffset)
    elseif tooltipRight and paragonRight and tooltipRight > paragonRight then
        local adjustment = paragonRight - tooltipRight - 10
        ParagonTutorialTooltip:ClearAllPoints()
        ParagonTutorialTooltip:SetPoint(position, targetFrame, targetAnchor, xOffset + adjustment, yOffset)
    end

    -- Adjust vertically if needed
    if tooltipTop and paragonTop and tooltipTop > paragonTop then
        local adjustment = paragonTop - tooltipTop - 10
        ParagonTutorialTooltip:ClearAllPoints()
        ParagonTutorialTooltip:SetPoint(position, targetFrame, targetAnchor, xOffset, yOffset + adjustment)
    elseif tooltipBottom and paragonBottom and tooltipBottom < paragonBottom then
        local adjustment = paragonBottom - tooltipBottom + 10
        ParagonTutorialTooltip:ClearAllPoints()
        ParagonTutorialTooltip:SetPoint(position, targetFrame, targetAnchor, xOffset, yOffset + adjustment)
    end
end

-- ============================================================================
-- PUBLIC API
-- ============================================================================

--- Checks if tutorial is currently active
-- @return boolean True if tutorial is running
function Paragon_IsTutorialActive()
    return TutorialState.active
end

function Paragon_RemoveActivateTutorial()
    if (Paragon_IsTutorialActive()) then
        Paragon_TutorialEnd()
    end
    TutorialState.active = bool
end
