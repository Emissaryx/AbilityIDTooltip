-- Local data
local VERSION = 1.0

-- AbilityIDTooltip Main Table
AbilityIDTooltip = {}
AbilityIDTooltip.Version = VERSION

-- Localized functions
local GetAbilityData = GetAbilityData
local LabelSetText = LabelSetText
local LabelGetText = LabelGetText

-- Initialize the addon
function AbilityIDTooltip.Initialize()
    -- Hook into the tooltip creation process
    if Tooltips and Tooltips.CreateAbilityTooltip then
        AbilityIDTooltip.OriginalCreateAbilityTooltip = Tooltips.CreateAbilityTooltip
        Tooltips.CreateAbilityTooltip = AbilityIDTooltip.HookedCreateAbilityTooltip
    end
end

-- Hooked function for creating ability tooltips
function AbilityIDTooltip.HookedCreateAbilityTooltip(abilityData, mouseoverWindow, anchor, extraText, extraTextColor)
    -- Call the original function to create the tooltip
    AbilityIDTooltip.OriginalCreateAbilityTooltip(abilityData, mouseoverWindow, anchor, extraText, extraTextColor)

    -- Append the ability ID to the tooltip
    AbilityIDTooltip.AppendAbilityIdToTooltip(abilityData)
end

-- Function to append ability ID to the tooltip
function AbilityIDTooltip.AppendAbilityIdToTooltip(abilityData)
    if abilityData and abilityData.id then
        local existingDesc = LabelGetText("AbilityTooltipDesc")
        local abilityIDText = L"Ability ID: " .. towstring(abilityData.id)
        local newDesc = existingDesc .. L"\n" .. abilityIDText

        -- Update the tooltip's description label
        LabelSetText("AbilityTooltipDesc", newDesc)
    end
end

-- Shutdown function for cleanup
function AbilityIDTooltip.Shutdown()
    -- Restore original function to avoid conflicts
    if Tooltips and Tooltips.CreateAbilityTooltip and AbilityIDTooltip.OriginalCreateAbilityTooltip then
        Tooltips.CreateAbilityTooltip = AbilityIDTooltip.OriginalCreateAbilityTooltip
    end
end
