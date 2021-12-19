 --[[
Name: Ability Team Tracker TBC
Author(s): by Izy inspired by the old Party Ability Bars (PAB)
Contact/support @ curseforge.com/wow/addons/att
Description: Track the cooldowns of your party members
--]]

local _G = _G
local addon, ATTdbs = ...
local match = string.match
local GetSpellInfo = GetSpellInfo
local UnitClass = UnitClass
local UnitGUID = UnitGUID
local UnitName = UnitName
local IsInInstance = IsInInstance
local IsInGroup = IsInGroup
local IsInRaid = IsInRaid
local UnitRace = UnitRace
local UnitLevel = UnitLevel
local CooldownFrame_Set = CooldownFrame_Set
local GetTalentInfo = GetTalentInfo
local GetInventoryItemID = GetInventoryItemID
local LGlows = LibStub("LibATTButtonGlow")
local ChatPrefix = "ATT-Check"
local ATTversion = 16
local ATTnewversion
local db
local dbModif = ATTdbs.dbModif
local dbRacial = ATTdbs.dbRacial
local dbImport = ATTdbs.dbImport
local ShareCD = ATTdbs.ShareCD
local dbAuraRemoved = ATTdbs.dbAuraRemoved
local dbAuraApplied = ATTdbs.dbAuraApplied
local dbExtraTrinkets = ATTdbs.dbExtraTrinkets
local cooldownResetters = ATTdbs.cooldownResetters
local isEnabledSpell, iconOrder, isEnabledTrinkets, isEnabledRacial
local ATT = CreateFrame("Frame","ATT",UIParent)
local ATTIcons = CreateFrame("Frame",nil,UIParent)
local ATTAnchor = CreateFrame("Frame",nil,UIParent)
local ATTInspectFrame = CreateFrame("Frame",nil,UIParent)
local ATTInspectedFrame = CreateFrame("GameTooltip", "ATTInspectedFrame", nil, "GameTooltipTemplate")
ATTInspectedFrame:SetOwner(UIParent, "ANCHOR_NONE")
local ATTInspectedCheck = CreateFrame("GameTooltip", "ATTInspectedFrame", nil, "GameTooltipTemplate")
ATTInspectedCheck:SetOwner(UIParent, "ANCHOR_NONE")
local PlayerGUID = UnitGUID("player")
local insTimes = 0
local elapsedTime = 0

local anchors = {}
local activeGUIDS = {}
local dbInspect = {}
local isFWW = {} -- workaround fix
local insUnitDelay = {}
        
local function print(...)
	for i=1,select('#',...) do
		ChatFrame1:AddMessage("|cff33ff99ATT|r: " .. select(i,...))
	end
end

local validPartyUnits = { 
    ["player"] = 5, ["party1"] = 1, ["party2"] = 2, ["party3"] = 3, ["party4"] = 4,	["pet"] = 5, ["partypet1"] = 1, ["partypet2"] = 2, ["partypet3"] = 3, ["partypet4"] = 4,
}

local validRaidUnits = {
    ["raid1"] = 1, ["raid2"] = 2, ["raid3"] = 3, ["raid4"] = 4, ["raid5"] = 5, ["raid6"] = 6, ["raid7"] = 7, ["raid8"] = 8, ["raid9"] = 9,["raid10"] = 10,
    ["raid11"] = 11, ["raid12"] = 12, ["raid13"] = 13, ["raid14"] = 14, ["raid15"] = 15, ["raid16"] = 16, ["raid17"] = 17, ["raid18"] = 18, ["raid19"] = 19,["raid20"] = 20,
    ["raid21"] = 21, ["raid22"] = 22, ["raid23"] = 23, ["raid24"] = 24, ["raid25"] = 25, ["raid26"] = 26, ["raid27"] = 27, ["raid28"] = 28, ["raid29"] = 29,["raid30"] = 30,
    ["raid31"] = 31, ["raid32"] = 32, ["raid33"] = 33, ["raid34"] = 34, ["raid35"] = 35, ["raid36"] = 36, ["raid37"] = 37, ["raid38"] = 38, ["raid39"] = 39,["raid40"] = 40,

	["raidpet1"] = 1, ["raidpet2"] = 2, ["raidpet3"] = 3, ["raidpet4"] = 4, ["raidpet5"] = 5, ["raidpet6"] = 6, ["raidpet7"] = 7, ["raidpet8"] = 8,["raidpet9"] = 9,["raidpet10"] = 10,
	["raidpet11"] = 11, ["raidpet12"] = 12, ["raidpet13"] = 13, ["raidpet14"] = 14, ["raidpet15"] = 15, ["raidpet16"] = 16, ["raidpet17"] = 17, ["raidpet18"] = 18, ["raidpet19"] = 19,["raidpet20"] = 20,
    ["raidpet21"] = 21, ["raidpet22"] = 22, ["raidpet23"] = 23, ["raidpet24"] = 24, ["raidpet25"] = 25, ["raidpet26"] = 26, ["raidpet27"] = 27, ["raidpet28"] = 28, ["raidpet29"] = 29,["raidpet30"] = 30,
    ["raidpet31"] = 31, ["raidpet32"] = 32, ["raidpet33"] = 33, ["raidpet34"] = 34, ["raidpet35"] = 35, ["raidpet36"] = 36, ["raidpet37"] = 37, ["raidpet38"] = 38, ["raidpet39"] = 39,["raidpet40"] = 40,
}

local dbVisibility = {
 {	["ability"] = "arena" , ["sname"] = "Show in Arena",},
 {	["ability"] = "dungeons" , ["sname"] = "Show in Dungeons",},
 {	["ability"] = "scenarios" , ["sname"] = "Show in Scenarios",},
 {	["ability"] = "inbg" , ["sname"] = "Show in Battleground",},
 {	["ability"] = "inraid" , ["sname"] = "Show in Raid Instance",},
 {	["ability"] = "outside" , ["sname"] = "Show in Open World",},
 }

-- Player Inspect
local inspected = {}
local inspect_queue = {}

local supportedPartyUnits = {"player", "party1", "party2", "party3", "party4",}
local supportedRaidUnits = {"raid1", "raid2", "raid3", "raid4", "raid5", "raid6", "raid7", "raid8", "raid9", "raid10","raid11", "raid12", "raid13", "raid14", "raid15", "raid16", "raid17", "raid18", "raid19", "raid20","raid21", "raid22", "raid23", "raid24", "raid25", "raid26", "raid27", "raid28", "raid29", "raid30","raid31", "raid32", "raid33", "raid34", "raid35", "raid36", "raid37", "raid38", "raid39", "raid40",}

local function isRaidGr()
    local _, instanceType = IsInInstance()
    local isInRaidGr = (IsInRaid(1) or (IsInRaid(2) and (instanceType == "raid" or instanceType == "pvp")))
    return isInRaidGr
end

function ATT:FindUnitByGUID(guid)
    local supportedUnits = (isRaidGr() and supportedRaidUnits) or supportedPartyUnits
    if guid then
        for i, unit in pairs(supportedUnits) do
            if UnitGUID(unit) == guid and ((isRaidGr() and ((validRaidUnits[unit] <= db.raidGroupSize) or (db.showSelf and guid == PlayerGUID))) or not isRaidGr()) then
                return unit
            end
        end
    end
end

