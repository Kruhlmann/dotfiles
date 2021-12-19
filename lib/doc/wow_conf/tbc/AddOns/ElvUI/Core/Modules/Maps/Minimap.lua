local E, L, V, P, G = unpack(ElvUI)
local M = E:GetModule('Minimap')
local LSM = E.Libs.LSM

local _G = _G
local mod = mod
local sort = sort
local floor = floor
local pairs = pairs
local tinsert = tinsert
local unpack = unpack
local utf8sub = string.utf8sub

local CloseAllWindows = CloseAllWindows
local CloseMenus = CloseMenus
local CreateFrame = CreateFrame
local GetMinimapZoneText = GetMinimapZoneText
local GetTime = GetTime
local GetZonePVPInfo = GetZonePVPInfo
local InCombatLockdown = InCombatLockdown
local IsAddOnLoaded = IsAddOnLoaded
local IsShiftKeyDown = IsShiftKeyDown
local PlaySound = PlaySound
local ShowUIPanel = ShowUIPanel
local HideUIPanel = HideUIPanel
local ToggleAchievementFrame = ToggleAchievementFrame
local ToggleCharacter = ToggleCharacter
local ToggleCollectionsJournal = ToggleCollectionsJournal
local ToggleFrame = ToggleFrame
local ToggleFriendsFrame = ToggleFriendsFrame
local ToggleGuildFrame = ToggleGuildFrame
local ToggleHelpFrame = ToggleHelpFrame
local ToggleLFGParentFrame = ToggleLFGParentFrame
local ToggleLFDParentFrame = ToggleLFDParentFrame
local ToggleTalentFrame = ToggleTalentFrame
local hooksecurefunc = hooksecurefunc
local MainMenuMicroButton_SetNormal = MainMenuMicroButton_SetNormal
local GarrisonLandingPageMinimapButton_OnClick = GarrisonLandingPageMinimapButton_OnClick

local WorldMapFrame = _G.WorldMapFrame
local Minimap = _G.Minimap

-- GLOBALS: GetMinimapShape

--Create the minimap micro menu
local menuFrame = CreateFrame('Frame', 'MinimapRightClickMenu', E.UIParent)
local menuList = {
	{ text = _G.CHARACTER_BUTTON, func = function() ToggleCharacter('PaperDollFrame') end },
	{ text = _G.SPELLBOOK_ABILITIES_BUTTON, func = function() ToggleFrame(_G.SpellBookFrame) end },
	{ text = _G.CHAT_CHANNELS, func = _G.ToggleChannelFrame },
	{ text = _G.TIMEMANAGER_TITLE, func = function() ToggleFrame(_G.TimeManagerFrame) end },
	{ text = _G.SOCIAL_BUTTON, func = ToggleFriendsFrame },
	{ text = _G.GUILD, func = ToggleGuildFrame },
	{ text = _G.TALENTS_BUTTON, func = ToggleTalentFrame },
}

if not E.Classic then
	tinsert(menuList, { text = _G.LFG_TITLE, func = ToggleLFGParentFrame or ToggleLFDParentFrame })
end

if E.Retail then
	tinsert(menuList, { text = L["Calendar"], func = function() _G.GameTimeFrame:Click() end })
	tinsert(menuList, { text = _G.COLLECTIONS, func = ToggleCollectionsJournal })
	tinsert(menuList, { text = _G.BLIZZARD_STORE, func = function() _G.StoreMicroButton:Click() end })
	tinsert(menuList, { text = _G.ACHIEVEMENT_BUTTON, func = ToggleAchievementFrame })
	tinsert(menuList, { text = _G.GARRISON_TYPE_8_0_LANDING_PAGE_TITLE, func = function() GarrisonLandingPageMinimapButton_OnClick(_G.GarrisonLandingPageMinimapButton) end })
	tinsert(menuList, { text = _G.ENCOUNTER_JOURNAL, func = function() if not IsAddOnLoaded('Blizzard_EncounterJournal') then _G.EncounterJournal_LoadUI() end ToggleFrame(_G.EncounterJournal) end })
else
	tinsert(menuList, { text = _G.QUEST_LOG, func = function() ToggleFrame(_G.QuestLogFrame) end})
end

sort(menuList, function(a, b) if a and b and a.text and b.text then return a.text < b.text end end)

