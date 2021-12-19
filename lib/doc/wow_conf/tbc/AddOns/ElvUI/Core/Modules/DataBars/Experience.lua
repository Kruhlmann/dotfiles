local E, L, V, P, G = unpack(ElvUI)
local DB = E:GetModule('DataBars')
local LSM = E.Libs.LSM

local error = error
local type, pairs = type, pairs
local min, format = min, format
local CreateFrame = CreateFrame
local IsTrialAccount = IsTrialAccount
local GetXPExhaustion = GetXPExhaustion
local IsXPUserDisabled = IsXPUserDisabled
local GetQuestLogRewardXP = GetQuestLogRewardXP
local IsLevelAtEffectiveMaxLevel = IsLevelAtEffectiveMaxLevel
local C_QuestLog_GetNumQuestLogEntries = C_QuestLog.GetNumQuestLogEntries
local C_QuestLog_ReadyForTurnIn = C_QuestLog.ReadyForTurnIn
local C_QuestLog_GetInfo = C_QuestLog.GetInfo
local C_QuestLog_GetQuestWatchType = C_QuestLog.GetQuestWatchType
local GetNumQuestLogEntries = GetNumQuestLogEntries
local GetQuestLogTitle = GetQuestLogTitle
local UnitXP, UnitXPMax = UnitXP, UnitXPMax
local GameTooltip = GameTooltip

local CurrentXP, XPToLevel, RestedXP, PercentRested
local PercentXP, RemainXP, RemainTotal, RemainBars
local QuestLogXP = 0

local function hasDisabledXP()
	return E.Retail and IsXPUserDisabled()
end

local function isTrialMax()
	return E.Retail and IsTrialAccount() and (E.myLevel ~= 20)
end

function DB:ExperienceBar_CheckQuests(questID, completedOnly)
	if E.Retail and questID then
		local isCompleted = C_QuestLog_ReadyForTurnIn(questID)
		if not completedOnly or isCompleted then
			QuestLogXP = QuestLogXP + GetQuestLogRewardXP(questID)
		end
	elseif not E.Retail then
		local currentZone = E.MapInfo.name
		if not currentZone then return end

		local bar = DB.StatusBars.Experience
		local currentZoneCheck, isHeader, isComplete, name, _
		for i = 1, GetNumQuestLogEntries() do
			name, _, _, isHeader, _, isComplete, _, questID = GetQuestLogTitle(i)
			if isHeader then
				currentZoneCheck = bar.db.questCurrentZoneOnly and currentZone == name or not bar.db.questCurrentZoneOnly
			elseif currentZoneCheck and (not completedOnly or isComplete == 1) then
				QuestLogXP = QuestLogXP + GetQuestLogRewardXP(questID)
			end
		end
	end
end

function DB:ExperienceBar_ShouldBeVisible()
	return not IsLevelAtEffectiveMaxLevel(E.mylevel) and not hasDisabledXP() and not isTrialMax()
end

local function RestedQuestLayering()
	if not QuestLogXP or not RestedXP then return end
	local bar = DB.StatusBars.Experience

	bar.Quest.barTexture:SetDrawLayer('ARTWORK', (QuestLogXP > RestedXP) and 2 or 3)
	bar.Rested.barTexture:SetDrawLayer('ARTWORK', (QuestLogXP <= RestedXP) and 2 or 3)
end

