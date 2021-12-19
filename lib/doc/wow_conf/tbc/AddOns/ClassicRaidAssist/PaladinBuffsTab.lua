local PaladinBuffsTab =  {}
_G["PaladinBuffsTab"] = PaladinBuffsTab

local AceGUI = LibStub("AceGUI-3.0")

local paladinBuffNames = {
    ["Greater Blessing of Kings"] = {
        ["alts"] = {"25898", "20217"},
        ["icon"] = "Interface\\Icons\\spell_magic_greaterblessingofkings",
        ["short"] = "Kings",
        ["hasThisBuff"] = {},
        ["smartFiltering"] = false
    },
    ["Greater Blessing of Might"] = {
        ["alts"] = {"25916", "25291"},
        ["icon"] = "Interface\\Icons\\spell_holy_greaterblessingofkings",
        ["short"] = "Might",
        ["hasThisBuff"] = {},
        ["smartFiltering"] = true
    },
    ["Greater Blessing of Wisdom"] = {
        ["alts"] = {"25918", "25290"},
        ["icon"] = "Interface\\Icons\\spell_holy_greaterblessingofwisdom",
        ["short"] = "Wisdom",
        ["hasThisBuff"] = {},
        ["smartFiltering"] = true
    },
    ["Greater Blessing of Salvation"] = {
        ["alts"] = {"25895", "1038"},
        ["icon"] = "Interface\\Icons\\spell_holy_greaterblessingofsalvation",
        ["short"] = "Salvation",
        ["hasThisBuff"] = {},
        ["smartFiltering"] = false
    },
    ["Greater Blessing of Sanctuary"] = {
        ["alts"] = {"25899", "20911"},
        ["icon"] = "Interface\\Icons\\spell_holy_greaterblessingofsanctuary",
        ["short"] = "Sanctuary",
        ["hasThisBuff"] = {},
        ["smartFiltering"] = false
    },
    ["Greater Blessing of Light"] = {
        ["alts"] = {"25890", "19979"},
        ["icon"] = "Interface\\Icons\\spell_holy_greaterblessingoflight",
        ["short"] = "Light",
        ["hasThisBuff"] = {},
        ["smartFiltering"] = false
    }
}

local function OnValueChanged(spellName)
    if(ClassicRaidAssist.db.char.paladinBuffsToCheckFor[spellName] == false or ClassicRaidAssist.db.char.paladinBuffsToCheckFor[spellName] == nil) then
        ClassicRaidAssist.db.char.paladinBuffsToCheckFor[spellName] = true
    else
        ClassicRaidAssist.db.char.paladinBuffsToCheckFor[spellName] = false
    end
end

