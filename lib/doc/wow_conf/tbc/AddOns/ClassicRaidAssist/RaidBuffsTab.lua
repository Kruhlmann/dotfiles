local RaidBuffsTab =  {}
_G["RaidBuffsTab"] = RaidBuffsTab

local AceGUI = LibStub("AceGUI-3.0")

local raidBuffNames = {
    ["Prayer of Fortitude"] = {
        ["alts"] = {"21564", "10938"},
        ["icon"] = "Interface\\Icons\\spell_holy_prayeroffortitude",
        ["short"] = "Fort",
        ["missingThisBuff"] = {},
        ["smartFiltering"] = false
    },
    ["Prayer of Spirit"] = {
        ["alts"] = {"27681", "27841"},
        ["icon"] = "Interface\\Icons\\spell_holy_prayerofspirit",
        ["short"] = "Spirit",
        ["missingThisBuff"] = {},
        ["smartFiltering"] = true
    },
    ["Gift of the Wild"] = {
        ["alts"] = {"21850", "9885"},
        ["icon"] = "Interface\\Icons\\spell_nature_regeneration",
        ["short"] = "MoTW",
        ["missingThisBuff"] = {},
        ["smartFiltering"] = false
    },
    ["Arcane Intellect"] = {
        ["alts"] = {"23028", "10157"},
        ["icon"] = "Interface\\Icons\\spell_holy_magicalsentry",
        ["short"] = "Int",
        ["missingThisBuff"] = {},
        ["smartFiltering"] = true
    }
}

local function OnValueChanged(spellName)
    if(ClassicRaidAssist.db.char.buffsToCheckFor[spellName] == false or ClassicRaidAssist.db.char.buffsToCheckFor[spellName] == nil) then
        ClassicRaidAssist.db.char.buffsToCheckFor[spellName] = true
    else
        ClassicRaidAssist.db.char.buffsToCheckFor[spellName] = false
    end
end

function RaidBuffsTab:ScanRaidBuffs()
    for key, value in pairs(raidBuffNames) do
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
    leftContainer:SetWidth(180)
    leftContainer:SetLayout("Flow")
    rightContainer:SetWidth(180)
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

            for key, value in pairs(ClassicRaidAssist.db.char.buffsToCheckFor) do

                if value then

                    for k, v in pairs(raidBuffNames[key]["alts"]) do

                        hasBuff, duration, expirationTime = CheckUnitForBuff(currPlayerName, v)

                        if (ClassicRaidAssist.db.char.smartBuffFiltering and (englishClass == "WARRIOR" or englishClass == "ROGUE") and (raidBuffNames[key]['smartFiltering'])) then
                            subgroups[subgroup][currPlayerName]['spellsMissing'][key] = {['missingBuff'] = 0}
                        else 
                            if not hasBuff then
                                raidBuffNames[key]['missingThisBuff'][currPlayerName] = subgroup
                                subgroups[subgroup][currPlayerName]['spellsMissing'][key] = {['missingBuff'] = true}
                            else
                                raidBuffNames[key]['missingThisBuff'][currPlayerName] = false
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
        --     for k, v in pairs(raidBuffNames) do
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
        -- groupContainer:SetWidth(160)
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
            currName:SetWidth(90)
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
                currSpell:SetImageSize("16", "16")
                currSpell.image:SetAllPoints()
                currSpell:SetWidth(16)
                currSpell:SetHeight(16)
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
                    currSpell:SetImage(raidBuffNames[spellName]["icon"])
                    currSpell:SetImageSize("16", "16")
                    currSpell:SetDisabled(true)
                    currSpell.image:SetAllPoints()
                    currSpell.image:SetVertexColor(1, 1, 1, 0.1)
                    currSpell:SetWidth(16)
                    currSpell:SetHeight(16)
                    playerContainer:AddChild(currSpell)
                else
                    local currSpell = AceGUI:Create("Icon")
                    currSpell:SetImage(raidBuffNames[spellName]["icon"])
                    currSpell:SetImageSize("16", "16")
                    currSpell:SetDisabled(true)
                    
                    currSpell.image:SetAllPoints()
                    currSpell.image:SetVertexColor(1, 1, 1, 1)

                    -- local myCooldown = CreateFrame("Cooldown", "myCooldown", currSpell.frame, "CooldownFrameTemplate")
                    -- myCooldown:SetAllPoints()
                    -- myCooldown:SetCooldown(value['exp']-value['duration'], value['duration'])
                    -- myCooldown:SetReverse(true)
                    -- tinsert(cooldownFrames, myCooldown)

                    currSpell:SetWidth(16)
                    currSpell:SetHeight(16)

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

function RaidBuffsTab:outputMissingDebuff(channel)
    sendBeginningMessage = true
    for key, value in pairs(raidBuffNames) do
        if(next(value['missingThisBuff']) ~= nil) then
            local beginningString = value['short'] .. ":"
            local stringCompose = beginningString
            for k, v in pairs(value['missingThisBuff']) do
                if type(v) ~= "boolean" then
                    stringToAdd = k:sub(1, 4) .. "[" .. v .. "],"
                    if ( string.len(stringCompose) + string.len(stringToAdd) ) >= 255 then
                        if(sendBeginningMessage) then
                            sendBeginningMessage = false
                            CRA_SendChatMessage("[Classic Raid Assist] Outputting Missing Raid Buffs: ", channel)
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
                    CRA_SendChatMessage("[Classic Raid Assist] Outputting Missing Raid Buffs: ", channel)
                end
                CRA_SendChatMessage(stringCompose:sub(1, -2), channel)
            end
        end
    end