-- want these two on the bottom
tinsert(menuList, { text = _G.MAINMENU_BUTTON,
	func = function()
		if not _G.GameMenuFrame:IsShown() then
			if _G.VideoOptionsFrame:IsShown() then
				_G.VideoOptionsFrameCancel:Click()
			elseif _G.AudioOptionsFrame:IsShown() then
				_G.AudioOptionsFrameCancel:Click()
			elseif _G.InterfaceOptionsFrame:IsShown() then
				_G.InterfaceOptionsFrameCancel:Click()
			end

			CloseMenus()
			CloseAllWindows()
			PlaySound(850) --IG_MAINMENU_OPEN
			ShowUIPanel(_G.GameMenuFrame)
		else
			PlaySound(854) --IG_MAINMENU_QUIT
			HideUIPanel(_G.GameMenuFrame)
			MainMenuMicroButton_SetNormal()
		end
	end
})

tinsert(menuList, { text = _G.HELP_BUTTON, bottom = true, func = ToggleHelpFrame })

function M:HandleGarrisonButton()
	local button = _G.GarrisonLandingPageMinimapButton
	if button then
		local db = E.db.general.minimap.icons.classHall
		local scale, pos = db.scale or 1, db.position or 'BOTTOMLEFT'
		button:ClearAllPoints()
		button:Point(pos, Minimap, pos, db.xOffset or 0, db.yOffset or 0)
		button:SetScale(scale)

		local box = _G.GarrisonLandingPageTutorialBox
		if box then
			box:SetScale(1/scale)
			box:SetClampedToScreen(true)
		end
	end
end

function M:GetLocTextColor()
	local pvpType = GetZonePVPInfo()
	if pvpType == 'arena' then
		return 0.84, 0.03, 0.03
	elseif pvpType == 'friendly' then
		return 0.05, 0.85, 0.03
	elseif pvpType == 'contested' then
		return 0.9, 0.85, 0.05
	elseif pvpType == 'hostile' then
		return 0.84, 0.03, 0.03
	elseif pvpType == 'sanctuary' then
		return 0.035, 0.58, 0.84
	elseif pvpType == 'combat' then
		return 0.84, 0.03, 0.03
	else
		return 0.9, 0.85, 0.05
	end
end

function M:SetupHybridMinimap()
	local MapCanvas = _G.HybridMinimap.MapCanvas
	MapCanvas:SetMaskTexture(E.Media.Textures.White8x8)
	MapCanvas:SetScript('OnMouseWheel', M.Minimap_OnMouseWheel)
	MapCanvas:SetScript('OnMouseDown', M.MapCanvas_OnMouseDown)
	MapCanvas:SetScript('OnMouseUp', E.noop)

	_G.HybridMinimap.CircleMask:StripTextures()
end

function M:HideNonInstancePanels()
	if InCombatLockdown() or not WorldMapFrame:IsShown() then return end
	HideUIPanel(WorldMapFrame)
end

function M:ADDON_LOADED(_, addon)
	if addon == 'Blizzard_TimeManager' then
		_G.TimeManagerClockButton:Kill()
	elseif addon == 'Blizzard_FeedbackUI' then
		_G.FeedbackUIButton:Kill()
	elseif addon == 'Blizzard_HybridMinimap' then
		M:SetupHybridMinimap()
	elseif addon == 'Blizzard_EncounterJournal' then
		-- Since the default non-quest map is full screen, it overrides the showing of the encounter journal
		hooksecurefunc('EJ_HideNonInstancePanels', M.HideNonInstancePanels)
	end
end

function M:CreateMinimapTrackingDropdown()
	local dropdown = CreateFrame('Frame', 'ElvUIMiniMapTrackingDropDown', _G.UIParent, 'UIDropDownMenuTemplate')
	dropdown:SetID(1)
	dropdown:SetClampedToScreen(true)
	dropdown:Hide()

	_G.UIDropDownMenu_Initialize(dropdown, _G.MiniMapTrackingDropDown_Initialize, 'MENU')
	dropdown.noResize = true

	return dropdown
end

function M:Minimap_OnMouseDown(btn)
	menuFrame:Hide()

	if M.TrackingDropdown then
		_G.HideDropDownMenu(1, nil, M.TrackingDropdown)
	end

	local position = self:GetPoint()
	if btn == 'MiddleButton' or (btn == 'RightButton' and IsShiftKeyDown()) then
		if InCombatLockdown() then _G.UIErrorsFrame:AddMessage(E.InfoColor.._G.ERR_NOT_IN_COMBAT) return end
		if position:match('LEFT') then
			E:DropDown(menuList, menuFrame)
		else
			E:DropDown(menuList, menuFrame, -160, 0)
		end
	elseif btn == 'RightButton' and M.TrackingDropdown then
		_G.ToggleDropDownMenu(1, nil, M.TrackingDropdown, 'cursor')
	else
		_G.Minimap_OnClick(self)
	end