function ATT:QueueInspect(guid)
    if guid then
        self:DequeueInspectByGUID(guid)
        inspect_queue[#inspect_queue+1] = guid
    end
end 

function ATT:DequeueInspectByGUID(guid)
    for i=1,#inspect_queue do
        if inspect_queue[i] == guid then
            table.remove(inspect_queue, i)
        end
    end
end

function ATT:InspectPlayer()
    local unit = self:FindUnitByGUID(PlayerGUID)
    self:InspectIsReady(PlayerGUID, unit)
end

function ATT:InspectIsReady(guid, inspectedUnit)
    self:DequeueInspectByGUID(guid)
    if guid and guid ~= PlayerGUID then
        self:UpdateAnchorGUID(inspectedUnit, guid, 1)
    else
        if guid and guid == PlayerGUID and db.showSelf then
            self:UpdateAnchorGUID(inspectedUnit, guid, 1)
        end
    end
end

function ATT:EnqueueInspect(grupdate)
    for i=1, ((isRaidGr() and db.raidGroupSize) or 4) do
        local unit = (isRaidGr() and "raid"..i) or "party"..i
        local guid = UnitGUID(unit)
        if guid and guid ~= PlayerGUID then
            if grupdate then
                if not dbInspect[guid] or (dbInspect[guid] and not dbInspect[guid]["spec"]) then self:QueueInspect(guid) end --here
            else
                self:QueueInspect(guid)
            end
        end
    end
    if grupdate and #inspect_queue > 0 then self:SendUpdate() end
    if #inspect_queue > 0 and not ATTInspectFrame:IsShown() then ATT:RegisterEvent("INSPECT_READY") ATTInspectFrame:Show(); end
end

function ATT:ProcessInspectQueue()
    for i, guid in pairs(inspect_queue) do
        local unit = self:FindUnitByGUID(guid)
        if unit and (not UnitIsConnected(unit) or (insUnitDelay[guid] and insUnitDelay[guid] > GetTime() + 120)) then self:DequeueInspectByGUID(guid)  end
        if unit and not (InspectFrame and InspectFrame:IsShown()) and CheckInteractDistance(unit,1) and CanInspect(unit) and (not insUnitDelay[guid] or insUnitDelay[guid] < GetTime()) then
            insTimes  = insTimes +1
            self.isATTunit = guid
            insUnitDelay[guid] = GetTime() + 2
            NotifyInspect(unit)
            break
        end
    end
end

local function InspectTimer(self, elapsed)
    elapsedTime = elapsedTime + elapsed
    if insTimes == 5 then elapsedTime = elapsedTime - 2; insTimes = 0 end
    if elapsed and elapsedTime > 1 and #inspect_queue > 0 then
        ATT:ProcessInspectQueue()
        elapsedTime = 0
    elseif #inspect_queue == 0 and elapsedTime > 1 then
        ATT:UnregisterEvent("INSPECT_READY")
        ATTInspectFrame:Hide()
        ClearInspectPlayer()
        elapsedTime = 0
        insTimes = 0
    end
end

function ATT:INSPECT_READY(guid)
    if InspectFrame and InspectFrame:IsShown() then return end
    local unit = self:FindUnitByGUID(guid)
    if unit and guid and self.isATTunit and self.isATTunit == guid then
    ATTInspectedCheck:ClearLines() --omnibar workournd bug fix
    ATTInspectedCheck:SetInventoryItem(unit, 1)
    local _, itemLink = ATTInspectedCheck:GetItem()
    if itemLink then
        self.isATTunit = nil
        self:InspectIsReady(guid,unit)
      end
    end
end

function ATT:SavePositions()
    for k,anchor in ipairs(anchors) do
        local scale = anchor:GetEffectiveScale()
        local worldscale = UIParent:GetEffectiveScale()
        local x = anchor:GetLeft() * scale
        local y = (anchor:GetTop() * scale) - (UIParent:GetTop() * worldscale)
        if not db.positions[k] then
            db.positions[k] = {}
        end
        db.positions[k].x = x
        db.positions[k].y = y
    end
end

local customframes = {
  [3] = { ctype = "ShadowUFRaidGR", cname = "ShadowedUnitFrames" , cframe = "SUFHeaderraid1RGUnitButton%d",},
  [4] = { ctype = "ShadowedUF", cname = "ShadowedUnitFrames" , cframe = "SUFHeaderpartyUnitButton%d", },
  [5] = { ctype = "ShadowUFRaid", cname = "ShadowedUnitFrames" , cframe = "SUFHeaderraidUnitButton%d",},
  [6] = { ctype = "Grid2", cname = "Grid2" , cframe = "Grid2LayoutHeader1UnitButton%d",},
  [7] = { ctype = "Nug", cname = "Nug" , cframe = "NugRaid1RGUnitButton%d",},
  [8] = { ctype = "HealBot", cname = "HealBot" , cframe = "HealBot_Action_HealUnit%d",},
  [9] = { ctype = "InvenRaidFrames3", cname = "InvenRaidFrames3" , cframe = "InvenRaidFrame3Group0UnitButton%d", },
  [10] = { ctype = "Plexus", cname = "Plexus" , cframe = "PlexusLayoutHeader1UnitButton%d", },
  [11] = { ctype = "ZPerl", cname = "ZPerl" , cframe = "XPerl_party%d", },
  [12] = { ctype = "ZPerl_RaidGR", cname = "ZPerl" , cframe = "XPerl_Raid_Grp1RGUnitButton%d",},
  [13] = { ctype = "ElvUI", cname = "ElvUI" , cframe = "ElvUF_PartyGroup1UnitButton%d", },
  [14] = { ctype = "ElvUIRaidGR", cname = "ElvUI" , cframe = "ElvUF_RaidGroup1RGUnitButton%d",},
  [15] = { ctype = "VuhDo", cname = "VuhDo" , cframe = "Vd1H%d",},
  [16] = { ctype = "Tukui", cname = "Tukui" , cframe = "TukuiPartyUnitButton%d",},
  [17] = { ctype = "Duf", cname = "Duf" , cframe = "DUF_PartyFrame%d",},
  [18] = { ctype = "PitBull4", cname = "PitBull4" , cframe = "PitBull4_Groups_PartyUnitButton%d",},
  [19] = { ctype = "ShestakUIDPS", cname = "ShestakUIDPS" , cframe = "oUF_PartyDPSUnitButton%d",},
  [20] = { ctype = "ShestakUI",cname = "ShestakUI" , cframe = "oUF_PartyUnitButton%d", },
  [21] = { ctype = "KkthnxUI", cname = "KkthnxUI" , cframe = "oUF_PartyUnitButton%d",},
  [22] = { ctype = "NDui", cname = "NDui" , cframe = "oUF_PartyUnitButton%d",},
  [23] = { ctype = "RUF", cname = "RUF" , cframe = "oUF_RUF_PartyUnitButton%d",},
  [24] = { ctype = "Gw", cname = "GwRaid" , cframe = "GwRaidGridDisplay%d",},
  [25] = { ctype = "Gw", cname = "Gw" , cframe = "GwCompactparty%d", },
  [26] = { ctype = "Lime", cname = "Lime" , cframe = "LimeGroup0UnitButton%d",},
  [27] = { ctype = "Cell", cname = "Cell" , cframe = "CellPartyFrameMember%d",},
}    

function ATT:CheckBlizzFrames(raidnum)
    local compact = C_CVar.GetCVarBool("useCompactPartyFrames")
    local keepgr = CompactRaidFrameManager_GetSetting and CompactRaidFrameManager_GetSetting("KeepGroupsTogether")
    
    if not isRaidGr() and not compact then frametype = "PartyMemberFrame%d"
    elseif keepgr and isRaidGr() and (_G["CompactRaidGroup"..raidnum]) then frametype = "CompactRaidGroup"..raidnum.."Member%d"
    elseif keepgr and _G["CompactPartyFrameMember1"] then frametype = "CompactPartyFrameMember%d"
    else frametype = "CompactRaidFrame%d" end

    return frametype
end
        
function ATT:FindFrameByUnit(checkunit, k)
    if not UnitGUID(checkunit) or not db.attach or db.attach == 0 then return end
    local index = UnitInRaid(checkunit)
    local _,_,raidnum=GetRaidRosterInfo(index or 1)

    if db.attach == 1 and ATT_DropDown1.values[7] then
        frametype = string.gsub(customframes[ATT_DropDown1.values[7]].cframe, "1RG", raidnum)
    else
        if db.attach < 3 then
            frametype = self:CheckBlizzFrames(raidnum)
        else
            frametype = string.gsub(customframes[db.attach].cframe, "1RG", raidnum) end
    end

    local guid = UnitGUID(checkunit)
    for i = 1, 40 do
        local name = format(frametype, i)
        local unit = _G[name] and ((string.find(name, "Vd1H") and _G[name].raidid) or (string.find(name, "XPerl") and _G[name].raidid) or _G[name].unit)
        if unit and (UnitGUID(unit) == guid) then
            frame = _G[name]
            if frame:IsForbidden() then frame = nil end
            return frame
        end
    end
end

function ATT:UpdatePositions()
    db.positions = db.positions or {}
    for k,anchor in ipairs(anchors) do
        anchors[k]:ClearAllPoints()
        local unit = (isRaidGr() and "raid"..k) or ((k==5 and "player") or (k~=5 and "party"..k))
        local raidFrame = self:FindFrameByUnit(unit, k)
        if raidFrame and db.attach and db.attach ~= 0 then
            if db.horizontal then
                anchors[k]:SetPoint(db.growLeft and "BOTTOMLEFT" or "BOTTOMRIGHT", raidFrame, db.growLeft and "BOTTOMRIGHT" or "BOTTOMLEFT", db.offsetX, db.offsetY)
            else
                anchors[k]:SetPoint(db.growLeft and "BOTTOMLEFT" or "BOTTOMRIGHT", raidFrame, db.growLeft and "TOPLEFT" or "TOPRIGHT", db.offsetX, db.offsetY)
            end
        else 
            if db.positions[k] then
                local x = db.positions[k].x
                local y = db.positions[k].y
                local scale = anchors[k]:GetEffectiveScale()
                anchors[k]:SetPoint("TOPLEFT", UIParent,"TOPLEFT", x/scale, y/scale)
            else
                anchors[k]:SetPoint("CENTER", UIParent, "CENTER")
            end
        end
    end
end

function ATT:CreateAnchors()
    local backdrop = {bgFile="Interface\\Tooltips\\UI-Tooltip-Background", edgeFile="", tile=false,}
    for i=1, 40 do
        local anchor = CreateFrame("Frame","ATTAnchor"..i ,ATTAnchor, BackdropTemplateMixin and "BackdropTemplate")
        local index = anchor:CreateFontString(nil,"ARTWORK","GameFontNormal")
        anchor:SetBackdrop(backdrop)
        anchor:SetHeight(15)
        anchor:SetWidth(15)
        anchor:SetBackdropColor(1,0,0,1)
        anchor:EnableMouse(true)
        anchor:SetMovable(true)
        anchor:Show()
        anchor.icons = {}
        anchor.HideIcons = function() for k,icon in ipairs(anchor.icons) do icon:ClearAllPoints(); icon:Hide();icon.ability = nil; icon.abilityID = nil; icon.active = nil; icon.inUse = nil; icon.showing = nil; icon.seen = nil; end end
        anchor.StopAllIcons = function(flag) for k,icon in ipairs(anchor.icons) do if flag ~= "raidstop" or (flag == "raidstop" and icon.cooldown and icon.cooldown >= 180) then icon.Stop(); icon.seen = nil  end  end end
        anchor.StopAllGlow = function(flag) for k,icon in ipairs(anchor.icons) do LGlows.HideOverlayGlow2(icon) end end
        anchor:SetScript("OnMouseDown",function(self,button) if button == "LeftButton" and db.attach == 0 then self:StartMoving(); end end)
        anchor:SetScript("OnMouseUp",function(self,button) if button == "LeftButton" and db.attach == 0 then self:StopMovingOrSizing(); ATT:SavePositions() end end)
        anchor:Hide()
        anchors[i] = anchor
        index:SetPoint("CENTER")
        index:SetText(i)
    end
end

local function CreateIcon(anchor)
    local icon = CreateFrame("Frame",anchor:GetName().."Icon".. (#anchor.icons+1),ATTIcons,"ATTButtonTemplate")
    icon:SetSize(40,40)
    local cd = CreateFrame("Cooldown",icon:GetName().."Cooldown",icon,"CooldownFrameTemplate")
    local anchorI = tonumber(anchor:GetName():match("%d"));
    cd:SetHideCountdownNumbers(false)
    icon.cd = cd
    icon.Start = function(sentCD , nextcharge, rate)
        local cTime = GetTime()
        if icon.raterecovery and not icon.excluded then
            rate = icon.raterecovery
            cTime = cTime * (1 - rate) + cTime * rate
            sentCD = sentCD * rate
            icon.cdrecovery = sentCD
        end
        icon.texture:SetVertexColor(1,1,1)
        if icon.maxcharges then
            local charges = tonumber(icon.chargesText:GetText():match("^[0-9]+$"))
            if charges == 2 or nextcharge == icon.maxcharges then
                CooldownFrame_Set(cd,cTime,sentCD, true, true, rate)
                cd:SetHideCountdownNumbers(true)
                cd:SetDrawSwipe(false)
                icon.starttime = cTime
                charges = charges - 1
                icon.chargesText:SetText(charges)

            elseif charges == 1 and nextcharge == 5 then
                CooldownFrame_Set(cd,cTime,sentCD, true, true, rate)
                cd:SetHideCountdownNumbers(true)
                cd:SetDrawSwipe(false)
                icon.starttime = cTime
                icon.chargesText:SetText(charges)

            elseif charges == 1 and nextcharge == 1 and icon.starttime < cTime then
                if not icon.glowDuration then cd:SetHideCountdownNumbers(false) end
                cd:SetDrawEdge(true)
                cd:SetDrawSwipe(true)
                charges = charges - 1
                icon.chargesText:SetText(charges)
            end
        else
            CooldownFrame_Set(cd,cTime,sentCD, true,false, rate)
            icon.starttime = cTime            
        end

        icon:Show()
        icon.active = true;
        icon.flashAnim:Play()
        icon.newitemglowAnim:Play()
        
        activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}
        activeGUIDS[icon.GUID][icon.abilityID] = activeGUIDS[icon.GUID][icon.abilityID] or {}
        if icon.maxcharges then activeGUIDS[icon.GUID][icon.abilityID].chargeleft = tonumber(icon.chargesText:GetText():match("^[0-9]+$")) end
        activeGUIDS[icon.GUID][icon.abilityID].starttime = icon.starttime
        activeGUIDS[icon.GUID][icon.abilityID].cooldown = sentCD
        if db.hidden then ATT:ToggleDisplay(anchor,icon.GUID) end
        if icon.ability and icon.abilityID and db.alertCD[icon.abilityID] and nextcharge ~= 5 then PlaySound(37666, "SFX"); end
    end

    icon.Stop = function()
        if icon.glowDuration then LGlows.HideOverlayGlow2(icon) end
        CooldownFrame_Set(cd,0,0,0);
        icon.starttime = 0
    end

    icon.SetTimer = function(starttime,cooldown,rate, isRate)
        if icon.raterecovery and icon.inUse and not isRate then
            rate = icon.raterecovery
            starttime = icon.starttime - ((icon.starttime - starttime) * rate)
            cooldown = cooldown * rate
        end
        if icon.inUse then
            icon.texture:SetVertexColor(1,1,1)
            CooldownFrame_Set(cd,starttime,cooldown,true,false, rate)
            if icon.maxcharges then
                local chargesleft = activeGUIDS[icon.GUID][icon.abilityID].chargeleft
                icon.chargesText:SetText(chargesleft or icon.maxcharges)
                cd:SetHideCountdownNumbers(true)
                cd:SetDrawEdge(true)
                cd:SetDrawSwipe(false)
                if chargesleft and chargesleft == 0 then
                    cd:SetDrawSwipe(true)
                    cd:SetHideCountdownNumbers(false)
                end
            end
            icon.active = true
            icon.starttime = starttime

            activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}
            activeGUIDS[icon.GUID][icon.abilityID] = activeGUIDS[icon.GUID][icon.abilityID] or {}
            activeGUIDS[icon.GUID][icon.abilityID].starttime = icon.starttime
            activeGUIDS[icon.GUID][icon.abilityID].cooldown = cooldown

            if db.hidden then  ATT:ToggleDisplay(anchor,icon.GUID) end
        end
    end

    icon.SetOldTimer = function(starttime,cooldown,rate)
        if icon.raterecovery or not icon.inUse then return end
        icon.texture:SetVertexColor(1,1,1)
        CooldownFrame_Set(cd,starttime,cooldown,true,false, rate)
        if icon.maxcharges then
            local chargesleft = activeGUIDS[icon.GUID][icon.abilityID].chargeleft
            icon.chargesText:SetText(chargesleft or icon.maxcharges)
            cd:SetHideCountdownNumbers(true)
            cd:SetDrawEdge(true)
            cd:SetDrawSwipe(false)
            if chargesleft and chargesleft == 0 then
                cd:SetDrawSwipe(true)
                cd:SetHideCountdownNumbers(false)
            end
        end
        icon.active = true
        icon.starttime = starttime
    end

    local texture = icon:CreateTexture(nil,"ARTWORK")
    texture:SetAllPoints(true)
    icon.texture = texture

    ATT:ApplyIconTextureBorder(icon)

    icon.chargesText = icon:CreateFontString(nil, nil, "DialogButtonHighlightText")
    icon.chargesText:SetTextColor(1, 1, 1)
    icon.chargesText:SetText("")
    icon.chargesText:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT")

    -- tooltip:
    if not db.showTooltip then icon:EnableMouse(false) end
    icon:SetScript('OnEnter', function()
        if db.showTooltip and icon.abilityID then
            GameTooltip:ClearLines()
            GameTooltip:SetOwner(WorldFrame, "ANCHOR_CURSOR")
            GameTooltip:SetSpellByID(icon.abilityID)
            GameTooltip:AddLine("Spell ID: "..icon.abilityID , 1, 1, 1)
            GameTooltip:SetPadding(16, 0)
            icon:EnableMouse(true)
        end
    end)

    icon:SetScript('OnLeave', function()
        if db.showTooltip and icon.abilityID then
            GameTooltip:ClearLines()
            GameTooltip:Hide()
            icon:EnableMouse(true)
        end
    end)

    icon.cd:SetScript("OnCooldownDone", function()
        if icon.active and icon.cooldown then 
           if activeGUIDS[icon.GUID] and activeGUIDS[icon.GUID][icon.abilityID] then activeGUIDS[icon.GUID][icon.abilityID] = nil end
           icon.active = nil
        end
        if icon.maxcharges and icon.inUse then
            local charges = tonumber(icon.chargesText:GetText():match("^[0-9]+$"))
            charges = math.min(icon.maxcharges, charges+1)
            icon.chargesText:SetText(charges)
            if charges < icon.maxcharges then
                icon.Start(icon.cooldown, 5)
            end
        end
        if db.hidden then ATT:ToggleDisplay(anchor,icon.GUID) end
        if icon.glowDuration then LGlows.HideOverlayGlow2(icon) end
    end)

    local Masque, MSQ_Version = LibStub("Masque", true)
    if Masque then
        icon.MasqueGroup = Masque:Group("Ability Team Tracker")
        icon.MasqueGroup:AddButton(icon, {
            FloatingBG = false,
            Icon = icon.texture,
            Cooldown = icon.cd,
            Normal = icon.NewItemTexture,
        })
    end

    return icon
end


-- adds a new icon
function ATT:AddIcon(icons,anchor)
	local newicon = CreateIcon(anchor)
	icons[#icons+1] = newicon
	return newicon
end

function ATT:ApplyIconTextureBorder(icon)
    icon.texture:SetVertexColor(1,1,1)
    if db.showIconBorders then
		icon.texture:SetTexCoord(0,1,0,1)
	else
	    icon.texture:SetTexCoord(0.07,0.9,0.07,0.90)
	end
end
                              

function ATT:UpdateAnchorGUID(unit, guid, newInspect)
    local _,class = UnitClass(unit)
    local anchor = self:CheckValidAnchor(unit)
    anchor.GUID = guid
    anchor.class = class
    local icons = anchor.icons
    local numIcons = 1
    local _, _, raceID = UnitRace(unit)

    -- Talent Check / Inspect
    if class and newInspect then
        dbInspect[guid] = {}
        local isInspect = (guid ~= PlayerGUID) and true  --here
        local tabs = GetNumTalentTabs(isInspect)
        for i = 1, tabs do
            local ntalents = GetNumTalents(i,isInspect)
            for j = 1, ntalents do
                Name, _, _, _, rank, maxRank, _, meetsPrereq = GetTalentInfo(i,j,isInspect)
                if rank and Name then dbInspect[guid][Name] = rank end
            end
        end
        for k=12,15 do
            ATTInspectedFrame:ClearLines()
            ATTInspectedFrame:SetInventoryItem(unit, k)
            local _, itemLink = ATTInspectedFrame:GetItem()
            if itemLink and itemLink ~= "[]" then
                local itemID = GetItemInfoInstant(itemLink)
                if k == 13 then dbInspect[guid]["item1"] = itemID end
                if k == 14 then dbInspect[guid]["item2"] = itemID end
            end
        end
        dbInspect[guid]["isInspected"] = true
    end

    dbInspect[guid] = dbInspect[guid] or {}
    local item1 = dbInspect[guid]["item1"] or 0
    local item2 = dbInspect[guid]["item2"] or 0
    local dbInspected = dbInspect[guid]

    --Trinkets
    for abilityIndex, abilityTable in pairs(dbExtraTrinkets) do
        local ability, id, cooldown, sname, pvptrinket = abilityTable.ability, abilityTable.id, abilityTable.cooldown, abilityTable.sname, abilityTable.pvptrinket
        if (id ~= ATTdbs.PvPTrinkets[item1] and id ~= ATTdbs.PvPTrinkets[item2] ) or not db.isEnabledTrinkets[sname] then ability = nil end

        if ability and id and pvptrinket then
            local icon = icons[numIcons] or self:AddIcon(icons,anchor)
            icon.texture:SetTexture(select(5,GetItemInfoInstant(id)))
            icon.GUID = anchor.GUID
            icon.ability = GetSpellInfo(ability)
            icon.abilityID = ability
            icon.cooldown = cooldown
            icon.maxcharges = nil
            icon.chargesText:SetText()
            icon.inUse = true
            icon.excluded = true
            icon.race = nil

            ATT:ApplyIconTextureBorder(icon)
            activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}
            if activeGUIDS[icon.GUID][ability] then
                icon.SetOldTimer(activeGUIDS[icon.GUID][ability].starttime, activeGUIDS[icon.GUID][ability].cooldown)
            else
                icon.Stop()
            end
            numIcons = numIcons + 1
        end
    end

    -- Racials
    for abilityIndex, abilityTable in pairs(dbRacial) do
        local ability, id, cooldown, maxcharges, race, cdshare = abilityTable.ability, abilityTable.id, abilityTable.cooldown, abilityTable.maxcharges, abilityTable.race, abilityTable.cdshare
        local id = ability
        local ability = GetSpellInfo(ability)
        if raceID ~= race or not db.isEnabledRacial[id] then ability = nil end

        if ability and id then
            local icon = icons[numIcons] or self:AddIcon(icons,anchor)
            icon.texture:SetTexture(self:FindAbilityIcon(ability, id))
            icon.GUID = anchor.GUID
            icon.ability = ability
            icon.abilityID = id
            icon.cooldown = cooldown
            icon.maxcharges = nil
            icon.chargesText:SetText()
            icon.inUse = true
            icon.race = raceID
            icon.excluded = true
            icon.racecdshare = cdshare

            ATT:ApplyIconTextureBorder(icon)
            activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}
            if activeGUIDS[icon.GUID][id] then
                icon.SetOldTimer(activeGUIDS[icon.GUID][id].starttime, activeGUIDS[icon.GUID][id].cooldown)
            else
                icon.Stop()
            end
            numIcons = numIcons + 1
        end
    end

    --PvE trinkets
    for abilityIndex, abilityTable in pairs(dbExtraTrinkets) do
        local ability, id, cooldown, sname, pvptrinket = abilityTable.ability, abilityTable.id, abilityTable.cooldown, abilityTable.sname, abilityTable.pvptrinket
        if (id ~= item1 and id ~= item2) or not db.isEnabledTrinkets[sname] then ability = nil end

        if ability and id and not pvptrinket then
            local icon = icons[numIcons] or self:AddIcon(icons,anchor)
            icon.texture:SetTexture(select(5,GetItemInfoInstant(id)))
            icon.GUID = anchor.GUID
            icon.ability = GetSpellInfo(ability)
            icon.abilityID = ability
            icon.cooldown = cooldown
            icon.maxcharges = nil
            icon.chargesText:SetText()
            icon.inUse = true
            icon.excluded = true
            icon.race = nil

            ATT:ApplyIconTextureBorder(icon)
            activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}
            if activeGUIDS[icon.GUID][ability] then
                icon.SetOldTimer(activeGUIDS[icon.GUID][ability].starttime, activeGUIDS[icon.GUID][ability].cooldown)
            else
                icon.Stop()
            end
            numIcons = numIcons + 1
        end
    end

    -- Abilities:
    if dbInspected and dbInspect[guid]["isInspected"] and class and dbImport[class] and type(isEnabledSpell[class] == "table") then
        for abilityIndex, abilityTable in pairs(self:MergeTable(class)) do
            local id, cooldown ,custom, spellrace = abilityTable.ability, abilityTable.cooldown,abilityTable.custom, abilityTable.race
            local ability = GetSpellInfo(id)
            if ability and spellrace and (raceID ~= spellrace[1] and raceID ~= spellrace[2] and raceID ~= spellrace[3]) then ability = nil end
            if ability and dbInspected[ability] == 0 then ability = nil end
            if ability and (custom and not isEnabledSpell[class][id.."custom"]) or (not custom and not isEnabledSpell[class][id]) then ability = nil end
            if ability and dbModif[id] and dbInspected[dbModif[id].mod] then cooldown = cooldown - (dbModif[id].rank[dbInspected[dbModif[id].mod]] or 0) end

            if ability and id then
                local icon = icons[numIcons] or self:AddIcon(icons,anchor)
                icon.texture:SetTexture(self:FindAbilityIcon(ability, id))
                icon.GUID = anchor.GUID
                icon.ability = ability
                icon.abilityID = id
                icon.cooldown = cooldown
                icon.maxcharges = nil
                icon.chargesText:SetText()
                icon.inUse = true
                icon.race = nil

                ATT:ApplyIconTextureBorder(icon)
                activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}
                if activeGUIDS[icon.GUID][id] then
                    icon.SetOldTimer(activeGUIDS[icon.GUID][id].starttime, activeGUIDS[icon.GUID][id].cooldown)
                else
                    icon.Stop()
                end
                numIcons = numIcons + 1
            end
        end
    end

    -- clean leftover icons
    for j=numIcons,#icons do
        icons[j].ability = nil
        icons[j].abilityID = nil
        icons[j].spec = nil
        icons[j].seen = nil
        icons[j].active = nil
        icons[j].inUse = nil
        icons[j].showing = nil
    end
    self:ToggleDisplay(anchor, guid)
