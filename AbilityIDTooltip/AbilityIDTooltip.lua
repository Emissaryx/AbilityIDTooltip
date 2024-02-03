-- Local data
local VERSION = 1.24

-- Main Table for the Addon
AbilityIDTooltip = {}
AbilityIDTooltip.Version = VERSION

-- Localized functions
local d = d
local towstring = towstring

-- Initialize the addon
function AbilityIDTooltip.Initialize()
    if Tooltips then
        AbilityIDTooltip.original_Tooltips_CreateItemTooltip = Tooltips.CreateItemTooltip
        AbilityIDTooltip.original_Tooltips_CreateAbilityTooltip = Tooltips.CreateAbilityTooltip    

        Tooltips.CreateItemTooltip = AbilityIDTooltip.HookedCreateItemTooltip    
        Tooltips.CreateAbilityTooltip = AbilityIDTooltip.HookedCreateAbilityTooltip
    end
end

-- Hooked function for creating item tooltips
function AbilityIDTooltip.HookedCreateItemTooltip(itemData, mouseoverWindow, anchor, disableComparison, extraText, extraTextColor, ignoreBroken)
    local ext = L"Unique ID: " .. itemData.uniqueID .. L"\nItem ID: " .. itemData.id.. L"\nIcon: " .. itemData.iconNum
    if extraText then
        extraText = extraText .. L"\n" .. ext
    else
        extraText = ext    
    end
    --d("[AbilityIDTooltip]: Creating item tooltip with extra text: " .. tostring(extraText))
    return AbilityIDTooltip.original_Tooltips_CreateItemTooltip(itemData, mouseoverWindow, anchor, disableComparison, extraText, extraTextColor, ignoreBroken)
end    

-- Hooked function for creating ability tooltips
function AbilityIDTooltip.HookedCreateAbilityTooltip(abilityData, mouseoverWindow, anchor, extraText, extraTextColor)
    local ext = L"Ability ID: " .. abilityData.id .. L" Icon: " .. abilityData.iconNum
    if extraText then
        extraText = extraText .. L"\n" .. ext
    else
        extraText = ext    
    end
    --d("[AbilityIDTooltip]: Creating ability tooltip with extra text: " .. tostring(extraText))
    return AbilityIDTooltip.original_Tooltips_CreateAbilityTooltip(abilityData, mouseoverWindow, anchor, extraText, extraTextColor)
end

-- Shutdown function for cleanup
function AbilityIDTooltip.Shutdown()
    if Tooltips then
        if Tooltips.CreateAbilityTooltip and AbilityIDTooltip.original_Tooltips_CreateAbilityTooltip then
            Tooltips.CreateAbilityTooltip = AbilityIDTooltip.original_Tooltips_CreateAbilityTooltip
        end

        if Tooltips.CreateItemTooltip and AbilityIDTooltip.original_Tooltips_CreateItemTooltip then
            Tooltips.CreateItemTooltip = AbilityIDTooltip.original_Tooltips_CreateItemTooltip
        end
    end
end
