local args = { ... };
local LB = args[2];
local _config = nil;
local _locale = LB.GetLocaleTable(GetLocale());

local LoadConfig = LB.Attributes.Core.LoadConfig;
local GetStatMod = LB.Attributes.Core.GetStatMod;
local floor = math.floor;
local DecimalFormat = LB.Attributes.Core.DecimalFormat;

local function getHealthFromStam(stamina, class, race)
   local healthFromStam = stamina * 10;
   local healthBonus = GetStatMod("MOD_HEALTH", class, race);
   return healthFromStam * healthBonus
end

local function getSpellDamageFromStam(stamina, class, race)




   local petScaledStamina = stamina * .3;
   local spPerStam = GetStatMod("ADD_SPELL_DMG_MOD_STA", class, race);
   spPerStam = spPerStam * GetStatMod("MOD_SPELL_DMG", class, race);
   return petScaledStamina * spPerStam
end

local function getBonusesString(stamina)
   local config = LoadConfig();
   if (not config) then
      return nil
   end

   if (not config["Stamina-Health"] and
      not config["Stamina-SpellDamage"]) then
      return nil
   end

   local statStrings = {};

   local playerClass = ({ UnitClass("player") })[2];
   local playerRace = ({ UnitRace("player") })[2];


   local modifiedStam = stamina * GetStatMod("MOD_STA", playerClass, playerRace);

   modifiedStam = floor(modifiedStam + 0.5);


   if (config["Stamina-Health"]) then
      local healthFromStam = getHealthFromStam(modifiedStam, playerClass, playerRace);
      if (healthFromStam > 0) then
         local valueString = DecimalFormat(healthFromStam);
         local hpString = valueString .. " " .. _locale.StatStrings.Health;
         table.insert(statStrings, hpString);
      end
   end


   if (config["Stamina-SpellDamage"]) then
      local spellDamageFromStam = getSpellDamageFromStam(modifiedStam, playerClass, playerRace);
      if (spellDamageFromStam > 0) then
         local valueString = DecimalFormat(spellDamageFromStam);
         local spellDamageString = valueString .. " " .. _locale.StatStrings.SpellDamage;
         table.insert(statStrings, spellDamageString);
      end
   end

   return table.concat(statStrings, ", ")
end

LB.Attributes.Stamina.GetBonusesString = getBonusesString;