end

function ATT:ToggleDisplay(anchor, unitGuid)
    local icons = anchor.icons
    local lastActiveIndex = 0
    local oldActiveIndex = 0
    local count = 0

    -- hiding icons before anchoring
    for k, icon in pairs(icons) do
      if icon.active and icon.cooldown then 
        icon.timeleft = icon.starttime + icon.cooldown - GetTime()
        if icon.timeleft <= 0 or not icon.timeleft then
            if activeGUIDS[icon.GUID] and activeGUIDS[icon.GUID][icon.abilityID] then activeGUIDS[icon.GUID][icon.abilityID] = nil end
            icon.active = nil
        end
      end   
        ATT:ApplyIconTextureBorder(icon)
        if db.showTooltip then icon:EnableMouse(true) else icon:EnableMouse(false) end     -- click-through
        if icon and icon.abilityID and icon.inUse and unitGuid and unitGuid == anchor.GUID and icon.GUID == unitGuid then
            icon.showing = (activeGUIDS[icon.GUID] and activeGUIDS[icon.GUID][icon.abilityID] and icon.active) or (not db.hidden)
        end
        icon:ClearAllPoints()
        icon:Hide()
        -- check iconglow
        if icon and icon.showing and icon.glowDuration and not db.glow then LGlows.HideOverlayGlow2(icon) end
    end

    --show icons
    for k, icon in pairs(icons) do
        if icon and icon.abilityID and icon.showing and icon.inUse and unitGuid and unitGuid == anchor.GUID and icon.GUID == unitGuid then
            if db.IconRows > 1 then
                if lastActiveIndex == 0 then
                    icon:SetPoint(db.growLeft and "TOPRIGHT" or "TOPLEFT", anchor, db.growLeft and "BOTTOMLEFT" or "BOTTOMRIGHT")
                elseif (count >= db.IconRows and count % db.IconRows == 0)  then
                    icon:SetPoint(db.growLeft and "RIGHT" or "LEFT", icons[oldActiveIndex], db.growLeft and "LEFT" or "RIGHT" , db.growLeft and -1 * db.iconOffsetY or db.iconOffsetY, 0)
                else
                    icon:SetPoint(db.growLeft and "TOP" or "TOP", icons[lastActiveIndex], db.growLeft and "BOTTOM" or "BOTTOM" ,0 , -1 *db.iconOffsetX)
                end
            else
                if lastActiveIndex == 0 then
                    icon:SetPoint(db.growLeft and "TOPRIGHT" or "TOPLEFT", anchor, db.growLeft and "BOTTOMLEFT" or "BOTTOMRIGHT", db.growLeft and -1 * db.iconOffsetX or db.iconOffsetX, 0)
                else
                    icon:SetPoint(db.growLeft and "RIGHT" or "LEFT", icons[lastActiveIndex], db.growLeft and "LEFT" or "RIGHT", db.growLeft and -1 * db.iconOffsetX or db.iconOffsetX, 0)
                end
            end
            lastActiveIndex = k
            if (count == 0 or (count >= db.IconRows and count % db.IconRows == 0)) then oldActiveIndex = count == 0 and k or lastActiveIndex end
            count = count +1
            icon:Show()
        end
    end
