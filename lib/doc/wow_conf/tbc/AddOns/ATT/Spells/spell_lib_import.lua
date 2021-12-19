local addon, ATTdbs = ...

ATTdbs.dbImport = {

	["DRUID"] = {
		{	["ability"] = 29166, ["cooldown"] = 360,}, -- Innervate --
		{	["ability"] = 22812, ["cooldown"] = 60,},  -- Barkskin -
		{	["ability"] = 8983, ["cooldown"] = 60,},   -- Bash --
		{	["ability"] = 17116, ["cooldown"] = 180,}, -- Nature's Swiftness - talent
		{	["ability"] = 27009, ["cooldown"] = 60,},  -- Natures Grasp --talent rank
		{	["ability"] = 33831, ["cooldown"] = 180,}, -- Force of Nature	-talent	
		{	["ability"] = 5229, ["cooldown"] = 60,},  -- Enrage
		{	["ability"] = 26999, ["cooldown"] = 180,},  -- Frenzied Regeneration
		{	["ability"] = 27012, ["cooldown"] = 60,}, -- Hurricane
		{	["ability"] = 26983, ["cooldown"] = 600,},  -- Tranquility
		{	["ability"] = 33357, ["cooldown"] = 300,},  -- Dash	
		{	["ability"] = 5209, ["cooldown"] = 600,},  -- Challenging Roar *
		{	["ability"] = 27048, ["cooldown"] = 5,},  -- Cower *
		{	["ability"] = 27047, ["cooldown"] = 5,},  -- Growl *
		{	["ability"] = 9913, ["cooldown"] = 10,},  -- Prowl *
		{	["ability"] = 26994, ["cooldown"] = 1200,},  -- Rebirth * !
		{	["ability"] = 16864, ["cooldown"] = 10,},  -- Omen of Clarity *
		{	["ability"] = 27011, ["cooldown"] = 6,},  -- Faerie Fire (Feral) *
		{	["ability"] = 16979, ["cooldown"] = 15,},  -- Feral Charge *
		{	["ability"] = 18562, ["cooldown"] = 15,},  -- Swiftmend *
	},
	["HUNTER"] = {
		{	["ability"] = 19503, ["cooldown"] = 30,},  -- Scatter Shot --talent
		{	["ability"] = 19263, ["cooldown"] = 300,},  -- Deterrence --talent
		{	["ability"] = 14311, ["cooldown"] = 30,},  -- Freezing Trap
		{	["ability"] = 13809, ["cooldown"] = 30,},  -- Frost Trap
		{	["ability"] = 34600, ["cooldown"] = 30,},  -- Snake Trap
		{	["ability"] = 27025, ["cooldown"] = 30,},  -- Explosive Trap
		{	["ability"] = 27023, ["cooldown"] = 30,},  -- Immolation Trap
		{	["ability"] = 34490, ["cooldown"] = 20,},  -- Silencing Shot -- talent
		{	["ability"] = 27068, ["cooldown"] = 120,},  -- Wyvern Sting -- talent rank
		{	["ability"] = 19577, ["cooldown"] = 60,},  -- Intimidation -- talent
		{	["ability"] = 3045, ["cooldown"] = 300,},  -- Rapid Fire
		{	["ability"] = 5384, ["cooldown"] = 30,},  -- Feign Death
		{	["ability"] = 19574, ["cooldown"] = 120,},  -- Bestial Wrath
		{	["ability"] = 23989, ["cooldown"] = 300,},  -- Readiness
		{	["ability"] = 34477, ["cooldown"] = 120,},  -- Misdirection
		{	["ability"] = 1543, ["cooldown"] = 20,},  -- Flare
		{	["ability"] = 14327, ["cooldown"] = 30,},  -- Scare Beast
		{	["ability"] = 27019, ["cooldown"] = 6,},  -- Arcane Shot *
		{	["ability"] = 27015, ["cooldown"] = 5,},  -- Disengage *
		{	["ability"] = 27020, ["cooldown"] = 8,},  -- Distracting Shot *
		{	["ability"] = 36916, ["cooldown"] = 5,},  -- Mongoose Bite *
		{	["ability"] = 27021, ["cooldown"] = 10,},  -- Multi-Shot *
		{	["ability"] = 27014, ["cooldown"] = 6,},  -- Raptor Strike *
		{	["ability"] = 19801, ["cooldown"] = 20,},  -- Tranquilizing Shot *
		{	["ability"] = 27022, ["cooldown"] = 60,},  -- Volley *
		{	["ability"] = 27065, ["cooldown"] = 6,},  -- Aimed Shot *
		{	["ability"] = 27067, ["cooldown"] = 5,},  -- Counterattack *
	},
	["MAGE"] = 	{
		{	["ability"] = 1953, ["cooldown"] = 15,},   -- Blink
		{	["ability"] = 2139, ["cooldown"] = 24,},   -- Counterspell
		{	["ability"] = 45438, ["cooldown"] = 300,}, -- Ice Block
		{	["ability"] = 12472, ["cooldown"] = 300,},  -- Icy Veins -- talent
		{	["ability"] = 31687, ["cooldown"] = 180,},  -- Summon Water Elemental -- talent
		{	["ability"] = 12043, ["cooldown"] = 180,}, -- Presence of Mind -- talent
		{	["ability"] = 11129, ["cooldown"] = 180,}, -- Combustion -- talent
        {	["ability"] = 27087, ["cooldown"] = 10,},  -- Cone of Cold
        {	["ability"] = 33043, ["cooldown"] = 20,},  -- Dragon's Breath -- talent rank
        {	["ability"] = 12042, ["cooldown"] = 180,},  -- Arcane Power -- talent
        {	["ability"] = 11958, ["cooldown"] = 480,}, -- Cold Snap	 -- talent
        {	["ability"] = 27088, ["cooldown"] = 25,}, -- Frost Nova
        {	["ability"] = 33405, ["cooldown"] = 30,}, -- Ice Barrier
        {	["ability"] = 33933, ["cooldown"] = 30,}, -- Blast Wave
        {	["ability"] = 66, ["cooldown"] = 300,}, -- Invisibility
        {   ["ability"] = 28734,  ["cooldown"] = 30, ["race"] = {[1] = 10}, }, --Manatap belf
        {	["ability"] = 32796, ["cooldown"] = 30,},  -- Frost Ward
        {	["ability"] = 27128, ["cooldown"] = 30,},  -- Fire Ward
        {	["ability"] = 27079, ["cooldown"] = 8,},  -- Fire Blast
        {	["ability"] = 12051, ["cooldown"] = 480,},  -- Evocation
        {	["ability"] = 33938, ["cooldown"] = 6,},  -- Pyroblast	 -- talent * 
	},
	["PALADIN"] = {
		{	["ability"] = 10308, ["cooldown"] = 60,},  -- Hammer of Justice 
		{	["ability"] = 10278, ["cooldown"] = 300,}, -- Blessing of Protection
		{	["ability"] = 1044, ["cooldown"] = 25,},   -- Blessing of Freedom 
		{	["ability"] = 1020, ["cooldown"] = 300,},   -- Divine Shield
		{	["ability"] = 31884, ["cooldown"] = 180,}, -- Avenging Wrath
		{	["ability"] = 20066, ["cooldown"] = 60,},  -- Repentance
		{	["ability"] = 31842, ["cooldown"] = 180,}, -- Divine Illumination --talent
		{	["ability"] = 32700, ["cooldown"] = 30,}, -- Avengers Shield -- talent rank
		{	["ability"] = 20216, ["cooldown"] = 120,}, -- Divine Favor
		{	["ability"] = 27139, ["cooldown"] = 60,},  -- Holy Wrath
		{	["ability"] = 10326, ["cooldown"] = 30,}, -- Turn Evil
		{	["ability"] = 27148, ["cooldown"] = 30,}, -- Blessing of Sacrifice
		{	["ability"] = 5573, ["cooldown"] = 300,}, -- Divine Protection
		{	["ability"] = 27154, ["cooldown"] = 3600,}, -- Lay on Hands
		{	["ability"] = 5627, ["cooldown"] = 30,}, -- Turn Undead
		{	["ability"] = 20271, ["cooldown"] = 10,}, -- Judgement *
		{	["ability"] = 27180, ["cooldown"] = 6,}, -- Hammer of Wrath *
		{	["ability"] = 27138, ["cooldown"] = 15,}, -- Exorcism *
		{	["ability"] = 19752, ["cooldown"] = 3600,}, -- Divine Intervention *
		{	["ability"] = 27173, ["cooldown"] = 8,}, -- Consecration *
		{	["ability"] = 27179, ["cooldown"] = 10,}, -- Holy Shield *
		{	["ability"] = 33072, ["cooldown"] = 15,}, -- Holy Shock *
	},
	["PRIEST"] = {
		{	["ability"] = 10890, ["cooldown"] = 30,},  -- Psychic Scream 
	    {	["ability"] = 34433, ["cooldown"] = 300,}, -- Shadowfiend --here
	    {	["ability"] = 15487, ["cooldown"] = 45,}, -- Silence  --talent
		{	["ability"] = 10060, ["cooldown"] = 180,},  -- Power Infusion --talent
		{	["ability"] = 33206, ["cooldown"] = 120,}, -- Pain Suppression --talent
		{	["ability"] = 33072, ["cooldown"] = 120,}, -- Holy Shock
		{	["ability"] = 14751, ["cooldown"] = 180,}, -- Inner Focus
		{	["ability"] = 6346, ["cooldown"] = 180,}, -- Fear Ward
		{	["ability"] = 25429, ["cooldown"] = 30,}, -- Fade
	    {   ["ability"] = 2651,  ["cooldown"] = 180, ["race"] = {[1] = 4}, }, -- night elf
        {   ["ability"] = 32548,  ["cooldown"] = 300, ["race"] = {[1] = 12} , }, -- Symbol of Hope -dranei
        {   ["ability"] = 32676,  ["cooldown"] = 120, ["race"] = {[1] = 10} , }, --bloodelf
        {   ["ability"] = 25467,  ["cooldown"] = 180 ,["race"] = {[1] = 5} ,}, --Devouring Plague --undead
        {   ["ability"] = 44047,  ["cooldown"] = 30, ["race"] = {[1] = 11, [2] = 3,} ,}, --Chastise --dranei dwarf
        {   ["ability"] = 25437,  ["cooldown"] = 600, ["race"] = {[1] = 1, [2] = 3,}, },--Desperate Prayer --human dwarf
        {   ["ability"] = 25446,  ["cooldown"] = 30, ["race"] = {[1] = 4} , }, --Starshards --nelf
        {   ["ability"] = 25441,  ["cooldown"] = 180, ["race"] = {[1] = 1}, }, --Feedback --human
        {   ["ability"] = 28734,  ["cooldown"] = 30, ["race"] = {[1] = 10}, }, --Manatap belf
		{	["ability"] = 28275, ["cooldown"] = 360,}, -- Lightwell
		{	["ability"] = 15286, ["cooldown"] = 10,}, -- Vampiric Embrace
		{	["ability"] = 25375, ["cooldown"] = 8,}, --  Mind Blast
	},
	["ROGUE"] = {
		{	["ability"] = 1766, ["cooldown"] = 10,},   -- Kick
		{	["ability"] = 8643, ["cooldown"] = 20,},   -- Kidney Shot
		{	["ability"] = 26669, ["cooldown"] = 300, }, -- Evasion 
		{	["ability"] = 31224, ["cooldown"] = 60, }, -- Cloak of Shadows
		{	["ability"] = 26889, ["cooldown"] = 300,}, -- Vanish 
		{	["ability"] = 2094, ["cooldown"] = 180,},  -- Blind
		{	["ability"] = 11305, ["cooldown"] = 300,},  -- Sprint
		{	["ability"] = 14177, ["cooldown"] = 180,}, -- Cold Blood --talent
        {	["ability"] = 13750, ["cooldown"] = 300,}, -- Adrenaline Rush --talent
        {	["ability"] = 13877, ["cooldown"] = 120,}, -- Blade Flurry --talent
		{	["ability"] = 36554, ["cooldown"] = 30,}, -- Shadowstep --talent
		{	["ability"] = 14185, ["cooldown"] = 600,}, -- Preparation --talent
		{	["ability"] = 1725, ["cooldown"] = 30,}, -- Distract
		{	["ability"] = 27448, ["cooldown"] = 10,}, -- Feint
		{	["ability"] = 38764, ["cooldown"] = 10,}, -- Gouge *
		{	["ability"] = 1787, ["cooldown"] = 10,}, -- Stealth *
		{	["ability"] = 14278, ["cooldown"] = 20,}, -- Ghostly Strike *
		{	["ability"] = 14183, ["cooldown"] = 120,}, -- Premeditation *
		{	["ability"] = 14251, ["cooldown"] = 6,}, -- Riposte *
	},
	["SHAMAN"] = {
		{	["ability"] = 16188, ["cooldown"] = 180,}, -- Nature's Swiftness --talent
		{	["ability"] = 8177, ["cooldown"] = 15,},   -- Grounding Totem
		{	["ability"] = 30823, ["cooldown"] = 120,}, -- Shamanistic Rage - talent rank	
		{	["ability"] = 16166, ["cooldown"] = 180,}, -- Elemental Mastery - talent
		{	["ability"] = 25454, ["cooldown"] = 6,},   -- Earth Shock
		{	["ability"] = 25464, ["cooldown"] = 6,},   -- Frost Shock
		{	["ability"] = 25457, ["cooldown"] = 6,},   -- Flame Shock
		{	["ability"] = 16190, ["cooldown"] = 300,},   -- Mana Tide Totem --talent
		{	["ability"] = 25525, ["cooldown"] = 30,},   -- Stoneclaw Totem
		{	["ability"] = 2062, ["cooldown"] = 1200,}, -- Earth Elemental Totem
		{	["ability"] = 2894, ["cooldown"] = 1200,}, -- Fire Elemental Totem
		{	["ability"] = 32182, ["cooldown"] = 600,["race"] = {[1] = 11,} ,}, -- Heroism	--dranei
		{	["ability"] = 2825, ["cooldown"] = 600,["race"] = {[1] = 2, [2] = 6, [3] = 8} ,}, -- Bloodlust	--orc , tauren , troll
		{	["ability"] = 25442, ["cooldown"] = 6,},   -- Chain Lightning*
		{	["ability"] = 2484, ["cooldown"] = 15,},   -- Earthbind Totem
		{	["ability"] = 25547, ["cooldown"] = 15,},   -- Fire Nova Totem*
		{	["ability"] = 17364, ["cooldown"] = 10,},   -- Stormstrike
	},
	["WARLOCK"] = {
		{	["ability"] = 19647, ["cooldown"] = 24,},  -- Spell Lock
		{	["ability"] = 17928, ["cooldown"] = 40,}, -- Howl of Terror
		{	["ability"] = 27223, ["cooldown"] = 120,}, -- Death Coil 
		{	["ability"] = 30414, ["cooldown"] = 20,},   -- Shadowfury --talent rank
		{	["ability"] = 30546, ["cooldown"] = 15,},  -- Shadowburn -- talent rank
		{	["ability"] = 18708, ["cooldown"] = 900,}, -- Fel Domination --talent
		{	["ability"] = 18288, ["cooldown"] = 180,}, -- Amplify Curse
		{	["ability"] = 29858, ["cooldown"] = 300,}, -- Soulshatter
		{	["ability"] = 30910, ["cooldown"] = 60,}, -- Curse of Doom
		{	["ability"] = 30545, ["cooldown"] = 60,}, -- Soul Fire
		{	["ability"] = 28610, ["cooldown"] = 30,}, -- Shadow Ward	
		{	["ability"] = 1122, ["cooldown"] = 3600,}, -- Inferno
		{	["ability"] = 18540, ["cooldown"] = 3600,}, -- Ritual of Doom
	},
	["WARRIOR"] = {
		{	["ability"] = 6554, ["cooldown"] = 10,},   -- Pummel
		{	["ability"] = 23920, ["cooldown"] = 10,},  -- Spell Reflection
		{	["ability"] = 3411, ["cooldown"] = 30,},  -- Intervene
		{	["ability"] = 676, ["cooldown"] = 60,},    -- Disarm
		{	["ability"] = 5246, ["cooldown"] = 180,},     --  Intimidating Shout
		{	["ability"] = 12292, ["cooldown"] = 180,},     -- Death Wish --talent
		{	["ability"] = 12975, ["cooldown"] = 480,},     -- Last Stand --talent
		{	["ability"] = 12809, ["cooldown"] = 45,},  -- Concussion Blow --talent
		{	["ability"] = 29704, ["cooldown"] = 12,},     -- Shield Bash
		{	["ability"] = 11578, ["cooldown"] = 15,},  -- Charge
		{	["ability"] = 871, ["cooldown"] = 1800,},   -- Shield Wall
		{	["ability"] = 2565, ["cooldown"] = 5,},   -- Shield Block
		{	["ability"] = 20230, ["cooldown"] = 1800,},   -- Retaliation
		{	["ability"] = 1719, ["cooldown"] = 1800,},   -- Recklessness
		{	["ability"] = 12328, ["cooldown"] = 30,},   -- Sweeping Strikes
		{	["ability"] = 18499, ["cooldown"] = 30,},   -- Berserker Rage
		{	["ability"] = 25275, ["cooldown"] = 30,},   -- Intercept
		{	["ability"] = 25266, ["cooldown"] = 120,},   -- Mocking Blow
		{	["ability"] = 2687, ["cooldown"] = 60,},   -- Bloodrage *
		{	["ability"] = 1161, ["cooldown"] = 600,},   -- Challenging Shout *
		{	["ability"] = 355, ["cooldown"] = 10,},   -- Taunt *
		{	["ability"] = 1680, ["cooldown"] = 10,},   -- Whirlwind *
		{	["ability"] = 30335, ["cooldown"] = 6,},   -- Bloodthirst *
		{	["ability"] = 30330, ["cooldown"] = 6,},   -- Mortal Strike *
		{	["ability"] = 30356, ["cooldown"] = 6,},   -- Shield Slam *
	},

}