end

function M:MapCanvas_OnMouseDown(btn)
	menuFrame:Hide()

	if M.TrackingDropdown then
		_G.HideDropDownMenu(1, nil, M.TrackingDropdown)
	end

	local position = self:GetPoint()
	if btn == 'MiddleButton' or (btn == 'RightButton' and IsShiftKeyDown()) then
		if InCombatLockdown() then _G.UIErrorsFrame:AddMessage(E.InfoColor.._G.ERR_NOT_IN_COMBAT) return end
		if position:match('LEFT') then
			E:DropDown(menuList, menuFrame)
		else
			E:DropDown(menuList, menuFrame, -160, 0)
		end
	elseif btn == 'RightButton' and M.TrackingDropdown then
		_G.ToggleDropDownMenu(1, nil, M.TrackingDropdown, 'cursor')
	end
end

function M:Minimap_OnMouseWheel(d)
	if d > 0 then
		_G.MinimapZoomIn:Click()
	elseif d < 0 then
		_G.MinimapZoomOut:Click()
	end
end

function M:Update_ZoneText()
	if E.db.general.minimap.locationText == 'HIDE' then return end
	Minimap.location:FontTemplate(LSM:Fetch('font', E.db.general.minimap.locationFont), E.db.general.minimap.locationFontSize, E.db.general.minimap.locationFontOutline)
	Minimap.location:SetText(utf8sub(GetMinimapZoneText(), 1, 46))
	Minimap.location:SetTextColor(M:GetLocTextColor())
end

do
	local isResetting
	local function ResetZoom()
		Minimap:SetZoom(0)
		_G.MinimapZoomIn:Enable() --Reset enabled state of buttons
		_G.MinimapZoomOut:Disable()
		isResetting = false
	end

	local function SetupZoomReset()
		if E.db.general.minimap.resetZoom.enable and not isResetting then
			isResetting = true
			E:Delay(E.db.general.minimap.resetZoom.time, ResetZoom)
		end
	end
	hooksecurefunc(Minimap, 'SetZoom', SetupZoomReset)
end

function M:GetIconSettings(button)
	local defaults = P.general.minimap.icons[button]
	local profile = E.db.general.minimap.icons[button]

	return profile.scale or defaults.scale, profile.position or defaults.position, profile.xOffset or defaults.xOffset, profile.yOffset or defaults.yOffset
end

function M:GetQueueStatusButton()
	return _G.QueueStatusMinimapButton or _G.MiniMapLFGFrame
end