function DB:ExperienceBar_Update()
	local bar = DB.StatusBars.Experience
	DB:SetVisibility(bar)

	if not bar.db.enable or bar:ShouldHide() then return end

	CurrentXP, XPToLevel, RestedXP = UnitXP('player'), UnitXPMax('player'), GetXPExhaustion()
	if XPToLevel <= 0 then XPToLevel = 1 end

	local remainXP = XPToLevel - CurrentXP
	local remainPercent = remainXP / XPToLevel
	RemainTotal, RemainBars = remainPercent * 100, remainPercent * 20
	PercentXP, RemainXP = (CurrentXP / XPToLevel) * 100, E:ShortValue(remainXP)

	local expColor, restedColor = DB.db.colors.experience, DB.db.colors.rested
	bar:SetStatusBarColor(expColor.r, expColor.g, expColor.b, expColor.a)
	bar.Rested:SetStatusBarColor(restedColor.r, restedColor.g, restedColor.b, restedColor.a)

	local displayString, textFormat = '', DB.db.experience.textFormat

	if not DB:ExperienceBar_ShouldBeVisible() then
		bar:SetMinMaxValues(0, 1)
		bar:SetValue(1)

		if textFormat ~= 'NONE' then
			displayString = hasDisabledXP() and L["Disabled"] or L["Max Level"]
		end
	else
		bar:SetMinMaxValues(0, XPToLevel)
		bar:SetValue(CurrentXP)

		if textFormat == 'PERCENT' then
			displayString = format('%.2f%%', PercentXP)
		elseif textFormat == 'CURMAX' then
			displayString = format('%s - %s', E:ShortValue(CurrentXP), E:ShortValue(XPToLevel))
		elseif textFormat == 'CURPERC' then
			displayString = format('%s - %.2f%%', E:ShortValue(CurrentXP), PercentXP)
		elseif textFormat == 'CUR' then
			displayString = format('%s', E:ShortValue(CurrentXP))
		elseif textFormat == 'REM' then
			displayString = format('%s', RemainXP)
		elseif textFormat == 'CURREM' then
			displayString = format('%s - %s', E:ShortValue(CurrentXP), RemainXP)
		elseif textFormat == 'CURPERCREM' then
			displayString = format('%s - %.2f%% (%s)', E:ShortValue(CurrentXP), PercentXP, RemainXP)
		end

		local isRested = RestedXP and RestedXP > 0
		if isRested then
			bar.Rested:SetMinMaxValues(0, XPToLevel)
			bar.Rested:SetValue(min(CurrentXP + RestedXP, XPToLevel))

			PercentRested = (RestedXP / XPToLevel) * 100

			if textFormat == 'PERCENT' then
				displayString = format('%s R:%.2f%%', displayString, PercentRested)
			elseif textFormat == 'CURPERC' then
				displayString = format('%s R:%s [%.2f%%]', displayString, E:ShortValue(RestedXP), PercentRested)
			elseif textFormat ~= 'NONE' then
				displayString = format('%s R:%s', displayString, E:ShortValue(RestedXP))
			end
		end

		if bar.db.showLevel and textFormat ~= 'NONE' then
			displayString = format('%s %s : %s', L["Level"], E.mylevel, displayString)
		end

		RestedQuestLayering()
		bar.Rested:SetShown(isRested)
	end

	bar.text:SetText(displayString)
end

function DB:ExperienceBar_QuestXP()
	if not DB:ExperienceBar_ShouldBeVisible() then return end
	local bar = DB.StatusBars.Experience

	QuestLogXP = 0

	local currentZoneCheck, trackedQuestCheck

	if E.Retail then
		for i = 1, C_QuestLog_GetNumQuestLogEntries() do
			local info = C_QuestLog_GetInfo(i)
			if info and not info.isHidden then
				currentZoneCheck = (bar.db.questCurrentZoneOnly and info.isOnMap) or not bar.db.questCurrentZoneOnly
				trackedQuestCheck = (bar.db.questTrackedOnly and info.questID and C_QuestLog_GetQuestWatchType(info.questID)) or not bar.db.questTrackedOnly
				if currentZoneCheck and trackedQuestCheck then
					DB:ExperienceBar_CheckQuests(info.questID, bar.db.questCompletedOnly)
				end
			end
		end
	else
		DB:ExperienceBar_CheckQuests(nil, bar.db.questCompletedOnly)
	end

	if bar.db.showQuestXP and QuestLogXP > 0 then
		bar.Quest:SetMinMaxValues(0, XPToLevel)
		bar.Quest:SetValue(min(CurrentXP + QuestLogXP, XPToLevel))
		bar.Quest:SetStatusBarColor(DB.db.colors.quest.r, DB.db.colors.quest.g, DB.db.colors.quest.b, DB.db.colors.quest.a)
		RestedQuestLayering()
		bar.Quest:Show()
	else
		bar.Quest:Hide()
	end

	if DB.CustomQuestXPWatchers then
		for _, func in pairs(DB.CustomQuestXPWatchers) do
			func(QuestLogXP)
		end
	end
end

function DB:ExperienceBar_OnEnter()
	if self.db.mouseover then
		E:UIFrameFadeIn(self, 0.4, self:GetAlpha(), 1)
	end

	if GameTooltip:IsForbidden() or not DB:ExperienceBar_ShouldBeVisible() then return end

	GameTooltip:ClearLines()
	GameTooltip:SetOwner(self, 'ANCHOR_CURSOR')

	GameTooltip:AddDoubleLine(L["Experience"], format('%s %d', L["Level"], E.mylevel))
	GameTooltip:AddLine(' ')

	GameTooltip:AddDoubleLine(L["XP:"], format(' %d / %d (%.2f%%)', CurrentXP, XPToLevel, PercentXP), 1, 1, 1)
	GameTooltip:AddDoubleLine(L["Remaining:"], format(' %s (%.2f%% - %d '..L["Bars"]..')', RemainXP, RemainTotal, RemainBars), 1, 1, 1)

	if QuestLogXP and QuestLogXP > 0 then
		GameTooltip:AddDoubleLine(L["Quest Log XP:"], format(' %d (%.2f%%)', QuestLogXP, (QuestLogXP / XPToLevel) * 100), 1, 1, 1)
	end

	if RestedXP and RestedXP > 0 then
		GameTooltip:AddDoubleLine(L["Rested:"], format('%d (%.2f%%)', RestedXP, PercentRested), 1, 1, 1)
	end

	GameTooltip:Show()
