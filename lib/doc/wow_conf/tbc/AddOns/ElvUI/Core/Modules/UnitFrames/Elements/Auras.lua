local E, L, V, P, G = unpack(ElvUI)
local UF = E:GetModule('UnitFrames')
local NP = E:GetModule('NamePlates')
local AB = E:GetModule('ActionBars')
local LSM = E.Libs.LSM

local _G = _G
local format, strlower = format, strlower
local tinsert, strsplit, strmatch = tinsert, strsplit, strmatch
local sort, wipe, unpack, next, floor = sort, wipe, unpack, next, floor

local CreateFrame = CreateFrame
local IsAltKeyDown = IsAltKeyDown
local IsControlKeyDown = IsControlKeyDown
local IsShiftKeyDown = IsShiftKeyDown
local UnitCanAttack = UnitCanAttack
local UnitIsFriend = UnitIsFriend
local UnitIsUnit = UnitIsUnit

UF.MatchGrowthY = { TOP = 'TOP', BOTTOM = 'BOTTOM' }
UF.MatchGrowthX = { LEFT = 'LEFT', RIGHT = 'RIGHT' }
UF.ExcludeStacks = {
	[113862] = 'Greater Invisibility',
	[324631] = 'Fleshcraft' -- Necrolord
}

UF.SmartPosition = {
	BUFFS_ON_DEBUFFS = {
		from = 'BUFFS', to = 'Debuffs',
		warning = format(L["This setting caused a conflicting anchor point, where '%s' would be attached to itself. Please check your anchor points. Setting '%s' to be attached to '%s'."], L["Buffs"], L["Debuffs"], L["Frame"]),
		func = function(db, buffs, debuffs)
			db.buffs.attachTo = 'DEBUFFS'
			buffs.attachTo = debuffs

			buffs.PostUpdate = nil
			debuffs.PostUpdate = UF.UpdateAuraSmartPoisition
		end
	},
	DEBUFFS_ON_BUFFS = {
		from = 'DEBUFFS', to = 'Buffs',
		warning = format(L["This setting caused a conflicting anchor point, where '%s' would be attached to itself. Please check your anchor points. Setting '%s' to be attached to '%s'."], L["Debuffs"], L["Buffs"], L["Frame"]),
		func = function(db, buffs, debuffs)
			db.debuffs.attachTo = 'BUFFS'
			debuffs.attachTo = buffs

			debuffs.PostUpdate = nil
			buffs.PostUpdate = UF.UpdateAuraSmartPoisition
		end
	}
}

UF.SmartPosition.FLUID_BUFFS_ON_DEBUFFS = E:CopyTable({fluid = true}, UF.SmartPosition.BUFFS_ON_DEBUFFS)
UF.SmartPosition.FLUID_DEBUFFS_ON_BUFFS = E:CopyTable({fluid = true}, UF.SmartPosition.DEBUFFS_ON_BUFFS)

function UF:Construct_Buffs(frame)
	local buffs = CreateFrame('Frame', '$parentBuffs', frame)
	buffs.PreSetPosition = self.SortAuras
	buffs.PostCreateIcon = self.Construct_AuraIcon
	buffs.PostUpdateIcon = self.PostUpdateAura
	buffs.SetPosition = self.SetPosition
	buffs.PreUpdate = self.PreUpdateAura
	buffs.CustomFilter = self.AuraFilter
	buffs.stacks = {}
	buffs.rows = {}
	buffs.type = 'buffs'

	buffs:SetFrameLevel(frame.RaisedElementParent.AuraLevel)
	buffs:SetSize(1, 1)

	return buffs
end