end

function ATT:UpdateIcons()
    local inraid = isRaidGr()
    for k,anchor in ipairs(anchors) do
        local unit = (inraid and "raid"..k) or ((k==5 and "player") or (k~=5 and "party"..k))
        local guid = UnitGUID(unit)
        local IsPlayer = (guid == PlayerGUID)
        
        if guid and not IsPlayer and ((inraid and (k <= db.raidGroupSize)) or (not inraid and (k <= 5))) then
            if db.lock then anchor:Hide() else anchor:Show() end
            self:UpdateAnchorGUID(unit, guid)
        elseif guid and IsPlayer and db.showSelf then
            if db.lock then anchor:Hide() else anchor:Show() end
            self:UpdateAnchorGUID(unit, guid)
        else
            anchor:Hide()
            anchor:HideIcons()
        end
    end
end

function ATT:ApplyAnchorSettings()
    local _, instanceType = IsInInstance()
    ATTIcons:SetScale(db.scale or 1)

    if  (db.isEnabledVisibility.arena and instanceType == "arena") or
        (db.isEnabledVisibility.dungeons and instanceType == "party") or
        (db.isEnabledVisibility.scenarios and instanceType == "scenario") or
        (db.isEnabledVisibility.inraid and instanceType == "raid") or
        (db.isEnabledVisibility.inbg and instanceType == "pvp" ) or
        (db.isEnabledVisibility.outside and instanceType == "none")
    then
        ATTIcons:Show(); self:Show();
    else
        ATTIcons:Hide(); self:Hide();
    end
    if not db.lock and ATTIcons:IsShown() then ATTAnchor:Show() else ATTAnchor:Hide() end

    self:UpdatePositions();
    self:UpdateIcons();
end

function ATT:UNIT_AURA(unit)
    if not ATTIcons:IsShown() then return end
    local unit = self:CheckValidUnit(unit)
    if not unit then return end
    -- Feign Death workaround fix
    local guid = UnitGUID(unit)
    local fd = select(1, AuraUtil.FindAuraByName(GetSpellInfo(5384), unit))
    if not fd and isFWW["fd"..guid] == guid then C_Timer.After(0.12, function() self:StartCooldown(GetSpellInfo(5384), unit, 5384); isFWW["fd"..guid] = nil; end ) end
end

function ATT:PLAYER_ENTERING_WORLD()
        ATTInspectFrame:Hide() -- just in case a bug
        C_Timer.After(1, function() self:InspectPlayer() self:StopAllGlow() self:UpdateGroup() 
        local inInstance, instanceType = IsInInstance()
        if instanceType == "arena" then self:StopAllIcons(); end
        end)
end

function ATT:GROUP_ROSTER_UPDATE()
    if (not ATTIcons:IsShown()) then return end
     C_Timer.After(0.05, function() self:ApplyAnchorSettings() self:EnqueueInspect(true) end)
end

function ATT:UpdateGroup()
   self:ApplyAnchorSettings(); self:EnqueueInspect()
end

function ATT:FindAbilityByName(abilities, name)
	if abilities then
		for i, v in pairs(abilities) do
			if v and v.ability and v.ability == name then return v, i end
		end
	end
end

function ATT:FindAbilityByID(abilities, id)
	if abilities then
		for i, v in pairs(abilities) do
			if v and v.id and v.id == id then return v, i end
		end
	end
end

function ATT:GetUnitByGUID(guid)
    local validUnits = (isRaidGr() and validRaidUnits) or validPartyUnits
	for k,v in pairs(validUnits) do
		if guid and UnitGUID(k) == guid and ((isRaidGr() and ((validRaidUnits[k] <= db.raidGroupSize) or (db.showSelf and guid == PlayerGUID))) or not isRaidGr()) then
			return k
		end
	end
end

function ATT:CheckValidUnit(unit)
    local validUnits = (isRaidGr() and validRaidUnits) or validPartyUnits
	for k,v in pairs(validUnits) do
		if unit and k == unit and ((isRaidGr() and ((validRaidUnits[k] <= db.raidGroupSize) or (db.showSelf and UnitGUID(unit) == PlayerGUID))) or not isRaidGr()) then
			return k
		end 			
	end
end

function ATT:CheckValidAnchor(unit)
    local validUnits = (isRaidGr() and validRaidUnits) or validPartyUnits
	return anchors[validUnits[unit]]
end

function ATT:StartCooldown(spellName, unit, SentID, flag)
    local anchor = self:CheckValidAnchor(unit)
    if not unit or not anchor then return end
    local guid = anchor.GUID

    if not anchor or not guid or not dbInspect[guid] then return end
    self:TrackCooldown(anchor, spellName, SentID, unit, guid, flag)
end

function ATT:TrackCooldown(anchor, ability, SentID, unit, guid, flag)
    for k,icon in ipairs(anchor.icons) do
        if icon.cooldown and icon.inUse then
            -- Direct cooldown
            if icon.ability and icon.ability == ability then  --here 
             if flag then icon.cd:Clear() icon.texture:SetVertexColor(0.4, 0.4, 0.4) break end
                icon.seen = true
                icon.Start(icon.cooldown, 1, rate)
            end  
        end
        -- Cooldown Share
        if ShareCD[ability] and ShareCD[ability][icon.abilityID] and icon.inUse then icon.Start(icon.cooldown, 1, rate) end  

        -- Cooldown reset
        if cooldownResetters[ability] then
            if type(cooldownResetters[ability]) == "table" and (cooldownResetters[ability][icon.abilityID] or cooldownResetters[ability]["ALL"]) and not icon.excluded and icon.inUse then
               icon.Stop() end
        end
    end
end