function PaladinBuffsTab:ScanPaladinBuffs()

    for key, value in pairs(paladinBuffNames) do
        value['missingThisBuff'] = {}
    end

    local subgroups = {}
    local hasBuff = false
    

    for i = 1, 8 do
        subgroups[i] = {}
    end

    local scrollContainer = AceGUI:Create("SimpleGroup")
    scrollContainer:SetFullWidth(true)
    scrollContainer:SetHeight(275)
    -- scrollContainer.height = 
    -- scrollContainer:SetFullHeight(true)
    scrollContainer:SetLayout("Fill")

    local scroll = AceGUI:Create("ScrollFrame")
    scroll:SetLayout("Flow")
    -- scroll.width = "fill"
    -- scroll.height = "fill"
    -- scroll.DoLayout()
    -- scroll:LayoutFinished(20,  500)
    -- scroll:SetFullHeight(true)
    scrollContainer:AddChild(scroll)

    local raidContainer = AceGUI:Create("SimpleGroup")
    raidContainer:SetFullWidth(true)
    -- raidContainer:SetHeight(500)
    raidContainer:SetLayout("Flow")

    scroll:AddChild(raidContainer)

    local leftContainer = AceGUI:Create("SimpleGroup")
    local rightContainer = AceGUI:Create("SimpleGroup")
    leftContainer:SetWidth(190)
    leftContainer:SetLayout("Flow")
    rightContainer:SetWidth(190)
    rightContainer:SetLayout("Flow")

    for i = 1, MAX_RAID_MEMBERS do
        local tempPlayerName, _, subgroup, _, class, englishClass = GetRaidRosterInfo(i)
        if(tempPlayerName ~= nil and class ~= nil) then
            local currPlayerName, currPlayerRealm = UnitName(tempPlayerName)

            -- if(subgroups[subgroup] == nil) then
            --     subgroups[subgroup] = {}
            -- end

            subgroups[subgroup][currPlayerName] = {
                ["class"] = englishClass,
                ['spellsMissing'] = {}
            }

            for key, value in pairs(ClassicRaidAssist.db.char.paladinBuffsToCheckFor) do

                if value then

                    for k, v in pairs(paladinBuffNames[key]["alts"]) do

                        hasBuff, duration, expirationTime = CheckUnitForBuff(currPlayerName, v)

                        if (ClassicRaidAssist.db.char.smartBuffFiltering and (englishClass == "WARRIOR" or englishClass == "ROGUE") and (paladinBuffNames[key]['smartFiltering']) and key == "Greater Blessing of Wisdom") then
                            subgroups[subgroup][currPlayerName]['spellsMissing'][key] = {['missingBuff'] = 0}
                        elseif (ClassicRaidAssist.db.char.smartBuffFiltering and (englishClass == "MAGE" or englishClass == "WARLOCK" or englishClass == "PRIEST") and (paladinBuffNames[key]['smartFiltering']) and key == "Greater Blessing of Might") then
                            subgroups[subgroup][currPlayerName]['spellsMissing'][key] = {['missingBuff'] = 0}
                        else 
                            if not hasBuff then
                                paladinBuffNames[key]['missingThisBuff'][currPlayerName] = subgroup
                                subgroups[subgroup][currPlayerName]['spellsMissing'][key] = {['missingBuff'] = true}
                            else
                                paladinBuffNames[key]['missingThisBuff'][currPlayerName] = false
                                subgroups[subgroup][currPlayerName]['spellsMissing'][key] = {['exp'] = expirationTime, ['duration'] = duration, ['missingBuff'] = false}
                                break
                            end
                        end
                    end 
                end
            end
        -- else
        --     print(subgroup)
        --     currPlayerName = "test" .. i
        --     if(subgroups[subgroup] == nil) then
        --         subgroups[subgroup] = {}
        --     end
        --     subgroups[subgroup][currPlayerName] = {
        --         ["class"] = "WARLOCK",
        --         ['spellsMissing'] = {}
        --     }
        --     for k, v in pairs(paladinBuffNames) do
        --         subgroups[subgroup][currPlayerName]['spellsMissing'][k] = true
        --     end
        end
    end

    leftSubgroups = 0
    rightSubgroups = 0
    for key, value in pairs(subgroups) do
        local groupContainer = AceGUI:Create("InlineGroup")
        groupContainer:SetTitle("Group " .. key .. ":")
        groupContainer:SetRelativeWidth(1)
        groupContainer:SetLayout("List")
        -- groupContainer:SetWidth(140)
        groupContainer:SetFullWidth(true)
        -- groupContainer:SetHeight(50)
        
        subgroups_made = 0

        currCount = 0

        for k, v in pairs(value) do
            currCount = currCount + 1
            local playerContainer = AceGUI:Create("SimpleGroup")
            playerContainer:SetLayout("Flow")
            playerContainer:SetFullWidth(true)
            -- playerContainer:SetHeight(20)

            local currName = AceGUI:Create("Label")
            currName:SetWidth(80)
            currName.characterName = k
            currName:SetText("|c" .. RAID_CLASS_COLORS[v['class']].colorStr .. k .. "|r")
            -- RegisterUnitWatch(currName.frame) 
            -- currName.frame:SetAttribute("unit", currName.characterName)
            -- currName.frame:RegisterForClicks("AnyUp")
            -- currName.frame:SetAttribute("*type1", "target")
            -- currName:SetCallback("OnClick", function(widget)
            --     -- TargetUnit()
            -- end)
            playerContainer:AddChild(currName)
            
            -- for temp1, temp2 in pairs(v['spellsMissing']) do
            --     print('-----')
            --     print(temp1)
            --     print(temp2)
            -- end
            -- if(next(v['spellsMissing']) == nil) then
            --     local currSpell = AceGUI:Create("Icon")
            --     currSpell:SetImage("Interface\\Icons\\spell_holy_magicalsentry")
            --     currSpell.image:SetColorTexture(0.5, 0.5, 0.5, 0.0);
            --     currSpell:SetDisabled(true)
            --     currSpell:SetImageSize("15", "15")
            --     currSpell:SetWidth(15)
            --     currSpell:SetHeight(20)
            --     playerContainer:AddChild(currSpell)                            
            -- end

            if(next(v['spellsMissing']) == nil) then
                local currSpell = AceGUI:Create("Icon")
                currSpell:SetImage("Interface\\Icons\\spell_holy_magicalsentry")
                currSpell.image:SetColorTexture(0.5, 0.5, 0.5, 0.0);
                currSpell:SetDisabled(true)
                currSpell:SetImageSize("14", "14")
                currSpell.image:SetAllPoints()
                currSpell:SetWidth(14)
                currSpell:SetHeight(14)
                playerContainer:AddChild(currSpell) 
            end

            for spellName, value in pairs(v['spellsMissing']) do
                if value == nil or value['missingBuff'] == 0 then
                    local currSpell = AceGUI:Create("Icon")
                    currSpell:SetImage("Interface\\Icons\\spell_chargenegative")
                    currSpell:SetImageSize("16", "16")
                    currSpell:SetDisabled(true)
                    currSpell.image:SetAllPoints()
                    currSpell.image:SetVertexColor(1, 1, 1, 0.5)
                    currSpell:SetWidth(16)
                    currSpell:SetHeight(16)
                    playerContainer:AddChild(currSpell)
                elseif value == nil or not not value['missingBuff'] then
                    local currSpell = AceGUI:Create("Icon")
                    currSpell:SetImage(paladinBuffNames[spellName]["icon"])
                    currSpell:SetImageSize("14", "14")
                    currSpell:SetDisabled(true)
                    currSpell.image:SetAllPoints()
                    currSpell.image:SetVertexColor(1, 1, 1, 0.1)
                    currSpell:SetWidth(14)
                    currSpell:SetHeight(14)
                    playerContainer:AddChild(currSpell)
                else
                    local currSpell = AceGUI:Create("Icon")
                    currSpell:SetImage(paladinBuffNames[spellName]["icon"])
                    currSpell:SetImageSize("14", "14")
                    currSpell:SetDisabled(true)
                    
                    currSpell.image:SetAllPoints()
                    currSpell.image:SetVertexColor(1, 1, 1, 1)

                    -- local myCooldown = CreateFrame("Cooldown", "myCooldown", currSpell.frame, "CooldownFrameTemplate")
                    -- myCooldown:SetAllPoints()
                    -- myCooldown:SetCooldown(value['exp']-value['duration'], value['duration'])
                    -- myCooldown:SetReverse(true)
                    -- tinsert(cooldownFrames, myCooldown)

                    currSpell:SetWidth(14)
                    currSpell:SetHeight(14)

                    -- playerContainer:AddChildTest(myCooldown)
                    playerContainer:AddChild(currSpell)
                end
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
            currSpell.image:SetAllPoints()
            currSpell.image:SetColorTexture(0.5, 0.5, 0.5, 0.0);
            currSpell:SetDisabled(true)
            currSpell:SetImageSize("14", "14")
            currSpell:SetWidth(14)
            currSpell:SetHeight(14)
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