ATTdbs.dbRacial = {
    {["ability"] = 20600, ["cooldown"] = 180, ["race"] = 1 },
    {["ability"] = 20572, ["cooldown"] = 120, ["race"] = 2 },
    {["ability"] = 20594, ["cooldown"] = 180, ["race"] = 3 },
    {["ability"] = 20580, ["cooldown"] = 10, ["race"] = 4 },
    {["ability"] = 20577, ["cooldown"] = 120, ["race"] = 5 },
    {["ability"] = 7744,  ["cooldown"] = 120, ["race"] = 5,},
    {["ability"] = 20549,  ["cooldown"] = 120, ["race"] = 6, },
    {["ability"] = 20589,  ["cooldown"] = 180, ["race"] = 7 },
    {["ability"] = 20554, ["cooldown"] = 180, ["race"] = 8 },
    {["ability"] = 28730,  ["cooldown"] = 120, ["race"] = 10 },
    {["ability"] = 28880, ["cooldown"] = 180, ["race"] = 11 },
}

ATTdbs.PvPTrinkets = {
   [37864] = 37864,
   [28237] = 37864,
   [30351] = 37864,
   [30350] = 37864,
   [30349] = 37864,
   [30348] = 37864,
   [28234] = 37864,
   [28235] = 37864,
   [28238] = 37864,
   [28236] = 37864,
   
   [29593] = 29593,
   [18864] = 29593,
   [18863] = 29593,
   [18862] = 29593,
   [18854] = 29593,
   [18856] = 29593,
   [18857] = 29593,
   [18858] = 29593,
   [18859] = 29593,
   
   [37865] = 37865,
   [28243] = 37865,
   [30343] = 37865,
   [30344] = 37865,
   [30345] = 37865,
   [30346] = 37865,
   [28242] = 37865,
   [28241] = 37865,
   [28240] = 37865,
   [28239] = 37865,
   
   [29592] = 29592,--
   [18845] = 29592,--
   [18852] = 29592,--
   [18834] = 29592,--
   [18846] = 29592,--
   [18849] = 29592,--
   [18850] = 29592,--
   [18853] = 29592,--
   [18851] = 29592,--
}

 ATTdbs.dbExtraTrinkets = {
  {["ability"] = 42292, ["id"] = 37864, ["cooldown"] = 120, ["sname"] = 37864, ["pvptrinket"] = true,},
  {["ability"] = 42292, ["id"] = 37865, ["cooldown"] = 120, ["sname"] = 37865, ["pvptrinket"] = true,},
  
  {["ability"] = 42292, ["id"] = 29593, ["cooldown"] = 300, ["sname"] = 29593, ["pvptrinket"] = true,},
  {["ability"] = 42292, ["id"] = 29592, ["cooldown"] = 300, ["sname"] = 29592, ["pvptrinket"] = true,},
  
  {["ability"] = 35165, ["id"] = 29376, ["cooldown"] = 120, ["sname"] = 29376},
  {["ability"] = 35163, ["id"] = 29370, ["cooldown"] = 120, ["sname"] = 29370},
  {["ability"] = 35169, ["id"] = 29387, ["cooldown"] = 120, ["sname"] = 29387}, 
}