function ATT:COMBAT_LOG_EVENT_UNFILTERED()
    if not ATTIcons:IsShown() then return end
    local _, event, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, SentID, spellName, _, auraType,_,powerType,_,_,_,crit = CombatLogGetCurrentEventInfo()
    local unit = self:GetUnitByGUID(sourceGUID)
    local unitDest = self:GetUnitByGUID(destGUID)

    if unit and (event == "SPELL_CAST_SUCCESS") then
        self:StartCooldown(spellName, unit, SentID, dbAuraRemoved[spellName] and "AuraOn")
    end 
    if unit and (event == "SPELL_AURA_APPLIED") and (auraType == "BUFF") then
        if dbAuraApplied[spellName] then self:StartCooldown(spellName, unit, SentID, dbAuraApplied and "AuraOn") end
    end
    if unit and (event == "SPELL_AURA_REMOVED") and (auraType == "BUFF") then
         if dbAuraRemoved[spellName] then self:StartCooldown(spellName, unit, SentID) end
    end
    
    if db.glow and unit and ((event == "SPELL_AURA_APPLIED") or (event == "SPELL_AURA_REMOVED")) and (auraType == "BUFF") then
        local dest = (unitDest and unitDest) or unit
        C_Timer.After(0.02, function() self:IconGlow(unit, spellName, event,dest ,SentID) end)
    end 
end

function ATT:IconGlow(unit, spellName, event, unitDest, SentID)
    if not unit then return end
    local anchor = self:CheckValidAnchor(unit)
    if not anchor then return end
    for k,icon in ipairs(anchor.icons) do
        if event == "SPELL_AURA_APPLIED" and spellName == icon.ability and not icon.race and icon.inUse then
            local duration = select(5,AuraUtil.FindAuraByName(spellName, unitDest))
            if  icon.showing and icon.cooldown and duration and duration > 1 and icon.cooldown > duration then
                icon.glowDuration = duration
                icon.cd:SetHideCountdownNumbers(true);
                icon.cd:SetSwipeColor(0,0,0,0.4)
                LGlows.ShowOverlayGlow2(icon)
                C_Timer.After(duration+0.5, function() local OLDduration = select(5,AuraUtil.FindAuraByName(spellName, unitDest)); if not OLDduration then LGlows.HideOverlayGlow2(icon) end end)
            end
        end
        if event == "SPELL_AURA_REMOVED" and spellName == icon.ability and icon.glowDuration then
            LGlows.HideOverlayGlow2(icon)
        end
    end
end

function ATT:UNIT_SPELLCAST_SUCCEEDED(unit,_,SentID)
    local unit = ATT:CheckValidUnit(unit)
    if not unit then return end
    local guid = UnitGUID(unit)
    -- Feign Death workaround fix
    if SentID == 42292 and unit and guid then self:StartCooldown(GetSpellInfo(42292), unit, SentID, dbAuraRemoved[spellName] and "AuraOn") end
    if SentID == 5384 and unit and guid then self:StartCooldown(GetSpellInfo(5384), unit, 5384, "AuraOn"); isFWW["fd"..guid] = guid end
end


-- resets all icons
function ATT:StopAllIcons(flag)
    for k,anchor in ipairs(anchors) do
        anchor:StopAllIcons(flag)
    end
    wipe(activeGUIDS)
end

function ATT:StopAllGlow()
    for k,anchor in ipairs(anchors) do
        anchor:StopAllGlow()
    end
end

function ATT:SendUpdate()
    if self.useCrossAddonCommunication and IsInGroup() then
        C_ChatInfo.SendAddonMessage(ChatPrefix, "Version|"..ATTversion, (IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and "INSTANCE_CHAT") or (IsInRaid(LE_PARTY_CATEGORY_HOME) and "RAID") or "PARTY")
    end
end

function ATT:CHAT_MSG_ADDON(prefix, message, dist, sender)
    if prefix == ChatPrefix then
        local vfound, vversion = match(message,"(.+)|(%A+)")
        if vfound == "Version" then
            if vversion then vversion = tonumber(string.sub(vversion,1,4)) end
            if vversion and vversion > ATTversion and not ATTnewversion then ATTnewversion = message
                print("There is a new version of |cff33ff99Ability Team Tracker|r: |cffFF4500v"..vversion.." TBC|r You are currently using: |cffFF4500v"..ATTversion.." TBC|r")
            end
            --[[ debug update note
            if vversion and GetUnitName("player") == "Ize" and sender ~= "Ize-Sylvanas" then print("Sender: |cffFF4500"..sender.."|r Version: |cffFF4500"..vversion.."|r") end --]]
        end
     end
end

function ATT:PLAYER_EQUIPMENT_CHANGED(item)
    if InCombatLockdown() then return end
    if not item then return end
    if (item ~= 13 and item ~= 14) then return end
    self:InspectPlayer()
end

function ATT:CVAR_UPDATE(cvar)
  if cvar == "USE_RAID_STYLE_PARTY_FRAMES" then
    C_Timer.After(0.1, function() self:ApplyAnchorSettings(); end)
  end  
end

function ATT:CHAT_MSG_BG_SYSTEM_NEUTRAL(text)
    if not ATTIcons:IsShown() or not text then return end
    local _, instanceType = IsInInstance()
    if (instanceType == "arena" or instanceType == "pvp") and (string.find(text, "!")) then
         self:InspectPlayer() self:UpdateGroup()
    end
end

function ATT:LEARNED_SPELL_IN_TAB()
     self:InspectPlayer()
end

function ATT:CheckProfile()
    if ATTDB.profilebychar then 
    ATTCharDB = ATTCharDB or ATTdbs.Defaults
    db = ATTCharDB
    db.version = ATTversion
    db.classSelected = "WARRIOR"
    else db = ATTDB end

    db.ProfileSelected = db.ProfileSelected or "DEFAULT"
    db.Profiles = db.Profiles or {}
    db.Profiles[db.ProfileSelected] = db.Profiles[db.ProfileSelected] or {}
    local dbProfiles = db.Profiles[db.ProfileSelected]

    local prtab = {'isEnabledSpell','iconOrder','isEnabledTrinkets','isEnabledRacial'}
    local tab = {'isEnabledSpell','customSpells','iconOrder','isEnabledTrinkets','isEnabledRacial','isEnabledVisibility',"isEnabledCConduit"}
    for _,v in pairs(tab) do if type(db[v]) ~= "table" then db[v] = {} end end
    if not db.ProfileSelected or db.ProfileSelected == "DEFAULT" then
        isEnabledSpell, iconOrder,isEnabledTrinkets,isEnabledRacial = db.isEnabledSpell, db.iconOrder, db.isEnabledTrinkets, db.isEnabledRacial
    else
        for _,v in pairs(prtab) do if type(dbProfiles[v]) ~= "table" then dbProfiles[v] = dbProfiles[v] or ATTdbs.Defaults[v] end end
        isEnabledSpell, iconOrder,isEnabledTrinkets,isEnabledRacial = dbProfiles.isEnabledSpell, dbProfiles.iconOrder, dbProfiles.isEnabledTrinkets, dbProfiles.isEnabledRacial
    end
end

local function ATT_OnLoad(self)
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
    self:RegisterEvent("GROUP_ROSTER_UPDATE")
    self:RegisterEvent("UNIT_AURA")
    self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    self:RegisterEvent("CVAR_UPDATE", "USE_RAID_STYLE_PARTY_FRAMES")
    self:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")
    self:RegisterEvent("LEARNED_SPELL_IN_TAB")

    if C_ChatInfo.RegisterAddonMessagePrefix(ChatPrefix) then self.useCrossAddonCommunication = true end
    if self.useCrossAddonCommunication then self:RegisterEvent("CHAT_MSG_ADDON") end
    self:SetScript("OnEvent",function(self,event, ...) if self[event] then self[event](self, ...) end end);
    
    ATTDB  = ATTDB or ATTdbs.Defaults

    db = ATTDB
    db.version = ATTversion
    db.classSelected = "WARRIOR";
    db.IconRows = tonumber(db.IconRows) or 1
    db.raidGroupSize = tonumber(db.raidGroupSize) or 0
    db.alertCD = db.alertCD or {}

    self:CheckProfile()
    self:CreateAnchors()
    self:CreateOptions()
    self:UpdateScrollBar()
    self:FindFrameType();
    ATTInspectFrame:Hide()
    ATTInspectFrame:SetScript("OnUpdate", InspectTimer)
    C_Timer.After(2.6, function() ATT:FindFrameType(); self:ApplyAnchorSettings(); end)

    if IsAddOnLoaded("Blizzard_CompactRaidFrames") then hooksecurefunc("CompactUnitFrameProfiles_ActivateRaidProfile", function()  ATT:ApplyAnchorSettings(); end) end
    print("|cff33ff99A|rbility |cff33ff99T|ream |cff33ff99T|rracker by |cff33ff99Izy|r |cffFF4500(v"..ATTversion..") TBC|r. Type |cffFF4500/att|r to open options.")
end

function ATT:FindAbilityIcon(ability, id)
    if not id then return end
	local icon
	if id then
		icon = GetSpellTexture(id)
	else
		 _, _, icon = GetSpellInfo(ability)
	end
	return icon
end

function ATT:MergeTable(class)
    local newdbSpells = {}
    if type(isEnabledSpell[class]) ~= "table" then isEnabledSpell[class] = {} end
    if type(db.customSpells[class]) ~= "table" then db.customSpells[class] = {} end
    if type(iconOrder[class]) ~= "table" then iconOrder[class] = {} end
    local dbSpells = dbImport[class]
    local iconOrder = iconOrder[class]
    local customSpells = db.customSpells[class]

    if customSpells then
        for _,v in pairs(customSpells) do
            table.insert(newdbSpells, v)
        end
    end

    if dbSpells then
        for _,v in pairs(dbSpells) do
            table.insert(newdbSpells, v)
        end
    end

    for _,v in pairs(newdbSpells) do
        if iconOrder[v.ability] then
            v.order = iconOrder[v.ability] else v.order = 10 end
    end

    table.sort(newdbSpells, function(a, b)
        if (a.order) == (b.order) then  return (a.ability) < (b.ability) else
            return (a.order) < (b.order) end end)

    return newdbSpells
end

-- Panel
-------------------------------------------------------------

local SO = LibStub("LibATTSimpleOptions")

local function CreateListButton(parent,index)
    local button = CreateFrame("CheckButton",parent:GetName()..index,parent,"InterfaceOptionsCheckButtonTemplate")
    button.Text:SetFont(GameFontNormal:GetFont(),12)
    return button, orderbtn
end

local function CreateListOrderbtn(parent,index)
    local orderbtn = CreateFrame("button",parent:GetName()..index,parent, "UIPanelScrollUpButtonTemplate")
    return orderbtn
end

local function CreateEditBox(name,parent,width,height)
    local editbox = CreateFrame("EditBox",parent:GetName()..name,parent,"InputBoxTemplate")
    editbox:SetHeight(height)
    editbox:SetWidth(width)
    editbox:SetAutoFocus(false)
    editbox:SetNumeric(true)
    editbox:SetMaxLetters(8)
    local label = editbox:CreateFontString(nil, "BACKGROUND", "GameFontNormal")
    label:SetText(name)
    label:SetPoint("BOTTOMLEFT", editbox, "TOPLEFT",-3,0)
    return editbox
end