function PaladinBuffsTab:outputMissingDebuff(channel)
    sendBeginningMessage = true
    for key, value in pairs(paladinBuffNames) do
        if(next(value['missingThisBuff']) ~= nil) then
            local beginningString = value['short'] .. ":"
            local stringCompose = beginningString
            for k, v in pairs(value['missingThisBuff']) do
                if type(v) ~= "boolean" then
                    stringToAdd = k:sub(1, 4) .. "[" .. v .. "],"
                    if ( string.len(stringCompose) + string.len(stringToAdd) ) >= 255 then
                        if(sendBeginningMessage) then
                            sendBeginningMessage = false
                            CRA_SendChatMessage("[Classic Raid Assist] Outputting Missing Paladin Buffs: ", channel)
                        end
                        CRA_SendChatMessage(stringCompose:sub(1, -2), channel)
                        stringCompose = beginningString
                    end
                    stringCompose = stringCompose .. " " .. stringToAdd
                end
            end
            if(stringCompose ~= beginningString) then
                if(sendBeginningMessage) then
                    sendBeginningMessage = false
                    CRA_SendChatMessage("[Classic Raid Assist] Outputting Missing Paladin Buffs: ", channel)
                end
                CRA_SendChatMessage(stringCompose:sub(1, -2), channel)
            end
        end
    end
end