function M:UpdateSettings()
	if not E.private.general.minimap.enable then return end

	E.MinimapSize = E.db.general.minimap.size or Minimap:GetWidth()

	local MinimapPanel, MMHolder = _G.MinimapPanel, _G.MMHolder
	MinimapPanel:SetShown(E.db.datatexts.panels.MinimapPanel.enable)

	local mmOffset = E.PixelMode and 1 or 3
	Minimap:ClearAllPoints()
	Minimap:Point('TOPRIGHT', MMHolder, 'TOPRIGHT', -mmOffset, -mmOffset)
	Minimap:Size(E.MinimapSize, E.MinimapSize)

	local mWidth, mHeight = Minimap:GetSize()
	local bWidth, bHeight = E:Scale(E.PixelMode and 2 or 6), E:Scale(E.PixelMode and 2 or 8)
	local panelSize, joinPanel = (MinimapPanel:IsShown() and MinimapPanel:GetHeight()) or E:Scale(E.PixelMode and 1 or -1), E:Scale(1)
	local HEIGHT, WIDTH = mHeight + (panelSize - joinPanel), mWidth
	MMHolder:SetSize(WIDTH + bWidth, HEIGHT + bHeight)

	Minimap.location:Width(E.MinimapSize)
	if E.db.general.minimap.locationText ~= 'SHOW' then
		Minimap.location:Hide()
	else
		Minimap.location:Show()
	end

	M.HandleGarrisonButton()

	_G.MiniMapMailIcon:SetTexture(E.Media.MailIcons[E.db.general.minimap.icons.mail.texture] or E.Media.MailIcons.Mail3)

	local GameTimeFrame = _G.GameTimeFrame
	if GameTimeFrame then
		if E.private.general.minimap.hideCalendar then
			GameTimeFrame:Hide()
		else
			local scale, position, xOffset, yOffset = M:GetIconSettings('calendar')
			GameTimeFrame:ClearAllPoints()
			GameTimeFrame:Point(position, Minimap, xOffset, yOffset)
			GameTimeFrame:SetScale(scale)
			GameTimeFrame:Show()
		end
	end

	local MiniMapMailFrame = _G.MiniMapMailFrame
	if MiniMapMailFrame then
		local scale, position, xOffset, yOffset = M:GetIconSettings('mail')
		MiniMapMailFrame:ClearAllPoints()
		MiniMapMailFrame:Point(position, Minimap, xOffset, yOffset)
		MiniMapMailFrame:SetScale(scale)
	end

	local MiniMapBattlefieldFrame = _G.MiniMapBattlefieldFrame
	if MiniMapBattlefieldFrame then
		local scale, position, xOffset, yOffset = M:GetIconSettings('battlefield')
		MiniMapBattlefieldFrame:ClearAllPoints()
		MiniMapBattlefieldFrame:Point(position, Minimap, xOffset, yOffset)
		MiniMapBattlefieldFrame:SetScale(scale)

		if _G.BattlegroundShine then _G.BattlegroundShine:Hide() end
		if _G.MiniMapBattlefieldBorder then _G.MiniMapBattlefieldBorder:Hide() end
		if _G.MiniMapBattlefieldIcon then _G.MiniMapBattlefieldIcon:SetTexCoord(unpack(E.TexCoords)) end
	end

	local queueStatusButton = M:GetQueueStatusButton()
	if queueStatusButton then
		local scale, position, xOffset, yOffset = M:GetIconSettings('lfgEye')
		queueStatusButton:ClearAllPoints()
		queueStatusButton:Point(position, Minimap, xOffset, yOffset)
		queueStatusButton:SetScale(scale)
	end

	local queueStatusDisplay = M.QueueStatusDisplay
	if queueStatusDisplay then
		local db = E.db.general.minimap.icons.queueStatus
		local _, position, xOffset, yOffset = M:GetIconSettings('queueStatus')
		queueStatusDisplay.text:ClearAllPoints()
		queueStatusDisplay.text:Point(position, Minimap, xOffset, yOffset)
		queueStatusDisplay.text:FontTemplate(LSM:Fetch('font', db.font), db.fontSize, db.fontOutline)

		if not db.enable and queueStatusDisplay.title then
			M:ClearQueueStatus()
		end
	end

	local MiniMapTracking = _G.MiniMapTrackingFrame or _G.MiniMapTracking
	if MiniMapTracking then
		if E.private.general.minimap.hideTracking then
			MiniMapTracking:SetParent(E.HiddenFrame)
		else
			local scale, position, xOffset, yOffset = M:GetIconSettings('tracking')

			MiniMapTracking:ClearAllPoints()
			MiniMapTracking:Point(position, Minimap, xOffset, yOffset)
			MiniMapTracking:SetScale(scale)
			MiniMapTracking:SetParent(Minimap)

			if _G.MiniMapTrackingBorder then
				_G.MiniMapTrackingBorder:Hide()
			end

			if _G.MiniMapTrackingBackground then
				_G.MiniMapTrackingBackground:Hide()
			end

			if _G.MiniMapTrackingIcon then
				_G.MiniMapTrackingIcon:SetDrawLayer('ARTWORK')
				_G.MiniMapTrackingIcon:SetTexCoord(unpack(E.TexCoords))
				_G.MiniMapTrackingIcon:SetInside()
			end
		end
	end

	local MiniMapInstanceDifficulty = _G.MiniMapInstanceDifficulty
	local GuildInstanceDifficulty = _G.GuildInstanceDifficulty
	if MiniMapInstanceDifficulty and GuildInstanceDifficulty then
		local scale, position, xOffset, yOffset = M:GetIconSettings('difficulty')
		MiniMapInstanceDifficulty:ClearAllPoints()
		MiniMapInstanceDifficulty:Point(position, Minimap, xOffset, yOffset)
		MiniMapInstanceDifficulty:SetScale(scale)
		GuildInstanceDifficulty:ClearAllPoints()
		GuildInstanceDifficulty:Point(position, Minimap, xOffset, yOffset)
		GuildInstanceDifficulty:SetScale(scale)
	end

	local MiniMapChallengeMode = _G.MiniMapChallengeMode
	if MiniMapChallengeMode then
		local scale, position, xOffset, yOffset = M:GetIconSettings('challengeMode')
		MiniMapChallengeMode:ClearAllPoints()
		MiniMapChallengeMode:Point(position, Minimap, xOffset, yOffset)
		MiniMapChallengeMode:SetScale(scale)
	end
