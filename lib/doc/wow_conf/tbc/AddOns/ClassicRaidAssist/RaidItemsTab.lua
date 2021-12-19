local RaidItemsTab =  {}
_G["RaidItemsTab"] = RaidItemsTab

local AceGUI = LibStub("AceGUI-3.0")
    
RaidItemsTab.raidItems = {
    ["Aqual Quintessence"] = {
        ["itemIds"] = {"22754", "17333"},
        ["alts"] = {"Aqual Quintessence", "Eternal Quintessence"},
        ["dropdownName"] = "Aqual/Eternal Quintessence",
        -- ["icon"] = "Interface\\Icons\\inv_misc_head_dragon_01",
        ["hasThisItem"] = {}
    },
    ["Drakefire Amulet"] = {
        ["itemIds"] = {"16309"},
        ["alts"] = {"Drakefire Amulet"},
        ["dropdownName"] = "Drakefire Amulet",
        -- ["icon"] = "Interface\\Icons\\spell_holy_mindvision",
        ["hasThisItem"] = {}
    },
    ["Onyxia Scale Cloak"] = {
        ["itemIds"] = {"15138"},
        ["alts"] = {"Onyxia Scale Cloak"},
        ["dropdownName"] = "Onyxia Scale Cloak",
        -- ["icon"] = "Interface\\Icons\\spell_arcane_teleportorgrimmar",
        ["hasThisItem"] = {}
    },
    ["Seal of Ascension"] = {
        ["itemIds"] = {"12344"},
        ["alts"] = {"Seal of Ascension"},
        ["dropdownName"] = "Seal of Ascension",
        -- ["icon"] = "Interface\\Icons\\spell_arcane_teleportorgrimmar",
        ["hasThisItem"] = {}
    },
    ["Hourglass Sand"] = {
        ["itemIds"] = {"19183"},
        ["alts"] = {"Hourglass Sand"},
        ["dropdownName"] = "Hourglass Sand",
        -- ["icon"] = "Interface\\Icons\\spell_arcane_teleportorgrimmar",
        ["hasThisItem"] = {}
    }
}