function UF:Construct_Debuffs(frame)
	local debuffs = CreateFrame('Frame', '$parentDebuffs', frame)
	debuffs.PreSetPosition = self.SortAuras
	debuffs.PostCreateIcon = self.Construct_AuraIcon
	debuffs.PostUpdateIcon = self.PostUpdateAura
	debuffs.SetPosition = self.SetPosition
	debuffs.PreUpdate = self.PreUpdateAura
	debuffs.CustomFilter = self.AuraFilter
	debuffs.stacks = {}
	debuffs.rows = {}
	debuffs.type = 'debuffs'

	debuffs:SetFrameLevel(frame.RaisedElementParent.AuraLevel)
	debuffs:SetSize(1, 1)

	return debuffs
end

function UF:GetAuraRow(element, row, col, growthY, width, height, anchor, inversed, middle)
	local holder = element.rows[row]
	if not holder then
		holder = CreateFrame('Frame', '$parentRow'..row, element)
		element.rows[row] = holder
	end

	holder:SetSize(col * width, height)

	-- update the holder only when the amount of rows changes
	if element.currentRow ~= row then
		element.currentRow = row

		holder:ClearAllPoints()
		element:Height((row + 1) * height)

		local last = element.rows[row - 1]
		if last and holder ~= last then
			if middle then
				holder:SetPoint(middle..anchor, last, E.InversePoints[middle]..anchor)
			elseif growthY == 1 then
				holder:SetPoint(anchor, last, inversed)
			else
				holder:SetPoint(inversed, last, anchor)
			end
		elseif middle then
			holder:SetPoint(middle..anchor, element)
		else
			holder:SetPoint(anchor, element)
		end
	end

	return holder
end

function UF:GetAuraPosition(element)
	local spacing = element.spacing or 0
	local width = (element.size or 16) + spacing
	local height = (not element.height and width) or element.height + spacing
	local cols = floor(element:GetWidth() / width + 0.5)

	local growthX = element.growthX == 'LEFT' and -1 or 1
	local growthY = element.growthY == 'DOWN' and -1 or 1
	local anchor = element.initialAnchor or 'BOTTOMLEFT'
	local inversed = E.InversePoints[anchor]

	local y = growthY == 1 and 'BOTTOM' or 'TOP'
	local x = growthX == 1 and 'LEFT' or 'RIGHT'

	local center = anchor == 'TOP' or anchor == 'BOTTOM'
	local side = anchor == 'LEFT' or anchor == 'RIGHT'
	local point = (center or side) and (y..x) or anchor

	return anchor, inversed, growthX, growthY, width, height, cols, point, side and y
end

function UF:SetAuraPosition(element, button, index, anchor, inversed, growthX, growthY, width, height, cols, point, middle)
	local z, col, row = index - 1, 0, 0
	if cols > 0 then col, row = z % cols, floor(z / cols) end

	local holder = UF:GetAuraRow(element, row, col + 1, growthY, width, height, anchor, inversed, middle)
	button:ClearAllPoints()
	button:SetPoint(point, holder, point, col * width * growthX, growthY)
end

function UF:SetPosition(from, to)
	if to < from then return end

	local anchor, inversed, growthX, growthY, width, height, cols, point, middle = UF:GetAuraPosition(self)
	for index = from, to do
		local button = self[index]
		if not button then break end

		UF:SetAuraPosition(self, button, index, anchor, inversed, growthX, growthY, width, height, cols, point, middle)
	end
end

function UF:Aura_OnClick()
	local keyDown = IsShiftKeyDown() and 'SHIFT' or IsAltKeyDown() and 'ALT' or IsControlKeyDown() and 'CTRL'
	if not keyDown then return end

	local spellName, spellID = self.name, self.spellID
	local listName = UF.db.modifiers[keyDown]
	if spellName and spellID and listName ~= 'NONE' then
		if not E.global.unitframe.aurafilters[listName].spells[spellID] then
			E:Print(format(L["The spell '%s' has been added to the '%s' unitframe aura filter."], spellName, listName))
			E.global.unitframe.aurafilters[listName].spells[spellID] = { enable = true, priority = 0 }
		else
			E.global.unitframe.aurafilters[listName].spells[spellID].enable = true
		end

		UF:Update_AllFrames()
	end
end