end

local function MinimapPostDrag()
	_G.MinimapBackdrop:ClearAllPoints()
	_G.MinimapBackdrop:SetAllPoints(_G.Minimap)
end

function M:GetMinimapShape()
	return 'SQUARE'
end

function M:SetGetMinimapShape()
	GetMinimapShape = M.GetMinimapShape

	Minimap:Size(E.db.general.minimap.size)
end

function M:QueueStatusTimeFormat(seconds)
	local hours = floor(mod(seconds,86400)/3600)
	if hours > 0 then return M.QueueStatusDisplay.text:SetFormattedText('%dh', hours) end

	local mins = floor(mod(seconds,3600)/60)
	if mins > 0 then return M.QueueStatusDisplay.text:SetFormattedText('%dm', mins) end

	local secs = mod(seconds,60)
	if secs > 0 then return M.QueueStatusDisplay.text:SetFormattedText('%ds', secs) end
end

function M:QueueStatusSetTime(seconds)
	local timeInQueue = GetTime() - seconds
	M:QueueStatusTimeFormat(timeInQueue)

	local wait = M.QueueStatusDisplay.averageWait
	local waitTime = wait and wait > 0 and (timeInQueue / wait)
	if not waitTime or waitTime >= 1 then
		M.QueueStatusDisplay.text:SetTextColor(1, 1, 1)
	else
		M.QueueStatusDisplay.text:SetTextColor(E:ColorGradient(waitTime, 1,.1,.1, 1,1,.1, .1,1,.1))
	end
end

function M:QueueStatusOnUpdate(elapsed)
	-- Replicate QueueStatusEntry_OnUpdate throttle
	self.updateThrottle = self.updateThrottle - elapsed
	if self.updateThrottle <= 0 then
		M:QueueStatusSetTime(self.queuedTime)
		self.updateThrottle = 0.1
	end
end

function M:SetFullQueueStatus(title, queuedTime, averageWait)
	local db = E.db.general.minimap.icons.queueStatus
	if not db or not db.enable then return end

	local display = M.QueueStatusDisplay
	if not display.title or display.title == title then
		if queuedTime then
			display.title = title
			display.updateThrottle = 0
			display.queuedTime = queuedTime
			display.averageWait = averageWait
			display:SetScript('OnUpdate', M.QueueStatusOnUpdate)
		else
			M:ClearQueueStatus()
		end
	end
end

function M:SetMinimalQueueStatus(title)
	if M.QueueStatusDisplay.title == title then
		M:ClearQueueStatus()
	end
end

function M:ClearQueueStatus()
	local display = M.QueueStatusDisplay
	display.text:SetText('')
	display.title = nil
	display.queuedTime = nil
	display.averageWait = nil
	display:SetScript('OnUpdate', nil)
end

function M:CreateQueueStatusText()
	local display = CreateFrame('Frame', 'ElvUIQueueStatusDisplay', _G.QueueStatusMinimapButton)
	display.text = display:CreateFontString(nil, 'OVERLAY')

	M.QueueStatusDisplay = display

	_G.QueueStatusMinimapButton:HookScript('OnHide', M.ClearQueueStatus)
	hooksecurefunc('QueueStatusEntry_SetMinimalDisplay', M.SetMinimalQueueStatus)
	hooksecurefunc('QueueStatusEntry_SetFullDisplay', M.SetFullQueueStatus)
end