function ATT:FindFrameType()
    ATT_DropDown1.values = {
            0, "Do Not Attach",
            1, "Auto attach UI",
            2, "Blizzard UI",
     }
    for x, v in pairs(customframes) do
        local checkframe = format(string.gsub(v.cframe, "1RG", 1), 1)
        if (_G[checkframe] or IsAddOnLoaded(v.cname)) then
         tinsert(ATT_DropDown1.values, x);
         tinsert(ATT_DropDown1.values, v.ctype);
        end
    end
    ATT_DropDown1.doRefresh()
end

function ATT:CreateOptions()
    local panel = SO.AddOptionsPanel("Ability Team Tracker", function() end)
    self.panel = panel
    SO.AddSlashCommand("Ability Team Tracker","/att")
    local title, subText = panel:MakeTitleTextAndSubText("Ability Team Tracker","General settings")

    local attach = panel:MakeDropDown(
        'name', ' Attach to raid frames',
        'description', 'Select hook mode behaviour',
        'values',  {
            0, "Do Not Attach",
            1, "Auto attach UI",
            2, "Blizzard UI",
         },
        'default', 0,
        'getFunc', function() return db.attach end,
        'setFunc', function(value) db.attach = tonumber(string.format("%.1d",value)); self:ApplyAnchorSettings(); end)
    attach:SetPoint("TOPLEFT",panel,"TOPLEFT",5,-85)

    local lock = panel:MakeToggle(
        'name', 'Hide Anchors',
        'description', 'Hide/Lock anchors',
        'default', false,
        'getFunc', function() return db.lock end,
        'setFunc', function(value) db.lock = value; self:ApplyAnchorSettings() end)
    lock:SetPoint("TOP",panel,"TOP",-110,-45)

    local growLeft = panel:MakeToggle(
        'name', 'Grow Left',
        'description', 'Grow icons to the left',
        'default', false,
        'getFunc', function() return db.growLeft end,
        'setFunc', function(value) db.growLeft = value; self:ApplyAnchorSettings(); end)
    growLeft:SetPoint("TOP",lock,"BOTTOM",0,-5)

    local growDown = panel:MakeToggle(
        'name', 'Grow Down',
        'description', 'Show icons under raid frames',
        'default', false,
        'getFunc', function() return db.horizontal end,
        'setFunc', function(value) db.horizontal = value; self:ApplyAnchorSettings();  end)
    growDown:SetPoint("TOP",growLeft,"BOTTOM",0,-5)

    local scale = panel:MakeSlider(
        'name', 'Scale',
        'description', 'Adjust the scale of icons',
        'minText', 'Min',
        'maxText', 'Max',
        'minValue', 0.05,
        'maxValue', 2,
        'step', 0.05,
        'default', 1,
        'current', tonumber(db.scale) or 1,
        'setFunc', function(value) if value ~= db.scale then db.scale = tonumber(string.format("%.2f",value)); ATTIcons:SetScale(db.scale or 1) end end,
        'currentTextFunc', function(value) return tonumber(string.format("%.2f",value)) end)
    scale:SetPoint("TOPLEFT",attach,"TOPLEFT", 20, -61)

    local IconRows = panel:MakeSlider(
        'name', 'Icon Rows',
        'description', 'Adjust number of icons per row',
        'minText', '1',
        'maxText', '5',
        'minValue', 1,
        'maxValue', 5,
        'step', 1,
        'default', 2,
        'current', tonumber(db.IconRows) or 1,
        'setFunc', function(value) if value ~= db.IconRows then db.IconRows = tonumber(string.format("%.1d",value)); self:UpdateIcons(); end end,
        'currentTextFunc', function(value) return tonumber(string.format("%.1d",value)); end)
    IconRows:SetPoint("LEFT", scale, "RIGHT", 15, 0)
    
   local raidGroupSize = panel:MakeSlider(
        'name', 'Raid Group Size',
        'description', 'Adjust raid group size',
        'minText', 'Hide',
        'maxText', '40',
        'minValue', 0,
        'maxValue', 40,
        'step', 1,
        'default', 0,
        'current', tonumber(db.raidGroupSize) or 0,
        'setFunc', function(value) if value ~= db.raidGroupSize then db.raidGroupSize = tonumber(string.format("%.1d",value)); self:EnqueueInspect(true) self:UpdateIcons(); end  end,
        'currentTextFunc', function(value) return tonumber(string.format("%.1d",value)); end)
    raidGroupSize:SetPoint("LEFT", IconRows, "RIGHT", 15, 0)

    local offsetX = panel:MakeSlider(
        'name', 'Anchor Offset X',
        'description', 'Adjust anchor position X',
        'minText', 'Left',
        'maxText', 'Right',
        'minValue', -150,
        'maxValue', 150,
        'step', 0.5,
        'default', 0,
        'current', tonumber(db.offsetX) or 0,
        'setFunc', function(value) if value ~= db.offsetX then db.offsetX = tonumber(string.format("%.1d",value)); self:UpdatePositions() end end,
        'currentTextFunc', function(value) return tonumber(string.format("%.1d",value)); end)
    offsetX:SetPoint("TOPLEFT",attach,"TOPLEFT", 20, -104)

    local offsetY = panel:MakeSlider(
        'name', 'Anchor Offset Y',
        'description', 'Adjust anchor position Y',
        'minText', 'Down',
        'maxText', 'Up',
        'minValue', -150,
        'maxValue', 150,
        'step', 0.5,
        'default', 0,
        'current', tonumber(db.offsetY) or 0,
        'setFunc', function(value) if value ~= db.offsetY then db.offsetY = tonumber(string.format("%.1d",value)); self:UpdatePositions() end end,
        'currentTextFunc', function(value) return tonumber(string.format("%.1d",value)); end)
    offsetY:SetPoint("LEFT", offsetX, "RIGHT", 15, 0)

    local iconOffsetX = panel:MakeSlider(
        'name', 'Rows spacing',
        'description', 'Adjust space between rows',
        'minText', '0',
        'maxText', '100',
        'minValue', 0,
        'maxValue', 100,
        'step', 1,
        'default', 5,
        'current', tonumber(db.iconOffsetX) or 5,
        'setFunc', function(value) if value ~= db.iconOffsetX then db.iconOffsetX = tonumber(string.format("%.1d",value)); self:UpdateIcons(); end end,
        'currentTextFunc', function(value) return tonumber(string.format("%.1d",value)); end)
    iconOffsetX:SetPoint("LEFT", offsetY, "RIGHT", 15, 0)

    local iconOffsetY = panel:MakeSlider(
        'name', 'Icons spacing',
        'description', 'Adjust space between icons',
        'minText', '0',
        'maxText', '100',
        'minValue', 0,
        'maxValue', 100,
        'step', 1,
        'default', 2,
        'current', tonumber(db.iconOffsetY) or 2,
        'setFunc', function(value) if value ~= db.iconOffsetY then db.iconOffsetY = tonumber(string.format("%.1d",value)); self:UpdateIcons(); end end,
        'currentTextFunc', function(value) return tonumber(string.format("%.1d",value)); end)
    iconOffsetY:SetPoint("LEFT", iconOffsetX, "RIGHT", 15, 0)

    local hidden = panel:MakeToggle(
        'name', 'Hidden Mode',
        'description', 'Show icons only when\nthey are on cooldown',
        'default', false,
        'getFunc', function() return db.hidden end,
        'setFunc', function(value) db.hidden = value;  self:UpdateIcons(); end)
    hidden:SetPoint("TOP",panel,"TOP",25,-45)

    local glow = panel:MakeToggle(
        'name', 'Glow Icons',
        'description', 'Show Glow animation when\nimportant abilites are active',
        'default', true,
        'getFunc', function() return db.glow end,
        'setFunc', function(value) db.glow = value;  self:UpdateIcons(); end)
    glow:SetPoint("TOP",hidden,"BOTTOM",0,-5)

    local showIconBorders = panel:MakeToggle(
        'name', 'Draw Borders',
        'description', 'Draw borders around icons',
        'default', true,
        'getFunc', function() return db.showIconBorders end,
        'setFunc', function(value) db.showIconBorders = value;  self:UpdateIcons(); end)
    showIconBorders:SetPoint("TOP",glow,"BOTTOM",0,-5)

    local showSelf = panel:MakeToggle(
        'name', 'Show Self',
        'description', 'Show your own icons',
        'default', false,
        'getFunc', function() return db.showSelf end,
        'setFunc', function(value) db.showSelf = value; self:InspectPlayer() self:UpdateIcons() end)
    showSelf:SetPoint("LEFT",hidden,"RIGHT",120,0)

    local showTooltip = panel:MakeToggle(
        'name', 'Show Tooltip',
        'description', 'Show tooltips over icons',
        'default', false,
        'getFunc', function() return db.showTooltip end,
        'setFunc', function(value) db.showTooltip = value; self:UpdateIcons(); end)
    showTooltip:SetPoint("TOP",showSelf,"BOTTOM",0,-5)
    
    local title2, subText2 = panel:MakeTitleTextAndSubText("","Show (if equipped / inUse):")
    title2:ClearAllPoints()
    title2:SetPoint("TOPLEFT",panel,"TOPLEFT",20,-458)

    local cpanel = CreateFrame("Frame" ,"ATTFrame" , panel , BackdropTemplateMixin and "BackdropTemplate")
    cpanel:SetBackdrop( { edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 15});
    cpanel:SetSize(610,240)
    cpanel:SetPoint("TOP",panel,"TOP",0,-220)

    local cpanel2 = CreateFrame("Frame" ,"ATTFrame" , panel,BackdropTemplateMixin and "BackdropTemplate" )
    cpanel2:SetBackdrop( { edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 15});
    cpanel2:SetSize(240,42)
    cpanel2:SetPoint("TOPLEFT",panel,"TOPLEFT",10,-482)

    local version =  panel:CreateFontString(nil,"ARTWORK","GameFontDisable")
    version:SetText("|cffffff00Version:|r |cff33ff99v"..ATTversion.." TBC|r by |cffffff00izy|r")
    version:SetPoint("TOPLEFT",panel,"TOPLEFT",20,-540)

    local contact =  panel:CreateFontString(nil,"ARTWORK","GameFontDisable")
    contact:SetText("[ Contact: curseforge.com/wow/addons/att ]")
    contact:SetPoint("TOPRIGHT",panel,"TOPRIGHT",-20,-540)

    self:CreateAbilityEditor()
end

