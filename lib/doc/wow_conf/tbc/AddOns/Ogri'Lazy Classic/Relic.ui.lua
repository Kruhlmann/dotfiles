-- Author:		Douglas R. Reno <renodr at linuxfromscratch dot org>
--				Known in game as "Nutterland" in Classic, or "Petadata" in Retail
-- Date:		2021-09-02
-- Purpose:		Provides the user interface for Ogri'Lazy Classic
-- File Name:	Relic.ui.lua

local _, T = ...
local L = T.L
local NINE = select(4,GetBuildInfo()) > 9e4

Relic_KeyBindings, Relic_ShowTooltip, Relic_UnbindCombat = true, true, true -- SVs

local ACTIVATION_OBJECT_IDS, INTROSPECTION_SPELL_IDS, COMBAT_FLAGS_SELF = {[185890]=1, [185944]=2}, {[40055]=1, [40165]=1, [40166]=1, [40167]=1}, 0x511
local Relic_View, Relic_Textures = Relic_View, {"Interface\\Icons\\Spell_Shadow_AntiMagicShell", "Interface\\Icons\\Spell_Holy_Retribution", "Interface\\Icons\\Spell_Fire_BlueFlameRing", "Interface\\Icons\\Spell_Fire_Burnout"}
local Relic_Chain, Relic_DebuffExpire, Relic_DefaultKeyset = {}, 0, L.colorDefaultKeys

local function Relic_UpdateUI()
	local chainLength, replaySlots = #Relic_Chain, #Relic_View.replay
	for i=1, math.min(chainLength, replaySlots) do
		local b = Relic_View.replay[i]
		b.tex:SetTexture(Relic_Textures[Relic_Chain[i]])
		b.toolHeader, b.toolText = L.colors[Relic_Chain[i]], L"remove"
		b:Show()
	end
	for i=chainLength+1, replaySlots do
		Relic_View.replay[i]:Hide()
	end
end
local function Relic_Shift()
	for i=0,#Relic_Chain do
		Relic_Chain[i] = Relic_Chain[i+1]
	end
	Relic_UpdateUI()
end

