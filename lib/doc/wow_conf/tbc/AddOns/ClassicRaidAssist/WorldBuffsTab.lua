local WorldBuffsTab =  {}
_G["WorldBuffsTab"] = WorldBuffsTab

local AceGUI = LibStub("AceGUI-3.0")

local raidBuffNames = {
    ["Rallying Cry of the Dragonslayer"] = {
        ["alts"] = {"22888"},
        ["icon"] = "Interface\\Icons\\inv_misc_head_dragon_01",
        ["short"] = "RC",
        ["hasThisBuff"] = {}
    },
    ["Songflower Serenade"] = {
        ["alts"] = {"15366"},
        ["icon"] = "Interface\\Icons\\spell_holy_mindvision",
        ["short"] = "Songflower",
        ["hasThisBuff"] = {}
    },
    ["Warchief's Blessing"] = {
        ["alts"] = {"16609"},
        ["icon"] = "Interface\\Icons\\spell_arcane_teleportorgrimmar",
        ["short"] = "WCB",
        ["hasThisBuff"] = {}
    },
    ["DMF"] = {
        ["alts"] = {"23736", "23766", "23738", "23737", "23735", "23767", "23769", "23768"},
        ["icon"] = "Interface\\Icons\\inv_misc_orb_02",
        ["short"] = "DMF",
        ["hasThisBuff"] = {}
    },
    ["DM Tribute"] = {
        ["alts"] = {"22817", "22820", "22818"},
        ["icon"] = "Interface\\Icons\\spell_nature_massteleport",
        ["short"] = "DM",
        ["hasThisBuff"] = {}
    }
}

local function OnValueChanged(spellName)
    if(ClassicRaidAssist.db.char.worldBuffsToCheckFor[spellName] == false or ClassicRaidAssist.db.char.worldBuffsToCheckFor[spellName] == nil) then
        ClassicRaidAssist.db.char.worldBuffsToCheckFor[spellName] = true
    else
        ClassicRaidAssist.db.char.worldBuffsToCheckFor[spellName] = false
    end
end

function WorldBuffsTab:ScanWorldBuffs()

    for key, value in pairs(raidBuffNames) do
        value['hasThisBuff'] = {}
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
    -- scroll:LayoutFinished(16,  500)
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
                ['spellsPresent'] = {}
            }

            for key, value in pairs(ClassicRaidAssist.db.char.worldBuffsToCheckFor) do

                if value then

                    for k, v in pairs(raidBuffNames[key]["alts"]) do

                        hasBuff, duration, expirationTime = CheckUnitForBuff(currPlayerName, v)

                        if not hasBuff then
                            raidBuffNames[key]['hasThisBuff'][currPlayerName] = false
                            subgroups[subgroup][currPlayerName]['spellsPresent'][key] = {['exp'] = expirationTime, ['duration'] = duration, ['spellsPresent'] = false}
                        else
                            raidBuffNames[key]['hasThisBuff'][currPlayerName] = subgroup
                            subgroups[subgroup][currPlayerName]['spellsPresent'][key] = {['exp'] = expirationTime, ['duration'] = duration, ['spellsPresent'] = true}
                            break
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
        --         ['spellsPresent'] = {}
        --     }
        --     for k, v in pairs(raidBuffNames) do
        --         subgroups[subgroup][currPlayerName]['spellsPresent'][k] = true
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
            -- playerContainer:SetHeight(16)

            local currName = AceGUI:Create("Label")
            currName:SetWidth(80)
            currName.characterName = k
            -- print(k)
            -- print(v['class'])
            currName:SetText("|c" .. RAID_CLASS_COLORS[v['class']].colorStr .. k .. "|r")
            -- RegisterUnitWatch(currName.frame) 
            -- currName.frame:SetAttribute("unit", currName.characterName)
            -- currName.frame:RegisterForClicks("AnyUp")
            -- currName.frame:SetAttribute("*type1", "target")
            -- currName:SetCallback("OnClick", function(widget)
            --     -- TargetUnit()
            -- end)
            playerContainer:AddChild(currName)
            
            -- for temp1, temp2 in pairs(v['spellsPresent']) do
            --     print('-----')
            --     print(temp1)
            --     print(temp2)
            -- end
            -- if(next(v['spellsPresent']) == nil) then
            --     local currSpell = AceGUI:Create("Icon")
            --     currSpell:SetImage("Interface\\Icons\\spell_holy_magicalsentry")
            --     currSpell.image:SetColorTexture(0.5, 0.5, 0.5, 0.0);
            --     currSpell:SetDisabled(true)
            --     currSpell:SetImageSize("16", "16")
            --     currSpell:SetWidth(16)
            --     currSpell:SetHeight(16)
            --     playerContainer:AddChild(currSpell)                            
            -- end

            if(next(v['spellsPresent']) == nil) then
                local currSpell = AceGUI:Create("Icon")
                currSpell:SetImage("Interface\\Icons\\spell_holy_magicalsentry")
                currSpell.image:SetAllPoints()
                currSpell.image:SetColorTexture(0.5, 0.5, 0.5, 0.0);
                currSpell:SetDisabled(true)
                currSpell:SetImageSize("14", "14")
                currSpell:SetWidth(14)
                currSpell:SetHeight(14)
                playerContainer:AddChild(currSpell) 
            end

            for spellName, value in pairs(v['spellsPresent']) do
                if value == nil or not value['spellsPresent'] then
                    local currSpell = AceGUI:Create("Icon")
                    currSpell:SetImage(raidBuffNames[spellName]["icon"])
                    currSpell:SetImageSize("14", "14")
                    currSpell:SetDisabled(true)
                    currSpell.image:SetAllPoints()
                    currSpell.image:SetVertexColor(1, 1, 1, 0.1)
                    currSpell:SetWidth(14)
                    currSpell:SetHeight(14)
                    playerContainer:AddChild(currSpell)
                else
                    local currSpell = AceGUI:Create("Icon")
                    currSpell:SetImage(raidBuffNames[spellName]["icon"])
                    currSpell:SetImageSize("14", "14")
                    currSpell:SetDisabled(true)
                    currSpell.image:SetAllPoints()
                    currSpell.image:SetVertexColor(1, 1, 1, 1)
                    currSpell:SetWidth(14)
                    currSpell:SetHeight(14)

                    -- local myCooldown = CreateFrame("Cooldown", "myCooldown", currSpell.frame, "CooldownFrameTemplate")
                    -- myCooldown:SetAllPoints()
                    -- myCooldown:SetCooldown(value['exp']-value['duration'], value['duration'])
                    -- myCooldown:SetReverse(true)
                    -- tinsert(cooldownFrames, myCooldown)

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

