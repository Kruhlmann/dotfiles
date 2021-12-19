-- Author:		Douglas R. Reno <renodr at linuxfromscratch dot org>
--				Known in game as "Nutterland" in Classic, or "Petadata" in Retail
-- Date:		2021-09-02
-- Purpose:		Provides configuration information for Relic, also known as Ogri'Lazy Classic
-- File Name:	Relic.config.lua

local _, T = ...
local L = T.L

local cfgFrame = CreateFrame("Frame", nil, UIParent)
local cfgFrameHeader = cfgFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	cfgFrameHeader:SetPoint("TOPLEFT", 15, -15)

local cfgShowHelpTooltip = CreateFrame("CheckButton", nil, cfgFrame, "InterfaceOptionsCheckButtonTemplate")
	cfgShowHelpTooltip:SetPoint("TOPLEFT", 20, -40)

local cfgUnbindInCombat = CreateFrame("CheckButton", nil, cfgFrame, "InterfaceOptionsCheckButtonTemplate")
	cfgUnbindInCombat:SetPoint("TOPLEFT", 20, -88)
	
local cfgEnableHotkeys = CreateFrame("CheckButton", nil, cfgFrame, "InterfaceOptionsCheckButtonTemplate")
	cfgEnableHotkeys:SetPoint("TOPLEFT", 20, -64)

local Relic_SpawnKeyset do
	local function Relic_KeysetDisarm(btn)
		btn:UnlockHighlight()
		btn:SetScript("OnKeyDown", nil)
		btn:EnableKeyboard(false)
		btn:GetParent().keysetActive = nil
	end
	local function Relic_KeysetListen(self, arg1)
	  if not (arg1:match("^[LR]?ALT$") or arg1:match("^[LR]?CTRL$") or arg1:match("^[LR]?SHIFT$")) then
		  local prefix = (IsAltKeyDown() and "ALT-" or "") ..  (IsControlKeyDown() and "CTRL-" or "") .. (IsShiftKeyDown() and "SHIFT-" or "")
			self:SetText(prefix .. arg1)
			Relic_KeysetDisarm(self)
		end
	end
	local function Relic_KeysetClick(self)
		local oldKeySet = self:GetParent().keysetActive
		if oldKeySet then
			Relic_KeysetDisarm(oldKeySet)
			if oldKeySet == self then
				return
			end
		end
		self:LockHighlight()
		self:GetParent().keysetActive = self
		self:SetScript("OnKeyDown", Relic_KeysetListen)
		self:EnableKeyboard(true)
	end
	function Relic_SpawnKeyset(ofsy)
		local btn = CreateFrame("Button", nil, cfgFrame, "UIPanelButtonTemplate")
		btn.lbl = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightLeft")
		btn:SetSize(125, 22)
		btn:SetPoint("TOPLEFT", 85, ofsy)
		btn.lbl:SetPoint("LEFT", -65, 0)
		btn:SetScript("OnClick", Relic_KeysetClick)
		btn:RegisterForClicks("AnyUp")
		return btn
	end
end
local cfgKeybindingsHeader = cfgFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalMed3")
cfgKeybindingsHeader:SetPoint("TOPLEFT", 15, -119-24)
local cfgGreenButton, cfgYellowButton, cfgBlueButton, cfgRedButton = Relic_SpawnKeyset(-139-24), Relic_SpawnKeyset(-163-24), Relic_SpawnKeyset(-187-24), Relic_SpawnKeyset(-211-24)

local skipNextUpdate = false
local function Relic_cfgSetBindingsDisplay(t)
	cfgGreenButton:SetText(t[1] or "")
	cfgYellowButton:SetText(t[2] or "")
	cfgBlueButton:SetText(t[3] or "")
	cfgRedButton:SetText(t[4] or "")
end
local function Relic_cfgInitView()
	if skipNextUpdate then
		skipNextUpdate = false
		return
	end
	cfgFrameHeader:SetText(L"caption")
	cfgShowHelpTooltip.Text:SetText(L"cfgShowTooltip")
	cfgShowHelpTooltip:SetChecked(Relic_ShowTooltip ~= false)
	cfgUnbindInCombat.Text:SetText(L"cfgUnbindInCombat")
	cfgUnbindInCombat:SetChecked(Relic_UnbindCombat ~= false)
	cfgEnableHotkeys.Text:SetText(L"cfgEnableHotkeys")
	cfgEnableHotkeys:SetChecked(Relic_EnableHotkeys ~= false)
	cfgKeybindingsHeader:SetText(L"cfgKeybindings")
	cfgGreenButton.lbl:SetText(L.colors[1])
	cfgYellowButton.lbl:SetText(L.colors[2])
	cfgBlueButton.lbl:SetText(L.colors[3])
	cfgRedButton.lbl:SetText(L.colors[4])
	Relic_cfgSetBindingsDisplay(T.GetKeyBindings())
end

local function Relic_cfgSaveView()
	Relic_ShowTooltip = not not cfgShowHelpTooltip:GetChecked()
	Relic_UnbindCombat = not not cfgUnbindInCombat:GetChecked()
	Relic_EnableHotkeys = not not cfgEnableHotkeys:GetChecked()
	T.SetKeyBindings({cfgGreenButton:GetText(), cfgYellowButton:GetText(), cfgBlueButton:GetText(), cfgRedButton:GetText()})
	Relic_cfgInitView()
end
local function Relic_cfgSetDefaults()
	cfgShowHelpTooltip:SetChecked(true)
	cfgUnbindInCombat:SetChecked(true)
	cfgEnableHotkeys:SetChecked(true)
	Relic_cfgSetBindingsDisplay(L"colorDefaultKeys")
	skipNextUpdate = true
end

cfgFrame:Hide()
cfgFrame:SetScript("OnShow", Relic_cfgInitView)
cfgFrame.name, cfgFrame.okay, cfgFrame.default = "Ogri'Lazy Classic", Relic_cfgSaveView, Relic_cfgSetDefaults
InterfaceOptions_AddCategory(cfgFrame)