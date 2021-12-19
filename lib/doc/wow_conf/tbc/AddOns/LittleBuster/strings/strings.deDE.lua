local args = { ... };
local LB = args[2];

local deDE = {};

deDE.AlternativePatterns = {

   ["ITEM_MOD_HIT_RATING"] = {},
   ["ITEM_MOD_HIT_MELEE_RATING"] = {},
   ["ITEM_MOD_HIT_RANGED_RATING"] = {},
   ["ITEM_MOD_CRIT_RATING"] = {},
   ["ITEM_MOD_CRIT_MELEE_RATING"] = {},
   ["ITEM_MOD_CRIT_RANGED_RATING"] = {},
   ["ITEM_MOD_HASTE_RATING"] = {},
   ["ITEM_MOD_EXPERTISE_RATING"] = {},
   ["ITEM_MOD_HIT_SPELL_RATING"] = {},
   ["ITEM_MOD_CRIT_SPELL_RATING"] = {},
   ["ITEM_MOD_HASTE_SPELL_RATING"] = {},
   ["ITEM_MOD_DEFENSE_SKILL_RATING"] = {},
   ["ITEM_MOD_BLOCK_RATING"] = {
      { pattern = "blockwertung um (%d+)", location = "AfterValue" },
   },
   ["ITEM_MOD_DODGE_RATING"] = {},
   ["ITEM_MOD_PARRY_RATING"] = {},
   ["ITEM_MOD_AGILITY"] = {
      { pattern = "+(%d+) beweglichkeit", location = "PatternEnd" },
      { pattern = "beweglichkeit um (%d+)", location = "AfterValue" },
      { pattern = "beweglichkeit .+ um (%d+)", location = "AfterValue" },
   },
   ["ITEM_MOD_INTELLECT"] = {
      { pattern = "+(%d+) intelligenz", location = "PatternEnd" },
      { pattern = "intelligenz.+um (%d+)", location = "AfterValue" },
   },
   ["ITEM_MOD_SPIRIT"] = {
      { pattern = "+(%d+) willenskraft", location = "PatternEnd" },
      { pattern = "willenskraft.+um (%d+)", location = "AfterValue" },
   },
   ["ITEM_MOD_STAMINA"] = {
      { pattern = "+(%d+) ausdauer", location = "PatternEnd" },
      { pattern = "ausdauer.+um (%d+)", location = "AfterValue" },
   },
   ["ITEM_MOD_STRENGTH"] = {
      { pattern = "+(%d+) stärke", location = "PatternEnd" },
      { pattern = "stärke.+um (%d+)", location = "AfterValue" },
   },
};


local conjugatedShortStats = {
   ["ITEM_MOD_HIT_RATING"] = "treffer",
   ["ITEM_MOD_HIT_MELEE_RATING"] = "treffer",
   ["ITEM_MOD_HIT_RANGED_RATING"] = "treffer",
   ["ITEM_MOD_CRIT_RATING"] = "kritische treffer",
   ["ITEM_MOD_CRIT_MELEE_RATING"] = "kritische treffer",
   ["ITEM_MOD_CRIT_RANGED_RATING"] = "kritische treffer",
   ["ITEM_MOD_HASTE_RATING"] = "tempo",
   ["ITEM_MOD_EXPERTISE_RATING"] = "waffenkunde",
   ["ITEM_MOD_HIT_SPELL_RATING"] = "zaubertreffer zaubertreffer",
   ["ITEM_MOD_CRIT_SPELL_RATING"] = "kritische",
   ["ITEM_MOD_HASTE_SPELL_RATING"] = "zaubertempo",
   ["ITEM_MOD_DEFENSE_SKILL_RATING"] = "verteidigungs",
   ["ITEM_MOD_BLOCK_RATING"] = "doNotUse",
   ["ITEM_MOD_DODGE_RATING"] = "ausweich",
   ["ITEM_MOD_PARRY_RATING"] = "parier",
   ["ITEM_MOD_AGILITY"] = "beweglichkeit",
   ["ITEM_MOD_INTELLECT"] = "intelligenz",
   ["ITEM_MOD_SPIRIT"] = "willenskraft",
   ["ITEM_MOD_STAMINA"] = "ausdauer",
   ["ITEM_MOD_STRENGTH"] = "stärke",
}


