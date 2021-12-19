local args = { ... };
local LB = args[2];
local _config = nil;
local _locale = LB.GetLocaleTable(GetLocale());

local LoadConfig = LB.Attributes.Core.LoadConfig;
local GetStatMod = LB.Attributes.Core.GetStatMod;
local BlizzRound = LB.BlizzRound;
local DecimalFormat = LB.Attributes.Core.DecimalFormat;



local _baseManaRegenPerSpi = {
   [1] = 0.034965,
   [2] = 0.034191,
   [3] = 0.033465,
   [4] = 0.032526,
   [5] = 0.031661,
   [6] = 0.031076,
   [7] = 0.030523,
   [8] = 0.029994,
   [9] = 0.029307,
   [10] = 0.028661,
   [11] = 0.027584,
   [12] = 0.026215,
   [13] = 0.025381,
   [14] = 0.0243,
   [15] = 0.023345,
   [16] = 0.022748,
   [17] = 0.021958,
   [18] = 0.021386,
   [19] = 0.02079,
   [20] = 0.020121,
   [21] = 0.019733,
   [22] = 0.019155,
   [23] = 0.018819,
   [24] = 0.018316,
   [25] = 0.017936,
   [26] = 0.017576,
   [27] = 0.017201,
   [28] = 0.016919,
   [29] = 0.016581,
   [30] = 0.016233,
   [31] = 0.015994,
   [32] = 0.015707,
   [33] = 0.015464,
   [34] = 0.015204,
   [35] = 0.014956,
   [36] = 0.014744,
   [37] = 0.014495,
   [38] = 0.014302,
   [39] = 0.014094,
   [40] = 0.013895,
   [41] = 0.013724,
   [42] = 0.013522,
   [43] = 0.013363,
   [44] = 0.013175,
   [45] = 0.012996,
   [46] = 0.012853,
   [47] = 0.012687,
   [48] = 0.012539,
   [49] = 0.012384,
   [50] = 0.012233,
   [51] = 0.012113,
   [52] = 0.011973,
   [53] = 0.011859,
   [54] = 0.011714,
   [55] = 0.011575,
   [56] = 0.011473,
   [57] = 0.011342,
   [58] = 0.011245,
   [59] = 0.01111,
   [60] = 0.010999,
   [61] = 0.0107,
   [62] = 0.010522,
   [63] = 0.01029,
   [64] = 0.010119,
   [65] = 0.009968,
   [66] = 0.009808,
   [67] = 0.009651,
   [68] = 0.009553,
   [69] = 0.009445,
   [70] = 0.009327,
}

local _healthRegenPerSpi = {
   ["WARRIOR"] = 0.5,
   ["PALADIN"] = 0.125,
   ["HUNTER"] = 0.125,
   ["ROGUE"] = 0.333333,
   ["PRIEST"] = 0.041667,
   ["SHAMAN"] = 0.071429,
   ["MAGE"] = 0.041667,
   ["WARLOCK"] = 0.045455,
   ["DRUID"] = 0.0625,
}

local function getRegenFromSpirit(spirit, class, race, level)
   local playerInt = UnitStat("player", 4);
   local regenWhileNotCasting = (0.001 +
   spirit * _baseManaRegenPerSpi[level] *
   (playerInt ^ 0.5)) *
   5;
   local regenWhileCasting = regenWhileNotCasting * GetStatMod("ADD_MANA_REG_MOD_NORMAL_MANA_REG", class, race);
   return { regenWhileNotCasting, regenWhileCasting }
end

local function getHealthRegenFromSpirit(spirit, class)
   local hpRegenPerSpi = _healthRegenPerSpi[class];
   return (hpRegenPerSpi * spirit) * 5
end

local function getSpellDamageFromSpirit(spirit, class, race)
   local spPerSpi = GetStatMod("ADD_SPELL_DMG_MOD_SPI", class, race);
   spPerSpi = spPerSpi * GetStatMod("MOD_SPELL_DMG", class, race);
   return spirit * spPerSpi
end

local function getBonusesString(spirit)
   local config = LoadConfig();
   if (not config) then
      return nil
   end

   if (not config["Spirit-ManaRegenNotCasting"] and
      not config["Spirit-ManaRegenCasting"] and
      not config["Spirit-HealthRegen"] and
      not config["Spirit-SpellDamage"] and
      not config["Spirit-Healing"]) then
      return nil
   end

   local statStrings = {};

   local playerClass = ({ UnitClass("player") })[2];
   local playerRace = ({ UnitRace("player") })[2];
   local playerLevel = UnitLevel("player");


   local modifiedSpi = spirit * GetStatMod("MOD_SPI", playerClass, playerRace);
   modifiedSpi = BlizzRound(modifiedSpi);


   if (config["Spirit-ManaRegenNotCasting"] or config["Spirit-ManaRegenCasting"]) then
      local regenFromSpi = getRegenFromSpirit(modifiedSpi, playerClass, playerRace, playerLevel);
      local notCasting = regenFromSpi[1];
      local casting = regenFromSpi[2]

      if (notCasting > 0 or casting > 0) then
         local regenString = "";
         if (config["Spirit-ManaRegenNotCasting"] and notCasting > 0) then
            regenString = format("%.1F", notCasting);
         end

         if (config["Spirit-ManaRegenCasting"] and casting > 0) then
            if (regenString ~= "") then
               regenString = regenString .. "/";
            end
            regenString = regenString .. format("%.1F", casting);
         end

         regenString = regenString .. " " .. _locale.StatStrings.ManaRegen;
         table.insert(statStrings, regenString);
      end
   end


   if (config["Spirit-HealthRegen"]) then
      local hpRegen = getHealthRegenFromSpirit(modifiedSpi, playerClass);
      if (hpRegen > 0) then
         local hpRegenString = format("%.1F", hpRegen) .. " " .. _locale.StatStrings.HealthRegen;
         table.insert(statStrings, hpRegenString);
      end
   end


   if (config["Spirit-SpellDamage"]) then
      local spellDamage = getSpellDamageFromSpirit(modifiedSpi, playerClass, playerRace);
      if (spellDamage > 0) then
         local valueString = DecimalFormat(spellDamage);
         local spellDamageString = valueString .. " " .. _locale.StatStrings.SpellDamage;
         table.insert(statStrings, spellDamageString);
      end
   end


   return table.concat(statStrings, ", ")

end

LB.Attributes.Spirit.GetBonusesString = getBonusesString;