function M:Initialize()
	if E.private.general.minimap.enable then
		_G.Minimap:SetMaskTexture(E.Retail and 130937 or [[interface\chatframe\chatframebackground]])
	else
		_G.Minimap:SetMaskTexture(E.Retail and 186178 or [[textures\minimapmask]])
		return
	end

	self.Initialized = true

	menuFrame:SetTemplate('Transparent')

	local mmholder = CreateFrame('Frame', 'MMHolder', Minimap)
	mmholder:Point('TOPRIGHT', E.UIParent, 'TOPRIGHT', -3, -3)
	mmholder:Size(Minimap:GetSize())

	Minimap:CreateBackdrop()
	Minimap:SetFrameLevel(Minimap:GetFrameLevel() + 2)
	Minimap:ClearAllPoints()
	Minimap:Point('TOPRIGHT', mmholder, 'TOPRIGHT', -E.Border, -E.Border)
	Minimap:HookScript('OnEnter', function(mm) if E.db.general.minimap.locationText == 'MOUSEOVER' then mm.location:Show() end end)
	Minimap:HookScript('OnLeave', function(mm) if E.db.general.minimap.locationText == 'MOUSEOVER' then mm.location:Hide() end end)

	if Minimap.backdrop then -- level to hybrid maps fixed values
		Minimap.backdrop:SetFrameLevel(99)
		Minimap.backdrop:SetFrameStrata('BACKGROUND')
	end

	Minimap.location = Minimap:CreateFontString(nil, 'OVERLAY')
	Minimap.location:FontTemplate(nil, nil, 'OUTLINE')
	Minimap.location:Point('TOP', Minimap, 'TOP', 0, -2)
	Minimap.location:SetJustifyH('CENTER')
	Minimap.location:SetJustifyV('MIDDLE')
	if E.db.general.minimap.locationText ~= 'SHOW' then
		Minimap.location:Hide()
	end

	local frames = {
		_G.MinimapBorder,
		_G.MinimapBorderTop,
		_G.MinimapZoomIn,
		_G.MinimapZoomOut,
		_G.MinimapNorthTag,
		_G.MinimapZoneTextButton,
		_G.MiniMapWorldMapButton,
		_G.MiniMapMailBorder
	}

	if E.Retail then
		tinsert(frames, _G.MiniMapTracking)
	else
		tinsert(frames, _G.MinimapToggleButton)
	end

	for _, frame in pairs(frames) do
		frame:Kill()
	end

	if E.Retail then
		-- Every GarrisonLandingPageMinimapButton_UpdateIcon() call reanchor the button
		hooksecurefunc('GarrisonLandingPageMinimapButton_UpdateIcon', M.HandleGarrisonButton)

		--Hide the BlopRing on Minimap
		Minimap:SetArchBlobRingAlpha(0)
		Minimap:SetArchBlobRingScalar(0)
		Minimap:SetQuestBlobRingAlpha(0)
		Minimap:SetQuestBlobRingScalar(0)

		if E.private.general.minimap.hideClassHallReport then
			_G.GarrisonLandingPageMinimapButton:Kill()
			_G.GarrisonLandingPageMinimapButton.IsShown = function() return true end
		end

		_G.QueueStatusFrame:SetClampedToScreen(true)
		_G.MiniMapInstanceDifficulty:SetParent(Minimap)
		_G.GuildInstanceDifficulty:SetParent(Minimap)
		_G.MiniMapChallengeMode:SetParent(Minimap)
	end

	if not E.Classic then
		--Create the new minimap tracking dropdown frame and initialize it
		M.TrackingDropdown = M:CreateMinimapTrackingDropdown()
	end

	if _G.QueueStatusMinimapButton then
		_G.QueueStatusMinimapButtonBorder:Hide()
		M:CreateQueueStatusText()
	elseif _G.MiniMapLFGFrame then
		_G.MiniMapLFGBorder:Hide()
	end

	if _G.TimeManagerClockButton then _G.TimeManagerClockButton:Kill() end
	if _G.FeedbackUIButton then _G.FeedbackUIButton:Kill() end
	if _G.HybridMinimap then M:SetupHybridMinimap() end

	E:CreateMover(_G.MMHolder, 'MinimapMover', L["Minimap"], nil, nil, MinimapPostDrag, nil, nil, 'maps,minimap')

	_G.MinimapCluster:EnableMouse(false)
	Minimap:EnableMouseWheel(true)
	Minimap:SetScript('OnMouseWheel', M.Minimap_OnMouseWheel)
	Minimap:SetScript('OnMouseDown', M.Minimap_OnMouseDown)
	Minimap:SetScript('OnMouseUp', E.noop)

	self:RegisterEvent('PLAYER_ENTERING_WORLD', 'Update_ZoneText')
	self:RegisterEvent('ZONE_CHANGED_NEW_AREA', 'Update_ZoneText')
	self:RegisterEvent('ZONE_CHANGED_INDOORS', 'Update_ZoneText')
	self:RegisterEvent('ZONE_CHANGED', 'Update_ZoneText')
	self:RegisterEvent('ADDON_LOADED')
	self:UpdateSettings()
end

E:RegisterModule(M:GetName())