end

function DB:ExperienceBar_OnClick() end

function DB:ExperienceBar_XPGain()
	DB:ExperienceBar_Update()

	if E.Retail then
		DB:ExperienceBar_QuestXP()
	end
end

function DB:ExperienceBar_Toggle()
	local bar = DB.StatusBars.Experience
	bar.db = DB.db.experience

	if bar.db.enable then
		E:EnableMover(bar.holder.mover:GetName())
	else
		E:DisableMover(bar.holder.mover:GetName())
	end

	if bar.db.enable and not bar:ShouldHide() then
		DB:RegisterEvent('PLAYER_XP_UPDATE', 'ExperienceBar_XPGain')
		DB:RegisterEvent('UPDATE_EXHAUSTION', 'ExperienceBar_Update')
		DB:RegisterEvent('QUEST_LOG_UPDATE', 'ExperienceBar_QuestXP')
		DB:RegisterEvent('ZONE_CHANGED', 'ExperienceBar_QuestXP')
		DB:RegisterEvent('ZONE_CHANGED_NEW_AREA', 'ExperienceBar_QuestXP')

		if E.Retail then
			DB:RegisterEvent('SUPER_TRACKING_CHANGED', 'ExperienceBar_QuestXP')
		end

		DB:ExperienceBar_Update()
	else
		DB:UnregisterEvent('PLAYER_XP_UPDATE')
		DB:UnregisterEvent('UPDATE_EXHAUSTION')
		DB:UnregisterEvent('QUEST_LOG_UPDATE')
		DB:UnregisterEvent('ZONE_CHANGED')
		DB:UnregisterEvent('ZONE_CHANGED_NEW_AREA')

		if E.Retail then
			DB:UnregisterEvent('SUPER_TRACKING_CHANGED')
		end
	end
end

function DB:ExperienceBar()
	local Experience = DB:CreateBar('ElvUI_ExperienceBar', 'Experience', DB.ExperienceBar_Update, DB.ExperienceBar_OnEnter, DB.ExperienceBar_OnClick, {'BOTTOM', E.UIParent, 'BOTTOM', 0, 43})
	Experience.barTexture:SetDrawLayer('ARTWORK', 4)
	DB:CreateBarBubbles(Experience)

	Experience.ShouldHide = function()
		return DB.db.experience.hideAtMaxLevel and not DB:ExperienceBar_ShouldBeVisible()
	end

	local Rested = CreateFrame('StatusBar', 'ElvUI_ExperienceBar_Rested', Experience.holder)
	Rested:SetStatusBarTexture(DB.db.customTexture and LSM:Fetch('statusbar', DB.db.statusbar) or E.media.normTex)
	Rested:EnableMouse(false)
	Rested:SetInside()
	Rested:Hide()
	Rested.barTexture = Rested:GetStatusBarTexture()
	Rested.barTexture:SetDrawLayer('ARTWORK', 3)
	Experience.Rested = Rested

	local Quest = CreateFrame('StatusBar', 'ElvUI_ExperienceBar_Quest', Experience.holder)
	Quest:SetStatusBarTexture(DB.db.customTexture and LSM:Fetch('statusbar', DB.db.statusbar) or E.media.normTex)
	Quest:EnableMouse(false)
	Quest:SetInside()
	Quest:Hide()
	Quest.barTexture = Quest:GetStatusBarTexture()
	Quest.barTexture:SetDrawLayer('ARTWORK', 2)
	Experience.Quest = Quest

	E:CreateMover(Experience.holder, 'ExperienceBarMover', L["Experience Bar"], nil, nil, nil, nil, nil, 'databars,experience')

	DB:RegisterEvent('UPDATE_EXPANSION_LEVEL', 'ExperienceBar_Toggle')
	DB:RegisterEvent('DISABLE_XP_GAIN', 'ExperienceBar_Toggle')
	DB:RegisterEvent('ENABLE_XP_GAIN', 'ExperienceBar_Toggle')
	DB:ExperienceBar_Toggle()
end

function DB:RegisterCustomQuestXPWatcher(name, func)
	if not name or not func or type(name) ~= "string" or type(func) ~= "function" then
		error("Usage: DB:RegisterCustomQuestXPWatcher(name [string], func [function])")
		return
	end

	DB.CustomQuestXPWatchers = DB.CustomQuestXPWatchers or {}
	DB.CustomQuestXPWatchers[name] = func
end
