local ELKBUFFBARS, private = ...
local ElkBuffBars = private.addon

local LSM3 = LibStub("LibSharedMedia-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(ELKBUFFBARS)

local ipairs				= ipairs
local tonumber				= tonumber
local unpack				= unpack

local math_max				= math.max
local math_min				= math.min

local string_format			= string.format
local string_match			= string.match
local string_utf8len		= string.utf8len

local prototype = {}
local prototype_mt = {__index = prototype}

function ElkBuffBars:NewBar()
	local bar = setmetatable({}, prototype_mt)
	bar.frames = {}
	return bar
end

function prototype:Reset()
	local container = self.frames.container
	container:SetScript("OnUpdate", nil)
	container:Hide()
	container:ClearAllPoints()
	if not InCombatLockdown() then
		self:RecycleSAB()
	end
	self.layout = nil
	self.data = nil
	self.timeleft = 0
	self:SetParent()
end

function prototype:GetContainer()
	return self.frames.container
end

function prototype:SetParent(parent)
	if self.frames.container then
		self.frames.container:SetParent(parent and parent.frames.container or UIParent)
	end
	self.parent = parent
end

local playerunit = {
	pet = true,
	player = true,
	vehicle = true,
}

function prototype:OnClick(button)
	if button == "LeftButton" then
		if IsAltKeyDown() then
			self.parent:ToggleConfigMode()
		elseif IsControlKeyDown() then
			if (self.data.realtype == "BUFF"
			 or self.data.realtype == "DEBUFF"
			 or self.data.realtype == "TENCH") then
				ElkBuffBars:AddAuraToBlacklist(self.parent.layout.id, self.data.realtype, self.data.name)
			end
		elseif IsShiftKeyDown() then
			local activeWindow = ChatEdit_GetActiveWindow()
			if activeWindow then
				if self.data.untilcancelled then
					activeWindow:Insert(self:GetDataString("NAMERANK"))
				else
					activeWindow:Insert(self:GetDataString("NAMERANK").." - "..string_format(self:GetTimeString(self.timeleft, self.layout.timeformat)))
				end
			end
		elseif self.data.realtype == "TRACKING" then
			if WOW_PROJECT_ID ~= WOW_PROJECT_CLASSIC then
				if GameTooltip:GetOwner() == self.frames.container then
					GameTooltip:Hide()
				end
				ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, self.frames.container, 0, -5)
				PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
			end
		end
--~ 	elseif button == "RightButton" then
--~ 		if not playerunit[self.parent.layout.target] then return end
--~ 		if self.data.realtype == "BUFF" then
--~ 			CancelUnitBuff(self.parent.layout.target, self.data.id)
--~ 			ElkBuffBars:CancelPlayerAura(self.data.realname, self.data.icon)
--~ 		elseif self.data.realtype == "TENCH" then
--~ 			CancelItemTempEnchantment(self.data.id - 15)
--~ 			ElkBuffBars:CancelPlayerTEnch(self.data.id, self.data.icon)
--~ 		end
	end
end

function prototype:OnEnter()
	local realtype = self.data.realtype
	if self.layout.tooltipanchor == "default" then
		GameTooltip_SetDefaultAnchor(GameTooltip, self.frames.container)
	else
		GameTooltip:SetOwner(self.frames.container, self.layout.tooltipanchor)
	end
	if realtype == "BUFF" or realtype == "DEBUFF" then
		if realtype == "BUFF" then
			GameTooltip:SetUnitAura(self.parent.layout.target, self.data.id, "HELPFUL")
		else
			GameTooltip:SetUnitAura(self.parent.layout.target, self.data.id, "HARMFUL")
		end
		if (self.layout.tooltipcaster) then
			local classColor = RAID_CLASS_COLORS[self.data.casterClass]
			if classColor then
				GameTooltip:AddDoubleLine(L["TOOLTIP_CASTER"], self.data.casterName, nil, nil, nil, classColor.r, classColor.g, classColor.b)
			else
				GameTooltip:AddDoubleLine(L["TOOLTIP_CASTER"], self.data.casterName)
			end
			GameTooltip:Show()
		end
	elseif realtype == "TENCH" and self.parent.layout.target == "player" then
		GameTooltip:SetInventoryItem("player", self.data.id)
	elseif realtype == "TRACKING" and self.parent.layout.target == "player" then
		if WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then
			GameTooltip:SetTrackingSpell()
		else -- WOW_PROJECT_MAINLINE / WOW_PROJECT_BURNING_CRUSADE_CLASSIC
			GameTooltip:ClearLines()
			GameTooltip:AddLine("Tracking")
			local name, texture, active, category
			local count = GetNumTrackingTypes()
			for id=1, count do
				name, texture, active, category = GetTrackingInfo(id)
				if active then
					if category == "spell" then
						GameTooltip:AddLine("|T"..texture..":0::::0.0625:0.9:0.0625:0.9|t |cffffffff"..name)
					else
						GameTooltip:AddLine("|T"..texture..":0::::0:1:0:1|t |cffffffff"..name)
					end
				end
			end
			GameTooltip:Show()
		end
	end
