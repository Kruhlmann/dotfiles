local args = { ... };
local LB = args[2];

local ruRU = {};

ruRU.AlternativePatterns = {

   ["ITEM_MOD_HIT_RATING"] = {
      { pattern = "рейтинг меткости на (%d+)", location = "AfterValue" },
      { pattern = "рейтинга меткости на (%d+)", location = "AfterValue" },
      { pattern = "+(%d+) к рейтингу меткости", location = "AfterValue" },
   },
   ["ITEM_MOD_HIT_MELEE_RATING"] = {
      { pattern = "рейтинг меткости на (%d+).", location = "AfterValue" },
   },
   ["ITEM_MOD_HIT_RANGED_RATING"] = {
      { pattern = "рейтинг меткости на (%d+).", location = "AfterValue" },
   },
   ["ITEM_MOD_CRIT_RATING"] = {
      { pattern = "рейтинг критического удара на (%d+).", location = "AfterValue" },
      { pattern = "критического урона на (%d+) ед.", location = "AfterValue" },
      { pattern = "+(%d+) к рейтингу критического удара", location = "AfterValue" },
   },
   ["ITEM_MOD_CRIT_MELEE_RATING"] = {
      { pattern = "рейтинг критического удара на (%d+).", location = "AfterValue" },
   },
   ["ITEM_MOD_CRIT_RANGED_RATING"] = {
      { pattern = "рейтинг критического удара на (%d+).", location = "AfterValue" },
   },
   ["ITEM_MOD_HASTE_RATING"] = {
      { pattern = "рейтинга скорости на (%d+) ед.", location = "AfterValue" },
      { pattern = "рейтинг скорости боя на (%d+).", location = "AfterValue" },
   },
   ["ITEM_MOD_EXPERTISE_RATING"] = {
      { pattern = "рейтинг мастерства на (%d+).", location = "AfterValue" },
   },
   ["ITEM_MOD_HIT_SPELL_RATING"] = {
      { pattern = "меткость %(заклинания%) %+(%d+)", location = "AfterValue" },
      { pattern = "Повышение на (%d+)%% рейтинга меткости заклинаний.", location = "AfterValue" },
      { pattern = "+(%d+) к рейтингу меткости заклинаний", location = "AfterValue" },
   },
   ["ITEM_MOD_CRIT_SPELL_RATING"] = {
      { pattern = "критический удар %(заклинания%) %+(%d+)", location = "AfterValue" },
      { pattern = "повышает рейтинг критического эффекта заклинаний на (%d+)", location = "AfterValue" },
      { pattern = "+(%d+) к рейтингу критического эффекта заклинаний", location = "AfterValue" },
      { pattern = "+(%d+) к рейтингу критического удара заклинаниями", location = "AfterValue" },
      { pattern = "рейтинга критического эффекта заклинаний на (%d+ ед%.)", location = "AfterValue" },
   },
   ["ITEM_MOD_HASTE_SPELL_RATING"] = {
      { pattern = "рейтинг скорости заклинаний на (%d+)", location = "AfterValue" },
      { pattern = "рейтингу скорости заклинаний на (%d+)", location = "AfterValue" },
      { pattern = "рейтинга скорости заклинаний на (%d+)", location = "AfterValue" },
      { pattern = "рейтинг скорости заклинаний (%d+) на", location = "AfterValue" },
      { pattern = "рейтингу скорости заклинаний (%d+) на", location = "AfterValue" },
      { pattern = "рейтинга скорости заклинаний (%d+) на", location = "AfterValue" },
      { pattern = "+(%d+) к рейтингу скорости заклинаний", location = "AfterValue" },
      { pattern = "рейтинга скорости .+ (%d+ ед%.)", location = "AfterValue" },
   },
   ["ITEM_MOD_DEFENSE_SKILL_RATING"] = {
      { pattern = "повышает рейтинг защиты на (%d+).", location = "AfterValue" },
      { pattern = "+(%d+) к рейтингу защиты", location = "AfterValue" },
   },
   ["ITEM_MOD_BLOCK_RATING"] = {
      { pattern = "рейтинг блока на (%d+) ед.", location = "AfterValue" },
      { pattern = "рейтинг блокирования щитом на (%d+)", location = "AfterValue" },
      { pattern = "рейтинга блокирования щитом на (%d+)", location = "AfterValue" },
      { pattern = "рейтингу блокирования щитом на (%d+)", location = "AfterValue" },
   },
   ["ITEM_MOD_DODGE_RATING"] = {
      { pattern = "рейтинг уклонения (%d+ ед%.)", location = "AfterValue" },
      { pattern = "рейтинга уклонения (%d+ ед%.)", location = "AfterValue" },
      { pattern = "рейтингу уклонения (%d+ ед%.)", location = "AfterValue" },
      { pattern = "+(%d+) к рейтингу уклонения", location = "AfterValue" },
   },
   ["ITEM_MOD_PARRY_RATING"] = {
      { pattern = "+(%d+) к рейтингу парирования", location = "AfterValue" },
      { pattern = "рейтинга парирования атак на (%d+) ед.", location = "AfterValue" },
   },
   ["ITEM_MOD_AGILITY"] = {
      { pattern = "+(%d+) к ловкости", location = "PatternEnd" },
      { pattern = "ловкости на (%d+)", location = "AfterValue" },
   },
   ["ITEM_MOD_INTELLECT"] = {
      { pattern = "+(%d+) к интеллекту", location = "PatternEnd" },
      { pattern = "интеллекта.+на (%d+ ед%.)", location = "AfterValue" },
   },
   ["ITEM_MOD_SPIRIT"] = {
      { pattern = "+(%d+) к духу", location = "PatternEnd" },
      { pattern = "духа.+на (%d+ ед%.)", location = "AfterValue" },
   },
   ["ITEM_MOD_STAMINA"] = {
      { pattern = "+(%d+) к выносливости", location = "PatternEnd" },
      { pattern = "выносливости.+на (%d+ ед%.)", location = "AfterValue" },
   },
   ["ITEM_MOD_STRENGTH"] = {
      { pattern = "+(%d+) к силе", location = "PatternEnd" },
      { pattern = "силе.+на (%d+ ед%.)", location = "AfterValue" },
   },
};