end

function RaidBuffsTab:DrawRaidBuffs(container)
    ClassicRaidAssist:ClearCooldowns()

    local checkBoxContainer = AceGUI:Create("InlineGroup")
    checkBoxContainer:SetTitle("Check for these Raid Buffs:")
    checkBoxContainer:SetFullWidth(true)
    checkBoxContainer:SetLayout("Flow")

    local spacerGroup = AceGUI:Create("Label")
    spacerGroup:SetWidth(30)
    checkBoxContainer:AddChild(spacerGroup)

    local spellName = "Prayer of Fortitude"
    local prayerOfFortitude = AceGUI:Create("CheckBox")
    prayerOfFortitude:SetWidth(90)
    prayerOfFortitude:SetLabel("")
    prayerOfFortitude:SetValue(ClassicRaidAssist.db.char.buffsToCheckFor[spellName])
    prayerOfFortitude:SetImage(raidBuffNames[spellName]["icon"])
    prayerOfFortitude:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
    checkBoxContainer:AddChild(prayerOfFortitude)

    local spellName = "Prayer of Spirit"
    local prayerOfSpirit = AceGUI:Create("CheckBox")
    prayerOfSpirit:SetWidth(90)
    prayerOfSpirit:SetLabel("")
    prayerOfSpirit:SetValue(ClassicRaidAssist.db.char.buffsToCheckFor[spellName])
    prayerOfSpirit:SetImage(raidBuffNames[spellName]["icon"])
    prayerOfSpirit:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
    checkBoxContainer:AddChild(prayerOfSpirit)

    local spellName = "Gift of the Wild"
    local giftOfTheWild = AceGUI:Create("CheckBox")
    giftOfTheWild:SetWidth(90)
    giftOfTheWild:SetLabel("")
    giftOfTheWild:SetValue(ClassicRaidAssist.db.char.buffsToCheckFor[spellName])
    giftOfTheWild:SetImage(raidBuffNames[spellName]["icon"])
    giftOfTheWild:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
    checkBoxContainer:AddChild(giftOfTheWild)

    local spellName = "Arcane Intellect"
    local arcaneIntellect = AceGUI:Create("CheckBox")
    arcaneIntellect:SetWidth(50)
    arcaneIntellect:SetLabel("")
    arcaneIntellect:SetValue(ClassicRaidAssist.db.char.buffsToCheckFor[spellName])
    arcaneIntellect:SetImage(raidBuffNames[spellName]["icon"])
    arcaneIntellect:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
    checkBoxContainer:AddChild(arcaneIntellect)

    container:AddChild(checkBoxContainer)

    -- local scanBtn = AceGUI:Create("Button")
    -- scanBtn:SetText("Scan Raid")
    -- scanBtn:SetFullWidth(true)
    -- container:AddChild(scanBtn)
    -- scanBtn:SetCallback("OnClick", function()
    --     ClassicRaidAssist:Scan()
    --     container:ReleaseChildren()
    --     DrawRaidBuffs(container)
    -- end)

    local spacer = AceGUI:Create("SimpleGroup")
    spacer:SetFullWidth(true)
    spacer:SetLayout("Flow")
    spacer:SetHeight(80)
    
    local scanBtn = AceGUI:Create("Button")
    scanBtn:SetText("Scan for Raid Buffs")
    scanBtn:SetWidth(200)
    if not (IsInGroup() or IsInRaid()) then
        scanBtn:SetDisabled(true)
        scanBtn:SetText("Can't scan, not in a group")
    end
    scanBtn:SetCallback("OnClick", function()
        container:ReleaseChildren()
        RaidBuffsTab:DrawRaidBuffs(container)
    end)
    spacer:AddChild(scanBtn)
    
    local reportBtn = AceGUI:Create("Button")
    reportBtn:SetText("Report")
    reportBtn:SetWidth(100)
    reportBtn:SetCallback("OnClick", function()
        RaidBuffsTab:outputMissingDebuff(ClassicRaidAssist.db.char.CurrentRaidBuffsOutputChannel)
    end)
    spacer:AddChild(reportBtn)

    local reportDropdown = AceGUI:Create("Dropdown")
    reportDropdown:SetWidth(100)
    reportDropdown:SetList(GetChatChannels())
    reportDropdown:SetValue(ClassicRaidAssist.db.char.CurrentRaidBuffsOutputChannel)
    reportDropdown:SetCallback("OnValueChanged", function(widget, event, key)
        ClassicRaidAssist.db.char.CurrentRaidBuffsOutputChannel = key
    end)
    spacer:AddChild(reportDropdown)

    container:AddChild(spacer)

    container:AddChild(RaidBuffsTab:ScanRaidBuffs())
end