end

function prototype:OnLeave()
	GameTooltip:Hide()
end

function prototype:OnUpdate(elapsed)
	self.updateThrottle = self.updateThrottle - elapsed
	if self.updateThrottle > 0 then
		return
	end
	self.updateThrottle = 0.05

	local data = self.data
	local frames = self.frames

--~ 	self.timeleft = math_max(0, self.timeleft - elapsed)
	self.timeleft = data.expirytime and math_max(0, data.expirytime - GetTime()) or 0
	if (data.timeMod > 0) then
		self.timeleft = self.timeleft / data.timeMod
	end
	self:UpdateTimeleft()
	if self.timeleft == 0 then
		frames.container:SetScript("OnUpdate", nil)
	end

	if not (frames.bar and frames.bar:IsShown()) then return end

	local layout = self.layout
	local fraction = math_max(0, math_min(self.timeleft / data.timemax, 1))

--~ 	if fraction > 1.001 then
--~ 		ElkBuffBars:Print(string.format("|cffff0000[EBB] ERROR:|r (ElkBuffBars.Bar:OnUpdate) %d - %s - %f / %f", data.id, data.name, self.timeleft, data.timemax))
--~ 		fraction = 0
--~ 	end

	local barwidth = self.barwidth_total * fraction
	if barwidth + .2 < self.barwidth then -- this could be a visual change
		if barwidth < 1 then
			frames.bar:Hide()
			if frames.spark then frames.spark:Hide() end
		else
			frames.bar:SetWidth(barwidth)
			if layout.barright then
				frames.bar:SetTexCoord(1 - fraction, 1, 0, 1)
			else
				frames.bar:SetTexCoord(0, fraction, 0, 1)
			end
		end
		self.barwidth = barwidth
	end
end

function prototype:UpdateLayout(layout)
	if layout then
		self.layout = layout
	else
		layout = self.layout
		if not layout then
			return
		end
	end

	local frames = self.frames

-- container
	if not frames.container then
		frames.container = CreateFrame("button", nil, UIParent)
		frames.container:SetFrameStrata("BACKGROUND")
		frames.container.bar = self
--~ 		frames.container:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		frames.container:RegisterForClicks("LeftButtonUp")
		frames.container:SetScript("OnClick", function(this, button) this.bar:OnClick(button) end )
		frames.container:SetScript("OnEnter", function(this) this.bar:OnEnter() end )
		frames.container:SetScript("OnLeave", function(this) this.bar:OnLeave() end )
	end
	if layout.clickthrough then
		frames.container:EnableMouse(false)
	else
		frames.container:EnableMouse(true)
	end
	frames.container:SetHeight(layout.height)
	frames.container:SetWidth(layout.width)
--~ 	frames.container:SetAlpha(layout.alpha)
	local leftoffset = 0
	local rightoffset = 0

-- icon
	if layout.icon then
		if not frames.icon then
			frames.icon = frames.container:CreateTexture(nil, "BACKGROUND")
		end
		frames.icon:ClearAllPoints()
		frames.icon:SetHeight(layout.height)
		frames.icon:SetWidth(layout.height)
		if layout.icon == "LEFT" then
			leftoffset = layout.height
			frames.icon:SetPoint("LEFT", frames.container)

		end
		if layout.icon == "RIGHT" then
			rightoffset = -layout.height
			frames.icon:SetPoint("RIGHT", frames.container)

		end
		frames.icon:Show()
	else
		if frames.icon then frames.icon:Hide() end
	end