local conjugatedShortStats = {
   ["ITEM_MOD_HIT_RATING"] = "меткости",
   ["ITEM_MOD_HIT_MELEE_RATING"] = "меткости",
   ["ITEM_MOD_HIT_RANGED_RATING"] = "меткости",
   ["ITEM_MOD_CRIT_RATING"] = "критического удара",
   ["ITEM_MOD_CRIT_MELEE_RATING"] = "критического удара",
   ["ITEM_MOD_CRIT_RANGED_RATING"] = "критического удара",
   ["ITEM_MOD_HASTE_RATING"] = "скорости",
   ["ITEM_MOD_EXPERTISE_RATING"] = "мастерства",
   ["ITEM_MOD_HIT_SPELL_RATING"] = "меткости заклинаний",
   ["ITEM_MOD_CRIT_SPELL_RATING"] = "критического удара заклинаниями",
   ["ITEM_MOD_HASTE_SPELL_RATING"] = "скорости заклинаний",
   ["ITEM_MOD_DEFENSE_SKILL_RATING"] = "защиты",
   ["ITEM_MOD_BLOCK_RATING"] = "блока",
   ["ITEM_MOD_DODGE_RATING"] = "уклонения",
   ["ITEM_MOD_PARRY_RATING"] = "парирования",
   ["ITEM_MOD_AGILITY"] = "ловкости",
   ["ITEM_MOD_INTELLECT"] = "интеллекту",
   ["ITEM_MOD_SPIRIT"] = "духу",
   ["ITEM_MOD_STAMINA"] = "выносливости",
   ["ITEM_MOD_STRENGTH"] = "силе",
}


ruRU.GetShortStatPatterns = function(_, statKey)
   return {
      { pattern = "рейтинг " .. conjugatedShortStats[statKey] .. " на (%d+)", location = "AfterValue" },
      { pattern = "рейтингу " .. conjugatedShortStats[statKey] .. " на (%d+)", location = "AfterValue" },
      { pattern = "рейтинга " .. conjugatedShortStats[statKey] .. " на (%d+)", location = "AfterValue" },
      { pattern = "рейтинг " .. conjugatedShortStats[statKey] .. " (%d+) на", location = "AfterValue" },
      { pattern = "рейтингу " .. conjugatedShortStats[statKey] .. " (%d+) на", location = "AfterValue" },
      { pattern = "рейтинга " .. conjugatedShortStats[statKey] .. " (%d+) на", location = "AfterValue" },
   }
end


ruRU.ConfigStrings = {
   DefensesHeader = "Защитные рейтинги",
   DefenseRatingCheckbox = "Конвертировать рейтинг защиты",
   DodgeRatingCheckbox = "Конвертировать рейтинг уклонения",
   ParryRatingCheckbox = "Конвертировать рейтинг парирования",
   BlockRatingCheckbox = "Конвертировать рейтинг блока щитом",

   SpellsHeader = "Рейтинги заклинаний",
   SpellHitRatingCheckbox = "Конвертировать рейтинг меткости",
   SpellCritRatingCheckbox = "Конвертировать рейтинг критического попадания",
   SpellHasteRatingCheckbox = "Конвертировать рейтинг скорости",

   PhysicalsHeader = "Рейтинги ближнего и дальнего боя",
   PhysicalHitRatingCheckbox = "Конвертировать рейтинг меткости",
   PhysicalCritRatingCheckbx = "Конвертировать рейтинг критического попадания",
   PhysicalHasteRatingCheckbox = "Конвертировать рейтинг скорости",
   PhysicalExpertiseRatingCheckbox = "Конвертировать рейтинг мастерства",

   AttributesHeader = "Характеристики",
   AgilityCheckbox = "Конвертировать ловкость",
   AgiDodgeCheck = "бонус к уклонению",
   AgiCritCheck = "бонус к критическому попаданию",
   AgiArmorCheck = "бонус к броне",
   AgiAPCheck = "бонус к силе атаки (AP)",
   AgiRAPCheck = "бонус к силе атаки дальнего боя (RAP)",
   AgilityHealingCheckbox = "бонус к лечению (BH)",

   IntellectCheckbox = "Конвертировать интеллект",
   IntellectManaCheckbox = "бонус маны",
   IntellectSpellCritCheckbox = "бонус к критическому попаданию",
   IntellectSpellDamageCheckbox = "бонус к урону заклинаниями (SPD)",
   IntellectHealingCheckbox = "бонус к лечению (BH)",
   IntellectManaRegenCheckbox = "бонус к регенерации маны (MP5)",
   IntellectRangedAPCheckbox = "бонус к силе атаки дальнего боя (RAP)",
   IntellectArmorCheckbox = "бонус к броне",

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


ruRU.StatStrings = {
   Dodge = "уклон.",
   Crit = "крит.",
   AttackPower = "AP",
   RangedAttackPower = "RAP",
   Armor = "брони",

   Mana = "маны",
   SpellCrit = "крит.",
   SpellDamage = "SPD",
   Healing = "BH",
   ManaRegen = "MP5",

   Health = "HP",
   HealthRegen = "HP5",

   BlockValue = "Block Value",
}

LB.LocaleTables["ruRU"] = {};
LB.LocaleTables["ruRU"].getLocaleTable = function()
   return ruRU
end
