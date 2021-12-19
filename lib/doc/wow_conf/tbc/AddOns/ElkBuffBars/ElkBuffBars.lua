local ELKBUFFBARS, private = ...

------------------------------------------------------------------------
-- Libraries:

local ACCommand		= LibStub("AceConfigCmd-3.0")
local ACDialog		= LibStub("AceConfigDialog-3.0")
local LDBIcon		= LibStub("LibDBIcon-1.0")
local LibQTip		= LibStub("LibQTip-1.0")
local LSM			= LibStub("LibSharedMedia-3.0")

local LSM_font			= LSM:HashTable("font")
local LSM_statusbar		= LSM:HashTable("statusbar")

------------------------------------------------------------------------
-- Upvalues:

local ipairs				= ipairs
local next					= next
local pairs					= pairs
local select				= select
local tonumber				= tonumber
local tostring				= tostring
local type					= type
local unpack				= unpack

local math_abs				= math.abs

local string_find			= string.find
local string_gmatch			= string.gmatch
local string_gsub			= string.gsub
local string_match			= string.match
local string_trim			= string.trim
local string_utf8sub		= string.utf8sub

local table_concat			= table.concat
local table_insert			= table.insert
local table_remove			= table.remove
local table_sort			= table.sort
local table_wipe			= table.wipe

local GetInventoryItemLink		= GetInventoryItemLink
local GetInventoryItemTexture	= GetInventoryItemTexture
local GetInventorySlotInfo		= GetInventorySlotInfo
local GetItemInfo				= GetItemInfo
local GetWeaponEnchantInfo		= GetWeaponEnchantInfo
local UnitAura					= UnitAura

------------------------------------------------------------------------
-- Localization:

local L = LibStub("AceLocale-3.0"):GetLocale(ELKBUFFBARS)

------------------------------------------------------------------------
-- Addon:

local ElkBuffBars = LibStub("AceAddon-3.0"):NewAddon(ELKBUFFBARS, "AceBucket-3.0", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")
_G.ElkBuffBars = ElkBuffBars
private.addon = ElkBuffBars
-- @Phanx: TODO: is AceConsole needed?

-- ElkBuffBars.debugFrame = ChatFrame4
-- ElkBuffBars:SetDebugging(true)

function ElkBuffBars:AddDefaultBargroups()
	table_insert(self.db.profile.bargroups, {
		bars = {
			barcolor			= {0.3, 0.5, 1, 0.8},							-- <color set>
			barbgcolor			= {0, 0.5, 1, 0.3},								-- <color set>
		},
		filter = {
			type = {
				BUFF = true,
			}
		},
		configmode = true,						-- true, false
		anchortext = "BUFFS",					-- <string>
		anchorshown = false,					-- true, false
	})
	table_insert(self.db.profile.bargroups, {
		bars = {
			barcolor			= {1, 0, 0, 0.8},								-- <color set>
			barbgcolor			= {1, 0, 0, 0.3},								-- <color set>
		},
		filter = {
			type = {
				DEBUFF = true,
			}
		},
		configmode = false,						-- true, false
		anchortext = "DEBUFFS",					-- <string>
		anchorshown = false,					-- true, false
		stickto = 1,							-- bargroup id
		stickside = "",							-- "LEFT", "RIGHT", ""
	})
	table_insert(self.db.profile.bargroups, {
		bars = {
			barcolor			= {0.5, 0, 0.5, 0.8},							-- <color set>
			barbgcolor			= {0.5, 0, 0.5, 0.3},							-- <color set>
		},
		filter = {
			type = {
				TENCH = true,
			}
		},
		configmode = false,						-- true, false
		anchortext = "TENCH",					-- <string>
		anchorshown = false,					-- true, false
		stickto = 2,							-- bargroup id
		stickside = "",							-- "LEFT", "RIGHT", ""
	})
end

local STICKTO_AREA = 25

local TENCH_INVENTORYSLOT = {
	[1] = GetInventorySlotInfo("MainHandSlot"),
	[2] = GetInventorySlotInfo("SecondaryHandSlot"),
}
if WOW_PROJECT_ID == WOW_PROJECT_CLASSIC or WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
	TENCH_INVENTORYSLOT[3] = GetInventorySlotInfo("RangedSlot")
end

local scan_happened = {}

local AO_buffsettings
local AO_groupsettings

do
	local jointable = {}
	ElkBuffBars.ShortName = setmetatable({}, { __index = function(self, key)
		local name = key
		name = string_gsub(name, "%b()", "")
		name = string_gsub(name, "([%-%:%?%!])", " %1 ")
		for word in string_gmatch(name, "([^ ]+)") do
			jointable[#jointable + 1] = string_utf8sub(word, 1, 1)
		end
		local shortname = table_concat(jointable)
		table_wipe(jointable)
		self[key] = shortname
		return shortname
	end })
end

------------------------------------------------------------------------
-- Broker icon

local function do_OnEnter(frame)
	local tooltip = LibQTip:Acquire(ELKBUFFBARS)
	tooltip:SmartAnchorTo(frame)
	tooltip:SetAutoHideDelay(0.1, frame)
	tooltip:EnableMouse(true)
	ElkBuffBars:UpdateTooltip()
	tooltip:Show()
end

local function do_OnLeave()
	-- empty dummy
end

local function do_OnClick(frame, button)
	if button == "RightButton" then
		ElkBuffBars:ToggleOptionsWindow()
	else
		if not ElkBuffBars.bargroups[1] then return end -- @Phanx: probably unnecessary but better safe than sorry
		local enable = not ElkBuffBars.bargroups[1].layout.configmode
		for _, bg in ipairs(ElkBuffBars.bargroups) do
			bg:ToggleConfigMode(enable)
		end
		ElkBuffBars:UpdateTooltip()
	end
end

local function tooltip_line_OnMouseUp(frame, groupIndex, button)
	ElkBuffBars.bargroups[groupIndex]:ToggleConfigMode()
	ElkBuffBars:UpdateTooltip()
end

function ElkBuffBars:UpdateTooltip()
	if not LibQTip:IsAcquired(ELKBUFFBARS) then
		return
	end
	local tooltip = LibQTip:Acquire(ELKBUFFBARS)
	tooltip:Clear()
	tooltip:SetColumnLayout(2,"LEFT", "RIGHT")

	local line = tooltip:AddHeader()
	tooltip:SetCell(line, 1, "|cfffed100Elk|cffffffffBuffBars", nil, "CENTER", 2)
	line = tooltip:AddLine()
	tooltip:SetCell(line, 1, L["TOOLTIP_BARGROUP"])
	tooltip:SetCell(line, 2, L["TOOLTIP_TYPE"])
	line = tooltip:AddSeparator()

	for i, group in ipairs(ElkBuffBars.bargroups) do
		line = tooltip:AddLine()
		tooltip:SetCell(line, 1, format("%s%d. %s", group.layout.configmode and "|cfffed100" or "|cffffffff", i, group.layout.anchortext or UNKNOWN))
		tooltip:SetCell(line, 2, group.layout.target)
		tooltip:SetLineScript(line, "OnMouseUp", tooltip_line_OnMouseUp, i)
	end

	line = tooltip:AddSeparator()
	line = tooltip:AddLine()
	tooltip:SetCell(line, 1, "|cfffed100"..L["TOOLTIP_CLICK_CONFIGMODE"], nil, nil, 2)
	line = tooltip:AddLine()
	tooltip:SetCell(line, 1, "|cfffed100"..L["TOOLTIP_RIGHTCLICK_OPTIONS"], nil, nil, 2)

	tooltip:UpdateScrolling()
end

-- -----

function ElkBuffBars:OnInitialize()
	self.dataObject = LibStub("LibDataBroker-1.1"):NewDataObject(ELKBUFFBARS, {
		type = "launcher",
		icon = "Interface\\AddOns\\"..ELKBUFFBARS.."\\icon", -- icon by Jakobud @ wowace forums
		label = GetAddOnMetadata(ELKBUFFBARS, "Title"),
		OnEnter = do_OnEnter,
		OnLeave = do_OnLeave,
		OnClick = do_OnClick,
	})

	self.db = LibStub("AceDB-3.0"):New("ElkBuffBarsDB", {
		profile = {
			bargroups = {},
			groupspacing = 10,
			hidebuffframe = true,
			hidetenchframe = true,
			hidetrackingframe = false,
			nameoverride = {
				BUFF = {},
				DEBUFF = {},
				TENCH = {},
				TRACKING = {},
			},
			typeoverride = {
				BUFF = {},
				DEBUFF = {},
				TENCH = {},
				TRACKING = {},
			},
			minimap = {}, -- for LibDBIcon-1.0
		},
		global = {
			maxtimes = {
				BUFF = {},
				DEBUFF = {},
				TENCH = {},
			},
			maxcharges = {
				BUFF = {},
				DEBUFF = {},
				TENCH = {},
			}
		},
	}, true) -- true = defaults to "Default" profile as is good and proper

	-- Clear out old data
	local build = select(2, GetBuildInfo())
	if true or not self.db.global.build or self.db.global.build ~= build then
		self.db.global.build = build
		for _, t in pairs(self.db.global.maxtimes) do table_wipe(t) end
		for _, t in pairs(self.db.global.maxcharges) do table_wipe(t) end
	end

	-- Register for profile related callbacks
	self.db.RegisterCallback(self, "OnProfileChanged", "OnProfileEnable")
	self.db.RegisterCallback(self, "OnProfileCopied", "OnProfileEnable")
	self.db.RegisterCallback(self, "OnProfileReset", "OnProfileEnable")
	self.db.RegisterCallback(self, "OnProfileShutdown", "OnProfileDisable")

	-- Generate options table
	self.options = self:GetOptions()
	AO_buffsettings = self.options.args.buffsettings
	AO_groupsettings = self.options.args.groupsettings.args

	-- Add profile options
	self.options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	self.options.args.profile.order = -1 -- show it last

		-- Add dual spec support
	local LibDualSpec = LibStub("LibDualSpec-1.0", true)
	if LibDualSpec then
		LibDualSpec:EnhanceDatabase(self.db, ELKBUFFBARS)
		LibDualSpec:EnhanceOptions(self.options.args.profile, self.db)
	end

	-- Register with AceConfig
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(ELKBUFFBARS, self.options)

	-- Register with LibDBIcon
	LDBIcon:Register(ELKBUFFBARS, self.dataObject, self.db.profile.minimap)

	-- Register a slash command
	self:RegisterChatCommand("ebb", function(input)
		if not input or string_trim(input) == "" or strlower(string_trim(input)) == "config" then
			self:ToggleOptionsWindow()
		else
			ACCommand.HandleCommand(self, "ebb", ELKBUFFBARS, input)
		end
	end)
end

function ElkBuffBars:OnEnable()
	self:OnProfileEnable()

	-- register events
	self:RegisterEvent("PLAYER_ENTERING_WORLD")

	self:RegisterEvent("PLAYER_REGEN_DISABLED")
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
--~ 	if not InCombatLockdown() then
--~ 		self:PLAYER_REGEN_ENABLED()
--~ 	end

	self.bucket_PLAYER_TARGET_CHANGED = self:RegisterBucketEvent("PLAYER_TARGET_CHANGED", .1)
	self.bucket_UNIT_PET = self:RegisterBucketEvent("UNIT_PET", .1)
	self.bucket_UNIT_AURA = self:RegisterBucketEvent("UNIT_AURA", .1)

	self:RegisterEvent("UNIT_INVENTORY_CHANGED")

	if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE or WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
		self.bucket_PLAYER_FOCUS_CHANGED = self:RegisterBucketEvent("PLAYER_FOCUS_CHANGED", .1) or nil

		self:RegisterEvent("UNIT_ENTERED_VEHICLE")
		self:RegisterEvent("UNIT_EXITED_VEHICLE")

		-- events for visibility during pet battles
		self:RegisterEvent("PET_BATTLE_OPENING_START")
		self:RegisterEvent("PET_BATTLE_CLOSE")
	end

--	self.timer_UpdateGroups = self:ScheduleRepeatingTimer("UpdateGroups", .5)

	LSM.RegisterCallback(self, "LibSharedMedia_Registered", "LibSharedMedia_Update")
	LSM.RegisterCallback(self, "LibSharedMedia_SetGlobal", "LibSharedMedia_Update")
	--
	self:ScanData_UnitAura("player", "BUFF")
	self:ScanData_UnitAura("player", "DEBUFF")
	self:ScanData_TENCH_Launcher()
	self:ScanData_TRACKING()

	-- hide Blizzard frames
	self:PLAYER_ENTERING_WORLD()
end

function ElkBuffBars:PLAYER_REGEN_DISABLED()
	for k, v in pairs(self.bargroups) do
		-- remove SecureActionButtons as they can't be moved with the frames in combat
		v:RecycleSABs()
	end
end

function ElkBuffBars:PLAYER_REGEN_ENABLED()
	for k, v in pairs(self.bargroups) do
		-- update bars to recreate the SecureActionButtons
		v:UpdateBars()
	end
end

function ElkBuffBars:PET_BATTLE_OPENING_START()
	for k, v in pairs(self.bargroups) do
		v:GetContainer():Hide()
	end
end

function ElkBuffBars:PET_BATTLE_CLOSE()
	for k, v in pairs(self.bargroups) do
		v:GetContainer():Show()
	end
end

function ElkBuffBars:OnDisable()
	self:OnProfileDisable()
	self:ClearAllData()
end

function ElkBuffBars:OnProfileEnable()
	-- update minimap icon
	LDBIcon:Refresh(ELKBUFFBARS, self.db.profile.minimap)
	-- add default bargroups
	if #self.db.profile.bargroups == 0 then
		self:AddDefaultBargroups()
	end
	-- check bargroups
	self:CheckLayouts()
	-- update known names
	self:UpdateKnownNames()
	-- create bargroups based on stored settings
	self:CreateBarGroups()
end

function ElkBuffBars:OnProfileDisable()
	-- recycle all bargroups
	self:RemoveBarGroups()
end

-- refresh layouts when new media is set
function ElkBuffBars:LibSharedMedia_Update(callback, mediatype, handle)
	if mediatype == "font" or mediatype == "statusbar" then
		for k, v in pairs(self.bargroups) do
			v:SetLayout()
		end
	end
end

function ElkBuffBars:PLAYER_ENTERING_WORLD()
	self:HandleFrame_Blizzard_BuffFrame(self.db.profile.hidebuffframe)
	self:HandleFrame_Blizzard_TemporaryEnchantFrame(self.db.profile.hidetenchframe)
	self:HandleFrame_Blizzard_MiniMapTracking(self.db.profile.hidetrackingframe)
	self:DoFullUpdate()
end

local hidden_blizzard_frames = {}

function ElkBuffBars:HandleFrame_Blizzard_BuffFrame(hide)
	if hide then
		BuffFrame:UnregisterEvent("UNIT_AURA")
		BuffFrame:Hide()
		hidden_blizzard_frames["BuffFrame"] = true
	elseif hidden_blizzard_frames["BuffFrame"] then
		BuffFrame:RegisterEvent("UNIT_AURA")
		BuffFrame:Show()
		BuffFrame_Update()
		hidden_blizzard_frames["BuffFrame"] = nil
	end
end

function ElkBuffBars:HandleFrame_Blizzard_TemporaryEnchantFrame(hide)
	if hide then
		TemporaryEnchantFrame:Hide()
		hidden_blizzard_frames["TemporaryEnchantFrame"] = true
	elseif hidden_blizzard_frames["TemporaryEnchantFrame"] then
		TemporaryEnchantFrame:Show()
		hidden_blizzard_frames["TemporaryEnchantFrame"] = nil
	end
end

if WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then
	function ElkBuffBars:HandleFrame_Blizzard_MiniMapTracking(hide)
		if hide then
			MiniMapTrackingFrame:UnregisterEvent("UNIT_AURA")
			MiniMapTrackingFrame:Hide()
			hidden_blizzard_frames["MiniMapTracking"] = true
		elseif hidden_blizzard_frames["MiniMapTracking"] then
			MiniMapTrackingFrame:RegisterEvent("UNIT_AURA")
			MiniMapTrackingFrame:Show()
			hidden_blizzard_frames["MiniMapTracking"] = nil
		end
	end
elseif WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
	function ElkBuffBars:HandleFrame_Blizzard_MiniMapTracking(hide)
		if hide then
			MiniMapTracking:Hide()
			hidden_blizzard_frames["MiniMapTracking"] = true
		elseif hidden_blizzard_frames["MiniMapTracking"] then
			MiniMapTracking:Show()
			hidden_blizzard_frames["MiniMapTracking"] = nil
		end
	end
else
	function ElkBuffBars:HandleFrame_Blizzard_MiniMapTracking(hide)
		if hide then
	--~ 		MiniMapTracking:UnregisterEvent("MINIMAP_UPDATE_TRACKING")
			MiniMapTracking:Hide()
			MiniMapTrackingButton:Hide()
			hidden_blizzard_frames["MiniMapTracking"] = true
		elseif hidden_blizzard_frames["MiniMapTracking"] then
	--~ 		MiniMapTracking:RegisterEvent("MINIMAP_UPDATE_TRACKING")
			MiniMapTracking:Show()
			MiniMapTrackingButton:Show()
	--~ 		MiniMapTracking_Update()
			hidden_blizzard_frames["MiniMapTracking"] = nil
		end
	end
end

------------------------------------------------------------------------
-- Cache bars

local barcache = {}

function ElkBuffBars:GetBar()
	if #barcache > 0 then
		return table_remove(barcache, #barcache)
	else
		return self:NewBar() -- see EBB_Bar.lua
	end
end

function ElkBuffBars:RecycleBar(bar)
	bar:Reset()
	table_insert(barcache, bar)
end

------------------------------------------------------------------------
-- Cache bar groups

local bargroupcache = {}

function ElkBuffBars:GetBarGroup()
	if #bargroupcache > 0 then
		return table_remove(bargroupcache, #bargroupcache)
	else
		return self:NewBarGroup() -- see EBB_BarGroup.lua
	end
end

function ElkBuffBars:RecycleBarGroup(bargroup)
	bargroup:Reset()
	table_insert(bargroupcache, bargroup)
end

------------------------------------------------------------------------
-- Cache datatables

local datatablecache = {}

local function GetDataTable()
	if #datatablecache > 0 then
		return table_remove(datatablecache, #datatablecache)
	else
		return {}
	end
end

local function RecycleDataTable(dt)
	table_insert(datatablecache, dt)
end

------------------------------------------------------------------------
-- Cache SecureActionButton

local cache_SAB = {}

local SAB_OnLeftClick = function(self, unit, button) local bar = self:GetAttribute("_bar"); bar.OnClick(bar, button) end
local SAB_OnRightClickTracking = function(self, unit, button)
	if WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then
		CancelTrackingBuff()
	end
end
local SAB_OnEnter = function(self) local bar = self:GetAttribute("_bar"); bar.OnEnter(bar) end
local SAB_OnLeave = function(self) local bar = self:GetAttribute("_bar"); bar.OnLeave(bar) end

function ElkBuffBars:GetSAB()
	if #cache_SAB > 0 then
		return table_remove(cache_SAB, #cache_SAB)
	else
		local button = CreateFrame("Button", nil, UIParent, "SecureActionButtonTemplate")
		button:RegisterForClicks("LeftButtonDown", "RightButtonDown")
		button:SetAttribute("unit", nil)
		button:SetAttribute("*type1", "OnLeftClick")
		button:SetAttribute("_OnLeftClick", SAB_OnLeftClick)
		button:SetAttribute("*type2", "cancelaura")
		button:SetAttribute("_OnRightClickTracking", SAB_OnRightClickTracking)
		button:SetAttribute("*index2", nil)
--~ 		button:SetAttribute("*spell2", nil)
		button:SetAttribute("*target-slot2", nil)
		button:SetScript("OnEnter", SAB_OnEnter)
		button:SetScript("OnLeave", SAB_OnLeave)
		return button
	end
end

function ElkBuffBars:RecycleSAB(button)
	button:ClearAllPoints()
	button:Hide()
	table_insert(cache_SAB, button)
end

------------------------------------------------------------------------
-- Keep track of known buff, debuff, and temp enchant names

ElkBuffBars.knownnames = {
	BUFF = {},
	DEBUFF = {},
	TENCH = {},
	TRACKING = {},
}

local knownnames_validate = {
	BUFF = {},
	DEBUFF = {},
	TENCH = {},
	TRACKING = {},
}


function ElkBuffBars:AddKnownName(auratype, name)
	if self.knownnames[auratype] and not self.knownnames[auratype][name] then
		self.knownnames[auratype][name] = true
		AO_buffsettings.args[auratype].args[name] = self:GetNameOptions(auratype, name)
		table_insert(knownnames_validate[auratype], name)
		table_sort(knownnames_validate[auratype])
	end
end

function ElkBuffBars:UpdateKnownNames()
	for auratype, data in pairs(self.db.profile.nameoverride) do
		for name in pairs(data) do
			self:AddKnownName(auratype, name)
		end
	end
	for auratype, data in pairs(self.db.profile.typeoverride) do
		for name in pairs(data) do
			self:AddKnownName(auratype, name)
		end
	end
	for id, bg in pairs(self.db.profile.bargroups) do
		if bg.filter.names_include then
			for auratype, data in pairs(bg.filter.names_include) do
				for name in pairs(data) do
					self:AddKnownName(auratype, name)
				end
			end
		end
		if bg.filter.names_exclude then
			for auratype, data in pairs(bg.filter.names_exclude) do
				for name in pairs(data) do
					self:AddKnownName(auratype, name)
				end
			end
		end
	end
end

------------------------------------------------------------------------
-- Bar group management

ElkBuffBars.bargroups = {}

local function ApplyDefaults(defaults, data)
	for k, v in pairs(defaults) do
		if type(v) == "table" then
			if data[k] == nil or type(data[k]) ~= "table" then data[k] = {} end
			ApplyDefaults(v, data[k])
		else
			if data[k] == nil then data[k] = v end
		end
	end
end

local DEFAULT_LAYOUT = {
	bars = {
		icon				= "LEFT",				-- "LEFT", "RIGHT", false
		iconcount			= true,					-- true, false
		iconcountanchor		= "CENTER",				-- <anchor>
		iconcountfont		= "Arial Narrow",		-- <LSM:font>
		iconcountfontsize	= 14,					-- <font size>
		iconcountcolor		= {1, 1, 1, 1},			-- <color set>
		bar					= true,					-- true, false
		bgbar				= true,					-- true, false
		bartexture			= "Otravi",				-- <LSM:statusbar>, false
		barright			= false,				-- true, false
		spark				= false,				-- true, false
		textTL				= "NAMERANKCOUNT",		-- false, "NAME", "NAMERANK", "NAMECOUNT", "NAMERANKCOUNT", "RANK", "COUNT", "TIMELEFT", "DEBUFFTYPE"
		textTLfont			= "Friz Quadrata TT",	-- <LSM:font>
		textTLfontsize		= 14,					-- <font size>
		textTLcolor			= {1, 1, 1, 1},			-- <color set>
		textTLstyle			= "",					-- "", OUTLINE, THICKOUTLINE
		textTLalign			= "LEFT",				-- left, center, right
		textTR				= "TIMELEFT",			-- false, "NAME", "NAMERANK", "NAMECOUNT", "NAMERANKCOUNT", "RANK", "COUNT", "TIMELEFT", "DEBUFFTYPE"
		textTRfont			= "Friz Quadrata TT",	-- <LSM:font>
		textTRfontsize		= 14,					-- <font size>
		textTRcolor			= {1, 1, 1, 1},			-- <color set>
		textTRstyle			= "",					-- "", OUTLINE, THICKOUTLINE
		textBL				= false,				-- false, "NAME", "NAMERANK", "NAMECOUNT", "NAMERANKCOUNT", "RANK", "COUNT", "TIMELEFT", "DEBUFFTYPE"
		textBLfont			= "Friz Quadrata TT",	-- <LSM:font>
		textBLfontsize		= 14,					-- <font size>
		textBLcolor			= {1, 1, 1, 1},			-- <color set>
		textBLstyle			= "",					-- "", OUTLINE, THICKOUTLINE
		textBLalign			= "LEFT",				-- left, center, right
		textBR				= false,				-- false, "NAME", "NAMERANK", "NAMECOUNT", "NAMERANKCOUNT", "RANK", "COUNT", "TIMELEFT", "DEBUFFTYPE"
		textBRfont			= "Friz Quadrata TT",	-- <LSM:font>
		textBRfontsize		= 14,					-- <font size>
		textBRcolor			= {1, 1, 1},			-- <color set>
		textBRstyle			= "",					-- "", OUTLINE, THICKOUTLINE
		barcolor			= {0.3, 0.5, 1, 0.8},	-- <color set>
		barbgcolor			= {0, 0.5, 1, 0.3},		-- <color set>
		debufftypecolor		= true,					-- true, false
		timeformat			= "CONDENSED",			-- "DEFAULT", "CLOCK", "CONDENSED"
		timeFraction		= true,					-- true, false
		width				= 250,
		height				= 20,
		tooltipanchor		= "default",			-- <tooltip anchor>, "default"
		tooltipcaster		= true,					-- true, false
		timelessfull		= false,				-- true, false
		padding				= 1,					-- 0 - 10
		abbreviate_name		= 0,					--
	},
	filter = {
		type = {},
	},
	alpha			= 1,							-- alpha value
	scale			= 1,
	sorting			= "timeleft",					-- timeleft, timemax
	target			= "player",						-- player, pet, target
	growup			= false,						-- true, false
	barspacing		= 0,							-- 0+
	configmode		= true,							-- true, false
	anchortext		= "unknown bargroup",			-- <string>
	anchorshown		= false,						-- true, false
}

-- resets corrupt entries in the given layout to default values; returns a now valid layout
function ElkBuffBars:CheckLayout(layout)
	if not layout or type(layout) ~= "table" then layout = {} end
	ApplyDefaults(DEFAULT_LAYOUT, layout)
	if layout.id and layout.stickto == layout.id then layout.stickto = nil end
	return layout
end

function ElkBuffBars:CheckLayouts()
	local bglayouts = self.db.profile.bargroups
	for k, v in ipairs(bglayouts) do
		self:CheckLayout(v)
	end
end

function ElkBuffBars:CreateBarGroups()
	for k, v in pairs(self.bargroups) do
		self:RecycleBarGroup(v)
		self.bargroups[k] = nil
	end

	local bglayouts = self.db.profile.bargroups
	for k, v in ipairs(bglayouts) do
		self:AddBarGroup(v)
	end
	for k, v in ipairs(self.bargroups) do
		local layout = bglayouts[k]
		v:SetPosition()
		v:GetContainer():Show()
	end
end

function ElkBuffBars:RemoveBarGroups()
	for i, v in pairs(self.bargroups) do
		self:RecycleBarGroup(v)
		self.bargroups[i] = nil
		AO_groupsettings[tostring(i)] = nil
	end
end

function ElkBuffBars:AddBarGroup(layout)
	if not layout then
		layout = {
			bars = {
			},
			filter = {
				type = {
					BUFF = true,
				}
			},
			anchortext = "new bargroup",			-- <string>
		}

		table_insert(self.db.profile.bargroups, layout)
	end
	local bargroup = self:GetBarGroup()
	table_insert(self.bargroups, bargroup)
	layout.id = #self.bargroups
	self:CheckLayout(layout)
	bargroup:SetLayout(layout)
	local settingsId = tostring(layout.id)
	if not AO_groupsettings[settingsId] then
		AO_groupsettings[settingsId] = self:GetGroupOptions(layout.id)
	end
	AO_groupsettings[settingsId].disabled = false
	AO_groupsettings[settingsId].hidden = false
	return bargroup
end

function ElkBuffBars:RemoveBarGroup(id)
	local settingsId = tostring(#self.bargroups)
	local bg = table_remove(self.bargroups, id)
	table_remove(self.db.profile.bargroups, id)
	for k, v in pairs(self.bargroups) do
		local layout = v.layout
		layout.id = k
		if layout.stickto then
			if layout.stickto == id then
				-- the group we sticked to was removed
				local container = v:GetContainer()
				layout.stickto = nil
				container:ClearAllPoints()
				container:SetPoint("CENTER", UIParent, "CENTER", layout.x, layout.y)
				v:ToggleConfigMode(true)
			elseif layout.stickto > id then
				layout.stickto = layout.stickto - 1
			end
		end
	end
	AO_groupsettings[settingsId].disabled = true
	AO_groupsettings[settingsId].hidden = true
	self:RecycleBarGroup(bg)
end

function ElkBuffBars:CopyBarLayout(target, source)
	if target == source then return end
	if not source then source = DEFAULT_LAYOUT end
	target.bars = {}
	ApplyDefaults(source.bars, target.bars)
	target.sorting = source.sorting
	self.bargroups[target.id]:SetLayout()
end

-- -----
-- buff scanning
-- -----
ElkBuffBars.buffdata = {
	focus = {},
	pet = {},
	player = {},
	target = {},
	vehicle = {},
}
ElkBuffBars.debuffdata = {
	focus = {},
	pet = {},
	player = {},
	target = {},
	vehicle = {},
}
ElkBuffBars.tenchdata = {}
ElkBuffBars.trackingdata = {}

function ElkBuffBars:ClearAllData()
	for _, data in pairs(self.buffdata) do
		for k, v in pairs(data) do
			RecycleDataTable(v)
			data[k] = nil
		end
	end
	for _, data in pairs(self.debuffdata) do
		for k, v in pairs(data) do
			RecycleDataTable(v)
			data[k] = nil
		end
	end
	for k, v in pairs(self.tenchdata) do
		RecycleDataTable(v)
		self.tenchdata[k] = nil
	end
end

function ElkBuffBars:PLAYER_FOCUS_CHANGED()
	self:ScanData_UnitAura("focus", "BUFF")
	self:ScanData_UnitAura("focus", "DEBUFF")

	self:UpdateGroups()
end

function ElkBuffBars:PLAYER_TARGET_CHANGED()
	self:ScanData_UnitAura("target", "BUFF")
	self:ScanData_UnitAura("target", "DEBUFF")

	self:UpdateGroups()
end

function ElkBuffBars:UNIT_PET(args)
	if args["player"] then
		self:ScanData_UnitAura("pet", "BUFF")
		self:ScanData_UnitAura("pet", "DEBUFF")

		self:UpdateGroups()
	end
end

function ElkBuffBars:UNIT_ENTERED_VEHICLE(event, unit)
	if unit ~= "player" then return end

	self:ScanData_UnitAura("vehicle", "BUFF")
	self:ScanData_UnitAura("vehicle", "DEBUFF")

	self:UpdateGroups()
end

function ElkBuffBars:UNIT_EXITED_VEHICLE(event, unit)
	if unit ~= "player" then return end

	self:ScanData_UnitAura("vehicle", "BUFF")
	self:ScanData_UnitAura("vehicle", "DEBUFF")

	self:UpdateGroups()
end

local watched_unitids = { focus = true, pet = true, player = true, target = true, vehicle = true }
function ElkBuffBars:UNIT_AURA(args)
	for arg in pairs(args) do
		if watched_unitids[arg] then
			self:ScanData_UnitAura(arg, "BUFF")
			self:ScanData_UnitAura(arg, "DEBUFF")
		end
		if arg == "player" then
			self:ScanData_TRACKING()
		end
	end

	self:UpdateGroups()
end

--
local function hasTEnch(...)
	local RETURNS_PER_ITEM = 4
	local numVals = select("#", ...)
	local numItems = numVals / RETURNS_PER_ITEM
	for itemIndex = 1, numItems do
		local hasEnchant = select(RETURNS_PER_ITEM * (itemIndex - 1) + 1, ...)
		if hasEnchant then return true end
	end
	return false
end

local TEnchBuffer = {}
local function refreshTEnchBuffer(...)
	table_wipe(TEnchBuffer)
	for i = 1, select("#", ...) do
		TEnchBuffer[i] = (select(i, ...))
	end
end
local function hasTEnchUpdate(...)
	local RETURNS_PER_ITEM = 4
	local numVals = select("#", ...)
	local numItems = numVals / RETURNS_PER_ITEM
	local changes = false
	for itemIndex = 1, numItems do
		local hasEnchant, enchantExpiration, enchantCharges, enchantId = select(RETURNS_PER_ITEM * (itemIndex - 1) + 1, ...)
		local offset = (itemIndex - 1) * RETURNS_PER_ITEM
		if (hasEnchant ~= TEnchBuffer[offset + 1]) or (enchantExpiration or 0) > (TEnchBuffer[offset + 2] or 0) or (enchantCharges ~= TEnchBuffer[offset + 3]) or (enchantId ~= TEnchBuffer[offset + 4]) then
			changes = true
			break
		end
	end
	if not changes then
		refreshTEnchBuffer(...)
	end
	return changes
end

function ElkBuffBars:UNIT_INVENTORY_CHANGED(event, unit)
	if unit ~= "player" then return end
	self:ScanData_TENCH_Launcher()
end

function ElkBuffBars:ScanData_TENCH_Launcher()
	if hasTEnch(GetWeaponEnchantInfo()) then
		if self.timer_TENCH == nil then
			self.timer_TENCH = self:ScheduleRepeatingTimer("ScanData_TENCH_Worker", .5)
			self:ScanData_TENCH_Worker()
		end
	elseif self.timer_TENCH ~= nil then
		self:CancelTimer(self.timer_TENCH)
		self.timer_TENCH = nil
		self:ScanData_TENCH_Worker()
	end
end

function ElkBuffBars:ScanData_TENCH_Worker()
	if hasTEnchUpdate(GetWeaponEnchantInfo()) then
		self:ScanData_TENCH()
		self:UpdateGroups()
	end
end
--

function ElkBuffBars:ScanData_TENCH()
	self:ScanData_TENCH_Helper(GetWeaponEnchantInfo())
end

function ElkBuffBars:ScanData_TENCH_Helper(...)
	refreshTEnchBuffer(...)
	local maxtimes = self.db.global.maxtimes.TENCH
	local maxcharges = self.db.global.maxcharges.TENCH
	for k, v in pairs(self.tenchdata) do
		RecycleDataTable(v)
		self.tenchdata[k] = nil
	end

	-- see function TemporaryEnchantFrame_Update(...) in FrameXML/BuffFrame.lua
	local value_GetTime = GetTime()
	local RETURNS_PER_ITEM = 4
	local numVals = select("#", ...)
	local numItems = numVals / RETURNS_PER_ITEM
	for itemIndex = 1, numItems do
		local hasEnchant, enchantExpiration, enchantCharges, enchantId = select(RETURNS_PER_ITEM * (itemIndex - 1) + 1, ...)
		if hasEnchant then
			if enchantExpiration then
				enchantExpiration = enchantExpiration / 1000
			end
			local timemax = enchantExpiration or 0

			local id = TENCH_INVENTORYSLOT[itemIndex]
			local name, rank = self:GetTempBuffName(id, enchantId)
			self:AddKnownName("TENCH", name)
	--		if rank then
	--			rank = string_match(rank, PATTERN_RANK)
	--		end
			if maxtimes[enchantId] and timemax < maxtimes[enchantId] then
				timemax = maxtimes[enchantId]
			else
				maxtimes[enchantId] = timemax
			end
			local charges = enchantCharges or 0
			if charges > 1 and (not maxcharges[enchantId] or maxcharges[enchantId] < charges) then
				maxcharges[enchantId] = charges
			end

			local dt = GetDataTable()
			dt.id				= id
			dt.spellid			= enchantId
			dt.name				= self.db.profile.nameoverride.TENCH[name] or name
			dt.realname			= name
			dt.rank				= rank and tonumber(rank) or nil
			dt.type				= self.db.profile.typeoverride.TENCH[name] or "TENCH"
			dt.realtype			= "TENCH"
			dt.debufftype		= nil
			dt.expirytime		= enchantExpiration + value_GetTime
			dt.timemax			= timemax
			dt.timeMod			= 0
			dt.untilcancelled	= nil
			dt.charges			= charges
			dt.maxcharges		= maxcharges[enchantId]
			dt.icon				= GetInventoryItemTexture("player", id)
			dt.ismine			= true
			dt.casterName		= GetUnitName("player", true) or UNKNOWN
			dt.casterClass		= (select(2, UnitClass("player"))) or ""
			dt.canStealOrPurge	= false

			table_insert(self.tenchdata, dt)
		end
	end
	scan_happened.player = true
end

function ElkBuffBars:ScanData_TRACKING()
	for k, v in pairs(self.trackingdata) do
		RecycleDataTable(v)
		self.trackingdata[k] = nil
	end
	if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE or WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC then
		local name = "Tracking"
		self:AddKnownName("TRACKING", name)
		local dt = GetDataTable()
		dt.id				= 1
		dt.spellid			= nil
		dt.name				= self.db.profile.nameoverride.TRACKING[name] or name
		dt.realname			= name
		dt.rank				= nil
		dt.type				= self.db.profile.typeoverride.TRACKING[name] or "TRACKING"
		dt.realtype			= "TRACKING"
		dt.debufftype		= nil
		dt.expirytime		= 0
		dt.timemax			= 0
		dt.timeMod			= 0
		dt.untilcancelled	= true
		dt.charges			= 0
		dt.maxcharges		= nil
		dt.icon				= [[Interface\Minimap\Tracking\None]]
		dt.ismine			= true
		dt.casterName		= GetUnitName("player", true) or UNKNOWN
		dt.casterClass		= (select(2, UnitClass("player"))) or ""
		dt.canStealOrPurge	= false
		table_insert(self.trackingdata, dt)
		return
	end

	local icon = GetTrackingTexture()
	if icon then
		name = self:GetTrackingName()
		self:AddKnownName("TRACKING", name)
		local dt = GetDataTable()
		dt.id				= 1
		dt.spellid			= nil
		dt.name				= self.db.profile.nameoverride.TRACKING[name] or name
		dt.realname			= name
		dt.rank				= nil
		dt.type				= self.db.profile.typeoverride.TRACKING[name] or "TRACKING"
		dt.realtype			= "TRACKING"
		dt.debufftype		= nil
		dt.expirytime		= 0
		dt.timemax			= 0
		dt.timeMod			= 0
		dt.untilcancelled	= true
		dt.charges			= 0
		dt.maxcharges		= nil
		dt.icon				= icon
		dt.ismine			= true
		dt.casterName		= GetUnitName("player", true) or UNKNOWN
		dt.casterClass		= (select(2, UnitClass("player"))) or ""
		dt.canStealOrPurge	= false
		table_insert(self.trackingdata, dt)
	end
	scan_happened.player = true
end


local selfcast = {
	pet = true,
	player = true,
	vehicle = true,
}
function ElkBuffBars:ScanData_UnitAura(unit, auratype)
	local filter = auratype == "DEBUFF" and "HARMFUL" or "HELPFUL"
	local maxcharges = self.db.global.maxcharges[auratype]
	local datatable = auratype == "DEBUFF" and self.debuffdata[unit] or self.buffdata[unit]
	if not datatable then return end
	for k, v in pairs(datatable) do
		RecycleDataTable(v)
		datatable[k] = nil
	end
	local i = 1
	while true do
		--    name, texture, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, nameplateShowPersonal, spellId, canApplyAura, isBossAura, isCastByPlayer, nameplateShowAll, timeMod...
		local name, texture, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, nameplateShowPersonal, spellId, canApplyAura, isBossAura, isCastByPlayer, nameplateShowAll, timeMod = UnitAura(unit, i, filter)
		if not texture then break end
--		print(unit, name, tostring(name.utf8len), tostring(issecure()))
		self:AddKnownName(auratype, name)
		count = count or 0
		if count > 1 and (not maxcharges[name] or maxcharges[name] < count) then
			maxcharges[name] = count
		end

		local dt = GetDataTable()
		dt.id				= i
		dt.spellid			= spellId
		dt.name				= self.db.profile.nameoverride[auratype][name] or name
		dt.realname			= name
		dt.rank				= nil
		dt.type				= (self.db.profile.typeoverride[auratype][name] or auratype)
		dt.realtype			= auratype
		dt.debufftype		= debuffType
		dt.expirytime		= expirationTime
		dt.timemax			= duration or 0
		dt.timeMod			= (timeMod > 0) and timeMod or 0
		dt.untilcancelled	= ((not duration) or duration == 0) and true or nil
		dt.charges			= count
		dt.maxcharges		= maxcharges[name]
		dt.icon				= texture
		dt.ismine			= unitCaster and selfcast[unitCaster] and true or false
		dt.casterName		= unitCaster and GetUnitName(unitCaster, true) or UNKNOWN
		dt.casterClass		= unitCaster and (select(2, UnitClass(unitCaster))) or ""
		dt.canStealOrPurge	= canStealOrPurge

		table_insert(datatable, dt)
		i = i + 1
	end
	scan_happened[unit] = true
end

local roman_to_arabic = setmetatable({I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000}, {__index=function(self, roman)
	local arabic = 0
	local maxval = 0
	for i = roman:len(), 1, -1 do
		local digitval = self[roman:sub(i,i)]
		if digitval < maxval then
			arabic = arabic - digitval
		else
			arabic = arabic + digitval
			maxval = digitval
		end
	end
	self[roman] = arabic
	return arabic
end})

local tooltipScanner = nil
local function getTooltipScanner()
	if tooltipScanner ~= nil then
		return tooltipScanner
	end
	tooltipScanner = CreateFrame("GameTooltip")
	tooltipScanner:SetOwner(UIParent, "ANCHOR_NONE")
	tooltipScanner.textLines = {}
	for i = 1, 30 do
		local left, right = tooltipScanner:CreateFontString(), tooltipScanner:CreateFontString()
		left:SetFontObject(GameFontNormal)
		right:SetFontObject(GameFontNormal)
		tooltipScanner:AddFontStrings(left, right)
		tooltipScanner.textLines[2*i - 1] = left
		tooltipScanner.textLines[2*i] = right
	end

	function tooltipScanner:ClearAll()
		-- reset scanning tooltip
		self:ClearLines()
		for i = 1, 60 do
			self.textLines[i]:SetText()
		end
		if not self:IsOwned(UIParent) then
			 self:SetOwner(UIParent, "ANCHOR_NONE")
		end
	end

	function tooltipScanner:GetEnchantNameForPlayerSlot(slot)
		self:ClearAll()
		self:SetInventoryItem("player", slot)

		for i = 1, 60 do
			local text = self.textLines[i]:GetText()
			if text then
				-- tooltip example: Venomhide Poison (5 min) (15 Charges)
				local match = select(3, string_find(text, "^(.+) %(%d+ [^%)]+%)$")) -- removes 1st bracket (time left / charges)
				if match then
					match = string_gsub(match, " %(%d+ [^%)]+%)", "") -- removes 2nd bracket (time left for buffs with charges)
					return match
				end
			end
		end
		return nil
	end

	function tooltipScanner:GetTrackingName()
		self:ClearAll()
		self:SetTrackingSpell()
		return self.textLines[1]:GetText()
	end

	return tooltipScanner
end

local enchantNameCache = {}
function ElkBuffBars:GetTempBuffName(slot, enchantId)
	local enchantName = enchantNameCache[enchantId]
	if enchantName then return enchantName end

	local scanner = getTooltipScanner()
	enchantName = scanner:GetEnchantNameForPlayerSlot(slot)
	if enchantName then
		enchantName = string_gsub(enchantName, " %(%d+ [^%)]+%)", "") -- removes 2nd bracket (time left for buffs with charges)
		local tname, rank = string_match(enchantName, "^(.*) (%d+)$")
		if tname then
			enchantName = tname
		else
			tname, rank = string_match(enchantName, "^(.*) ([CDILMVX]+)$")
			if tname then
				enchantName = tname
				rank = roman_to_arabic[rank]
			end
		end
		enchantNameCache[enchantId] = enchantName
		return enchantName, rank
	end

	-- fall back to the item's name instead
	local itemlink = GetInventoryItemLink("player", slot)
	if itemlink then
		local name = GetItemInfo(itemlink)
		return name or "Weapon "..slot
	end
	return "Weapon "..slot
end

function ElkBuffBars:GetTrackingName()
	local scanner = getTooltipScanner()
	local name = scanner:GetTrackingName()
	return name or "Tracking..."
end

function ElkBuffBars:DoFullUpdate()
	self:UNIT_AURA(watched_unitids)
	self:ScanData_TENCH()
	self:UpdateGroups()
end

function ElkBuffBars:UpdateGroups()
	-- if we did a scan, poke bar groups for updates
	if next(scan_happened) then
		for _, bg in pairs(self.bargroups) do
			bg:UpdateData(scan_happened)
		end
		table_wipe(scan_happened)
	end
end

function ElkBuffBars:StickGroup(bargroup)
	local layout = bargroup.layout
	local id = layout.id
	local growup = layout.growup
	local container = bargroup:GetContainer()
	local base_y = growup and container:GetBottom() or container:GetTop()
	local base_left = container:GetLeft()
	local base_right = container:GetRight()
	layout.stickto = nil
--	self:Print("Sticking bargroup", id)
	for k, v in pairs(self.bargroups) do
		local comp_container = v:GetContainer()
		local comp_y = growup and comp_container:GetTop() or comp_container:GetBottom() or 0
		if v.layout.id ~= id and math_abs(comp_y - base_y) < STICKTO_AREA then
			-- we are on the same y-area
			local comp_left = comp_container:GetLeft()
			local comp_right = comp_container:GetRight()
			local dist_left = math_abs(base_left - comp_left)
			local dist_mid = math_abs((base_left + base_right) - (comp_left + comp_right)) / 2
			local dist_right = math_abs(base_right - comp_right)
			if dist_left <= STICKTO_AREA or dist_mid <= STICKTO_AREA or dist_right <= STICKTO_AREA then
--				self:Print(" - sticking to bargroup ", k)
				-- we are also on the same x-area
				-- check if we would loop-stick to ourself
				local parent = v
				local hasloop = false
				while parent.layout.stickto do
					if parent.layout.stickto == id then
--						self:Print("   - LOOP FOUND!")
						hasloop = true
						break
					end
					parent = self.bargroups[parent.layout.stickto]
				end
				if not hasloop then
					-- we have found a valid group to stick to
					layout.stickto = k
					local stickdist = STICKTO_AREA
					if dist_mid <= STICKTO_AREA then
--~ 						self:Print("   - SUCCESS! -> middle")
						layout.stickside = ""
						stickdist = dist_mid
					end
					if dist_left <= STICKTO_AREA and dist_left < stickdist then
--~ 						self:Print("   - SUCCESS! -> left")
						layout.stickside = "LEFT"
						stickdist = dist_left
					end
					if dist_right <= STICKTO_AREA and dist_right < stickdist then
--~ 						self:Print("   - SUCCESS! -> right")
						layout.stickside = "RIGHT"
						stickdist = dist_right
--~ 					else
--~ 						self:Print("   - |cffff0000ERROR|r")
					end
					bargroup:SetPosition()
					return true
				end
			end
		end
	end
	return false
end

------------------------------------------------------------------------
-- Options

function ElkBuffBars:GetOptions()
	if self.options then
		return self.options
	end

	self.options = {
		type = "group",
		childGroups = "tab",
		args = {
			general = {
				order = 100,
				type = "group",
				name = GENERAL,
				args = {
					-- 101:
					-- 102:
					newgroup = {
						order = 103,
						type = "execute",
						name = L["OPTIONS_NEWGROUP_NAME"],
						desc = L["OPTIONS_NEWGROUP_DESC"],
						func = function()
							local bg = ElkBuffBars:AddBarGroup()
							bg:SetPosition()
							bg:GetContainer():Show()
						end,
					},
					groupspacing = {
						order = 104,
						type = "range",
						name = L["OPTIONS_GROUPSPACING_NAME"],
						desc = L["OPTIONS_GROUPSPACING_DESC"],
						min = 0, max = 50, step = 1,
						get = function(info) return ElkBuffBars.db.profile.groupspacing end,
						set = function(info, v)
							ElkBuffBars.db.profile.groupspacing = v
							for _, bg in ipairs(ElkBuffBars.bargroups) do
								bg:SetPosition()
							end
						end,
					},
					buffframe = {
						order = 105,
						type = "toggle",
						width = "full",
						name = L["OPTIONS_HIDEBLIZZARDBUFFS_NAME"],
						desc = L["OPTIONS_HIDEBLIZZARDBUFFS_DESC"],
						get = function(info) return ElkBuffBars.db.profile.hidebuffframe end,
						set = function(info, v)
							ElkBuffBars.db.profile.hidebuffframe = v
							ElkBuffBars:HandleFrame_Blizzard_BuffFrame(ElkBuffBars.db.profile.hidebuffframe)
						end,
					},
					tenchframe = {
						order = 106,
						type = "toggle",
						width = "full",
						name = L["OPTIONS_HIDEBLIZZARDTENCH_NAME"],
						desc = L["OPTIONS_HIDEBLIZZARDTENCH_DESC"],
						get = function(info) return ElkBuffBars.db.profile.hidetenchframe end,
						set = function(info, v)
							ElkBuffBars.db.profile.hidetenchframe = v
							ElkBuffBars:HandleFrame_Blizzard_TemporaryEnchantFrame(ElkBuffBars.db.profile.hidetenchframe)
						end,
					},
					trackingframe = {
						order = 107,
						type = "toggle",
						width = "full",
						name = L["OPTIONS_HIDEBLIZZARDTRACKING_NAME"],
						desc = L["OPTIONS_HIDEBLIZZARDTRACKING_DESC"],
						get = function(info) return ElkBuffBars.db.profile.hidetrackingframe end,
						set = function(info, v)
							ElkBuffBars.db.profile.hidetrackingframe = v
							ElkBuffBars:HandleFrame_Blizzard_MiniMapTracking(ElkBuffBars.db.profile.hidetrackingframe)
						end,
					},
					minimap = {
						order = 108,
						type = "toggle",
						width = "full",
						name = L["OPTIONS_MINIMAP_NAME"],
						desc = L["OPTIONS_MINIMAP_DESC"],
						get = function(info) return not ElkBuffBars.db.profile.minimap.hide end,
						set = function(info, value)
							ElkBuffBars.db.profile.minimap.hide = not value
							LibStub("LibDBIcon-1.0"):Refresh(ELKBUFFBARS)
						end,
					},
				},
			},
			buffsettings = {
				order = 101,
				type = "group",
				name = L["OPTIONS_OVERRIDES_NAME"],
				desc = L["OPTIONS_OVERRIDES_DESC"],
				args = {
					BUFF = {
						type = "group",
						name = L["AURATYPE_BUFF"],
						args = {},
					},
					DEBUFF = {
						type = "group",
						name = L["AURATYPE_DEBUFF"],
						args = {},
					},
					TENCH = {
						type = "group",
						name = L["AURATYPE_TENCH"],
						args = {},
					},
					TRACKING = {
						type = "group",
						name = L["AURATYPE_TRACKING"],
						args = {},
					},
				},
			},
			groupsettings = {
				order = 102,
				type = "group",
				name = L["OPTIONS_BARGROUPS_NAME"],
				desc = L["OPTIONS_BARGROUPS_DESC"],
				args = {},
			},
		}
	}

	return self.options
end

function ElkBuffBars:ToggleOptionsWindow()
	if ACDialog.OpenFrames[ELKBUFFBARS] then
		ACDialog:Close(ELKBUFFBARS)
	else
		ACDialog:Open(ELKBUFFBARS)
	end
end

function ElkBuffBars:OpenGroupOptions(groupid)
	ACDialog:Open(ELKBUFFBARS)
	ACDialog:SelectGroup(ELKBUFFBARS, "groupsettings", tostring(groupid))
end

function ElkBuffBars:GetNameOptions(auratype, name)
	return {
		type = "group",
		name = name,
		desc = name,
		args = {
			name = {
				type = "input",
				name = L["OPTIONS_OVERRIDES_NAME_NAME"],
				desc = L["OPTIONS_OVERRIDES_NAME_DESC"],
				get = function(info) return ElkBuffBars.db.profile.nameoverride[auratype][name] end,
				set = function(info, v)
					v = string_trim(v)
					if v == "" or v == name then
						ElkBuffBars.db.profile.nameoverride[auratype][name] = nil
					else
						ElkBuffBars.db.profile.nameoverride[auratype][name] = v
					end
				end,
			},
			type = {
				type = "select",
				name = L["OPTIONS_OVERRIDES_TYPE_NAME"],
				desc = L["OPTIONS_OVERRIDES_TYPE_DESC"],
				values = {
					BUFF = L["AURATYPE_BUFF"],
					DEBUFF = L["AURATYPE_DEBUFF"],
					TENCH = L["AURATYPE_TENCH"],
					TRACKING = L["AURATYPE_TRACKING"],
					[""] = L["OPTIONS_OVERRIDES_TYPE_OPTION_DEFAULT"]
				},
				get = function(info) return ElkBuffBars.db.profile.typeoverride[auratype][name] end,
				set = function(info, v)
					v = string_trim(v)
					if v == "" or v == auratype then
						ElkBuffBars.db.profile.typeoverride[auratype][name] = nil
					else
						ElkBuffBars.db.profile.typeoverride[auratype][name] = v
					end
				end,
			}
		}
	}
end

local function SetNameFilter(groupid, white, auratype, auraname, value)
	local bg = ElkBuffBars.bargroups[groupid]
	local filter = bg.layout.filter
	local ftname = white and "names_include" or "names_exclude"
	if value then
		if not filter[ftname] then
			filter[ftname] = {}
		end
		if not filter[ftname][auratype] then
			filter[ftname][auratype] = {}
		end
		filter[ftname][auratype][auraname] = true
	elseif filter[ftname] and filter[ftname][auratype] then
		filter[ftname][auratype][auraname] = nil
		local hasdata = false
		for _ in pairs(filter[ftname][auratype]) do
			hasdata = true
			break
		end
		if not hasdata then
			filter[ftname][auratype] = nil
		end
		hasdata = false
		for _ in pairs(filter[ftname]) do
			hasdata = true
			break
		end
		if not hasdata then
			filter[ftname] = nil
		end
	end
	bg:UpdateData()
end

function ElkBuffBars:AddAuraToBlacklist(groupid, auratype, auraname)
	SetNameFilter(groupid, false, auratype, auraname, true)
end

local values_text_template = {
	["false"] = L["OPTIONS_GROUP_TEXT_TEMPLATE_OPTION_HIDE"],
	NAME = L["OPTIONS_GROUP_TEXT_TEMPLATE_OPTION_NAME"],
	NAMERANK = L["OPTIONS_GROUP_TEXT_TEMPLATE_OPTION_NAMERANK"],
	NAMECOUNT = L["OPTIONS_GROUP_TEXT_TEMPLATE_OPTION_NAMECOUNT"],
	NAMERANKCOUNT = L["OPTIONS_GROUP_TEXT_TEMPLATE_OPTION_NAMERANKCOUNT"],
	RANK = L["OPTIONS_GROUP_TEXT_TEMPLATE_OPTION_RANK"],
	COUNT = L["OPTIONS_GROUP_TEXT_TEMPLATE_OPTION_COUNT"],
	TIMELEFT = L["OPTIONS_GROUP_TEXT_TEMPLATE_OPTION_TIMELEFT"],
	DEBUFFTYPE = L["OPTIONS_GROUP_TEXT_TEMPLATE_OPTION_DEBUFFTYPE"],
	CASTER = L["OPTIONS_GROUP_TEXT_TEMPLATE_OPTION_CASTER"],
}
local values_text_style = {
	[""] = L["OPTIONS_GROUP_TEXT_STYLE_OPTION_PLAIN"],
	["OUTLINE"] = L["OPTIONS_GROUP_TEXT_STYLE_OPTION_OUTLINE"],
	["THICKOUTLINE"] = L["OPTIONS_GROUP_TEXT_STYLE_OPTION_THICKOUTLINE"],
}

function ElkBuffBars:GetGroupOptions(id)
	return {
		type = "group",
		name = format(L["OPTIONS_GROUP_NAME"], id),
		desc = format(L["OPTIONS_GROUP_DESC"], id),
		disabled = true,
		hidden = true,
		args = {
			configmode = {
				order = 101,
				type = "toggle",
				width = "double",
				name = L["OPTIONS_GROUP_CONFIG_NAME"],
				desc = L["OPTIONS_GROUP_CONFIG_DESC"],
				get = function(info) return ElkBuffBars.db.profile.bargroups[id].configmode end,
				set = function(info) ElkBuffBars.bargroups[id]:ToggleConfigMode() end,
			},
			anchorshown = {
				order = 102,
				type = "toggle",
				width = "double",
				name = L["OPTIONS_GROUP_ANCHOR_NAME"],
				desc = L["OPTIONS_GROUP_ANCHOR_DESC"],
				get = function(info) return ElkBuffBars.db.profile.bargroups[id].anchorshown end,
				set = function(info)
					local bg = ElkBuffBars.bargroups[id]
					bg.layout.anchorshown = not bg.layout.anchorshown
					bg:UpdateAnchor()
				end,
			},
			anchortext = {
				order = 103,
				type = "input",
				name = L["OPTIONS_GROUP_NAME_NAME"],
				desc = L["OPTIONS_GROUP_NAME_DESC"],
				get = function(info) return ElkBuffBars.db.profile.bargroups[id].anchortext end,
				set = function(info, v)
					local bg = ElkBuffBars.bargroups[id]
					bg.layout.anchortext = v
					bg:UpdateAnchor()
				end,
			},
			bars = {
				order = 104,
				type = "group",
				name = L["OPTIONS_GROUP_BARLAYOUT_NAME"],
				desc = L["OPTIONS_GROUP_BARLAYOUT_DESC"],
				args = {
					bar = {
						order = 101,
						type = "group",
						name = L["OPTIONS_GROUP_BAR_NAME"],
						desc = L["OPTIONS_GROUP_BAR_DESC"],
						args = {
							bar = {
								order = 101,
								type = "toggle",
--								width = "double",
								name = L["OPTIONS_GROUP_BAR_SHOW_NAME"],
								desc = L["OPTIONS_GROUP_BAR_SHOW_DESC"],
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.bar end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.bar = v
									bg:SetLayout()
								end,
							},
							barcolor = {
								order = 102,
								type = "color",
								name = L["OPTIONS_GROUP_BAR_COLOR_NAME"],
								desc = L["OPTIONS_GROUP_BAR_COLOR_DESC"],
								hasAlpha = true,
								get = function(info) return unpack(ElkBuffBars.db.profile.bargroups[id].bars.barcolor) end,
								set = function(info, r, g, b, a)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.barcolor[1] = r
									bg.layout.bars.barcolor[2] = g
									bg.layout.bars.barcolor[3] = b
									bg.layout.bars.barcolor[4] = a
									bg:SetLayout()
								end,
							}, -- <color set>
							bgbar = {
								order = 103,
								type = "toggle",
--								width = "double",
								name = L["OPTIONS_GROUP_BAR_BGSHOW_NAME"],
								desc = L["OPTIONS_GROUP_BAR_BGSHOW_DESC"],
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.bgbar end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.bgbar = v
									bg:SetLayout()
								end,
							},
							barbgcolor = {
								order = 104,
								type = "color",
								name = L["OPTIONS_GROUP_BAR_BGCOLOR_NAME"],
								desc = L["OPTIONS_GROUP_BAR_BGCOLOR_DESC"],
								hasAlpha = true,
								get = function(info) return unpack(ElkBuffBars.db.profile.bargroups[id].bars.barbgcolor) end,
								set = function(info, r, g, b, a)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.barbgcolor[1] = r
									bg.layout.bars.barbgcolor[2] = g
									bg.layout.bars.barbgcolor[3] = b
									bg.layout.bars.barbgcolor[4] = a
									bg:SetLayout()
								end,
							}, -- <color set>
							bartexture = {
								order = 105,
								type = "select",
								name = L["OPTIONS_GROUP_BAR_TEXTURE_NAME"],
								desc = L["OPTIONS_GROUP_BAR_TEXTURE_DESC"],
								values = LSM_statusbar,
								dialogControl = "LSM30_Statusbar",
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.bartexture end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.bartexture = v
									bg:SetLayout()
								end,
							},
							spark = {
								order = 106,
								type = "toggle",
								width = "double",
								name = L["OPTIONS_GROUP_BAR_SPARK_NAME"],
								desc = L["OPTIONS_GROUP_BAR_SPARK_DESC"],
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.spark end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.spark = v
									bg:SetLayout()
								end,
							},
							debufftypecolor = {
								order = 107,
								type = "toggle",
								width = "double",
								name = L["OPTIONS_GROUP_BAR_DEBUFFCOLOR_NAME"],
								desc = L["OPTIONS_GROUP_BAR_DEBUFFCOLOR_DESC"],
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.debufftypecolor end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.debufftypecolor = v
									bg:UpdateBars()
								end,
							},
							barright = {
								order = 108,
								type = "toggle",
								width = "double",
								name = L["OPTIONS_GROUP_BAR_LTRDIR_NAME"],
								desc = L["OPTIONS_GROUP_BAR_LTRDIR_DESC"],
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.barright end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.barright = v
									bg:SetLayout()
								end,
							},
							timelessfull = {
								order = 109,
								type = "toggle",
								width = "double",
								name = L["OPTIONS_GROUP_BAR_TIMELESSFULL_NAME"],
								desc = L["OPTIONS_GROUP_BAR_TIMELESSFULL_DESC"],
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.timelessfull end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.timelessfull = v
									bg:UpdateData()
								end,
							},
						},
					},
					icon = {
						order = 102,
						type = "group",
						name = L["OPTIONS_GROUP_ICON_NAME"],
						desc = L["OPTIONS_GROUP_ICON_DESC"],
						args = {
							icon = {
								order = 101,
								type = "select",
								name = L["OPTIONS_GROUP_ICON_POSITION_NAME"],
								desc = L["OPTIONS_GROUP_ICON_POSITION_DESC"],
								values = {
									["false"] = L["OPTIONS_GROUP_ICON_POSITION_HIDE"],
									["LEFT"] = L["OPTIONS_GROUP_ICON_POSITION_LEFT"],
									["RIGHT"] = L["OPTIONS_GROUP_ICON_POSITION_RIGHT"],
								},
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.icon or "false" end,
								set = function(info, v)
									if v == "false" then v = false end
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.icon = v
									bg:SetLayout()
								end,
							}, -- "LEFT", "RIGHT", false
							iconcount = {
								order = 102,
								type = "toggle",
								width = "double",
								name = L["OPTIONS_GROUP_ICON_STACK_SHOW_NAME"],
								desc = L["OPTIONS_GROUP_ICON_STACK_SHOW_DESC"],
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.iconcount end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.iconcount = v
									bg:SetLayout()
								end,
							}, -- true, false
							iconcountanchor = {
								order = 103,
								type = "select",
								name = L["OPTIONS_GROUP_ICON_STACK_ANCHOR_NAME"],
								desc = L["OPTIONS_GROUP_ICON_STACK_ANCHOR_DESC"],
								values = {
									TOPLEFT = L["ANCHOR_TOPLEFT"],
									TOP = L["ANCHOR_TOP"],
									TOPRIGHT = L["ANCHOR_TOPRIGHT"],
									LEFT = L["ANCHOR_LEFT"],
									CENTER = L["ANCHOR_CENTER"],
									RIGHT = L["ANCHOR_RIGHT"],
									BOTTOMLEFT = L["ANCHOR_BOTTOMLEFT"],
									BOTTOM = L["ANCHOR_BOTTOM"],
									BOTTOMRIGHT = L["ANCHOR_BOTTOMRIGHT"],
								},
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.iconcountanchor end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.iconcountanchor = v
									bg:SetLayout()
								end,
							}, -- <anchor>
							iconcountfont = {
								order = 104,
								type = "select",
								name = L["OPTIONS_GROUP_ICON_STACK_FONT_NAME"],
								desc = L["OPTIONS_GROUP_ICON_STACK_FONT_DESC"],
								values = LSM_font,
								dialogControl = "LSM30_Font",
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.iconcountfont end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.iconcountfont = v
									bg:SetLayout()
								end,
							}, -- <LSM:font>
							iconcountfontsize =  {
								order = 105,
								type = "range",
								name = L["OPTIONS_GROUP_ICON_STACK_FONTSIZE_NAME"],
								desc = L["OPTIONS_GROUP_ICON_STACK_FONTSIZE_DESC"],
								min = 4, max = 32, step = 1,
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.iconcountfontsize end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.iconcountfontsize = tonumber(v)
									bg:SetLayout()
								end,
							}, -- <font size>
							iconcountcolor = {
								order = 106,
								type = "color",
								name = L["OPTIONS_GROUP_ICON_STACK_FONTCOLOR_NAME"],
								desc = L["OPTIONS_GROUP_ICON_STACK_FONTCOLOR_DESC"],
								hasAlpha = true,
								get = function(info) return unpack(ElkBuffBars.db.profile.bargroups[id].bars.iconcountcolor) end,
								set = function(info, r, g, b, a)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.iconcountcolor[1] = r
									bg.layout.bars.iconcountcolor[2] = g
									bg.layout.bars.iconcountcolor[3] = b
									bg.layout.bars.iconcountcolor[4] = a
									bg:SetLayout()
								end,
							}, -- <color set>
						},
					},
					texttl = {
						order = 103,
						type = "group",
						--dialogInline = true,
						name = L["OPTIONS_GROUP_TEXTTL_NAME"],
						desc = L["OPTIONS_GROUP_TEXTTL_DESC"],
						args = {
							textTL = {
								order = 101,
								type = "select",
								name = L["OPTIONS_GROUP_TEXT_TEMPLATE_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_TEMPLATE_DESC"],
								values = values_text_template,
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textTL or "false" end,
								set = function(info, v)
									if v == "false" then v = false end
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textTL = v
									bg:SetLayout()
								end,
							}, -- false, "NAME", "NAMERANK", "NAMECOUNT", "NAMERANKCOUNT", "RANK", "COUNT", "TIMELEFT", "DEBUFFTYPE"
							textTLfont = {
								order = 102,
								type = "select",
								name = L["OPTIONS_GROUP_TEXT_FONT_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_FONT_DESC"],
								values = LSM_font,
								dialogControl = "LSM30_Font",
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textTLfont end,
								set = function(info, v)
										local bg = ElkBuffBars.bargroups[id]
										bg.layout.bars.textTLfont = v
										bg:SetLayout()
									end,
							}, -- <LSM:font>
							textTLfontsize = {
								order = 103,
								type = "range",
								name = L["OPTIONS_GROUP_TEXT_FONTSIZE_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_FONTSIZE_DESC"],
								min = 4, max = 32, step = 1,
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textTLfontsize end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textTLfontsize = tonumber(v)
									bg:SetLayout()
								end,
							}, -- <font size>
							textTLcolor = {
								order = 104,
								type = "color",
								name = L["OPTIONS_GROUP_TEXT_FONTCOLOR_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_FONTCOLOR_DESC"],
								hasAlpha = true,
								get = function(info) return unpack(ElkBuffBars.db.profile.bargroups[id].bars.textTLcolor) end,
								set = function(info, r, g, b, a)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textTLcolor[1] = r
									bg.layout.bars.textTLcolor[2] = g
									bg.layout.bars.textTLcolor[3] = b
									bg.layout.bars.textTLcolor[4] = a
									bg:SetLayout()
								end,
							}, -- <color set>
							textTLstyle = {
								order = 105,
								type = "select",
								name = L["OPTIONS_GROUP_TEXT_STYLE_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_STYLE_DESC"],
								values = values_text_style,
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textTLstyle end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textTLstyle = v
									bg:SetLayout()
								end,
							}, -- "", OUTLINE, THICKOUTLINE
							textTLalign = {
								order = 106,
								type = "select",
								name = L["OPTIONS_GROUP_TEXT_ALIGNMENT_NAME"],
								desc = L["OPTIONS_GROUP_TEXTTL_ALIGNMENT_DESC"],
								values = { -- @Phanx: keys capitalized for passing to SetJustifyH
									LEFT = L["OPTIONS_GROUP_TEXT_ALIGNMENT_LEFT"],
									CENTER = L["OPTIONS_GROUP_TEXT_ALIGNMENT_CENTER"],
									RIGHT = L["OPTIONS_GROUP_TEXT_ALIGNMENT_RIGHT"]
								},
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textTLalign end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textTLalign = v
									bg:SetLayout()
								end,
							}, -- LEFT, CENTER, RIGHT
						},
					},
					texttr = {
						order = 104,
						type = "group",
						--dialogInline = true,
						name = L["OPTIONS_GROUP_TEXTTR_NAME"],
						desc = L["OPTIONS_GROUP_TEXTTR_NAME"],
						args = {
							textTR = {
								order = 101,
								type = "select",
								name = L["OPTIONS_GROUP_TEXT_TEMPLATE_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_TEMPLATE_DESC"],
								values = values_text_template,
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textTR or "false" end,
								set = function(info, v)
									if v == "false" then v = false end
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textTR = v
									bg:SetLayout()
								end,
							}, -- false, "NAME", "NAMERANK", "NAMECOUNT", "NAMERANKCOUNT", "RANK", "COUNT", "TIMELEFT", "DEBUFFTYPE"
							textTRfont = {
								order = 102,
								type = "select",
								name = L["OPTIONS_GROUP_TEXT_FONT_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_FONT_DESC"],
								values = LSM_font,
								dialogControl = "LSM30_Font",
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textTRfont end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textTRfont = v
									bg:SetLayout()
								end,
							}, -- <LSM:font>
							textTRfontsize = {
								order = 103,
								type = "range",
								name = L["OPTIONS_GROUP_TEXT_FONTSIZE_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_FONTSIZE_DESC"],
								min = 4, max = 32, step = 1,
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textTRfontsize end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textTRfontsize = tonumber(v)
									bg:SetLayout()
								end,
							}, -- <font size>
							textTRcolor = {
								order = 104,
								type = "color",
								hasAlpha = true,
								name = L["OPTIONS_GROUP_TEXT_FONTCOLOR_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_FONTCOLOR_DESC"],
								get = function(info) return unpack(ElkBuffBars.db.profile.bargroups[id].bars.textTRcolor) end,
								set = function(info, r, g, b, a)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textTRcolor[1] = r
									bg.layout.bars.textTRcolor[2] = g
									bg.layout.bars.textTRcolor[3] = b
									bg.layout.bars.textTRcolor[4] = a
									bg:SetLayout()
								end,
							}, -- <color set>
							textTRstyle = {
								order = 105,
								type = "select",
								name = L["OPTIONS_GROUP_TEXT_STYLE_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_STYLE_DESC"],
								values = values_text_style,
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textTRstyle end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textTRstyle = v
									bg:SetLayout()
								end,
							}, -- "", OUTLINE, THICKOUTLINE
						},
					},
					textbl = {
						order = 105,
						type = "group",
						--dialogInline = true,
						name = L["OPTIONS_GROUP_TEXTBL_NAME"],
						desc = L["OPTIONS_GROUP_TEXTBL_NAME"],
						args = {
							textBL = {
								order = 101,
								type = "select",
								name = L["OPTIONS_GROUP_TEXT_TEMPLATE_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_TEMPLATE_DESC"],
								values = values_text_template,
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textBL or "false" end,
								set = function(info, v)
									if v == "false" then v = false end
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textBL = v
									bg:SetLayout()
								end,
							}, -- false, "NAME", "NAMERANK", "NAMECOUNT", "NAMERANKCOUNT", "RANK", "COUNT", "TIMELEFT", "DEBUFFTYPE"
							textBLfont = {
								order = 102,
								type = "select",
								name = L["OPTIONS_GROUP_TEXT_FONT_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_FONT_DESC"],
								values = LSM_font,
								dialogControl = "LSM30_Font",
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textBLfont end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textBLfont = v
									bg:SetLayout()
								end,
							}, -- <LSM:font>
							textBLfontsize = {
								order = 103,
								type = "range",
								name = L["OPTIONS_GROUP_TEXT_FONTSIZE_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_FONTSIZE_DESC"],
								min = 4, max = 32, step = 1,
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textBLfontsize end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textBLfontsize = tonumber(v)
									bg:SetLayout()
								end,
							}, -- <font size>
							textBLcolor = {
								order = 104,
								type = "color",
								name = L["OPTIONS_GROUP_TEXT_FONTCOLOR_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_FONTCOLOR_DESC"],
								hasAlpha = true,
								get = function(info) return unpack(ElkBuffBars.db.profile.bargroups[id].bars.textBLcolor) end,
								set = function(info, r, g, b, a)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textBLcolor[1] = r
									bg.layout.bars.textBLcolor[2] = g
									bg.layout.bars.textBLcolor[3] = b
									bg.layout.bars.textBLcolor[4] = a
									bg:SetLayout()
								end,
							}, -- <color set>
							textBLstyle = {
								order = 105,
								type = "select",
								name = L["OPTIONS_GROUP_TEXT_STYLE_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_STYLE_DESC"],
								values = values_text_style,
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textBLstyle end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textBLstyle = v
									bg:SetLayout()
								end,
							}, -- "", OUTLINE, THICKOUTLINE
							textBLalign = {
								order = 106,
								type = "select",
								name = L["OPTIONS_GROUP_TEXT_ALIGNMENT_NAME"],
								desc = L["OPTIONS_GROUP_TEXTBL_ALIGNMENT_DESC"],
								values = {
									left = L["OPTIONS_GROUP_TEXT_ALIGNMENT_LEFT"],
									center = L["OPTIONS_GROUP_TEXT_ALIGNMENT_CENTER"],
									right = L["OPTIONS_GROUP_TEXT_ALIGNMENT_RIGHT"]
								},
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textBLalign end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textBLalign = v
									bg:SetLayout()
								end,
							}, -- left, center, right
						},
					},
					textbr = {
						order = 106,
						type = "group",
						--dialogInline = true,
						name = L["OPTIONS_GROUP_TEXTBR_NAME"],
						desc = L["OPTIONS_GROUP_TEXTBR_NAME"],
						args = {
							textBR = {
								order = 101,
								type = "select",
								name = L["OPTIONS_GROUP_TEXT_TEMPLATE_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_TEMPLATE_DESC"],
								values = values_text_template,
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textBR or "false" end,
								set = function(info, v)
									if v == "false" then v = false end
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textBR = v
									bg:SetLayout()
								end,
							}, -- false, "NAME", "NAMERANK", "NAMECOUNT", "NAMERANKCOUNT", "RANK", "COUNT", "TIMELEFT", "DEBUFFTYPE"
							textBRfont = {
								order = 102,
								type = "select",
								name = L["OPTIONS_GROUP_TEXT_FONT_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_FONT_DESC"],
								values = LSM_font,
								dialogControl = "LSM30_Font",
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textBRfont end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textBRfont = v
									bg:SetLayout()
								end,
							}, -- <LSM:font>
							textBRfontsize = {
								order = 103,
								type = "range",
								name = L["OPTIONS_GROUP_TEXT_FONTSIZE_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_FONTSIZE_DESC"],
								min = 4, max = 32, step = 1,
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textBRfontsize end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textBRfontsize = tonumber(v)
									bg:SetLayout()
								end,
							}, -- <font size>
							textBRcolor = {
								order = 104,
								type = "color",
								hasAlpha = true,
								name = L["OPTIONS_GROUP_TEXT_FONTCOLOR_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_FONTCOLOR_DESC"],
								get = function(info) return unpack(ElkBuffBars.db.profile.bargroups[id].bars.textBRcolor) end,
								set = function(info, r, g, b, a)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textBRcolor[1] = r
									bg.layout.bars.textBRcolor[2] = g
									bg.layout.bars.textBRcolor[3] = b
									bg.layout.bars.textBRcolor[4] = a
									bg:SetLayout()
								end,
							}, -- <color set>
							textBRstyle = {
								order = 105,
								type = "select",
								name = L["OPTIONS_GROUP_TEXT_STYLE_NAME"],
								desc = L["OPTIONS_GROUP_TEXT_STYLE_DESC"],
								values = values_text_style,
								get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.textBRstyle end,
								set = function(info, v)
									local bg = ElkBuffBars.bargroups[id]
									bg.layout.bars.textBRstyle = v
									bg:SetLayout()
								end,
							}, -- "", OUTLINE, THICKOUTLINE
						},
					},
					height = {
						order = 107,
						type = "range",
						name = L["OPTIONS_GROUP_HEIGHT_NAME"],
						desc = L["OPTIONS_GROUP_HEIGHT_DESC"],
						min = 0, max = 100, step = 1, bigStep = 5,
						get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.height end,
						set = function(info, v)
							local bg = ElkBuffBars.bargroups[id]
							local blayout = bg.layout.bars
							blayout.height = tonumber(v)
							if blayout.height > blayout.width then blayout.height = blayout.width end
							bg:SetLayout()
						end,
					},
					width = {
						order = 108,
						type = "range",
						name = L["OPTIONS_GROUP_WIDTH_NAME"],
						desc = L["OPTIONS_GROUP_WIDTH_DESC"],
						min = 0, max = 500, step = 1, bigStep = 10,
						get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.width end,
						set = function(info, v)
							local bg = ElkBuffBars.bargroups[id]
							local blayout = bg.layout.bars
							blayout.width = tonumber(v)
							if blayout.width < blayout.height then blayout.width = blayout.height end
							bg:SetLayout()
						end,
					},
					padding = {
						order = 109,
						type = "range",
						name = L["OPTIONS_GROUP_PADDING_NAME"],
						desc = L["OPTIONS_GROUP_PADDING_DESC"],
						min = 0, max = 10, step = 1,
						get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.padding end,
						set = function(info, v)
							local bg = ElkBuffBars.bargroups[id]
							bg.layout.bars.padding = tonumber(v)
							bg:SetLayout()
						end,
					},
					abbreviate_name = {
						order = 110,
						type = "range",
						name = L["OPTIONS_GROUP_ABBREVIATE_NAME"],
						desc = L["OPTIONS_GROUP_ABBREVIATE_DESC"],
						min = 0, max = 100, step = 1,
						get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.abbreviate_name end,
						set = function(info, v)
							local bg = ElkBuffBars.bargroups[id]
							bg.layout.bars.abbreviate_name = tonumber(v)
							bg:UpdateText()
						end,
					},
					timeformat = {
						order = 111,
						type = "select",
						name = L["OPTIONS_GROUP_TIMEFORMAT_NAME"],
						desc = L["OPTIONS_GROUP_TIMEFORMAT_DESC"],
						values = {
							DEFAULT = L["OPTIONS_GROUP_TIMEFORMAT_OPTION_DEFAULT"],
							CLOCK = L["OPTIONS_GROUP_TIMEFORMAT_OPTION_CLOCK"],
							CONDENSED = L["OPTIONS_GROUP_TIMEFORMAT_OPTION_CONDENSED"],
						},
						get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.timeformat end,
						set = function(info, v)
							local bg = ElkBuffBars.bargroups[id]
							bg.layout.bars.timeformat = v
							bg:UpdateTimeleft()
						end,
					}, -- "DEFAULT", "CLOCK", "CONDENSED"
					timefraction = {
						order = 112,
						type = "toggle",
						width = "double",
						name = L["OPTIONS_GROUP_TIMEFRACTION_NAME"],
						desc = L["OPTIONS_GROUP_TIMEFRACTION_DESC"],
						get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.timeFraction end,
						set = function(info, v)
							local bg = ElkBuffBars.bargroups[id]
							bg.layout.bars.timeFraction = v
						end,
					},
					tooltipanchor = {
						order = 113,
						type = "select",
						name = L["OPTIONS_GROUP_TTIPANCHOR_NAME"],
						desc = L["OPTIONS_GROUP_TTIPANCHOR_DESC"],
						values = {
							default = L["ANCHOR_DEFAULT"],
							ANCHOR_TOPRIGHT = L["ANCHOR_TOPRIGHT"],
							ANCHOR_RIGHT = L["ANCHOR_RIGHT"],
							ANCHOR_BOTTOMRIGHT = L["ANCHOR_BOTTOMRIGHT"],
							ANCHOR_TOPLEFT = L["ANCHOR_TOPLEFT"],
							ANCHOR_LEFT = L["ANCHOR_LEFT"],
							ANCHOR_BOTTOMLEFT = L["ANCHOR_BOTTOMLEFT"],
							ANCHOR_CURSOR = L["ANCHOR_CURSOR"],
							ANCHOR_PRESERVE = L["ANCHOR_PRESERVE"],
							ANCHOR_NONE = L["ANCHOR_NONE"],
						},
						get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.tooltipanchor end,
						set = function(info, v)
							local bg = ElkBuffBars.bargroups[id]
							bg.layout.bars.tooltipanchor = v
						end,
					},
					tooltipcaster = {
						order = 114,
						type = "toggle",
						width = "double",
						name = L["OPTIONS_GROUP_TTIPCASTER_NAME"],
						desc = L["OPTIONS_GROUP_TTIPCASTER_DESC"],
						get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.tooltipcaster end,
						set = function(info, v)
							local bg = ElkBuffBars.bargroups[id]
							bg.layout.bars.tooltipcaster = v
						end,
					},
				},
			},
			alpha = {
				order = 105,
				type = "range",
				name = L["OPTIONS_GROUP_ALPHA_NAME"],
				desc = L["OPTIONS_GROUP_ALPHA_DESC"],
				min = 0, max = 1, step = 0.01,
				isPercent = true,
				get = function(info) return ElkBuffBars.db.profile.bargroups[id].alpha end,
				set = function(info, v)
					local bg = ElkBuffBars.bargroups[id]
					bg.layout.alpha = tonumber(v)
					bg:SetLayout()
				end,
			},
			scale = {
				order = 106,
				type = "range",
				name = L["OPTIONS_GROUP_SCALE_NAME"],
				desc = L["OPTIONS_GROUP_SCALE_DESC"],
				isPercent = true, min = 0.1, max = 2, step = 0.05, bigStep = 0.1,
				get = function(info) return ElkBuffBars.db.profile.bargroups[id].scale end,
				set = function(info, v)
					local bg = ElkBuffBars.bargroups[id]
					bg.layout.scale = tonumber(v)
					bg:SetLayout()
				end,
			},
			barspacing = {
				order = 107,
				type = "range",
				name = L["OPTIONS_GROUP_BARSPACING_NAME"],
				desc = L["OPTIONS_GROUP_BARSPACING_DESC"],
				min = 0, max = 50, step = 1,
				get = function(info) return ElkBuffBars.db.profile.bargroups[id].barspacing end,
				set = function(info, v)
					local bg = ElkBuffBars.bargroups[id]
					bg.layout.barspacing = tonumber(v)
					bg:UpdateBarPositions()
				end,
			},
			growup = {
				order = 108,
				type = "toggle",
				width = "double",
				name = L["OPTIONS_GROUP_GROWUP_NAME"],
				desc = L["OPTIONS_GROUP_GROWUP_DESC"],
				get = function(info) return ElkBuffBars.db.profile.bargroups[id].growup end,
				set = function(info, v)
					local bg = ElkBuffBars.bargroups[id]
					bg.layout.growup = v
					bg.layout.stickto = nil
					bg.layout.stickside = nil
					bg:SetLayout()
					bg:SetPosition()
				end,
			},
			sorting = {
				order = 109,
				type = "select",
				name = L["OPTIONS_GROUP_SORTING_NAME"],
				desc = L["OPTIONS_GROUP_SORTING_DESC"],
				values = {
					name = NAME, -- Blizzard global string
					none = NONE, -- Blizzard global string
					timeleft = L["OPTIONS_GROUP_SORTING_OPTION_TIMELEFT"],
					timemax = L["OPTIONS_GROUP_SORTING_OPTION_TIMEMAX"],
				},
				get = function(info) return ElkBuffBars.db.profile.bargroups[id].sorting end,
				set = function(info, v)
					local bg = ElkBuffBars.bargroups[id]
					bg.layout.sorting = v
					bg:UpdateData()
				end,
			},
			filter = { -- @Phanx: the whitelist / blacklist > buffs / debuffs have the potential to get really long, what to do?
				order = 110,
				type = "group",
				name = L["OPTIONS_GROUP_FILTER_NAME"],
				desc = L["OPTIONS_GROUP_FILTER_DESC"],
				args = {
					type = {
						order = 101,
						type = "multiselect", -- @Phanx: is this really the best choice?
						values = {
							BUFF = L["AURATYPE_BUFF"],
							DEBUFF = L["AURATYPE_DEBUFF"],
							TENCH = L["AURATYPE_TENCH"],
							TRACKING = TRACKING, -- Blizzard global string
						},
						name = L["OPTIONS_GROUP_FILTER_TYPE_NAME"],
						desc = L["OPTIONS_GROUP_FILTER_TYPE_DESC"],
						get = function(info, k) return ElkBuffBars.db.profile.bargroups[id].filter.type[k] or false end,
						set = function(info, k, v)
							ElkBuffBars.bargroups[id].layout.filter.type[k] = v or nil
							ElkBuffBars:DoFullUpdate()
						end,
					},
					selfcast = {
						order = 102,
						type = "select",
						name = L["OPTIONS_GROUP_FILTER_SELFCAST_NAME"],
						desc = L["OPTIONS_GROUP_FILTER_SELFCAST_DESC"],
						values = {
							whitelist = L["OPTIONS_GROUP_FILTER_SELFCAST_OPTION_WHITELIST"],
							none = L["OPTIONS_GROUP_FILTER_SELFCAST_OPTION_NOFILTER"],
							blacklist = L["OPTIONS_GROUP_FILTER_SELFCAST_OPTION_BLACKLIST"],
						},
						get = function(info) return ElkBuffBars.db.profile.bargroups[id].filter.selfcast or "none" end,
						set = function(info, v)
							if v == "none" then v = nil end
							ElkBuffBars.bargroups[id].layout.filter.selfcast = v
							ElkBuffBars:DoFullUpdate()
						end,
					},
					untilcancelled = {
						order = 103,
						type = "select",
						name = L["OPTIONS_GROUP_FILTER_TIMELESS_NAME"],
						desc = L["OPTIONS_GROUP_FILTER_TIMELESS_DESC"],
						values = {
							only = L["OPTIONS_GROUP_FILTER_TIMELESS_OPTION_WHITELIST"],
							none = L["OPTIONS_GROUP_FILTER_TIMELESS_OPTION_NOFILTER"],
							hide = L["OPTIONS_GROUP_FILTER_TIMELESS_OPTION_BLACKLIST"],
						},
						get = function(info) return ElkBuffBars.db.profile.bargroups[id].filter.untilcancelled or "none" end,
						set = function(info, v)
							if v == "none" then v = nil end
							ElkBuffBars.bargroups[id].layout.filter.untilcancelled = v
							ElkBuffBars:DoFullUpdate()
						end,
					},
					timemax_min = {
						type = "input",
						name = L["OPTIONS_GROUP_FILTER_TIMEMAXMIN_NAME"],
						desc = L["OPTIONS_GROUP_FILTER_TIMEMAXMIN_DESC"],
						pattern = "^%d+$",
						--usage = L["OPTIONS_GROUP_FILTER_TIMEMAXMIN_USAGE"], -- @Phanx: not supported by select, merge into desc
						get = function(info) return tostring(ElkBuffBars.db.profile.bargroups[id].filter.timemax_min or "") end,
						set = function(info, v)
								v = tonumber(v)
								ElkBuffBars.bargroups[id].layout.filter.timemax_min = (v ~= 0) and v or nil
								ElkBuffBars:DoFullUpdate()
							end,
						order = 104,
					},
					timemax_max = {
						order = 105,
						type = "input",
						name = L["OPTIONS_GROUP_FILTER_TIMEMAXMAX_NAME"],
						desc = L["OPTIONS_GROUP_FILTER_TIMEMAXMAX_DESC"],
						pattern = "^%d+$",
						--usage = L["OPTIONS_GROUP_FILTER_TIMEMAXMAX_USAGE"], -- @Phanx: not supported by select, merge into desc
						get = function(info) return tostring(ElkBuffBars.db.profile.bargroups[id].filter.timemax_max or "") end,
						set = function(info, v)
							v = tonumber(v)
							ElkBuffBars.bargroups[id].layout.filter.timemax_max = (v ~= 0) and v or nil
							ElkBuffBars:DoFullUpdate()
						end,
					},
					names_include = {
						order = 106,
						type = "group",
						name = L["OPTIONS_GROUP_FILTER_NAME_WHITELIST_NAME"],
						desc = L["OPTIONS_GROUP_FILTER_NAME_WHITELIST_DESC"],
						args = {
							BUFF = {
								type = "multiselect",
								name = L["AURATYPE_BUFF"],
								values = knownnames_validate.BUFF,
								get = function(info, i)
									local ni = ElkBuffBars.db.profile.bargroups[id].filter.names_include
									return ni and ni.BUFF and ni.BUFF[knownnames_validate.BUFF[i]] or false
								end,
								set = function(info, i, value) SetNameFilter(id, true, "BUFF", knownnames_validate.BUFF[i], value) end,
							},
							DEBUFF = {
								type = "multiselect",
								name = L["AURATYPE_DEBUFF"],
								values = knownnames_validate.DEBUFF,
								get = function(info, i)
									local ni = ElkBuffBars.db.profile.bargroups[id].filter.names_include
									return ni and ni.DEBUFF and ni.DEBUFF[knownnames_validate.DEBUFF[i]] or false
								end,
								set = function(info, i, value) SetNameFilter(id, true, "DEBUFF", knownnames_validate.DEBUFF[i], value) end,
							},
							TENCH = {
								type = "multiselect",
								name = L["AURATYPE_TENCH"],
								values = knownnames_validate.TENCH,
								get = function(info, i)
									local ni = ElkBuffBars.db.profile.bargroups[id].filter.names_include
									return ni and ni.TENCH and ni.TENCH[knownnames_validate.TENCH[i]] or false
								end,
								set = function(info, i, value) SetNameFilter(id, true, "TENCH", knownnames_validate.TENCH[i], value) end,
							},
							TRACKING = {
								type = "multiselect",
								name = L["AURATYPE_TRACKING"],
								values = knownnames_validate.TRACKING,
								get = function(info, i)
									local ni = ElkBuffBars.db.profile.bargroups[id].filter.names_include
									return ni and ni.TRACKING and ni.TRACKING[knownnames_validate.TRACKING[i]] or false
								end,
								set = function(info, i, value) SetNameFilter(id, true, "TRACKING", knownnames_validate.TRACKING[i], value) end,
							},
						},
					},
					names_exclude = {
						order = 107,
						type = "group",
						name = L["OPTIONS_GROUP_FILTER_NAME_BLACKLIST_NAME"],
						desc = L["OPTIONS_GROUP_FILTER_NAME_BLACKLIST_DESC"],
						args = {
							BUFF = {
								type = "multiselect",
								name = L["AURATYPE_BUFF"],
								values = knownnames_validate.BUFF,
								get = function(info, i)
									local ne = ElkBuffBars.db.profile.bargroups[id].filter.names_exclude
									return ne and ne.BUFF and ne.BUFF[knownnames_validate.BUFF[i]] or false
								end,
								set = function(info, i, value) SetNameFilter(id, false, "BUFF", knownnames_validate.BUFF[i], value) end,
							},
							DEBUFF = {
								type = "multiselect",
								name = L["AURATYPE_DEBUFF"],
								values = knownnames_validate.DEBUFF,
								get = function(info, i)
									local ne = ElkBuffBars.db.profile.bargroups[id].filter.names_exclude
									return ne and ne.DEBUFF and ne.DEBUFF[knownnames_validate.DEBUFF[i]] or false
								end,
								set = function(info, i, value) SetNameFilter(id, false, "DEBUFF", knownnames_validate.DEBUFF[i], value) end,
							},
							TENCH = {
								type = "multiselect",
								name = L["AURATYPE_TENCH"],
								values = knownnames_validate.TENCH,
								get = function(info, i)
									local ne = ElkBuffBars.db.profile.bargroups[id].filter.names_exclude
									return ne and ne.TENCH and ne.TENCH[knownnames_validate.TENCH[i]] or false
								end,
								set = function(info, i, value) SetNameFilter(id, false, "TENCH", knownnames_validate.TENCH[i], value) end,
							},
							TRACKING = {
								type = "multiselect",
								name = L["AURATYPE_TRACKING"],
								values = knownnames_validate.TRACKING,
								get = function(info, i)
									local ne = ElkBuffBars.db.profile.bargroups[id].filter.names_exclude
									return ne and ne.TRACKING and ne.TRACKING[knownnames_validate.TRACKING[i]] or false
								end,
								set = function(info, i, value) SetNameFilter(id, false, "TRACKING", knownnames_validate.TRACKING[i], value) end,
							},
						},
					},
				},
			},
			target = {
				order = 111,
				type = "select",
				name = L["OPTIONS_GROUP_TARGET_NAME"],
				desc = L["OPTIONS_GROUP_TARGET_DESC"],
				values = {
					focus = FOCUS, -- Blizzard global strings
					pet = PET,
					player = PLAYER,
					target = TARGET,
					vehicle = L["UNIT_VEHICLE"],
				},
				get = function(info) return ElkBuffBars.db.profile.bargroups[id].target end,
				set = function(info, v)
					local bg = ElkBuffBars.bargroups[id]
					bg.layout.target = v
					bg:UpdateData()
				end,
			},
			clickthrough = {
				order = 112,
				type = "toggle",
				width = "double",
				name = L["OPTIONS_GROUP_CLICKTHROUGH_NAME"],
				desc = L["OPTIONS_GROUP_CLICKTHROUGH_DESC"],
				get = function(info) return ElkBuffBars.db.profile.bargroups[id].bars.clickthrough end,
				set = function(info, v)
					local bg = ElkBuffBars.bargroups[id]
					bg.layout.bars.clickthrough = v
					bg:SetLayout()
				end,
			},
			copylayout = {
				order = 113,
				type = "input",
				name = L["OPTIONS_GROUP_COPYLAYOUT_NAME"],
				desc = L["OPTIONS_GROUP_COPYLAYOUT_DESC"],
				usage = L["OPTIONS_GROUP_COPYLAYOUT_USAGE"],
				get = false,
				set = function(info, v)
					v = tonumber(v)
					if v ~= id and ElkBuffBars.bargroups[v] then
						ElkBuffBars:CopyBarLayout(ElkBuffBars.bargroups[id].layout, ElkBuffBars.bargroups[v].layout)
					end
				end,
			},
			resetpos = {
				order = 114,
				type = "execute",
				name = L["OPTIONS_GROUP_RESETPOSITION_NAME"],
				desc = L["OPTIONS_GROUP_RESETPOSITION_DESC"],
				func = function()
					local bg = ElkBuffBars.bargroups[id]
					bg.layout.x = nil
					bg.layout.y = nil
					bg.stickto = nil
					bg.stickside = nil
					bg:SetPosition()
				end,
			},
			remove = {
				order = 115,
				type = "execute", confirm = true,
				name = L["OPTIONS_GROUP_REMOVE_NAME"],
				desc = L["OPTIONS_GROUP_REMOVE_DESC"],
				func = function()
					ElkBuffBars:RemoveBarGroup(id)
				end,
			},
		}
	}
end