function ATT:UpdateScrollBar()
    local btns , btns2 = self.btns, self.btns2
    local scrollframe = self.scrollframe
    local line = 1

    for abilityIndex, abilityTable in pairs(self:MergeTable(db.classSelected)) do
        local id, cooldown, maxcharges, custom = abilityTable.ability, abilityTable.cooldown, abilityTable.maxcharges, abilityTable.custom
        local ability = GetSpellInfo(id)
        local button = btns[line]
        local spectexture = "Interface\\Icons\\ClassIcon_"..db.classSelected
        local abilitytexture = self:FindAbilityIcon(ability, id)
        local isEnabledSpell = isEnabledSpell[db.classSelected]

        if line == 1 then button:SetPoint("TOPLEFT",scrollframe,"TOPLEFT",2,0) end
        if custom then
            button.Text:SetText("|T"..spectexture..":18|t - |cff808080|T"..abilitytexture..":17|t " ..ability:sub(1,20).."|r")
            button:SetChecked(isEnabledSpell[id.."custom"])
            button:SetScript("OnClick",function(self) isEnabledSpell[id.."custom"] = (button:GetChecked() == true and button:GetChecked()) or nil; ATT:UpdateIcons(); end)
        else
            button.Text:SetText("|T"..spectexture..":18|t - |T"..abilitytexture..":17|t " .. ability:sub(1,20))
            button:SetChecked(isEnabledSpell[id])
            button:SetScript("OnClick",function(self) isEnabledSpell[id] = (button:GetChecked() == true and button:GetChecked()) or nil; ATT:UpdateIcons(); end)  end
            
        button:SetScript('OnEnter', function() GameTooltip:ClearLines(); GameTooltip:SetOwner(scrollframe, "ANCHOR_CURSOR")
            GameTooltip:SetSpellByID(id) if custom then GameTooltip:AddLine("Spell ID: "..id.. " - Cooldown: " ..cooldown, 1, 1, 1) else
                GameTooltip:AddLine("Spell ID: "..id, 1, 1, 1) end  GameTooltip:SetPadding(16, 0) end)
        button:SetScript('OnLeave', function()
            GameTooltip:ClearLines()
            GameTooltip:Hide()
        end)
       button:SetHitRectInsets(0, -_G[button:GetName() .. "Text"]:GetStringWidth() - 1, 0, 0)

        local orderbtn = btns2[line]
        orderbtn:SetPoint("LEFT", button, "RIGHT", 200, 0)
        orderbtn:SetText("Order")
        local panel = self.panel
        orderbtn:SetScript("OnClick", function(self)
            if iFrame and iFrame:IsShown() then iFrame:Hide() return end
            iFrame = CreateFrame("Frame", "ATI", panel, "TooltipBorderedFrameTemplate");
            iFrame:SetSize(250, 150);
            iFrame:SetPoint('LEFT',220,-76);
            iFrame:SetFrameLevel(iFrame:GetFrameLevel() + 3)
            iFrame:EnableMouse(true);
            local titleclass =  iFrame:CreateFontString(nil,"ARTWORK","GameFontNormal")
            titleclass:SetText(("|T"..spectexture..":18|t - |T"..abilitytexture..":17|t " .. ability:sub(1,24) ))
            titleclass:SetPoint("TOP", iFrame, "TOP", 0, -10)
            local iconOrder = iconOrder[db.classSelected]
            local order = panel:MakeSlider(
                'name', 'Icon Order',
                'extra' , iFrame,
                'description', 'Adjust icon order priority',
                'minText', '1',
                'maxText', '10',
                'minValue', 1,
                'maxValue', 10,
                'step', 1,
                'default', 1,
                'current', tonumber(iconOrder[id]) or 10,
                'setFunc', function(value) if value ~= iconOrder[id] then iconOrder[id] = tonumber(string.format("%.1d",value)) end end,
                'currentTextFunc', function(value) return tonumber(string.format("%.1d",value)) end)
            order:SetPoint("TOP", titleclass, "TOP", 0, -40)

            local alertCD = panel:MakeToggle(
                'name', 'Play alert on cooldown',
                'extra' , iFrame,
                'description', 'Play sound alert when activated',
                'default', false,
                'getFunc', function() return db.alertCD[id] end,
                'setFunc', function(value) db.alertCD[id] = value;  end)
            alertCD:SetPoint("TOP",order,"BOTTOM",-90,-10)
            
            local updatebtn = CreateFrame("button","updatebtn", iFrame, "UIPanelButtonTemplate")
            updatebtn:SetHeight(24)
            updatebtn:SetWidth(100)
            updatebtn:SetPoint("BOTTOM", iFrame, "BOTTOM", -40, 10)
            updatebtn:SetText("Update Order")
            updatebtn:SetScript("OnClick", function(self)
            local ordervalue = string.format("%.0f",order.value) self:GetParent():Hide() ATT:UpdateScrollBar() ;ATT:UpdateIcons() end)
            local closebtn = CreateFrame("button","closebtn", iFrame, "UIPanelButtonTemplate")
            closebtn:SetHeight(24)
            closebtn:SetWidth(60)
            closebtn:SetPoint("BOTTOM", iFrame, "BOTTOM", 60, 10)
            closebtn:SetText("Close")
            closebtn:SetScript("OnClick", function(self) self:GetParent():Hide() end)
        end)
        button:Show()
        orderbtn:Show()
        line = line + 1
    end

    for i=line,35 do btns[i]:Hide(); btns2[i]:Hide(); end
end

function CreateListFrame(title ,self)
    if iFrame and iFrame:IsShown() then iFrame:Hide() return end
    iFrame = CreateFrame("Frame", "ATI", self, "TooltipBorderedFrameTemplate");
    iFrame:SetSize(255, 260);
    iFrame:SetPoint('LEFT',220,-70);
    iFrame:SetFrameLevel(iFrame:GetFrameLevel() + 3)
    iFrame:EnableMouse(true);

    local titleclass =  iFrame:CreateFontString(nil,"ARTWORK","GameFontNormalLarge")
    titleclass:SetText(title)
    titleclass:SetJustifyH("CENTER")
    titleclass:SetPoint("TOP", iFrame, "TOP", 0, -10)

    local closebtn = CreateFrame("button","closebtn", iFrame, "UIPanelButtonTemplate")
    closebtn:SetHeight(24)
    closebtn:SetWidth(60)
    closebtn:SetPoint("BOTTOM", iFrame, "BOTTOM", 0, 5)
    closebtn:SetText("Close")
    closebtn:SetScript("OnClick", function(self) self:GetParent():Hide() end)
    return iFrame
end