function WorldBuffsTab:outputBuffs(channel)
    sendBeginningMessage = true
    for key, value in pairs(raidBuffNames) do
        if(next(value['hasThisBuff']) ~= nil) then
            local beginningString = value['short'] .. ":"
            local stringCompose = beginningString
            for k, v in pairs(value['hasThisBuff']) do
                if type(v) ~= "boolean" then
                    stringToAdd = k:sub(1, 4) .. "[" .. v .. "],"
                    if ( string.len(stringCompose) + string.len(stringToAdd) ) >= 255 then
                        if(sendBeginningMessage) then
                            sendBeginningMessage = false
                            CRA_SendChatMessage("[Classic Raid Assist] Outputting People With World Buffs: ", channel)
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
                    CRA_SendChatMessage("[Classic Raid Assist] Outputting People With World Buffs: ", channel)
                end
                CRA_SendChatMessage(stringCompose:sub(1, -2), channel)
            end
        end
    end
end

function WorldBuffsTab:DrawWorldBuffs(container)
    ClassicRaidAssist:ClearCooldowns()

    local worldBuffCheckBox = AceGUI:Create("InlineGroup")
    worldBuffCheckBox:SetTitle("Check for these World Buffs:")
    worldBuffCheckBox:SetFullWidth(true)

    worldBuffCheckBox:SetLayout("Flow")

    if (ClassicRaidAssist.faction == "Horde") then
        local spacerGroup = AceGUI:Create("Label")
        spacerGroup:SetWidth(10)
        worldBuffCheckBox:AddChild(spacerGroup)

        local spellName = "Rallying Cry of the Dragonslayer"
        local rallyingCry = AceGUI:Create("CheckBox")
        rallyingCry:SetWidth(65)
        rallyingCry:SetLabel("")
        rallyingCry:SetValue(ClassicRaidAssist.db.char.worldBuffsToCheckFor[spellName])
        rallyingCry:SetImage(raidBuffNames[spellName]["icon"])
        rallyingCry:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
        worldBuffCheckBox:AddChild(rallyingCry)

        local spellName = "Songflower Serenade"
        local songFlower = AceGUI:Create("CheckBox")
        songFlower:SetWidth(65)
        songFlower:SetLabel("")
        songFlower:SetValue(ClassicRaidAssist.db.char.worldBuffsToCheckFor[spellName])
        songFlower:SetImage(raidBuffNames[spellName]["icon"])
        songFlower:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
        worldBuffCheckBox:AddChild(songFlower)

        local spellName = "Warchief's Blessing"
        local warchiefsBlessing = AceGUI:Create("CheckBox")
        warchiefsBlessing:SetWidth(65)
        warchiefsBlessing:SetLabel("")
        warchiefsBlessing:SetValue(ClassicRaidAssist.db.char.worldBuffsToCheckFor[spellName])
        warchiefsBlessing:SetImage(raidBuffNames[spellName]["icon"])
        warchiefsBlessing:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
        worldBuffCheckBox:AddChild(warchiefsBlessing)

        local spellName = "DMF"
        local dmf = AceGUI:Create("CheckBox")
        dmf:SetWidth(65)
        dmf:SetLabel("")
        dmf:SetValue(ClassicRaidAssist.db.char.worldBuffsToCheckFor[spellName])
        dmf:SetImage(raidBuffNames[spellName]["icon"])
        dmf:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
        worldBuffCheckBox:AddChild(dmf)

        local spellName = "DM Tribute"
        local dmBuffs = AceGUI:Create("CheckBox")
        dmBuffs:SetWidth(100)
        dmBuffs:SetValue(ClassicRaidAssist.db.char.worldBuffsToCheckFor[spellName])
        dmBuffs:SetImage(raidBuffNames[spellName]["icon"])
        dmBuffs:SetLabel("DM Buffs")
        dmBuffs:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
        worldBuffCheckBox:AddChild(dmBuffs)
    else
        local spacerGroup = AceGUI:Create("Label")
        spacerGroup:SetWidth(10)
        worldBuffCheckBox:AddChild(spacerGroup)

        local spellName = "Rallying Cry of the Dragonslayer"
        local rallyingCry = AceGUI:Create("CheckBox")
        rallyingCry:SetWidth(90)
        rallyingCry:SetLabel("")
        rallyingCry:SetValue(ClassicRaidAssist.db.char.worldBuffsToCheckFor[spellName])
        rallyingCry:SetImage(raidBuffNames[spellName]["icon"])
        rallyingCry:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
        worldBuffCheckBox:AddChild(rallyingCry)

        local spellName = "Songflower Serenade"
        local songFlower = AceGUI:Create("CheckBox")
        songFlower:SetWidth(90)
        songFlower:SetLabel("")
        songFlower:SetValue(ClassicRaidAssist.db.char.worldBuffsToCheckFor[spellName])
        songFlower:SetImage(raidBuffNames[spellName]["icon"])
        songFlower:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
        worldBuffCheckBox:AddChild(songFlower)

        local spellName = "Warchief's Blessing"
        ClassicRaidAssist.db.char.worldBuffsToCheckFor[spellName] = false

        local spellName = "DMF"
        local dmf = AceGUI:Create("CheckBox")
        dmf:SetWidth(90)
        dmf:SetLabel("")
        dmf:SetValue(ClassicRaidAssist.db.char.worldBuffsToCheckFor[spellName])
        dmf:SetImage(raidBuffNames[spellName]["icon"])
        dmf:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
        worldBuffCheckBox:AddChild(dmf)

        local spellName = "DM Tribute"
        local dmBuffs = AceGUI:Create("CheckBox")
        dmBuffs:SetWidth(100)
        dmBuffs:SetValue(ClassicRaidAssist.db.char.worldBuffsToCheckFor[spellName])
        dmBuffs:SetImage(raidBuffNames[spellName]["icon"])
        dmBuffs:SetLabel("DM Buffs")
        dmBuffs:SetCallback("OnValueChanged", function() OnValueChanged(spellName) end)
        worldBuffCheckBox:AddChild(dmBuffs)
    end

    container:AddChild(worldBuffCheckBox)

    -- local scanBtn = AceGUI:Create("Button")
    -- scanBtn:SetText("Scan Raid")
    -- scanBtn:SetFullWidth(true)
    -- container:AddChild(scanBtn)
    -- scanBtn:SetCallback("OnClick", function()
    --     ClassicRaidAssist:Scan()
    --     container:ReleaseChildren()
    --     DrawWorldBuffs(container)
    -- end)

    local spacer = AceGUI:Create("SimpleGroup")
    spacer:SetFullWidth(true)
    spacer:SetLayout("Flow")
    spacer:SetHeight(80)
    
    local scanBtn = AceGUI:Create("Button")
    scanBtn:SetText("Scan for World Buffs")
    scanBtn:SetWidth(200)
    if not (IsInGroup() or IsInRaid()) then
        scanBtn:SetDisabled(true)
        scanBtn:SetText("Can't scan, not in a group")
    end
    scanBtn:SetCallback("OnClick", function()
        container:ReleaseChildren()
        WorldBuffsTab:DrawWorldBuffs(container)
    end)
    spacer:AddChild(scanBtn)
    
    local reportBtn = AceGUI:Create("Button")
    reportBtn:SetText("Report")
    reportBtn:SetWidth(100)
    reportBtn:SetCallback("OnClick", function()
        WorldBuffsTab:outputBuffs(ClassicRaidAssist.db.char.CurrentWorldBuffsOutputChannel)
    end)
    spacer:AddChild(reportBtn)

    local reportDropdown = AceGUI:Create("Dropdown")
    reportDropdown:SetWidth(100)
    reportDropdown:SetList(GetChatChannels())
    reportDropdown:SetValue(ClassicRaidAssist.db.char.CurrentWorldBuffsOutputChannel)
    reportDropdown:SetCallback("OnValueChanged", function(widget, event, key)
        ClassicRaidAssist.db.char.CurrentWorldBuffsOutputChannel = key
    end)
    spacer:AddChild(reportDropdown)

    container:AddChild(spacer)

    container:AddChild(WorldBuffsTab:ScanWorldBuffs())
end