function UF:Construct_AuraIcon(button)
	button:SetTemplate(nil, nil, nil, nil, true)

	button.cd:SetReverse(true)
	button.cd:SetDrawEdge(false)
	button.cd:SetInside(button, UF.BORDER, UF.BORDER)

	button.icon:SetInside(button, UF.BORDER, UF.BORDER)
	button.icon:SetDrawLayer('ARTWORK')

	button.count:ClearAllPoints()
	button.count:Point('BOTTOMRIGHT', 1, 1)
	button.count:SetJustifyH('RIGHT')

	button.overlay:SetTexture()
	button.stealable:SetTexture()

	button:RegisterForClicks('RightButtonUp')
	button:SetScript('OnClick', UF.Aura_OnClick)

	button.cd.CooldownOverride = 'unitframe'
	E:RegisterCooldown(button.cd)

	local auras = button:GetParent()
	local frame = auras:GetParent()
	button.db = frame.db and frame.db[auras.type]

	UF:UpdateAuraSettings(button)
end

function UF:UpdateAuraSettings(button)
	local db = button.db
	if db then
		local point = db.countPosition or 'CENTER'
		button.count:ClearAllPoints()
		button.count:SetJustifyH(point:find('RIGHT') and 'RIGHT' or 'LEFT')
		button.count:Point(point, db.countXOffset, db.countYOffset)
		button.count:FontTemplate(LSM:Fetch('font', db.countFont), db.countFontSize, db.countFontOutline)
	end

	button.needsIconTrim = true
	button.needsUpdateCooldownPosition = true
end

function UF:EnableDisable_Auras(frame)
	if frame.db.debuffs.enable or frame.db.buffs.enable then
		if not frame:IsElementEnabled('Auras') then
			frame:EnableElement('Auras')
		end
	else
		if frame:IsElementEnabled('Auras') then
			frame:DisableElement('Auras')
		end
	end
end

function UF:UpdateAuraCooldownPosition(button)
	button.cd.timer.text:ClearAllPoints()
	local point = (button.db and button.db.durationPosition) or 'CENTER'
	if point == 'CENTER' then
		button.cd.timer.text:Point(point, 1, 0)
	else
		local bottom, right = point:find('BOTTOM'), point:find('RIGHT')
		button.cd.timer.text:Point(point, right and -1 or 1, bottom and 1 or -1)
	end

	button.needsUpdateCooldownPosition = nil
end

function UF:Configure_AllAuras(frame)
	if frame.Buffs then frame.Buffs:ClearAllPoints() end
	if frame.Debuffs then frame.Debuffs:ClearAllPoints() end

	UF:Configure_Auras(frame, 'Buffs')
	UF:Configure_Auras(frame, 'Debuffs')
end

function UF:GetAuraElements(frame)
	if frame.isNamePlate then
		return frame.Buffs_, frame.Debuffs_
	else
		return frame.Buffs, frame.Debuffs
	end
end

function UF:SetSmartPosition(frame, db)
	if frame.isNamePlate then db = NP:PlateDB(frame) end

	local position, fluid = db.smartAuraPosition
	local buffs, debuffs = UF:GetAuraElements(frame)
	local info = UF.SmartPosition[position]
	if info then
		local TO = db[strlower(info.to)]
		if TO.attachTo == info.from then
			TO.attachTo = 'FRAME'

			E:Print(info.warning)

			local element = (info.to == 'Debuffs' and debuffs) or buffs
			element.attachTo = frame
			element:ClearAllPoints()
			element:Point(element.initialAnchor, element.attachTo, element.anchorPoint, element.xOffset, element.yOffset)
		end

		fluid = info.fluid
		info.func(db, buffs, debuffs, info.isFuild)
	else
		buffs.PostUpdate = nil
		debuffs.PostUpdate = nil
	end

	if db.debuffs.attachTo == 'BUFFS' and db.buffs.attachTo == 'DEBUFFS' then
		E:Print(format(L["%s frame has a conflicting anchor point. Forcing the Buffs to be attached to the main unitframe."], E:StringTitle(frame:GetName())))
		db.buffs.attachTo = 'FRAME'
	end

	return position, fluid