-- iconcount
	if layout.icon and layout.iconcount then
		if not frames.iconcount then
			frames.iconcount = frames.container:CreateFontString(nil, "OVERLAY")
		end
		frames.iconcount:ClearAllPoints()
		frames.iconcount:SetPoint(layout.iconcountanchor, frames.icon, layout.iconcountanchor, (string_match(layout.iconcountanchor, "LEFT") and 3) or (string_match(layout.iconcountanchor, "RIGHT") and -3) or 0, (string_match(layout.iconcountanchor, "TOP") and -3) or (string_match(layout.iconcountanchor, "BOTTOM") and 3) or 0)
		frames.iconcount:SetFont(LSM3:Fetch("font", layout.iconcountfont), layout.iconcountfontsize, "OUTLINE")
		frames.iconcount:SetTextColor(layout.iconcountcolor[1], layout.iconcountcolor[2], layout.iconcountcolor[3], 1)
		frames.iconcount:Show()
	else
		if frames.iconcount then frames.iconcount:Hide() end
	end

-- iconborder
	if layout.icon then
		if not frames.iconborder then
			frames.iconborder = frames.container:CreateTexture(nil, "OVERLAY")
		end
		frames.iconborder:ClearAllPoints()
		frames.iconborder:SetPoint("TOPLEFT", frames.icon)
		frames.iconborder:SetPoint("BOTTOMRIGHT", frames.icon)
		frames.iconborder:Show()
	else
		if frames.iconborder then frames.iconborder:Hide() end
	end

-- bar
	if layout.bgbar then
		if not frames.bgbar then
			frames.bgbar = frames.container:CreateTexture(nil, "BACKGROUND")
		end
		frames.bgbar:ClearAllPoints()
		frames.bgbar:SetPoint("TOPLEFT", frames.container, "TOPLEFT", leftoffset, 0)
		frames.bgbar:SetPoint("BOTTOMRIGHT", frames.container, "BOTTOMRIGHT", rightoffset, 0)
		frames.bgbar:SetTexture(LSM3:Fetch("statusbar", layout.bartexture))
		frames.bgbar:Show()
	else
		if frames.bgbar then frames.bgbar:Hide() end
	end

	if layout.bar then
		if not frames.bar then
			frames.bar = frames.container:CreateTexture(nil, "ARTWORK")
		end
		frames.bar:ClearAllPoints()
		if layout.barright then
			frames.bar:SetPoint("TOPRIGHT",		frames.container,	"TOPRIGHT",		rightoffset,	0)
			frames.bar:SetPoint("BOTTOMRIGHT",	frames.container,	"BOTTOMRIGHT",	rightoffset,	0)
		else
			frames.bar:SetPoint("TOPLEFT",		frames.container,	"TOPLEFT",		leftoffset,		0)
			frames.bar:SetPoint("BOTTOMLEFT",	frames.container,	"BOTTOMLEFT",	leftoffset,		0)
		end
		frames.bar:SetWidth(0)
		frames.bar:SetTexture(LSM3:Fetch("statusbar", layout.bartexture))
		frames.bar:Show()
	else
		if frames.bar then frames.bar:Hide() end
	end

	if layout.bar and layout.spark then
		if not frames.spark then
			frames.spark = frames.container:CreateTexture(nil, "OVERLAY")
			frames.spark:SetTexture([[Interface\CastingBar\UI-CastingBar-Spark]])
			frames.spark:SetWidth(16)
			frames.spark:SetBlendMode("ADD")
		end
		frames.spark:ClearAllPoints()
		if layout.barright then
			frames.spark:SetPoint("TOP", frames.bar, "TOPLEFT", 0, 7)
			frames.spark:SetPoint("BOTTOM", frames.bar, "BOTTOMLEFT", 0, -7)
			frames.spark:SetTexCoord(1, 0, 0, 1)
		else
			frames.spark:SetPoint("TOP", frames.bar, "TOPRIGHT", 0, 7)
			frames.spark:SetPoint("BOTTOM", frames.bar, "BOTTOMRIGHT", 0, -7)
			frames.spark:SetTexCoord(0, 1, 0, 1)
		end
		frames.spark:Show()
	else
		if frames.spark then frames.spark:Hide() end
	end

	local padding = layout.padding