local function Relic_RecordClick(self)
	Relic_Chain[#Relic_Chain + 1] = self:GetID()
	Relic_UpdateUI()
end
local function Relic_ReplayClick(self, button)
	if button == "LeftButton" then
		tremove(Relic_Chain, self:GetID())
	elseif button == "RightButton" then
		for i=self:GetID(), #Relic_Chain do
			Relic_Chain[i] = nil
		end
	end
	Relic_UpdateUI()
end

local function Relic_BindKeys(self)
	if InCombatLockdown() then
		UIErrorsFrame:AddMessage(L"unbinderror", 1, 0.3, 0)
		self.onLockdownEnd = Relic_BindKeys
	else
		ClearOverrideBindings(self)
		if self:IsVisible() and Relic_EnableHotkeys ~= false then
			local keyset = type(Relic_KeyBindings) == "table" and Relic_KeyBindings or Relic_DefaultKeyset
			for i=1,4 do
				local b = Relic_View.set[i]
				SetOverrideBindingClick(self, 1, keyset[i], b:GetName())
				b.toolText = L.colorHotkey:format(keyset[i])
			end
			self.primedKeys = true
		end
	end
end
local function Relic_UnBindKeys(self)
	self.onLockdownEnd = nil
	if InCombatLockdown() and self.primedKeys then
		self.onLockdownEnd = Relic_UnBindKeys
		UIErrorsFrame:AddMessage(L"unbinderror", 1, 0.3, 0)
	elseif self.primedKeys then
		ClearOverrideBindings(self)
		self.primedKeys = false
		return true
	end
end
local function Relic_OnEvent(self, event, ...)
	if event == "PLAYER_REGEN_DISABLED" and Relic_UnbindCombat then
		ClearOverrideBindings(self)
		self.onLockdownEnd, self.primedKeys = Relic_BindKeys, false
	elseif event == "PLAYER_REGEN_ENABLED" and self.onLockdownEnd then
		self:onLockdownEnd()
		self.onLockdownEnd = nil
	elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local _, ev, _3, _sg, _5, _6, _7, _dg, _9, df, _11, sid = CombatLogGetCurrentEventInfo()
		if ev == "SPELL_DAMAGE" and Relic_Chain[0] and sid == 40065 and df == COMBAT_FLAGS_SELF then
			table.insert(Relic_Chain, 1, Relic_Chain[0])
			Relic_Chain[0] = nil
			Relic_UpdateUI()
		end
	end
end
local function Relic_OnShow(self)
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	Relic_BindKeys(self)
end
local function Relic_OnHide(self)
	self:UnregisterEvent("PLAYER_REGEN_DISABLED")
	self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	if Relic_UnBindKeys(self) then
		self:UnregisterEvent("PLAYER_REGEN_ENABLED")
	end
end

local function Relic_GossipOption(index) -- posthook for SelectGossipOption
	if index == 1 then
		local guid = UnitGUID("npc")
		if ACTIVATION_OBJECT_IDS[tonumber(guid and guid:match("^GameObject%-.-%-(%d+)%-%x+$") or 0)] then
			Relic_View:Show()
		end
	end
end
local function Relic_BuffUpdate(self)
	local time = GetTime()
	if (self.nU or 0) < time then
		self.nU = time + 0.1
		local i = 1 repeat
			local _, _, _, _, _, expirationTime, _, _, _, sid = UnitDebuff("player", i)
			if INTROSPECTION_SPELL_IDS[sid] then
				if expirationTime ~= Relic_DebuffExpire then
					Relic_DebuffExpire = expirationTime
					Relic_Shift()
				end
				return
			end
			i = i + 1
		until not sid
	end
end

function T.GetKeyBindings()
	return type(Relic_KeyBindings) == "table" and Relic_KeyBindings or Relic_DefaultKeyset
end
function T.SetKeyBindings(bindt)
	if bindt and type(bindt) == "table" and #bindt == 4 then
		local diff = false
		for i=1,4 do
			diff = diff or (bindt[i] ~= Relic_DefaultKeyset[i])
		end
		Relic_KeyBindings = diff and bindt or nil
		if Relic_View:IsVisible() then
			Relic_BindKeys(Relic_View)
		end
	end
end

for i=2,10 do
	Relic_View.replay[i]:SetPoint("TOPLEFT", Relic_View.replay[i-1], "TOPRIGHT", 2, 0)
end
Relic_View.replay[7]:ClearAllPoints()
Relic_View.replay[7]:SetPoint("TOP", Relic_View.replay[2], "BOTTOM", 12, -4)
Relic_View:SetScript("OnMouseUp", Relic_View.StopMovingOrSizing)
Relic_View:SetScript("OnMouseDown", Relic_View.StartMoving)
for i=1,4 do
	local bo = Relic_View.set[i]
	bo.tex:SetTexture(Relic_Textures[i])
	bo:SetScript("OnClick", Relic_RecordClick)
	bo.toolHeader = string.format(L"colorClick", L.colors[i])
end

Relic_View:SetScript("OnShow", Relic_OnShow)
Relic_View:SetScript("OnUpdate", Relic_BuffUpdate)
Relic_View:SetScript("OnHide", Relic_OnHide)
Relic_View:SetScript("OnEvent", Relic_OnEvent)
Relic_View:RegisterEvent("PLAYER_REGEN_DISABLED")
Relic_View:RegisterEvent("PLAYER_REGEN_ENABLED")
Relic_View.title:SetText(L"caption")
if NINE then
	hooksecurefunc(C_GossipInfo, "SelectOption", Relic_GossipOption)
else
	hooksecurefunc("SelectGossipOption", Relic_GossipOption)
end
for i,e in ipairs(Relic_View.replay) do
	e:SetScript("OnClick", Relic_ReplayClick)
	e:RegisterForClicks("LeftButtonUp", "RightButtonUp")
end

SLASH_RELIC1, SLASH_RELIC2, SLASH_RELIC3, SlashCmdList.RELIC = "/ogri", "/relic", "/ol", function(msg)
	if msg == "config" then
		InterfaceOptionsFrame_OpenToCategory("Ogri'Lazy")
		InterfaceOptionsFrame_OpenToCategory("Ogri'Lazy")
	elseif Relic_View then
		Relic_View:SetShown(not Relic_View:IsShown())
	end
end