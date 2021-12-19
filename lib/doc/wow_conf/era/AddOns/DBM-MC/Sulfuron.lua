local mod	= DBM:NewMod("Sulfuron", "DBM-MC", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20211031024951")
mod:SetCreatureID(12098)--, 11662
mod:SetEncounterID(669)
mod:SetModelID(13030)
mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 19779 19780 19776 20294",
	"SPELL_CAST_START 19775"
)

--TODO, nameplate aura if classic API supports it enough
local warnInspire		= mod:NewTargetNoFilterAnnounce(19779, 2, nil, "Tank|Healer", 2)
local warnHandRagnaros	= mod:NewTargetAnnounce(19780, 2, nil, false, 2)
local warnShadowPain	= mod:NewTargetAnnounce(19776, 2, nil, false, 2)
local warnImmolate		= mod:NewTargetAnnounce(20294, 2, nil, false, 2)

local specWarnHeal		= mod:NewSpecialWarningInterrupt(19775, "HasInterrupt", nil, nil, 1, 2)

local timerInspire		= mod:NewTargetTimer(10, 19779, nil, "Tank|Healer", 2, 5, nil, DBM_CORE_L.TANK_ICON..DBM_CORE_L.HEALER_ICON)

local castsPerGUID = {}

function mod:OnCombatEnd()
	table.wipe(castsPerGUID)
end

do
	local Inspire, HandRag, ShadowPain, Immolate = DBM:GetSpellInfo(19779), DBM:GetSpellInfo(19780), DBM:GetSpellInfo(19776), DBM:GetSpellInfo(20294)
	function mod:SPELL_AURA_APPLIED(args)
		local spellName = args.spellName
		--if args.spellId == 19779 then
		if spellName == Inspire then
			warnInspire:Show(args.destName)
			timerInspire:Start(args.destName)
		--elseif args.spellId == 19780 and args:IsDestTypePlayer() then
		elseif spellName == HandRag and args:IsDestTypePlayer() then
			warnHandRagnaros:CombinedShow(0.3, args.destName)
		--elseif args.spellId == 19776 and args:IsDestTypePlayer() then
		elseif spellName == ShadowPain and args:IsDestTypePlayer() then
			warnShadowPain:CombinedShow(0.3, args.destName)
		--elseif args.spellId == 20294 and args:IsDestTypePlayer() then
		elseif spellName == Immolate and args:IsDestTypePlayer() then
			warnImmolate:CombinedShow(0.3, args.destName)
		end
	end

	function mod:SPELL_AURA_REMOVED(args)
		--if args.spellId == 19779 then
		if args.spellName == Inspire then
			timerInspire:Stop(args.destName)
		end
	end
end

do
	local DarkMending = DBM:GetSpellInfo(19775)
	function mod:SPELL_CAST_START(args)
		--if args.spellId == 19775 then
		if args.spellName == DarkMending and args:IsSrcTypeHostile() then
			if not castsPerGUID[args.sourceGUID] then
				castsPerGUID[args.sourceGUID] = 0
			end
			castsPerGUID[args.sourceGUID] = castsPerGUID[args.sourceGUID] + 1
			local count = castsPerGUID[args.sourceGUID]
			if self:CheckInterruptFilter(args.sourceGUID, false, false) then
				specWarnHeal:Show(args.sourceName, count)
				if count == 1 then
					specWarnHeal:Play("kick1r")
				elseif count == 2 then
					specWarnHeal:Play("kick2r")
				elseif count == 3 then
					specWarnHeal:Play("kick3r")
				elseif count == 4 then
					specWarnHeal:Play("kick4r")
				elseif count == 5 then
					specWarnHeal:Play("kick5r")
				else
					specWarnHeal:Play("kickcast")
				end
			end
		end
	end
end