-- textTL
	if layout.textTL then
		if not frames.textTL then
			frames.textTL = frames.container:CreateFontString(nil, "OVERLAY")
		end
		local fontString = frames.textTL
		fontString:ClearAllPoints()
		fontString:SetPoint("TOPLEFT", frames.container, "TOPLEFT", leftoffset + padding, -padding)
		fontString:SetFontObject(GameFontNormal)
		fontString:SetFont(LSM3:Fetch("font", layout.textTLfont), layout.textTLfontsize, layout.textTLstyle)
		fontString:SetTextColor(layout.textTLcolor[1], layout.textTLcolor[2], layout.textTLcolor[3], 1)
		if not layout.textTR then
			fontString:SetPoint("TOPRIGHT", frames.container, "TOPRIGHT", rightoffset - padding, -padding)
			fontString:SetJustifyH(layout.textTLalign)
		else
			fontString:SetJustifyH("LEFT")
		end
		if not layout.textBL then
			fontString:SetPoint("BOTTOMLEFT", frames.container, "BOTTOMLEFT", leftoffset + padding, padding)
			fontString:SetJustifyV("CENTER")
		else
			fontString:SetJustifyV("TOP")
		end
		fontString:SetWordWrap(false)
		fontString:Show()
	else
		if frames.textTL then frames.textTL:Hide() end
	end

-- textTR
	if layout.textTR then
		if not frames.textTR then
			frames.textTR = frames.container:CreateFontString(nil, "OVERLAY")
		end
		local fontString = frames.textTR
		fontString:ClearAllPoints()
		fontString:SetPoint("TOPRIGHT", frames.container, "TOPRIGHT", rightoffset - padding, -padding)
		fontString:SetFontObject(GameFontNormal)
		fontString:SetFont(LSM3:Fetch("font", layout.textTRfont), layout.textTRfontsize, layout.textTRstyle)
		fontString:SetTextColor(layout.textTRcolor[1], layout.textTRcolor[2], layout.textTRcolor[3], 1)
		fontString:SetJustifyH("RIGHT")
		if not layout.textBL then
			fontString:SetPoint("BOTTOMRIGHT", frames.container, "BOTTOMRIGHT", rightoffset - padding, padding)
			fontString:SetJustifyV("CENTER")
		else
			fontString:SetJustifyV("TOP")
		end
		if layout.textTL then
			fontString:SetPoint("TOPLEFT", frames.textTL, "TOPLEFT", 10, 0)
		end
		fontString:SetWordWrap(false)
		fontString:Show()
	else
		if frames.textTR then frames.textTR:Hide() end
	end

-- textBL
	if layout.textTL and layout.textBL then
		if not frames.textBL then
			frames.textBL = frames.container:CreateFontString(nil, "OVERLAY")
		end
		local fontString = frames.textBL
		fontString:ClearAllPoints()
		fontString:SetPoint("BOTTOMLEFT", frames.container, "BOTTOMLEFT", leftoffset + padding, padding)
		fontString:SetFontObject(GameFontNormal)
		fontString:SetFont(LSM3:Fetch("font", layout.textBLfont), layout.textBLfontsize, layout.textBLstyle)
		fontString:SetTextColor(layout.textBLcolor[1], layout.textBLcolor[2], layout.textBLcolor[3], 1)
		if not layout.textBR then
			fontString:SetPoint("BOTTOMRIGHT", frames.container, "BOTTOMRIGHT", rightoffset - padding, padding)
			fontString:SetJustifyH(layout.textBLalign)
		else
			fontString:SetJustifyH("LEFT")
		end
		fontString:SetWordWrap(false)
		fontString:Show()
	else
		if frames.textBL then frames.textBL:Hide() end
	end

-- textBR
	if layout.textTL and layout.textBR then
		if not frames.textBR then
			frames.textBR = frames.container:CreateFontString(nil, "OVERLAY")
		end
		local fontString = frames.textBR
		fontString:ClearAllPoints()
		fontString:SetPoint("BOTTOMRIGHT", frames.container, "BOTTOMRIGHT", rightoffset - padding, padding)
		fontString:SetFontObject(GameFontNormal)
		fontString:SetFont(LSM3:Fetch("font", layout.textBRfont), layout.textBRfontsize, layout.textBRstyle)
		fontString:SetTextColor(layout.textBRcolor[1], layout.textBRcolor[2], layout.textBRcolor[3], 1)
		fontString:SetJustifyH("RIGHT")
		if layout.textBL then
			fontString:SetPoint("BOTTOMLEFT", frames.textBL, "BOTTOMLEFT", 10, 0)
		end
		fontString:SetWordWrap(false)
		fontString:Show()
	else
		if frames.textBR then frames.textBR:Hide() end
	end

