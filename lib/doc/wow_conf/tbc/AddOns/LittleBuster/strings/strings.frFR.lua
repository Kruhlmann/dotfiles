local args = { ... };
local LB = args[2];

local frFR = {};

frFR.AlternativePatterns = {

   ["ITEM_MOD_HIT_RATING"] = {},
   ["ITEM_MOD_HIT_MELEE_RATING"] = {},
   ["ITEM_MOD_HIT_RANGED_RATING"] = {},
   ["ITEM_MOD_CRIT_RATING"] = {
      { pattern = "(%d+) le score de coup critique", location = "AfterValue" },
      { pattern = "score de coup critique de (%d+)", location = "AfterValue" },
      { pattern = "(%d+) au score de coup critique", location = "AfterValue" },
   },
   ["ITEM_MOD_CRIT_MELEE_RATING"] = {},
   ["ITEM_MOD_CRIT_RANGED_RATING"] = {},
   ["ITEM_MOD_HASTE_RATING"] = {},
   ["ITEM_MOD_EXPERTISE_RATING"] = {
      { pattern = "(%d+) le score d’expertise", location = "AfterValue" },
   },
   ["ITEM_MOD_HIT_SPELL_RATING"] = {
      { pattern = "score de toucher des sorts de (%d+)", location = "AfterValue" },
   },
   ["ITEM_MOD_CRIT_SPELL_RATING"] = {
      { pattern = "(%d+) le score de coup critique des sorts", location = "AfterValue" },
      { pattern = "(%d+) au score de critique des sorts", location = "AfterValue" },
      { pattern = "(%d+) au score de coup critique des sorts", location = "AfterValue" },
      { pattern = "score de coup critique des sorts de (%d+)", location = "AfterValue" },
   },
   ["ITEM_MOD_HASTE_SPELL_RATING"] = {},
   ["ITEM_MOD_DEFENSE_SKILL_RATING"] = {},
   ["ITEM_MOD_BLOCK_RATING"] = {},
   ["ITEM_MOD_DODGE_RATING"] = {
      { pattern = "(%d+) le score d’esquive", location = "AfterValue" },
      { pattern = "(%d+) le score d'esquive", location = "AfterValue" },
      { pattern = "score d'esquive de (%d+)", location = "AfterValue" },
      { pattern = "(%d+) au score d'esquive", location = "AfterValue" },
   },
   ["ITEM_MOD_PARRY_RATING"] = {},
   ["ITEM_MOD_AGILITY"] = {
      { pattern = "+(%d+) agilité", location = "PatternEnd" },
      { pattern = "l'agilité.+de (%d+)", location = "AfterValue" },
      { pattern = "agilité de (%d+)", location = "AfterValue" },
   },
   ["ITEM_MOD_INTELLECT"] = {
      { pattern = "+(%d+) intelligence", location = "PatternEnd" },
      { pattern = "l'intelligence.+de (%d+)", location = "AfterValue" },
   },
   ["ITEM_MOD_SPIRIT"] = {
      { pattern = "+(%d+) esprit", location = "PatternEnd" },
      { pattern = "l'esprit.+de (%d+)", location = "AfterValue" },
   },
   ["ITEM_MOD_STAMINA"] = {
      { pattern = "+(%d+) endurance", location = "PatternEnd" },
      { pattern = "l'endurance.+de (%d+)", location = "AfterValue" },
   },
   ["ITEM_MOD_STRENGTH"] = {
      { pattern = "+(%d+) force", location = "PatternEnd" },
      { pattern = "force.+de (%d+)", location = "AfterValue" },
   },
};


frFR.GetShortStatPatterns = function(shortStatString, _)
   return {
      { pattern = "(%d+) le score de " .. shortStatString, location = "AfterValue" },
      { pattern = "score de " .. shortStatString .. " augmenté de (%d+)", location = "AfterValue" },
      { pattern = "score de " .. shortStatString .. " de (%d+)", location = "AfterValue" },
      { pattern = "(%d+) au score de " .. shortStatString, location = "AfterValue" },
   }
end


frFR.ConfigStrings = {
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


frFR.StatStrings = {
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

LB.LocaleTables["frFR"] = {};
LB.LocaleTables["frFR"].getLocaleTable = function()
   return frFR
end
