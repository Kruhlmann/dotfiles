local mod	= DBM:NewMod("Magmadar", "DBM-MC", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("20211031024951")
mod:SetCreatureID(11982)
mod:SetEncounterID(664)
mod:SetModelID(10193)
mod:SetHotfixNoticeRev(20191205000000)--2019, 12, 05

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED 19451 19428 363731",
	"SPELL_AURA_REMOVED 19451",
	"SPELL_CAST_SUCCESS 19408"
)

--[[
(ability.id = 19408 or ability.id = 19451) and type = "cast"
 or ability.id = 19428 and type = "applydebuff"
 or (source.type = "NPC" and source.firstSeen = timestamp) or (target.type = "NPC" and target.firstSeen = timestamp)
--]]
local warnPanic			= mod:NewSpellAnnounce(19408, 2)
local warnEnrage		= mod:NewTargetNoFilterAnnounce(19451, 3, nil , "Healer|Tank|RemoveEnrage", 2)
local warnConflagration	= mod:NewTargetNoFilterAnnounce(19428, 2, nil , false)

local specWarnEnrage	= mod:NewSpecialWarningDispel(19451, "RemoveEnrage", nil, nil, 1, 6)

local timerPanicCD		= mod:NewCDTimer(30, 19408, nil, nil, nil, 2)--30-50
local timerEnrage		= mod:NewBuffActiveTimer(8, 19451, nil, nil, nil, 5, nil, DBM_CORE_L.ENRAGE_ICON)
local timerAddsCD		= mod:NewAddsTimer(60, 19497, nil, "-Healer", nil, 1, nil, DBM_CORE_L.DAMAGE_ICON)--Use 363731 if it has better icon?

function mod:OnCombatStart(delay)
	if self:IsSeasonal() then
		timerAddsCD:Start(21-delay)
	end
end

do
	local Enrage, Conflagration, volcanicUnrest = DBM:GetSpellInfo(19451), DBM:GetSpellInfo(19428), DBM:GetSpellInfo(363731)
	function mod:SPELL_AURA_APPLIED(args)
		--if args.spellId == 19451 then
		if args.spellName == Enrage and args:IsDestTypeHostile() then
			if self.Options.SpecWarn19451dispel then
				specWarnEnrage:Show(args.destName)
				specWarnEnrage:Play("enrage")
			else
				warnEnrage:Show(args.destName)
			end
			timerEnrage:Start()
		elseif args.spellName == Conflagration and args:IsDestTypePlayer() then
			warnConflagration:CombinedShow(0.5, args.destName)
		elseif args.spellName == volcanicUnrest and args:GetDestCreatureID() == 184367 and self:AntiSpam(5, 1) then
			timerAddsCD:Start()
		end
	end

	function mod:SPELL_AURA_REMOVED(args)
		--if args.spellId == 19451 then
		if args.spellName == Enrage and args:IsDestTypeHostile() then
			timerEnrage:Stop()
		end
	end
end

do
	local Panic = DBM:GetSpellInfo(19408)
	function mod:SPELL_CAST_SUCCESS(args)
		--if args.spellId == 19408 then
		if args.spellName == Panic then
			warnPanic:Show()
			timerPanicCD:Start()
		end
	end
end