-- precomputations
	self.barwidth_total = layout.width - leftoffset + rightoffset		-- rightoffset is <= 0
	self.barwidth_padded = self.barwidth_total - 2 * layout.padding
	self.trdwidth = self.barwidth_padded / 3

end

local updateFunc = function(self, elapsed) self.bar:OnUpdate(elapsed) end

function prototype:UpdateData(data)
	if data then
		self.data = data
	else
		data = self.data
		if not data then
			return
		end
	end

	if data.type == "FAKE" then -- special case for Blessing of Demonstration
		self.timeleft = data.expirytime
	else
		self.timeleft = data.expirytime and math_max(0, data.expirytime - GetTime()) or 0
	end

	local frames = self.frames
	local layout = self.layout

	if layout.icon then
		frames.icon:SetTexture(data.icon)
		if data.canStealOrPurge then
			frames.iconborder:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Stealable")
			frames.iconborder:SetTexCoord(0, 1, 0, 1)
			frames.iconborder:SetBlendMode("ADD")
			frames.iconborder:Show()
		elseif data.type == "DEBUFF" then
			frames.iconborder:SetTexture("Interface\\Buttons\\UI-Debuff-Overlays")
			frames.iconborder:SetTexCoord(0.296875, 0.5703125, 0, 0.515625)
			local debuffcolor = DebuffTypeColor[data.debufftype or "none"] or DebuffTypeColor["none"]
			frames.iconborder:SetVertexColor(debuffcolor.r, debuffcolor.g, debuffcolor.b)
			frames.iconborder:SetBlendMode("BLEND")
			frames.iconborder:Show()
		elseif data.type == "TENCH" then
			frames.iconborder:SetTexture("Interface\\Buttons\\UI-TempEnchant-Border")
			frames.iconborder:SetTexCoord(0, 1, 0, 1)
			frames.iconborder:SetBlendMode("BLEND")
			frames.iconborder:Show()
		else
			frames.iconborder:Hide()
		end
		if layout.iconcount then
			if data.maxcharges and data.charges and data.charges > 0 then
				frames.iconcount:SetText(data.charges)
				frames.iconcount:Show()
			else
				frames.iconcount:Hide()
			end
		end
	end
	if layout.bar then
		if data.untilcancelled then
			if layout.timelessfull then
				frames.bar:SetWidth(self.barwidth_total)
				frames.bar:SetTexCoord(0, 1, 0, 1)
				frames.bar:Show()
			else
				frames.bar:SetWidth(0)
				frames.bar:Hide()
			end
			if frames.spark then frames.spark:Hide() end
		else

			local fraction = math_max(0, math_min(self.timeleft / data.timemax, 1))