end

function UF:Configure_Auras(frame, which)
	local db = frame.db
	local auras = frame[which]
	local auraType = which:lower()
	local settings = db[auraType]
	auras.db = settings

	-- not onUpdateFrequency ignores targettarget
	auras.auraSort = UF.SortAuraFuncs[not frame.onUpdateFrequency and settings.sortMethod]

	auras.attachTo = UF:GetAuraAnchorFrame(frame, settings.attachTo)
	auras.smartPosition, auras.smartFluid = UF:SetSmartPosition(frame, db)

	if settings.sizeOverride and settings.sizeOverride > 0 then
		auras:Width(settings.perrow * settings.sizeOverride + ((settings.perrow - 1) * settings.spacing))
	else
		local xOffset = 0
		if frame.USE_POWERBAR_OFFSET then
			if frame.ORIENTATION == 'MIDDLE' then
				if settings.attachTo ~= 'POWER' then
					xOffset = frame.POWERBAR_OFFSET * 2
				end -- if its middle and power we dont want an offset.
			else
				xOffset = frame.POWERBAR_OFFSET
			end
		end

		auras:Width((frame.UNIT_WIDTH - UF.SPACING*2) - xOffset)
	end

	auras.spacing = settings.spacing
	auras.num = settings.perrow * settings.numrows
	auras.size = settings.sizeOverride ~= 0 and settings.sizeOverride or (((frame.UNIT_WIDTH - (settings.spacing * (auras.num / settings.numrows - 1)) - ((UF.thinBorders or E.twoPixelsPlease) and 0 or 2)) / auras.num) * settings.numrows)
	auras.height = not settings.keepSizeRatio and settings.height
	auras.forceShow = frame.forceShowAuras
	auras.disableMouse = settings.clickThrough
	auras.anchorPoint = settings.anchorPoint
	auras.growthX = UF.MatchGrowthX[settings.anchorPoint] or settings.growthX
	auras.growthY = UF.MatchGrowthY[settings.anchorPoint] or settings.growthY
	auras.initialAnchor = E.InversePoints[settings.anchorPoint]
	auras.filterList = UF:ConvertFilters(auras, settings.priority)
	auras.numAuras = settings.perrow
	auras.numRows = settings.numrows

	local x, y
	if settings.attachTo == 'HEALTH' or settings.attachTo == 'POWER' then
		x, y = E:GetXYOffset(auras.anchorPoint, -UF.BORDER, UF.BORDER)
	elseif settings.attachTo == 'FRAME' then
		x, y = E:GetXYOffset(auras.anchorPoint, UF.SPACING, 0)
	else
		x, y = E:GetXYOffset(auras.anchorPoint, 0, UF.SPACING)
	end

	auras.xOffset = x + settings.xOffset + (settings.attachTo == 'FRAME' and frame.ORIENTATION ~= 'LEFT' and frame.POWERBAR_OFFSET or 0)
	auras.yOffset = y + settings.yOffset

	auras:ClearAllPoints()
	auras:Point(auras.initialAnchor, auras.attachTo, auras.anchorPoint, auras.xOffset, auras.yOffset)

	local index = 1
	while auras[index] do
		local button = auras[index]
		if button then
			button.db = settings
			UF:UpdateAuraSettings(button)
			button:SetBackdropBorderColor(unpack(E.media.unitframeBorderColor))
		end

		index = index + 1
	end

	if settings.enable then
		auras:Show()
	else
		auras:Hide()
	end
end

function UF.SortAuraFunc(a, b)
	local frame = b and a and a:GetParent()
	if frame and frame.db and a:IsShown() then
		if not b:IsShown() then return true else
			return frame.auraSort(a, b, frame.db.sortDirection)
		end
	end
end

