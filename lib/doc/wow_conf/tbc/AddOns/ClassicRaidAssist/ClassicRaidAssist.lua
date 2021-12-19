ClassicRaidAssist = LibStub("AceAddon-3.0"):NewAddon("ClassicRaidAssist", "AceConsole-3.0", "AceHook-3.0", "AceEvent-3.0", "AceComm-3.0", "AceSerializer-3.0")
_G['ClassicRaidAssist'] = ClassicRaidAssist
_G['cooldownFrames'] = {}

local MAX_NUMBER_OF_UNITS = 100
local curr_unit_pointer = 1

local list_of_units = {}
for i=1, MAX_NUMBER_OF_UNITS do
    list_of_units[i] = nil
end

local announcePrefix = "CRA_announce"
local questionPrefix = "CRA_question"
local scanSendPrefix = "CRA_scansend"
local scanRecievePrefix = "CRA_scanrecieve"
local questionItemPrefix = "CRA_questionitem"
local sendItemPrefix = "CRA_senditem"
local sendBadItemPrefix = "CRA_sendbaditem"
local consumableQuestionItemPrefix = "CRA_cqi"
local consumableSendItemPrefix = "CRA_csi"
local checkBuffPrefix = "CRA_buff"

local version = GetAddOnMetadata("ClassicRaidAssist", "Version")
ClassicRaidAssist.version = version

local name, _ = UnitName("player")
local _, thisPlayerClass, _ = UnitClass("player")
thisPlayerClass = string.lower(thisPlayerClass):gsub("^%l", string.upper)
ClassicRaidAssist.thisPlayerClass = thisPlayerClass
local faction, _ = UnitFactionGroup("player")
ClassicRaidAssist.faction = faction
ClassicRaidAssist.thisPlayerSpec = "Loading"

local hasScanned = false

function ClassicRaidAssist:Scan()
    hasScanned = true
    self.raid[name] = version
    ClassicRaidAssist:SendMessage(version, scanSendPrefix)
end