--~ 			if fraction > 1.001 then
--~ 				ElkBuffBars:Print(string.format("|cffff0000[EBB] ERROR:|r (ElkBuffBars.Bar:UpdateData) %d - %s - %f / %f", data.id, data.name, self.timeleft, data.timemax))
--~ 				fraction = 0
--~ 			end

			local barwidth = self.barwidth_total * fraction
			self.barwidth = barwidth

			if barwidth < 1 then
				frames.bar:Hide()
			else
				frames.bar:SetWidth(barwidth)
				if layout.barright then
					frames.bar:SetTexCoord(1 - fraction, 1, 0, 1)
				else
					frames.bar:SetTexCoord(0, fraction, 0, 1)
				end
				frames.bar:Show()
			end
			if layout.spark then frames.spark:Show() end
		end
		local barcolorR, barcolorG, barcolorB, barcolorA = unpack(layout["barcolor"])
		if data.type == "DEBUFF" and layout.debufftypecolor then
			local debuffcolor = DebuffTypeColor[data.debufftype or "none"] or DebuffTypeColor["none"]
			barcolorR, barcolorG, barcolorB = debuffcolor.r, debuffcolor.g, debuffcolor.b
		end
		frames.bar:SetVertexColor(barcolorR, barcolorG, barcolorB, barcolorA)
	end
	if layout.bgbar then
		frames.bgbar:SetVertexColor(unpack(layout["barbgcolor"]))
	end

	if not data.untilcancelled and data.type ~= "FAKE" then -- no scripts for Blessing of Demonstration
		self.updateThrottle = 0
		frames.container:SetScript("OnUpdate", updateFunc)
	else
		frames.container:SetScript("OnUpdate", nil)
	end
	self:UpdateText()

	if not InCombatLockdown() then
		if not layout.clickthrough and playerunit[self.parent.layout.target]
		  and (data.type == "BUFF" or data.type == "TENCH" or data.type == "TRACKING") then
			local SAB = self.SAB
			if not SAB then
				SAB = ElkBuffBars:GetSAB()
				SAB:SetPoint("TOPLEFT", frames.container, "TOPLEFT")
				SAB:SetPoint("BOTTOMRIGHT", frames.container, "BOTTOMRIGHT")
				SAB:SetFrameStrata(frames.container:GetFrameStrata())
				SAB:SetFrameLevel(frames.container:GetFrameLevel() + 1)
				SAB:SetAttribute("_bar", self)
				SAB:Show()
				frames.container:EnableMouse(false)
			end
			SAB:SetAttribute("unit", self.parent.layout.target)
			if data.type == "BUFF" then
				SAB:SetAttribute("*type2", "cancelaura")
				SAB:SetAttribute("*index2", data.id)
				SAB:SetAttribute("*target-slot2", nil);
			elseif data.type == "TENCH" then
				SAB:SetAttribute("*type2", "cancelaura")
				SAB:SetAttribute("*index2", nil)
				SAB:SetAttribute("*target-slot2", data.id);
			else -- data.type == "TRACKING"
				SAB:SetAttribute("*type2", "OnRightClickTracking")
				SAB:SetAttribute("*index2", nil)
				SAB:SetAttribute("*target-slot2", nil);
			end
			self.SAB = SAB
		else
			self:RecycleSAB()
		end
	end
end

function prototype:RecycleSAB()
	if self.SAB then
		ElkBuffBars:RecycleSAB(self.SAB)
		self.SAB = nil
		if self.layout.clickthrough then
			self.frames.container:EnableMouse(false)
		else
			self.frames.container:EnableMouse(true)
		end
	end
end

local romandigits = {	{["r"] = "M",  ["a"] = 1000},
						{["r"] = "CM", ["a"] =  900},
						{["r"] = "D",  ["a"] =  500},
						{["r"] = "CD", ["a"] =  400},
						{["r"] = "C",  ["a"] =  100},
						{["r"] = "XC", ["a"] =   90},
						{["r"] = "L",  ["a"] =   50},
						{["r"] = "XL", ["a"] =   40},
						{["r"] = "X",  ["a"] =   10},
						{["r"] = "IX", ["a"] =    9},
						{["r"] = "V",  ["a"] =    5},
						{["r"] = "IV", ["a"] =    4},
						{["r"] = "I",  ["a"] =    1}
					}

local arabic_to_roman = setmetatable({}, {__index=function(self,arabic)
	arabic = tonumber(arabic)
	if not arabic then
		return nil
	end
	local roman = ""
	for i,v in ipairs(romandigits) do
		while arabic >= v.a do
			arabic = arabic - v.a
			roman = roman .. v.r
		end
	end
	self[arabic] = roman
	return roman
end})

function prototype:GetDataString(datatype)
	local charges = self.data.maxcharges and self.data.charges and self.data.charges > 0 and " x"..self.data.charges or ""
	if datatype == "NAME" then return self:GetNameString() end
	if datatype == "NAMERANK" then return self:GetNameString()..(self.data.rank and (" "..arabic_to_roman[self.data.rank]) or "") end
	if datatype == "NAMECOUNT" then return self:GetNameString()..charges end
	if datatype == "NAMERANKCOUNT" then return self:GetNameString()..(self.data.rank and (" "..arabic_to_roman[self.data.rank]) or "")..charges end
	if datatype == "RANK" then return self.data.rank and arabic_to_roman[self.data.rank] or "" end
	if datatype == "COUNT" then return charges end
	if datatype == "TIMELEFT" then return string_format(self:GetTimeString(self.timeleft, self.layout.timeformat)) end
	if datatype == "DEBUFFTYPE" then return self.data.debufftype end
	if datatype == "CASTER" then
		local classColor = RAID_CLASS_COLORS[self.data.casterClass]
		if classColor then
			return "|c"..classColor.colorStr..self.data.casterName.."|r"
		else
			return self.data.casterName
		end
	end
	return "???"
end

