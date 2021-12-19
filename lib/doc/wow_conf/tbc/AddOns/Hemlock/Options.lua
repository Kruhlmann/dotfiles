if (select(2, UnitClass("player"))) ~= "ROGUE" then return end
local addOnName = ...

-- main frame
frame = CreateFrame("Frame","HemlockOptions")
frame.name = addOnName
InterfaceOptions_AddCategory(frame)
frame:Hide()

frame:SetScript("OnShow", function(frame)
	local options = {}
	local title = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	title:SetPoint("TOPLEFT", 16, -16)
	title:SetText(addOnName)

	local description = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	description:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
	description:SetText("Minimalistic addon to automate poison buying and creation")

	local function newCheckbox(name, label, description, onClick)
		local check = CreateFrame("CheckButton", "HemlockCheckBox" .. name, frame, "InterfaceOptionsCheckButtonTemplate")
		check:SetScript("OnClick", function(self)
			local tick = self:GetChecked()
			onClick(self, tick and true or false)
			if tick then
				PlaySound(856)
			else
				PlaySound(857)
			end
		end)
		check.label = _G[check:GetName() .. "Text"]
		check.label:SetText(label)
		check.tooltipText = label
		check.tooltipRequirement = description
		return check
	end

	smartPoisonCount = newCheckbox(
		"SmartPoisonCount",
		Hemlock:L("option_smartPoisonCount"),
		Hemlock:L("option_smartPoisonCount_desc"),
		function(self, value) Hemlock.db.profile.options.smartPoisonCount = value; Hemlock:InitFrames() end)
	smartPoisonCount:SetChecked(Hemlock.db.profile.options.smartPoisonCount)
	smartPoisonCount:SetPoint("TOPLEFT", description, "BOTTOMLEFT", -2, -16)
	
	chatMessages = newCheckbox(
		"ChatMessages",
		Hemlock:L("option_chatMessages"),
		Hemlock:L("option_chatMessages_desc"),
		function(self, value) Hemlock.db.profile.options.chatMessages = value end)
	chatMessages:SetChecked(Hemlock.db.profile.options.chatMessages)
	chatMessages:SetPoint("TOPLEFT", smartPoisonCount, "BOTTOMLEFT", 0, -8)
	
	buyConfirmation = newCheckbox(
		"BuyConfirmation",
		Hemlock:L("option_buyConfirmation"),
		Hemlock:L("option_buyConfirmation_desc"),
		function(self, value) Hemlock.db.profile.options.buyConfirmation = value; Hemlock:InitFrames() end)
	buyConfirmation:SetChecked(Hemlock.db.profile.options.buyConfirmation)
	buyConfirmation:SetPoint("TOPLEFT", chatMessages, "BOTTOMLEFT", 0, -8)
	
	ignoreLowerRankPoisons = newCheckbox(
		"IgnoreLowerRankPoisons",
		Hemlock:L("option_ignoreLowerRankPoisons"),
		Hemlock:L("option_ignoreLowerRankPoisons_desc"),
		function(self, value) Hemlock.db.profile.options.ignoreLowerRankPoisons = value; Hemlock:InitFrames() end)
	ignoreLowerRankPoisons:SetChecked(Hemlock.db.profile.options.ignoreLowerRankPoisons)
	ignoreLowerRankPoisons:SetPoint("TOPLEFT", buyConfirmation, "BOTTOMLEFT", 0, -8)
	
	local reset = CreateFrame("Button", "HemlockResetButton", frame, "UIPanelButtonTemplate")
	reset:SetText(Hemlock:L("option_reset_button"))
	reset:SetWidth(177)
	reset:SetHeight(24)
	reset:SetPoint("TOPLEFT", ignoreLowerRankPoisons, "BOTTOMLEFT", 17, -15)
	reset:SetScript("OnClick", function()
		local excludef = true
		Hemlock:Reset(excludef)
		PlaySound(856);
	end)
	reset.tooltipText = Hemlock:L("option_reset_tooltip_title")
	reset.newbieText = Hemlock:L("option_reset_tooltip_desc")
	
	frame:SetScript("OnShow", nil)
end)