function ClassicRaidAssist:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("ClassicRaidAssistDB", {
        factionrealm = {
            minimapButton = {hide = false}
        },
        char = {
            buffsToCheckFor = {},
            worldBuffsToCheckFor = {},
            paladinBuffsToCheckFor = {},
            consumablesToCheckFor = {
                ["Ele Shaman"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Enh Shaman"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Feral DPS"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Feral Tank"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Healing Priest"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Holy Paladin"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Hunter"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Mage"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Moonkin"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Prot Paladin"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Prot Warrior"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Resto Druid"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Resto Shaman"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Ret Paladin"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Rogue"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Shadow Priest"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["Warlock"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                },
                ["DPS Warrior"] = {
                    ["ITEM"] = {},
                    ["BUFF"] = {}
                }
            },
            CurrentRaidBuffsOutputChannel = "RAID",
            CurrentWorldBuffsOutputChannel = "RAID",
            CurrentRaidItemsOutputChannel = "RAID",
            CurrentConsumablesOutputChannel = "RAID",
            CurrentPaladinBuffsOutputChannel = "RAID",
            CurrentReadyCheckOutputChannel = "RAID",
            CurrentRaidItemCheck = "Aqual Quintessence",
            smartBuffFiltering = true,
            readyCheckOutput = false,
            allowItemScanning = true,
            raidItemsContainer = nil,
            settingsContainer = nil,
            consumablesContainer = nil,
            currentTab = "raidBuffs",
            currentSpecTab = "Warlock",
            currentConsumableType = "ITEM"
        }
    }, true)
    
    self.raid = {}
    self.unit = {}
    
    self:RegisterComm(announcePrefix, "OnAnnounce")
    self:RegisterComm(questionPrefix, "OnQuestion")
    self:RegisterComm(scanSendPrefix, "OnScanSend")
    self:RegisterComm(scanRecievePrefix, "OnScanRecieve")
    self:RegisterComm(questionItemPrefix, "OnQuestionItem")
    self:RegisterComm(sendItemPrefix, "OnSendItem")
    self:RegisterComm(sendBadItemPrefix, "OnSendBadItem")
    self:RegisterComm(consumableQuestionItemPrefix, "OnConsumableQuestionItem")
    self:RegisterComm(consumableSendItemPrefix, "OnConsumableSendItem")
    self:RegisterComm(checkBuffPrefix, "OnBuffCheck")
    
    local frame = CreateFrame("Frame")
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")
    frame:SetScript("OnEvent", function(self)
        ClassicRaidAssist.thisPlayerSpec = determineSpec(ClassicRaidAssist.thisPlayerClass)
        ClassicRaidAssistGUI_frame:SetStatusText("v" .. ClassicRaidAssist.version .. " Spec: " .. ClassicRaidAssist.thisPlayerSpec .. " Class: " .. ClassicRaidAssist.thisPlayerClass)
    end)

    local readyCheckFrame = CreateFrame("Frame")
    readyCheckFrame:RegisterEvent("READY_CHECK")
    readyCheckFrame:SetScript("OnEvent", function(self)
        ClassicRaidAssist:ReadyCheckOutput()
    end)

    ClassicRaidAssist:SetUpMouseEvent()
    ClassicRaidAssistGUI:SetUpGUI()
    ClassicRaidAssist:SetUpMinimapIcon()
    
    local options = {
        name = 'ClassicRaidAssist',
        type = 'group'
    }
    LibStub("AceConfig-3.0"):RegisterOptionsTable("ClassicRaidAssist", options)
end 

function ClassicRaidAssist:ClearCooldowns()
    for key, value in pairs(cooldownFrames) do
        value:Hide()
    end
    cooldownFrames  = {}
end

function ClassicRaidAssist:SendMessage(msg, prefix)
    local instance, instanceType = IsInInstance()
    if(instance) then
        if(instanceType == "raid") then
            ClassicRaidAssist:SendCommMessage(prefix, msg, "RAID")
        elseif(instanceType == "party") then
            ClassicRaidAssist:SendCommMessage(prefix, msg, "PARTY")
        else
            ClassicRaidAssist:SendCommMessage(prefix, msg, "INSTANCE_CHAT")
        end
    elseif(IsInRaid()) then
        ClassicRaidAssist:SendCommMessage(prefix, msg, "RAID")
    elseif(IsInGroup()) then
        ClassicRaidAssist:SendCommMessage(prefix, msg, "PARTY")
    end
end

function ClassicRaidAssist:ConsumableQuestion(spec, item)
    ClassicRaidAssist:SendMessage(spec .. "--" .. item, consumableQuestionItemPrefix)
end

function ClassicRaidAssist:QuestionBuffs(currentType, key, spec, name)
    ClassicRaidAssist:SendMessage("QUESTION--" .. spec .. "--" .. key .. "--" .. currentType .. "--".. name .. "--0--0", checkBuffPrefix)
end

function ClassicRaidAssist:OnBuffCheck(prefix, message, distribution, sender)
    -- Question/Send -- spec -- key -- Item/Buff -- Name -- has -- Remaining Time -- 
    local tokens = splitString(message, "--")
    local messageType = tokens[1]
    local spec = tokens[2]
    local key = tokens[3]
    local itemOrBuff = tokens[4]
    local buffName = tokens[5]
    local hasBuff = tokens[6]
    local remainingTime = tokens[7]
    consumables = ConsumablesTab:getConsumables()
    
    ClassicRaidAssist.thisPlayerSpec = determineSpec(ClassicRaidAssist.thisPlayerClass)

    if messageType == "QUESTION" then
        if not ClassicRaidAssist.db.char.allowItemScanning then
            return
        end

        if spec == ClassicRaidAssist.thisPlayerSpec then
            if(itemOrBuff == "ITEM") and consumables[spec]['consumables'][key] ~= nil and consumables[spec]['consumables'][key]['itemName'] == buffName then
                count  = GetItemCount(buffName)
                if count > 0 then
                    ClassicRaidAssist:SendMessage("SEND--" .. ClassicRaidAssist.thisPlayerSpec .. "--" .. key .. "--ITEM--".. buffName .. "--1--0", checkBuffPrefix)
                else
                    ClassicRaidAssist:SendMessage("SEND--" .. ClassicRaidAssist.thisPlayerSpec .. "--" .. key .. "--ITEM--".. buffName .. "--0--0", checkBuffPrefix)
                end
            elseif(itemOrBuff == "BUFF") then
                local hasBuff, duration, expirationTime = CheckUnitForBuff("player", buffName)
                if hasBuff then
                    ClassicRaidAssist:SendMessage("SEND--" .. ClassicRaidAssist.thisPlayerSpec .. "--" .. key .. "--BUFF--".. buffName .. "--1--" .. tostring(expirationTime), checkBuffPrefix)
                else
                    ClassicRaidAssist:SendMessage("SEND--" .. ClassicRaidAssist.thisPlayerSpec .. "--" .. key .. "--BUFF--".. buffName .. "--0--0", checkBuffPrefix)
                end
            end
        end
    elseif messageType == "SEND" then
        if(consumables[spec]['currentBuffs'][sender] == nil) then
            consumables[spec]['currentBuffs'][sender] = {}
        end

        if hasBuff == "1" then
            consumables[spec]['currentBuffs'][sender][key] = "1"
        else
            consumables[spec]['currentBuffs'][sender][key] = "0"
        end
            
        CRA_wait(1, function() 
            if(ClassicRaidAssist.db.char.currentTab == "consumables" and ClassicRaidAssistGUI_Shown) then
                ClassicRaidAssist.db.char.consumablesContainer:ReleaseChildren()
                ConsumablesTab:DrawConsumables(ClassicRaidAssist.db.char.consumablesContainer)
            end
        end, "consumables")

        CRA_wait(1, function()
            if(ClassicRaidAssistReadyCheck) then
                RaidBuffsTab:outputMissingDebuff(ClassicRaidAssist.db.char.CurrentReadyCheckOutputChannel)
                if not (ClassicRaidAssist.faction == "Horde") then
                    PaladinBuffsTab:outputMissingDebuff(ClassicRaidAssist.db.char.CurrentReadyCheckOutputChannel)
                end
                ConsumablesTab:outputBuffs(ClassicRaidAssist.db.char.CurrentReadyCheckOutputChannel, "BUFF", "All Classes")
                ClassicRaidAssistReadyCheck = false
            end
        end, "readyCheck")

    end
end

function ClassicRaidAssist:OnConsumableQuestionItem(prefix, message, distribution, sender)
    if not ClassicRaidAssist.db.char.allowItemScanning then
        return
    end

    local tokens = splitString(message, "--")
    -- local tokens = string.gmatch(message, "[^--]+")
    spec = tokens[1]
    item = tokens[2]
    consumables = ConsumablesTab:getConsumables()
    if spec == ClassicRaidAssist.thisPlayerSpec then
        for key, value in pairs(consumables[spec]['consumables']) do
            if(value['itemId'] == item) then
                -- check to see if this players spec and the item checking for is in the consumables list, protects against malicious
                count  = GetItemCount(item)
                ClassicRaidAssist:SendMessage(item .. "--" .. count .. "--" .. spec, consumableSendItemPrefix)
                return
            end
        end
    end
end

function ClassicRaidAssist:OnConsumableSendItem(prefix, message, distribution, sender)
    local specs = ConsumablesTab:getConsumables()
    local tokens = splitString(message, "--")
    item = tokens[1]
    count = tonumber(tokens[2])
    currentSpec = tokens[3]

    if(specs[currentSpec] == nil) then
        return
    end

    if(specs[currentSpec]['currentItems'][sender] == nil) then
        specs[currentSpec]['currentItems'][sender] = {}
    end
    
    to_add = "0"
    if(count > 0) then
        to_add = "1"
    end
    
    for key, value in pairs(consumables[currentSpec]['consumables']) do
        if(value['itemId'] == item) then
            specs[currentSpec]['currentItems'][sender][key] = to_add
            break
        end
    end

    CRA_wait(1, function() 
        if(ClassicRaidAssist.db.char.currentTab == "consumables" and ClassicRaidAssistGUI_Shown) then
            ClassicRaidAssist.db.char.consumablesContainer:ReleaseChildren()
            ConsumablesTab:DrawConsumables(ClassicRaidAssist.db.char.consumablesContainer)
        end
    end, "consumables")
    
    CRA_wait(1, function()
        if(ClassicRaidAssistReadyCheck) then
            RaidBuffsTab:outputMissingDebuff(ClassicRaidAssist.db.char.CurrentReadyCheckOutputChannel)
            if not (ClassicRaidAssist.faction == "Horde") then
                PaladinBuffsTab:outputMissingDebuff(ClassicRaidAssist.db.char.CurrentReadyCheckOutputChannel)
            end
            ConsumablesTab:outputBuffs(ClassicRaidAssist.db.char.CurrentReadyCheckOutputChannel, "BUFF", "All Classes")
            ClassicRaidAssistReadyCheck = false
        end
    end, "readyCheck")
end

function ClassicRaidAssist:DetermineLooter(guid)
    canLoot, inRange = CanLootUnit(guid)
    if canLoot then
        local localizedClass, englishClass, classIndex = UnitClass("player")
        ClassicRaidAssist:SendMessage(guid, announcePrefix)
        return name, englishClass, false
    else
        ClassicRaidAssist:SendMessage(guid, questionPrefix)
        return _, _, true
    end
end

function ClassicRaidAssist:ScanForItem(message)
    ClassicRaidAssist:SendMessage(message, questionItemPrefix)
end

function ClassicRaidAssist:OnQuestionItem(prefix, message, distribution, sender)
    if not ClassicRaidAssist.db.char.allowItemScanning then
        return
    end

    for key, value in pairs(RaidItemsTab.raidItems) do
        if (key == message) then 
            for k, v in pairs(value['itemIds']) do
                count  = GetItemCount(v)
                if count > 0 then
                    ClassicRaidAssist:SendMessage(message, sendItemPrefix)
                else
                    ClassicRaidAssist:SendMessage(message, sendBadItemPrefix)
                end
            end
        end
    end
end

function ClassicRaidAssist:OnSendItem(prefix, message, distribution, sender)
    for key, value in pairs(RaidItemsTab.raidItems) do
        if(key == message) then
            value['hasThisItem'][sender] = true
            CRA_wait(1, function() 
                if(ClassicRaidAssist.db.char.currentTab == "raidItems") then
                    ClassicRaidAssist.db.char.raidItemsContainer:ReleaseChildren() 
                    RaidItemsTab:DrawRaidItems(ClassicRaidAssist.db.char.raidItemsContainer) 
                end
            end, "RaidItems")
            break
        end
    end
end

function ClassicRaidAssist:OnSendBadItem(prefix, message, distribution, sender)
    for key, value in pairs(RaidItemsTab.raidItems) do
        if(key == message) then
            value['hasThisItem'][sender] = false
            CRA_wait(1, function() 
                if(ClassicRaidAssist.db.char.currentTab == "raidItems") then
                    ClassicRaidAssist.db.char.raidItemsContainer:ReleaseChildren() 
                    RaidItemsTab:DrawRaidItems(ClassicRaidAssist.db.char.raidItemsContainer) 
                end
            end, "RaidItems")
            break
        end
    end
end

function ClassicRaidAssist:OnQuestion(prefix, message, distribution, sender)
    canLoot, inRange = CanLootUnit(message)
    if canLoot then
        local localizedClass, englishClass, classIndex = UnitClass("player")
        ClassicRaidAssist:SendMessage(message, announcePrefix)
        ClassicRaidAssist:AddToUnits(message, name, englishClass)
    end
end

function ClassicRaidAssist:OnAnnounce(prefix, message, distribution, sender)
    local localizedClass, englishClass, classIndex = UnitClass(sender)
    ClassicRaidAssist:AddToUnits(message, sender, englishClass)
    
    -- drawGameToolTip()
end

function ClassicRaidAssist:OnScanSend(prefix, message, distribution, sender)
    -- if(sender ~= name) then
    ClassicRaidAssist:SendMessage(version, scanRecievePrefix)
    -- end
end

function ClassicRaidAssist:OnScanRecieve(prefix, message, distribution, sender)
    self.raid[sender] = message
    
    CRA_wait(1, function() 
        if(ClassicRaidAssist.db.char.currentTab == "settings") then
            ClassicRaidAssist.db.char.settingsContainer:ReleaseChildren()
            ClassicRaidAssistGUI:DrawSettings(ClassicRaidAssist.db.char.settingsContainer)
        end
    end, "settings")
end

function ClassicRaidAssist:AddToUnits(guid, looter, class)
    if(list_of_units[curr_unit_pointer] ~= nil)  then
        ClassicRaidAssist.unit[list_of_units[curr_unit_pointer]] = nil
    end
    
    ClassicRaidAssist.unit[guid] = {
        ["looter"] = looter,
        ["unitClassColor"] = RAID_CLASS_COLORS[class].colorStr
    }
    list_of_units[curr_unit_pointer] = guid
    curr_unit_pointer = curr_unit_pointer + 1
    if(curr_unit_pointer > MAX_NUMBER_OF_UNITS) then
        curr_unit_pointer = 1
    end
end

function ClassicRaidAssist:SetUpMouseEvent()
    local frame = CreateFrame("Frame")
    frame:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
    frame:SetScript("OnEvent", function(self)
        drawGameToolTip()
    end)
end

function drawGameToolTip()
    if(IsInRaid() or IsInGroup()) then
        local name = UnitName("mouseover")
        local guid = UnitGUID("mouseover")
        local friend = UnitIsFriend("mouseover", "player")
        local dead = UnitIsDead("mouseover")
        local creatureType = UnitCreatureType("mouseover")
        local tapped = UnitIsTapDenied("mouseover")
        
        if name == nil or friend or not dead or creatureType == "Critter" or tapped then return end
        
        if ClassicRaidAssist.unit[guid] == nil then
            playerName, playerClass, not_found = ClassicRaidAssist:DetermineLooter(guid)
        
            if not not_found then
                ClassicRaidAssist:AddToUnits(guid, playerName, playerClass)
            end
        end
        
        if ClassicRaidAssist.unit[guid] == nil then
            GameTooltip:AddLine("Looter: |cababababUnknown|r", 1, 1, 1)
            GameTooltip:Show()
        else
            -- GameTooltipTextLeft3:SetText("Looter: |c" .. ClassicRaidAssist.unit[guid].unitClassColor .. ClassicRaidAssist.unit[guid].looter .. "|r", 1, 1, 1)
            GameTooltip:AddLine("Looter: |c" .. ClassicRaidAssist.unit[guid].unitClassColor .. ClassicRaidAssist.unit[guid].looter .. "|r", 1, 1, 1)
            GameTooltip:Show()
        end
    end
end

function ClassicRaidAssist:SetUpMinimapIcon()
	LibStub("LibDBIcon-1.0"):Register("ClassicRaidAssist", LibStub("LibDataBroker-1.1"):NewDataObject("ClassicRaidAssist",
	{
		type = "data source",
		text = "Classic Raid Assist",
		icon = "Interface\\Icons\\ability_creature_disease_02",
		OnClick = function(self, button) 
			if (button == "LeftButton") then
				ClassicRaidAssistGUI:Toggle()
            end
		end,
		OnTooltipShow = function(tooltip)
			tooltip:AddDoubleLine(format("%s", "Classic Raid Assist"), format("|cff777777v%s", GetAddOnMetadata("ClassicRaidAssist", "Version")));
			tooltip:AddLine("|cFFCFCFCFLeft Click: |rShow GUI");
		end
	}), self.db.factionrealm.minimapButton);
end

function ClassicRaidAssist:ReadyCheckOutput()
    if not ClassicRaidAssist.db.char.readyCheckOutput then
        return
    end

    if(UnitIsRaidOfficer("player") or UnitIsGroupLeader("player")) then
        RaidBuffsTab:ScanRaidBuffs()
        PaladinBuffsTab:ScanPaladinBuffs()
        ConsumablesTab:ScanConsumables("BUFF", "All Classes")

        _G["ClassicRaidAssistReadyCheck"] = true

        CRA_wait(1, function()
            if(ClassicRaidAssistReadyCheck) then
                RaidBuffsTab:outputMissingDebuff(ClassicRaidAssist.db.char.CurrentReadyCheckOutputChannel)
                if not (ClassicRaidAssist.faction == "Horde") then
                    PaladinBuffsTab:outputMissingDebuff(ClassicRaidAssist.db.char.CurrentReadyCheckOutputChannel)
                end
                ConsumablesTab:outputBuffs(ClassicRaidAssist.db.char.CurrentReadyCheckOutputChannel, "BUFF", "All Classes")
                ClassicRaidAssistReadyCheck = false
            end
        end, "readyCheck")
    end
end