function prototype:GetNameString()
	local layout = self.layout
	local name = self.data.name
	if layout.abbreviate_name > 0 and string_utf8len(name) > layout.abbreviate_name then
		return ElkBuffBars.ShortName[name]
	else
		return name
	end
end

local function getTimeFormatCondensed(timeAmount, timeFraction)
	local seconds = timeAmount % 60 or 0
	local minutes = floor(timeAmount / 60) % 60
	local hours = floor(timeAmount / 3600)
	if (hours > 0) then
		return "%dh %dm", hours, minutes
	elseif (minutes > 0) then
		return "%dm %ds", minutes, seconds
	else
		return (timeFraction and "%.1fs" or "%ds"), seconds
	end
end

local function getTimeFormatClock(timeAmount, timeFraction)
	local seconds = timeAmount % 60 or 0
	local minutes = floor(timeAmount / 60) % 60
	local hours = floor(timeAmount / 3600)
	if (hours > 0) then
		return "%d:%02d:%02d", hours, minutes, seconds
	elseif (minutes > 0) then
		return "%d:%02d", minutes, seconds
	else
		return (timeFraction and "%.1fs" or "%ds"), seconds
	end
end

function prototype:GetTimeString(timeAmount, timeFormat, timeFraction)
	if self.data.untilcancelled then return "" end
	if timeFormat == "DEFAULT" then return SecondsToTimeAbbrev(timeAmount) end
	if timeFormat == "CLOCK" then return getTimeFormatClock(timeAmount, timeFraction) end
	if timeFormat == "CONDENSED" then return getTimeFormatCondensed(timeAmount, timeFraction) end
	return "???"
end

function prototype:UpdateText()
	local frames = self.frames
	local layout = self.layout
	if layout.textTL then
		frames.textTL:SetText(self:GetDataString(layout.textTL))
	end
	if layout.textTR then
		frames.textTR:SetText(self:GetDataString(layout.textTR))
	end
	if layout.textTL and layout.textBL then
		frames.textBL:SetText(self:GetDataString(layout.textBL))
	end
	if layout.textTL and layout.textBR then
		frames.textBR:SetText(self:GetDataString(layout.textBR))
	end
	self:UpdateTextWidth()
end

function prototype:UpdateTimeleft()
	if self.data.untilcancelled then return end
	local frames = self.frames
	local layout = self.layout
	if layout.textTL == "TIMELEFT" then
		frames.textTL:SetFormattedText(self:GetTimeString(self.timeleft, layout.timeformat, layout.timeFraction))
	end
	if layout.textTR == "TIMELEFT" then
		frames.textTR:SetFormattedText(self:GetTimeString(self.timeleft, layout.timeformat, layout.timeFraction))
	end
	if layout.textTL and layout.textBL == "TIMELEFT" then
		frames.textBL:SetFormattedText(self:GetTimeString(self.timeleft, layout.timeformat, layout.timeFraction))
	end
	if layout.textTL and layout.textBR == "TIMELEFT" then
		frames.textBR:SetFormattedText(self:GetTimeString(self.timeleft, layout.timeformat, layout.timeFraction))
	end
	self:UpdateTextWidth()
end

function prototype:UpdateTextWidth()
	local frames = self.frames
	local layout = self.layout
	local trdwidth = self.trdwidth
	if layout.textTL and layout.textTR then
		local TLwidth = frames.textTL:GetStringWidth() + 5
		local TRwidth = frames.textTR:GetStringWidth() + 5
		if TLwidth < trdwidth then
			frames.textTL:SetWidth(TLwidth)
		elseif TRwidth < trdwidth then
			frames.textTL:SetWidth(self.barwidth_padded - TRwidth)
		else
			frames.textTL:SetWidth(trdwidth + (TLwidth * trdwidth)/(TLwidth + TRwidth))
		end
	end
	if layout.textTL and layout.textBL and layout.textBR then
		local BLwidth = frames.textBL:GetStringWidth() + 5
		local BRwidth = frames.textBR:GetStringWidth() + 5
		if BLwidth < trdwidth then
			frames.textBL:SetWidth(BLwidth)
		elseif BRwidth < trdwidth then
			frames.textBL:SetWidth(self.barwidth_padded - BRwidth)
		else
			frames.textBL:SetWidth(trdwidth + (BLwidth * trdwidth)/(BLwidth + BRwidth))
		end
	end
end