function UF:SortAuras()
	if self.auraSort then sort(self, UF.SortAuraFunc) end
	return 1, self.visibleAuras or self.visibleBuffs or self.visibleDebuffs
end

function UF:PreUpdateAura()
	wipe(self.stacks)

	self.currentRow = nil
end

function UF:PostUpdateAura(_, button)
	local db = (self.isNameplate and NP.db.colors) or UF.db.colors
	local enemyNPC = not button.isFriend and not button.isPlayer

	local r, g, b
	if button.isDebuff then
		if enemyNPC then
			if db.auraByType then
				r, g, b = .9, .1, .1
			end
		elseif db.auraByDispels and button.debuffType and E.BadDispels[button.spellID] and E:IsDispellableByMe(button.debuffType) then
			r, g, b = .05, .85, .94
		elseif db.auraByType then
			local color = _G.DebuffTypeColor[button.debuffType] or _G.DebuffTypeColor.none
			r, g, b = color.r * 0.6, color.g * 0.6, color.b * 0.6
		end
	elseif db.auraByDispels and button.isStealable and not button.isFriend then
		r, g, b = .93, .91, .55
	end

	if not r then
		r, g, b = unpack((self.isNameplate and E.media.bordercolor) or E.media.unitframeBorderColor)
	end

	button:SetBackdropBorderColor(r, g, b)
	button.icon:SetDesaturated(button.isDebuff and enemyNPC and button.canDesaturate)
	button.matches = nil -- stackAuras

	if button.needsIconTrim then
		AB:TrimIcon(button)
		button.needsIconTrim = nil
	end

	if button.needsUpdateCooldownPosition and (button.cd and button.cd.timer and button.cd.timer.text) then
		UF:UpdateAuraCooldownPosition(button)
	end
end

function UF:GetSmartAuraElements(auras)
	local Buffs, Debuffs = UF:GetAuraElements(auras:GetParent())
	if auras == Buffs then
		return Debuffs, Buffs, auras.visibleBuffs
	else
		return Buffs, Debuffs, auras.visibleDebuffs
	end
end

function UF:UpdateAuraSmartPoisition()
	local element, other, visible = UF:GetSmartAuraElements(self)

	if visible == 0 then
		if self.smartFluid then
			element:ClearAllPoints()
			element:Point(other.initialAnchor, other.attachTo, other.anchorPoint, other.xOffset, other.yOffset)
		else
			other:Height(other.size)
		end
	else
		element:ClearAllPoints()
		element:Point(element.initialAnchor, element.attachTo, element.anchorPoint, element.xOffset, element.yOffset)
	end
end

function UF:ConvertFilters(auras, priority)
	if not priority or priority == '' then return end

	local list = auras.filterList or {}
	if next(list) then wipe(list) end

	local special, filters = G.unitframe.specialFilters, E.global.unitframe.aurafilters

	for _, name in next, {strsplit(',', priority)} do
		local friend, enemy = strmatch(name, '^Friendly:([^,]*)'), strmatch(name, '^Enemy:([^,]*)')
		local real = friend or enemy or name
		local custom = filters[real]

		if special[real] or custom then
			tinsert(list, {
				name = real,
				custom = custom,
				status = (friend and 1) or (enemy and 2)
			})
		end
	end

	if next(list) then
		return list
	end
end