function ATT:CreateAbilityEditor()
    local panel = self.panel
    panel:Hide()
    local btns, btns2 = {}, {}
    self.btns, self.btns2 = btns , btns2
    local scrollframe = CreateFrame("ScrollFrame", "ATTScrollFrame",panel, (BackdropTemplateMixin and "UIPanelScrollFrameTemplate, BackdropTemplate") or "UIPanelScrollFrameTemplate"  )
    local backdrop = {
        bgFile = [=[Interface\Buttons\WHITE8X8]=],
        insets = { left = 0, right = 0, top = -5, bottom = -5 }}
    scrollframe:SetBackdrop(backdrop)
    scrollframe:SetBackdropColor(0,0,0,0.50)
    local child = CreateFrame("ScrollFrame" ,"ATTScrollFrameChild" , scrollframe )
    child:SetSize(1, 1)
    scrollframe:SetScrollChild(child)

    for i=1,35 do
        local button = CreateListButton(child,tostring(i))
        local orderbtn = CreateListOrderbtn(child,tostring(i))
        button:SetPoint("TOPLEFT",btns[#btns],"BOTTOMLEFT")
        btns[#btns+1] = button
        btns2[#btns2+1] = orderbtn
    end

    scrollframe:SetScript("OnShow",function(self) if not db.classSelected then db.classSelected = "WARRIOR";  end; ATT:FindFrameType(); if iFrame then iFrame:Hide();end ATT:UpdateScrollBar(); end)
    self.scrollframe = child
    scrollframe:SetSize(250,210)
    scrollframe:SetPoint('LEFT',20,-55)
    child.dropdown2 = nil

    local aslection =  panel:CreateFontString(nil,"ARTWORK","GameFontNormal")
    aslection:SetFont(GameFontNormal:GetFont(),13)
    aslection:SetText("Class selection")
    aslection:SetJustifyH("LEFT")
    aslection:SetPoint("TOPLEFT",scrollframe,"TOPRIGHT",30,0)

    local dropdown = panel:MakeDropDown(
        'name', ' Class',
        'description', 'Pick a class',
        'values', {
            "WARRIOR", "Warrior",
            "PALADIN", "Paladin",
            "PRIEST", "Priest",
            "SHAMAN", "Shaman",
            "DRUID", "Druid",
            "ROGUE", "Rogue",
            "MAGE", "Mage",
            "WARLOCK", "Warlock",
            "HUNTER", "Hunter",
        },
        'default', 'WARRIOR',
        'getFunc', function() return db.classSelected end ,
        'setFunc', function(value)
            db.classSelected = value;  self:UpdateScrollBar()
        end)
    dropdown:SetPoint("TOPLEFT",aslection,"BOTTOMLEFT",-20,-30)
    child.dropdown = dropdown


    local customedit =  panel:CreateFontString(nil,"ARTWORK","GameFontNormal")
    customedit:SetFont(GameFontNormal:GetFont(),13)
    customedit:SetText("Custom abilities editor")
    customedit:SetPoint("TOPLEFT",aslection,"BOTTOMLEFT",0,-80)

    local ideditbox = CreateEditBox("Ability ID",scrollframe,65,30)
    ideditbox:SetPoint("TOPLEFT",customedit,"BOTTOMLEFT",5,-25)

    local cdeditbox = CreateEditBox("CD (s)",scrollframe,40,30)
    cdeditbox:SetPoint("LEFT",ideditbox,"RIGHT",15,0)

    local tipbtn = CreateFrame("button","tipbtn",panel, "UIPanelScrollUpButtonTemplate")
    tipbtn:SetButtonState("PUSHED", "NORMAL")
    tipbtn:SetHighlightTexture(nil)
    tipbtn:SetPoint("TOPLEFT",customedit,"BOTTOMLEFT",5,-80)
    local tips =  panel:CreateFontString(nil,"ARTWORK","GameFontNormal")
    tips:SetFont(GameFontNormal:GetFont(),12)
    tips:SetText("- icon order/alert")
    tips:SetPoint("LEFT",tipbtn,"RIGHT",5,0)

    local addbutton = panel:MakeButton(
        'name', 'Add/Update',
        'description', "Add / Update ability",
        'func', function()
            local id = ideditbox:GetText():match("^[0-9]+$")
            local ability = GetSpellInfo(id)
            local iconfound = ATT:FindAbilityIcon(ability, id)
            local cdtext = cdeditbox:GetText():match("^[0-9]+$")

            if iconfound and cdtext and id and db.customSpells[db.classSelected] then
                local abilities = db.customSpells[db.classSelected]
                local order = iconOrder[db.classSelected]
                local _ability, _index = ATT:FindAbilityByName(db.customSpells[db.classSelected], tonumber(ideditbox:GetText()))
                if _ability and _index then
                    abilities[_index] = {ability = tonumber(id), cooldown = tonumber(cdtext), order = _ability.order , custom = true}
                    ideditbox:SetText("");
                    cdeditbox:SetText("");
                    print("Updated: |cffFF4500"..ability.."|r cd: |cffFF4500" ..tonumber(cdtext).."|r")
                else
                    table.insert(abilities, {ability = tonumber(id),cooldown = tonumber(cdtext), order = 1 , custom = true})
                    ideditbox:SetText("");
                    cdeditbox:SetText("");
                    print("Added: |cffFF4500"..ability.."|r cd: |cffFF4500" ..tonumber(cdtext).."|r")
                end
                ATT:UpdateScrollBar();
                ATT:UpdateIcons()
            else
                print("Invalid/blank:|cffFF4500 Ability ID or Cooldown|r")
            end
        end)
    addbutton:SetPoint("LEFT",cdeditbox,"RIGHT",15,0)

    local removebutton = panel:MakeButton(
        'name', 'Remove',
        'description', 'Remove ability',
        'func', function()
            local _ability, _index = ATT:FindAbilityByName(db.customSpells[db.classSelected], tonumber(ideditbox:GetText()))
            if _ability and _index then table.remove(db.customSpells[db.classSelected], _index)
                local ability = GetSpellInfo(tonumber(ideditbox:GetText()))
                print("Removed ability |cffFF4500" ..ability.. "|r id: |cffFF4500" ..ideditbox:GetText().."|r")
            ideditbox:SetText("");
            cdeditbox:SetText("");
            ATT:UpdateScrollBar();
            ATT:UpdateIcons()
            else
             print("Invalid/blank:|cffFF4500 Ability ID|r")
            end
        end)
    removebutton:SetPoint("LEFT",addbutton,"RIGHT",5,0)

    local showTrinketsTab = panel:MakeButton(
        'name', 'Trinkets Tab',
        'description', 'Open Trinkets Tab',
        'extra', true,
        'func', function()
            local title =  "Trinkets Tab"
            CreateListFrame(title, panel)
            local isFrame = CreateFrame("ScrollFrame", "ATC", iFrame, "UIPanelScrollFrameTemplate");
            isFrame:SetSize(210, 180);
            isFrame:SetPoint("TOPLEFT", iFrame, "TOPLEFT", 10, -35)
            local childiF = CreateFrame("Frame","ATC", isFrame )
            childiF:SetSize(1,1);
            isFrame:SetScrollChild(childiF)
            self.isFrame = childiF
            local btn = {}
            self.btn = btn
            for abilityIndex, abilityTable in pairs(dbExtraTrinkets) do
                local ability, id, cooldown, sname = abilityTable.ability, abilityTable.id, abilityTable.cooldown, abilityTable.sname
                local button = CreateFrame("CheckButton", ability,childiF, "InterfaceOptionsCheckButtonTemplate")
                if abilityIndex == 1 then  btn[#btn+1] = 1 button:SetPoint("LEFT") end
                local abilitytexture = select(5,GetItemInfoInstant(id))
                local itemname = GetSpellInfo(ability)
                button.Text:SetText(" |T"..abilitytexture..":18|t " ..itemname)
                button:SetPoint("TOPLEFT",btn[#btn],"BOTTOMLEFT")
                button:SetChecked(db.isEnabledTrinkets[sname])
                button:SetScript("OnClick",function(self) db.isEnabledTrinkets[sname] = (button:GetChecked() == true and button:GetChecked()) or nil; ATT:UpdateIcons() end)
                button:SetScript('OnEnter', function() GameTooltip:ClearLines(); GameTooltip:SetOwner(iFrame, "ANCHOR_TOP")
                    GameTooltip:SetItemByID(id)
                end)
                button:SetScript('OnLeave', function()
                    GameTooltip:ClearLines()
                    GameTooltip:Hide()
                end)
                button:SetHitRectInsets(0, -_G[button:GetName() .. "Text"]:GetStringWidth() - 1, 0, 0)
                btn[#btn+1] = button
            end
        end)
    showTrinketsTab:SetPoint("TOPLEFT",panel,"TOPLEFT",20,-488)

    local selectRacials = panel:MakeButton(
        'name', 'Racials Tab',
        'description', 'Open Racials Tab',
        'extra', true,
        'func', function()
            local title =  "Racials Tab"
            CreateListFrame(title, panel)
            local isFrame = CreateFrame("ScrollFrame", "ATC", iFrame, "UIPanelScrollFrameTemplate");
            isFrame:SetSize(210, 180);
            isFrame:SetPoint("TOPLEFT", iFrame, "TOPLEFT", 10, -35)
            local childiF = CreateFrame("Frame","ATC", isFrame )
            childiF:SetSize(1,1);
            isFrame:SetScrollChild(childiF)
            self.isFrame = childiF
            local btn = {}
            self.btn = btn
            for abilityIndex, abilityTable in pairs(dbRacial) do
                local id, race = abilityTable.ability, abilityTable.race
                local ability = GetSpellInfo(id)
                local button = CreateFrame("CheckButton", ability,childiF, "InterfaceOptionsCheckButtonTemplate")
                if abilityIndex == 1 then btn[#btn+1] = 1 button:SetPoint("LEFT") end
                local abilitytexture = select(3,GetSpellInfo(id))
                button.Text:SetText(" |T"..abilitytexture..":18|t " ..ability)
                button:SetPoint("TOPLEFT",btn[#btn],"BOTTOMLEFT")
                button:SetChecked(db.isEnabledRacial[id])
                button:SetScript("OnClick",function(self) db.isEnabledRacial[id] = (button:GetChecked() == true and button:GetChecked()) or nil; ATT:UpdateIcons() end)
                button:SetScript('OnEnter', function() GameTooltip:ClearLines(); GameTooltip:SetOwner(iFrame, "ANCHOR_TOP")
                    GameTooltip:SetSpellByID(id)
                end)
                button:SetScript('OnLeave', function()
                    GameTooltip:ClearLines()
                    GameTooltip:Hide()
                end)
                button:SetHitRectInsets(0, -_G[button:GetName() .. "Text"]:GetStringWidth() - 1, 0, 0)
                btn[#btn+1] = button
            end
        end)
    selectRacials:SetPoint("LEFT", showTrinketsTab, "RIGHT", 20, 0)

    local selectVisibility = panel:MakeButton(
        'name', 'Visibility Tab',
        'description', 'Open Visibility Tab',
        'extra', true,
        'func', function()
            local title =  "Visibility Options"
            CreateListFrame(title, panel)
            local isFrame = CreateFrame("ScrollFrame", "ATC", iFrame);
            isFrame:SetSize(210, 180);
            isFrame:SetPoint("TOPLEFT", iFrame, "TOPLEFT", 10, -35)
            local childiF = CreateFrame("Frame","ATC", isFrame )
            childiF:SetSize(1,1);
            isFrame:SetScrollChild(childiF)
            self.isFrame = childiF
            local btn = {}
            self.btn = btn
            for abilityIndex, abilityTable in pairs(dbVisibility) do
                local ability, sname = abilityTable.ability, abilityTable.sname
                local button = CreateFrame("CheckButton", ability,childiF, "UICheckButtonTemplate")
                button:SetHeight(30);
                button:SetWidth(30);
                if abilityIndex == 1 then btn[#btn+1] = 1 button:SetPoint("LEFT")  end
                button.text:SetText(" |T"..GetItemIcon(9254)..":18|t "..sname)
                button.text:SetFont(GameFontHighlight:GetFont(),12)
                button.text:SetTextColor(1, 1, 1);
                button:SetPoint("TOPLEFT",btn[#btn],"BOTTOMLEFT")
                button:SetChecked(db.isEnabledVisibility[ability])
                button:SetScript("OnClick",function(self) db.isEnabledVisibility[ability] = (button:GetChecked() == true and button:GetChecked()) or nil;  ATT:ApplyAnchorSettings(); end)
                button:SetScript('OnEnter', function() GameTooltip:ClearLines(); GameTooltip:SetOwner(iFrame, "ANCHOR_TOP")
                    GameTooltip:SetText(sname)
                    GameTooltip:Show()
                end)
                button:SetScript('OnLeave', function()
                    GameTooltip:ClearLines()
                    GameTooltip:Hide()
                end)
                button:SetHitRectInsets(0, -_G[button:GetName() .. "Text"]:GetStringWidth() - 1, 0, 0)
                btn[#btn+1] = button
            end
        end)
    selectVisibility:SetPoint("LEFT", showTrinketsTab, "RIGHT", 280, 0)

    local showProfiles = panel:MakeButton(
        'name', 'Profiles Tab',
        'description', 'Open Profiles tab',
        'extra', true,
        'func', function()
            local title =  "Profile Options"
            CreateListFrame(title, panel)
            local isFrame = CreateFrame("ScrollFrame", "ATC", iFrame);
            isFrame:SetSize(210, 180);
            isFrame:SetPoint("TOPLEFT", iFrame, "TOPLEFT", 10, -35)
            local childiF = CreateFrame("Frame","ATC", isFrame )
            childiF:SetSize(1,1);
            isFrame:SetScrollChild(childiF)
            self.isFrame = childiF

            local selectProfile = panel:MakeDropDown(
                'name', ' Select Profile',
                'description', 'Select Profile',
                'extra', iFrame,
                'values', {
                    "DEFAULT", "Default",
                    "TANK", "Tank",
                    "HEALER", "Healer",
                    "DAMAGER", "Damage Dealer",
                    "Extra1", "Extra Profie 1",
                    "Extra2", "Extra Profie 2",
                },
                'default', "DEFAULT",
                'getFunc', function() return db.ProfileSelected end ,
                'setFunc', function(value)
                    db.ProfileSelected = value; self:CheckProfile(); ATT:UpdateScrollBar(); ATT:ApplyAnchorSettings();  end)
            selectProfile:SetPoint("TOP", iFrame, "TOP", 0, -70)
            
           local profilebychar = panel:MakeToggle(
                'name', 'Characater Profiles',
                'description', 'Use Charcater Profiles \ninstead of Global profile\n(your UI will be reloaded)',
                'extra', iFrame,
                'default', false,
                'getFunc', function() return ATTDB.profilebychar end,
                'setFunc', function(value) ATTDB.profilebychar = value; self:CheckProfile(); ATT:UpdateScrollBar();  ReloadUI();
                end)
          profilebychar:SetPoint("TOP", iFrame, "TOP", -55, -140)

          local reset = CreateFrame("button","resetbtn", iFrame, "UIPanelButtonTemplate")
            reset:SetHeight(25)
            reset:SetWidth(100)
            reset:SetPoint("BOTTOM", selectProfile, "BOTTOM", 0, -100)
            reset:SetText("Reset Addon")
            reset:SetScript("OnClick", function(self) ATTDB = {}; ReloadUI(); self:GetParent():Hide() end)
            reset:SetScript('OnEnter', function() GameTooltip:ClearLines(); GameTooltip:SetOwner(reset, "ANCHOR_TOP")
                GameTooltip:SetText("Reset all settings and profiles") end)
            reset:SetScript('OnLeave', function() GameTooltip:ClearLines()  GameTooltip:Hide() end)
        end)
    showProfiles:SetPoint("LEFT", showTrinketsTab, "RIGHT", 390, 0)

end

ATT:RegisterEvent("ADDON_LOADED")
ATT:SetScript("OnEvent",ATT_OnLoad)