local function ScanRaidItems()
    local subgroups = {}
    
    for i = 1, 8 do
        subgroups[i] = {}
    end

    local scrollContainer = AceGUI:Create("SimpleGroup")
    scrollContainer:SetFullWidth(true)
    scrollContainer:SetHeight(315)
    scrollContainer:SetLayout("Fill")

    local scroll = AceGUI:Create("ScrollFrame")
    scroll:SetLayout("Flow")
    scrollContainer:AddChild(scroll)

    local raidContainer = AceGUI:Create("SimpleGroup")
    raidContainer:SetFullWidth(true)
    raidContainer:SetLayout("Flow")

    scroll:AddChild(raidContainer)

    local leftContainer = AceGUI:Create("SimpleGroup")
    local rightContainer = AceGUI:Create("SimpleGroup")
    leftContainer:SetWidth(180)
    leftContainer:SetLayout("Flow")
    rightContainer:SetWidth(180)
    rightContainer:SetLayout("Flow")

    for i = 1, MAX_RAID_MEMBERS do
        local tempPlayerName, _, subgroup, _, class, englishClass = GetRaidRosterInfo(i)
        if(tempPlayerName ~= nil and class ~= nil) then
            local currPlayerName, currPlayerRealm = UnitName(tempPlayerName)

            subgroups[subgroup][currPlayerName] = {
                ["class"] = englishClass
            }

        end
    end

    leftSubgroups = 0
    rightSubgroups = 0

    for key, value in pairs(subgroups) do
        local groupContainer = AceGUI:Create("InlineGroup")
        groupContainer:SetTitle("Group " .. key .. ":")
        groupContainer:SetRelativeWidth(1)
        groupContainer:SetLayout("List")
        groupContainer:SetFullWidth(true)
        
        subgroups_made = 0

        currCount = 0

        for k, v in pairs(value) do
            currCount = currCount + 1
            local playerContainer = AceGUI:Create("SimpleGroup")
            playerContainer:SetLayout("Flow")
            playerContainer:SetFullWidth(true)
            local currName = AceGUI:Create("Label")
            currName:SetWidth(90)
            currName.characterName = k
            currName:SetText("|c" .. RAID_CLASS_COLORS[v['class']].colorStr .. k .. "|r")
            playerContainer:AddChild(currName)

            if(RaidItemsTab.raidItems[ClassicRaidAssist.db.char.CurrentRaidItemCheck]['hasThisItem'][k] == nil) then
                local currSpell = AceGUI:Create("Icon")
                currSpell:SetImage("Interface\\Icons\\inv_misc_questionmark")
                -- currSpell.image:SetColorTexture(0.5, 0.5, 0.5, 0.0);
                currSpell:SetDisabled(true)
                currSpell.image:SetVertexColor(1, 1, 1, 1)
                currSpell:SetImageSize("16", "16")
                currSpell.image:SetAllPoints()
                currSpell:SetWidth(16)
                currSpell:SetHeight(16)
                playerContainer:AddChild(currSpell)
            elseif(RaidItemsTab.raidItems[ClassicRaidAssist.db.char.CurrentRaidItemCheck]['hasThisItem'][k] == false) then
                local currSpell = AceGUI:Create("Icon")
                currSpell:SetImage("Interface\\Icons\\spell_chargenegative")
                -- currSpell.image:SetColorTexture(0.5, 0.5, 0.5, 0.0);
                currSpell:SetDisabled(true)
                currSpell.image:SetVertexColor(1, 1, 1, 1)
                currSpell:SetImageSize("16", "16")
                currSpell.image:SetAllPoints()
                currSpell:SetWidth(16)
                currSpell:SetHeight(16)
                playerContainer:AddChild(currSpell)
            else
                local currSpell = AceGUI:Create("Icon")
                currSpell:SetImage("Interface\\Icons\\spell_chargepositive")
                currSpell:SetImageSize("16", "16")
                currSpell:SetDisabled(true)
                currSpell.image:SetVertexColor(1, 1, 1, 1)
                currSpell.image:SetAllPoints()
                currSpell:SetWidth(16)
                currSpell:SetHeight(16)
                playerContainer:AddChild(currSpell)
            end
            groupContainer:AddChild(playerContainer)
        end

        -- Create "Fake" spots if the group isnt full to keep allignment
        for i = currCount, 4 do
            local playerContainer = AceGUI:Create("SimpleGroup")
            playerContainer:SetLayout("Flow")
            playerContainer:SetFullWidth(true)
            playerContainer:SetHeight(20)

            local currName = AceGUI:Create("Label")
            currName:SetWidth(90)
            currName:SetText(" ")
            playerContainer:AddChild(currName)

            local currSpell = AceGUI:Create("Icon")
            currSpell:SetImage("Interface\\Icons\\spell_holy_magicalsentry")
            currSpell.image:SetColorTexture(0.5, 0.5, 0.5, 0.0);
            currSpell:SetDisabled(true)
            currSpell:SetImageSize("16", "16")
            currSpell:SetWidth(16)
            currSpell:SetHeight(16)
            playerContainer:AddChild(currSpell) 

            groupContainer:AddChild(playerContainer)
        end

        if(key % 2 == 1) then
            leftContainer:AddChild(groupContainer)
        else
            rightContainer:AddChild(groupContainer)
        end
    end
    raidContainer:AddChild(leftContainer)
    raidContainer:AddChild(rightContainer)
    return scrollContainer
end

local function outPutItems(channel)
    local initialOutput = "[Classic Raid Assist] Outputting People without or having an unknown status for "

    -- local beginningString = "Missing item "
    for k, v in pairs(RaidItemsTab.raidItems[ClassicRaidAssist.db.char.CurrentRaidItemCheck]['alts']) do
        -- beginningString = beginningString .. "'" .. v .. "' or "
        initialOutput = initialOutput .. "'" .. v .. "' or "
    end
    CRA_SendChatMessage(initialOutput:sub(1, -5) .. ":", channel)
    -- beginningString = beginningString:sub(1, -5) .. ":"

    local stringCompose = ""

    for i = 1, MAX_RAID_MEMBERS do
        local tempPlayerName, _, subgroup, _, class, englishClass = GetRaidRosterInfo(i)
        if(tempPlayerName ~= nil and class ~= nil) then
            local currPlayerName, currPlayerRealm = UnitName(tempPlayerName)
            stringToAdd = " " .. currPlayerName .. ","
            if(RaidItemsTab.raidItems[ClassicRaidAssist.db.char.CurrentRaidItemCheck]['hasThisItem'][currPlayerName] == nil or RaidItemsTab.raidItems[ClassicRaidAssist.db.char.CurrentRaidItemCheck]['hasThisItem'][currPlayerName] == false) then
                if ( string.len(stringCompose) + string.len(stringToAdd) ) >= 255 then
                    CRA_SendChatMessage(stringCompose:sub(1, -2), channel)
                    stringCompose = ""
                end
                stringCompose = stringCompose .. stringToAdd
            end
        end
    end
    CRA_SendChatMessage(stringCompose:sub(1, -2), channel)