function UF:CheckFilter(source, spellName, spellID, canDispel, isFriend, isPlayer, unitIsCaster, myPet, otherPet, isBossDebuff, allowDuration, noDuration, castByPlayer, nameplateShowSelf, nameplateShowAll, filterList)
	for _, data in next, filterList do
		local status = data.status
		local skip = (status == 1 and not isFriend) or (status == 2 and isFriend)
		if not skip then
			-- Custom Filters
			local custom = data.custom
			if custom then
				local which, list = custom.type, custom.spells
				if which and list and next(list) then
					local spell = list[spellID] or list[spellName]
					if spell and spell.enable then
						if which == 'Blacklist' then
							return false
						elseif allowDuration then
							return true, spell.priority
						end
					end
				end
			-- Special Filters
			else
				-- Whitelists
				local name = data.name
				local found = (allowDuration and ((name == 'Personal' and isPlayer)
					or (name == 'nonPersonal' and not isPlayer)
					or (name == 'Boss' and isBossDebuff)
					or (name == 'MyPet' and myPet)
					or (name == 'OtherPet' and otherPet)
					or (name == 'CastByUnit' and source and unitIsCaster)
					or (name == 'notCastByUnit' and source and not unitIsCaster)
					or (name == 'Dispellable' and canDispel)
					or (name == 'notDispellable' and not canDispel)
					or (name == 'CastByNPC' and not castByPlayer)
					or (name == 'CastByPlayers' and castByPlayer)
					or (name == 'BlizzardNameplate' and (nameplateShowAll or (nameplateShowSelf and (isPlayer or myPet))))))
				-- Blacklists
				or ((name == 'blockCastByPlayers' and castByPlayer)
				or (name == 'blockNoDuration' and noDuration)
				or (name == 'blockNonPersonal' and not isPlayer)
				or (name == 'blockDispellable' and canDispel)
				or (name == 'blockNotDispellable' and not canDispel)) and 0

				if found then
					return found ~= 0
				end
			end
		end
	end
end

function UF:AuraFilter(unit, button, name, icon, count, debuffType, duration, expiration, source, isStealable, nameplateShowPersonal, spellID, _, isBossDebuff, castByPlayer, nameplateShowAll)
	if not name then return end -- checking for an aura that is not there, pass nil to break while loop

	local db = button.db or self.db
	if not db then return true end

	local dispel = self.type == 'debuffs' and debuffType and E:IsDispellableByMe(debuffType)

	-- already set by oUF:
	--- button.caster = source
	--- button.filter = filter
	--- button.isDebuff = isDebuff
	--- button.isPlayer = source == 'player' or source == 'vehicle'

	button.canDesaturate = db.desaturate
	button.myPet = source == 'pet'
	button.otherPet = source and not UnitIsUnit('pet', source) and strmatch(source, 'pet%d+')
	button.isFriend = unit and UnitIsFriend('player', unit) and not UnitCanAttack('player', unit)
	button.unitIsCaster = unit and source and UnitIsUnit(unit, source)
	button.canDispel = dispel or (self.type == 'buffs' and isStealable)
	button.isStealable = isStealable
	button.debuffType = debuffType
	button.duration = duration
	button.expiration = expiration
	button.noTime = duration == 0 and expiration == 0
	button.stackCount = count
	button.texture = icon
	button.spellID = spellID
	button.name = name
	button.priority = 0

	if db.stackAuras and not UF.ExcludeStacks[spellID] then
		local matching = source and castByPlayer and format('%s:%s', source, name) or name
		local stack = self.stacks[matching]
		if not stack then
			self.stacks[matching] = button
		elseif stack.texture == icon then
			stack.matches = (stack.matches or 1) + ((count and count > 0 and count) or 1)
			stack.count:SetText(stack.matches)

			return false
		end
	end

	local noDuration = (not duration or duration == 0)
	local allowDuration = noDuration or (duration and duration > 0 and (not db.maxDuration or db.maxDuration == 0 or duration <= db.maxDuration) and (not db.minDuration or db.minDuration == 0 or duration >= db.minDuration))

	if self.filterList then
		local filterCheck, spellPriority = UF:CheckFilter(source, name, spellID, button.canDispel, button.isFriend, button.isPlayer, button.unitIsCaster, button.myPet, button.otherPet, isBossDebuff, allowDuration, noDuration, castByPlayer, nameplateShowPersonal, nameplateShowAll, self.filterList)
		if spellPriority then button.priority = spellPriority end -- this is the only difference from auarbars code
		return filterCheck
	else
		return allowDuration -- Allow all auras to be shown when the filter list is empty, while obeying duration sliders
	end
end