deDE.GetShortStatPatterns = function(shortStatString, statKey)
   return {
      { pattern = "(%d+) " .. conjugatedShortStats[statKey], location = "AfterValue" },
      { pattern = shortStatString .. "wertung um (%d+)", location = "AfterValue" },
      { pattern = conjugatedShortStats[statKey] .. "wertung um (%d+)", location = "AfterValue" },
      { pattern = conjugatedShortStats[statKey] .. "wertung %d+ sek. lang um (%d+)", location = "AfterValue" },
   }
end


deDE.ConfigStrings = {
   DefensesHeader = "Defensive Stats",
   DefenseRatingCheckbox = "Display converted Defense rating",
   DodgeRatingCheckbox = "Display converted Dodge rating",
   ParryRatingCheckbox = "Display converted Parry rating",
   BlockRatingCheckbox = "Display converted Block rating",

   SpellsHeader = "Spell Stats",
   SpellHitRatingCheckbox = "Display converted Spell Hit rating",
   SpellCritRatingCheckbox = "Display converted Spell Crit rating",
   SpellHasteRatingCheckbox = "Display converted Spell Haste rating",

   PhysicalsHeader = "Melee and Ranged Stats",
   PhysicalHitRatingCheckbox = "Display converted Hit rating",
   PhysicalCritRatingCheckbx = "Display converted Crit rating",
   PhysicalHasteRatingCheckbox = "Display converted Haste rating",
   PhysicalExpertiseRatingCheckbox = "Display converted Expertise rating",

   AttributesHeader = "Attributes",
   AgilityCheckbox = "Scan for Agility and...",
   AgiDodgeCheck = "...display Dodge bonus",
   AgiCritCheck = "...display Crit bonus",
   AgiArmorCheck = "...display Armor bonus",
   AgiAPCheck = "...display Attack Power bonus",
   AgiRAPCheck = "...display Ranged Attack Power bonus",
   AgilityHealingCheckbox = "...display Healing bonus",

   IntellectCheckbox = "Scan for Intellect and...",
   IntellectManaCheckbox = "...display Mana bonus",
   IntellectSpellCritCheckbox = "...display Spell Crit bonus",
   IntellectSpellDamageCheckbox = "...display Spell Damage bonus",
   IntellectHealingCheckbox = "...display Healing bonus",
   IntellectManaRegenCheckbox = "...display Mana Regen bonus",
   IntellectRangedAPCheckbox = "...display Ranged Attack Power bonus",
   IntellectArmorCheckbox = "...display Armor bonus",

   SpiritCheckbox = "Scan for Spirit and...",
   SpiritManaRegenNotCastingCheckbox = "...display Mana Regen while not casting",
   SpiritManaRegenCastingCheckbox = "...display Mana Regen while casting",
   SpiritHealthRegenCheckbox = "...display Health Regen bonus",
   SpiritSpellDamageCheckbox = "...display Spell Damage bonus",
   SpiritHealingCheckbox = "...display Healing bonus",

   StaminaCheckbox = "Scan for Stamina and...",
   StaminaHealthCheckbox = "...display Health bonus",
   StaminaSpellDamageCheckbox = "...display Spell Damage bonus",

   StrengthCheckbox = "Scan for Strength and...",
   StrengthAttackPowerCheckbox = "...display Attack Power bonus",
   StrengthBlockValueCheckbox = "...display Block Value bonus",
};


deDE.StatStrings = {
   Dodge = "Dodge",
   Crit = "Crit",
   AttackPower = "AP",
   RangedAttackPower = "RAP",
   Armor = "Armor",

   Mana = "Mana",
   SpellCrit = "Spell Crit",
   SpellDamage = "Spell Damage",
   Healing = "Healing",
   ManaRegen = "MP5",

   Health = "HP",
   HealthRegen = "HP5",

   BlockValue = "Block Value",
}

LB.LocaleTables["deDE"] = {};
LB.LocaleTables["deDE"].getLocaleTable = function()
   return deDE
end