end

function RaidItemsTab:DrawRaidItems(container)
    ClassicRaidAssist:ClearCooldowns()

    local itemSpacer = AceGUI:Create("SimpleGroup")
    itemSpacer:SetFullWidth(true)
    itemSpacer:SetLayout("Flow")
    itemSpacer:SetHeight(80)

    local itemLabel = AceGUI:Create("Label")
    itemLabel:SetText("Choose which item to scan for: ")
    itemSpacer:AddChild(itemLabel)
    -- itemSpacer:SetFont(40)
    itemSpacer:SetWidth(175)
    local itemDropdown = AceGUI:Create("Dropdown")
    itemDropdown:SetWidth(200)
    -- itemDropdown:SetFullWidth(true)
    dropdownTable = {}
    for key, value in pairs(RaidItemsTab.raidItems) do
        dropdownTable[key] = value['dropdownName']
    end
    itemDropdown:SetList(dropdownTable)
    itemDropdown:SetValue(ClassicRaidAssist.db.char.CurrentRaidItemCheck)
    itemDropdown:SetCallback("OnValueChanged", function(widget, event, key)
        ClassicRaidAssist.db.char.CurrentRaidItemCheck = key
        ClassicRaidAssistGUI:ReloadTab()
    end)
    itemSpacer:AddChild(itemDropdown)

    container:AddChild(itemSpacer)

    local spacer = AceGUI:Create("SimpleGroup")
    spacer:SetFullWidth(true)
    spacer:SetLayout("Flow")
    spacer:SetHeight(80)
    
    local scanBtn = AceGUI:Create("Button")
    scanBtn:SetText("Scan for Raid Items")
    scanBtn:SetWidth(200)
    if not (IsInGroup() or IsInRaid()) then
        scanBtn:SetDisabled(true)
        scanBtn:SetText("Can't scan, not in a group")
    end
    scanBtn:SetCallback("OnClick", function()
        -- for key, value in pairs(RaidItemsTab.raidItems) do
        --     value['hasThisItem'] = {}
        -- end

        -- for key, value in pairs(RaidItemsTab.raidItems[ClassicRaidAssist.db.char.CurrentRaidItemCheck]['itemIds']) do
        --     -- print(value)
        --     count  = GetItemCount(value)
        --     local currPlayerName, currPlayerRealm = UnitName("player")
        --     -- print(count)
        --     if (count > 0) then
        --         -- print(count)
        --         RaidItemsTab.raidItems[ClassicRaidAssist.db.char.CurrentRaidItemCheck]['hasThisItem'][currPlayerName] = true
        --         -- print(currPlayerName)
        --         break
        --     else 
        --         RaidItemsTab.raidItems[ClassicRaidAssist.db.char.CurrentRaidItemCheck]['hasThisItem'][currPlayerName] = false
        --     end
        -- end

        RaidItemsTab.raidItems[ClassicRaidAssist.db.char.CurrentRaidItemCheck]['hasThisItem'] = {}
        ClassicRaidAssist:ScanForItem(ClassicRaidAssist.db.char.CurrentRaidItemCheck)
        ClassicRaidAssist.db.char.raidItemsContainer = container
        container:ReleaseChildren()
        RaidItemsTab:DrawRaidItems(container)
    end)
    spacer:AddChild(scanBtn)
    
    local reportBtn = AceGUI:Create("Button")
    reportBtn:SetText("Report")
    reportBtn:SetWidth(100)
    reportBtn:SetCallback("OnClick", function()
        outPutItems(ClassicRaidAssist.db.char.CurrentRaidItemsOutputChannel)
    end)
    spacer:AddChild(reportBtn)

    local reportDropdown = AceGUI:Create("Dropdown")
    reportDropdown:SetWidth(100)
    reportDropdown:SetList(GetChatChannels())
    reportDropdown:SetValue(ClassicRaidAssist.db.char.CurrentRaidItemsOutputChannel)
    reportDropdown:SetCallback("OnValueChanged", function(widget, event, key)
        ClassicRaidAssist.db.char.CurrentRaidItemsOutputChannel = key
    end)
    spacer:AddChild(reportDropdown)

    container:AddChild(spacer)

    container:AddChild(ScanRaidItems())
end