function PaladinBuffsTab:DrawPaladinBuffs(container)
    ClassicRaidAssist:ClearCooldowns()

    local checkBoxContainer = AceGUI:Create("InlineGroup")
    checkBoxContainer:SetTitle("Check for these Paladin Buffs:")
    checkBoxContainer:SetFullWidth(true)
    checkBoxContainer:SetLayout("Flow")

    local spacerGroup = AceGUI:Create("Label")
    spacerGroup:SetWidth(15)
    checkBoxContainer:AddChild(spacerGroup)

    local spellName = "Greater Blessing of Kings"
    local bok = AceGUI:Create("CheckBox")
    bok:SetWidth(60)
    bok:SetLabel("")
    bok:SetValue(ClassicRaidAssist.db.char.paladinBuffsToCheckFor[spellName])
    bok:SetImage(paladinBuffNames[spellName]["icon"])
    bok:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
    checkBoxContainer:AddChild(bok)

    local spellName = "Greater Blessing of Might"
    local bom = AceGUI:Create("CheckBox")
    bom:SetWidth(60)
    bom:SetLabel("")
    bom:SetValue(ClassicRaidAssist.db.char.paladinBuffsToCheckFor[spellName])
    bom:SetImage(paladinBuffNames[spellName]["icon"])
    bom:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
    checkBoxContainer:AddChild(bom)

    local spellName = "Greater Blessing of Wisdom"
    local bow = AceGUI:Create("CheckBox")
    bow:SetWidth(60)
    bow:SetLabel("")
    bow:SetValue(ClassicRaidAssist.db.char.paladinBuffsToCheckFor[spellName])
    bow:SetImage(paladinBuffNames[spellName]["icon"])
    bow:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
    checkBoxContainer:AddChild(bow)

    local spellName = "Greater Blessing of Salvation"
    local bosalv = AceGUI:Create("CheckBox")
    bosalv:SetWidth(60)
    bosalv:SetLabel("")
    bosalv:SetValue(ClassicRaidAssist.db.char.paladinBuffsToCheckFor[spellName])
    bosalv:SetImage(paladinBuffNames[spellName]["icon"])
    bosalv:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
    checkBoxContainer:AddChild(bosalv)

    local spellName = "Greater Blessing of Sanctuary"
    local bosanc = AceGUI:Create("CheckBox")
    bosanc:SetWidth(60)
    bosanc:SetLabel("")
    bosanc:SetValue(ClassicRaidAssist.db.char.paladinBuffsToCheckFor[spellName])
    bosanc:SetImage(paladinBuffNames[spellName]["icon"])
    bosanc:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
    checkBoxContainer:AddChild(bosanc)

    local spellName = "Greater Blessing of Light"
    local bol = AceGUI:Create("CheckBox")
    bol:SetWidth(60)
    bol:SetLabel("")
    bol:SetValue(ClassicRaidAssist.db.char.paladinBuffsToCheckFor[spellName])
    bol:SetImage(paladinBuffNames[spellName]["icon"])
    bol:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
    checkBoxContainer:AddChild(bol)

    container:AddChild(checkBoxContainer)

    local spacer = AceGUI:Create("SimpleGroup")
    spacer:SetFullWidth(true)
    spacer:SetLayout("Flow")
    spacer:SetHeight(80)
    
    local scanBtn = AceGUI:Create("Button")
    scanBtn:SetText("Scan for Paladin Buffs")
    scanBtn:SetWidth(200)
    if not (IsInGroup() or IsInRaid()) then
        scanBtn:SetDisabled(true)
        scanBtn:SetText("Can't scan, not in a group")
    end
    scanBtn:SetCallback("OnClick", function()
        container:ReleaseChildren()
        PaladinBuffsTab:DrawPaladinBuffs(container)
    end)
    spacer:AddChild(scanBtn)
    
    local reportBtn = AceGUI:Create("Button")
    reportBtn:SetText("Report")
    reportBtn:SetWidth(100)
    reportBtn:SetCallback("OnClick", function()
        PaladinBuffsTab:outputMissingDebuff(ClassicRaidAssist.db.char.CurrentPaladinBuffsOutputChannel)
    end)
    spacer:AddChild(reportBtn)

    local reportDropdown = AceGUI:Create("Dropdown")
    reportDropdown:SetWidth(100)
    reportDropdown:SetList(GetChatChannels())
    reportDropdown:SetValue(ClassicRaidAssist.db.char.CurrentPaladinBuffsOutputChannel)
    reportDropdown:SetCallback("OnValueChanged", function(widget, event, key)
        ClassicRaidAssist.db.char.CurrentPaladinBuffsOutputChannel = key
    end)
    spacer:AddChild(reportDropdown)

    container:AddChild(spacer)

    container:AddChild(PaladinBuffsTab:ScanPaladinBuffs())
end