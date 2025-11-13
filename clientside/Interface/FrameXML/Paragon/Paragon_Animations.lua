--[[
    Paragon_Animations.lua
    Animation system for Paragon Anniversary UI

    Provides smooth, performant animations for:
    - Experience bar hover effects
    - Stat item description tooltips
    - Stat icon hover zoom effects

    @module Paragon_Animations
    @author Paragon Team
]]

-- ============================================================================
-- EXPERIENCE BAR ANIMATIONS
-- ============================================================================

--- Animates text swap on experience bar during hover
-- Handles smooth cross-fade between normal and hover text with vertical movement
-- @param self Frame The experience bar frame
-- @usage Called automatically from OnUpdate hook in XML
function UIParagonExperienceBar_AnimateTextSwap(self)
    if not self.isAnimating then return end

    local elapsed = GetTime() - self.animStart
    local progress = math.min(elapsed / self.animDuration, 1)

    if self.animType == "in" then
        if progress < 0.4 then
            self.text:SetAlpha(1 - (progress * 2.5))
        else
            self.text:SetAlpha(0)
        end

        if progress > 0.4 then
            local adjustedProgress = (progress - 0.4) / 0.6
            self.hover_text:SetAlpha(adjustedProgress)
            self.hover_text:ClearAllPoints()

            local offsetY = self.hoverStartY + (15 * adjustedProgress)
            self.hover_text:SetPoint("CENTER", 0, offsetY)
        end
    else
        if progress > 0.6 then
            local adjustedProgress = (progress - 0.6) / 0.4
            self.text:SetAlpha(adjustedProgress)
        else
            self.text:SetAlpha(0)
        end

        if progress < 0.6 then
            local adjustedProgress = progress / 0.6
            self.hover_text:SetAlpha(1 - adjustedProgress)
            self.hover_text:ClearAllPoints()

            local offsetY = (self.hoverStartY + 15) - (15 * adjustedProgress)
            self.hover_text:SetPoint("CENTER", 0, offsetY)
        else
            self.hover_text:SetAlpha(0)
        end
    end

    if progress >= 1 then
        self.isAnimating = false
        if self.animType == "in" then
            self.hover_text:SetAlpha(1)
            self.text:SetAlpha(0)
        else
            self.hover_text:SetAlpha(0)
            self.text:SetAlpha(1)
        end
    end
end

-- ============================================================================
-- STAT ITEM ANIMATIONS
-- ============================================================================

--- Animates stat description text with fade and movement
-- Description fades in/out while moving vertically for a smooth reveal effect
-- @param self Frame The stat item frame
-- @usage Called automatically from OnUpdate hook in XML
function UIParagonStatItem_AnimateDescription(self)
    if not self.isAnimating then return end

    local elapsed = GetTime() - self.animStart
    local progress = math.min(elapsed / self.animDuration, 1)

    if self.animType == "in" then
        self.description:SetAlpha(progress)
        self.description:ClearAllPoints()

        local offsetY = self.descStartY - (23 * progress)
        self.description:SetPoint("TOP", 0, offsetY)
    else
        self.description:SetAlpha(1 - progress)
        self.description:ClearAllPoints()

        local offsetY = (self.descStartY - 23) + (23 * progress)
        self.description:SetPoint("TOP", 0, offsetY)
    end

    if progress >= 1 then
        self.isAnimating = false
        if self.animType == "in" then
            self.description:SetAlpha(1)
        else
            self.description:SetAlpha(0)
        end
    end
end

--- Animates stat icon zoom effect on hover
-- Uses smooth interpolation to scale icon and reposition to stay centered
-- Icon grows by 15% when hovered and smoothly returns to normal size
-- @param self Frame The stat item frame
-- @usage Called automatically from OnUpdate hook in XML
function UIParagonStatItem_AnimateZoom(self)
    self.currentZoom = self.currentZoom or 0

    local targetZoom = self.zoomEnabled and 1.0 or 0.0
    local zoomSpeed = 0.2

    if math.abs(self.currentZoom - targetZoom) > 0.01 then
        self.currentZoom = self.currentZoom + (targetZoom - self.currentZoom) * zoomSpeed
    else
        self.currentZoom = targetZoom
    end

    local zoomAmount = 1.15
    local scaleMultiplier = 1 + (self.currentZoom * (zoomAmount - 1))

    if not self.originalXOffset then
        local point, relativeTo, relativePoint, xOfs, yOfs = self:GetPoint(1)
        self.originalXOffset = xOfs or 0
        self.originalYOffset = yOfs or 0
        self.originalPoint = point
        self.originalRelativeTo = relativeTo
        self.originalRelativePoint = relativePoint
    end

    local baseSize = 55
    local newSize = baseSize * scaleMultiplier
    local sizeDiff = newSize - baseSize
    local offsetX = self.originalXOffset - (sizeDiff / 2)
    local offsetY = self.originalYOffset + (sizeDiff / 2)

    self:ClearAllPoints()
    self:SetPoint(self.originalPoint, self.originalRelativeTo, self.originalRelativePoint, offsetX, offsetY)
    self:SetSize(newSize, newSize)

    if self.Icon then
        self.Icon:SetSize(42 * scaleMultiplier, 41 * scaleMultiplier)
    end
end
