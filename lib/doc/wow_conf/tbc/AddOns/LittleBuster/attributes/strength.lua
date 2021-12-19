local args = { ... };
local LB = args[2];
local _config = nil;
local _locale = LB.GetLocaleTable(GetLocale());

local LoadConfig = LB.Attributes.Core.LoadConfig;
local GetStatMod = LB.Attributes.Core.GetStatMod;
local floor = math.floor;
local BlizzRound = LB.BlizzRound;

local _apPerStr = {
   ["WARRIOR"] = 2,
   ["PALADIN"] = 2,
   ["HUNTER"] = 1,
   ["ROGUE"] = 1,
   ["PRIEST"] = 1,
   ["SHAMAN"] = 2,
   ["MAGE"] = 1,
   ["WARLOCK"] = 1,
   ["DRUID"] = 2,
};

local _bvPerStr = {
   ["WARRIOR"] = 0.05,
   ["PALADIN"] = 0.05,
   ["HUNTER"] = 0,
   ["ROGUE"] = 0,
   ["PRIEST"] = 0,
   ["SHAMAN"] = 0.05,
   ["MAGE"] = 0,
   ["WARLOCK"] = 0,
   ["DRUID"] = 0,
}

local function getAPFromStr(strength, class)
   local apPerStr = _apPerStr[class];
   return strength * apPerStr
end

local function getBlockValueFromStr(strength, class)
   local bvPerStr = _bvPerStr[class];

   return strength * bvPerStr
end

local function getBonusesString(strength)
   local config = LoadConfig();
   if (not config) then
      return nil
   end

   if (not config["Strength-AttackPower"] and
      not config["Strength-BlockValue"]) then
      return nil
   end

   local statStrings = {};

   local playerClass = ({ UnitClass("player") })[2];
   local playerRace = ({ UnitRace("player") })[2];

   local modifiedStr = strength * GetStatMod("MOD_STR", playerClass, playerRace);
   modifiedStr = BlizzRound(modifiedStr);


   if (config["Strength-AttackPower"]) then
      local apFromStr = getAPFromStr(strength, playerClass);
      if (apFromStr > 0) then
         local apString = format("%d", apFromStr) .. " " .. _locale.StatStrings.AttackPower;
         table.insert(statStrings, apString);
      end
   end


   if (config["Strength-BlockValue"]) then
      local bvFromStr = getBlockValueFromStr(strength, playerClass);
      if (bvFromStr > 0) then
         local bvString = format("%.1F", bvFromStr) .. " " .. _locale.StatStrings.BlockValue;
         table.insert(statStrings, bvString);
      end
   end

   return table.concat(statStrings, ", ")
end

LB.Attributes.Strength.GetBonusesString = getBonusesString;
