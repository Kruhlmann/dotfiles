local args = { ... };
local LB = args[2];


LB.Attributes = {};
LB.Attributes.Core = {};
LB.Attributes.Agility = {};
LB.Attributes.Intellect = {};
LB.Attributes.Spirit = {};
LB.Attributes.Stamina = {};
LB.Attributes.Strength = {};




local function getStanceIcon()
   local currentStance = GetShapeshiftForm();
   if currentStance ~= 0 then
      return GetShapeshiftFormInfo(currentStance)[1]
   end
end

local function getPlayerBuffRank(buff)
   local spellId = select(10, AuraUtil.FindAuraByName(buff, "player"));
   if (spellId) then
      local rank = GetSpellSubtext(spellId);
      return rank and tonumber(string.match(rank, "(%d+)")) or 1
   end
end





local _raceBaseStat = {
   ["Human"] = { 20, 20, 20, 20, 21 },
   ["Dwarf"] = { 22, 16, 23, 19, 19 },
   ["NightElf"] = { 17, 25, 19, 20, 20 },
   ["Gnome"] = { 15, 23, 19, 24, 20 },
   ["Draenei"] = { 21, 17, 19, 21, 22 },
   ["Orc"] = { 23, 17, 22, 17, 23 },
   ["Scourge"] = { 19, 18, 21, 18, 25 },
   ["Tauren"] = { 25, 15, 22, 15, 22 },
   ["Troll"] = { 21, 22, 21, 16, 21 },
   ["BloodElf"] = { 17, 22, 18, 24, 19 },
}

local _classBonusStat = {
   ["DRUID"] = { 1, 0, 0, 2, 2 },
   ["HUNTER"] = { 0, 3, 1, 0, 1 },
   ["MAGE"] = { 0, 0, 0, 3, 2 },
   ["PALADIN"] = { 2, 0, 2, 0, 1 },
   ["PRIEST"] = { 0, 0, 0, 2, 3 },
   ["ROGUE"] = { 1, 3, 1, 0, 0 },
   ["SHAMAN"] = { 1, 0, 1, 1, 2 },
   ["WARLOCK"] = { 0, 0, 1, 2, 2 },
   ["WARRIOR"] = { 3, 0, 2, 0, 0 },
}

local _classBaseHealth = {
   ["DRUID"] = 54,
   ["HUNTER"] = 46,
   ["MAGE"] = 52,
   ["PALADIN"] = 38,
   ["PRIEST"] = 52,
   ["ROGUE"] = 45,
   ["SHAMAN"] = 47,
   ["WARLOCK"] = 43,
   ["WARRIOR"] = 40,
}

local _classBaseMana = {
   ["DRUID"] = 70,
   ["HUNTER"] = 85,
   ["MAGE"] = 120,
   ["PALADIN"] = 80,
   ["PRIEST"] = 130,
   ["ROGUE"] = 0,
   ["SHAMAN"] = 75,
   ["WARLOCK"] = 110,
   ["WARRIOR"] = 0,
}

local _classBaseDodge = {
   ["WARRIOR"] = 0.7580,
   ["PALADIN"] = 0.6520,
   ["HUNTER"] = -5.4500,
   ["ROGUE"] = -0.5900,
   ["PRIEST"] = 3.1830,
   ["SHAMAN"] = 1.6750,
   ["MAGE"] = 3.4575,
   ["WARLOCK"] = 2.0350,
   ["DRUID"] = -1.8720,
}




































































local _statModInfo = {










   ["ADD_DODGE"] = {
      initialValue = 0,
      finalAdjust = 0,
   },
   ["ADD_SPELL_DMG_MOD_INT"] = {
      initialValue = 0,
      finalAdjust = 0,
   },
   ["ADD_HEALING_MOD_INT"] = {
      initialValue = 0,
      finalAdjust = 0,
   },
   ["ADD_MANA_REG_MOD_INT"] = {
      initialValue = 0,
      finalAdjust = 0,
   },
   ["ADD_RANGED_AP_MOD_INT"] = {
      initialValue = 0,
      finalAdjust = 0,
   },
   ["ADD_ARMOR_MOD_INT"] = {
      initialValue = 0,
      finalAdjust = 0,
   },
   ["ADD_SPELL_DMG_MOD_STA"] = {
      initialValue = 0,
      finalAdjust = 0,
   },
   ["ADD_SPELL_DMG_MOD_SPI"] = {
      initialValue = 0,
      finalAdjust = 0,
   },
   ["ADD_SPELL_DMG_MOD_AP"] = {
      initialValue = 0,
      finalAdjust = 0,
   },
   ["ADD_HEALING_MOD_SPI"] = {
      initialValue = 0,
      finalAdjust = 0,
   },
   ["ADD_HEALING_MOD_STR"] = {
      initialValue = 0,
      finalAdjust = 0,
   },
   ["ADD_HEALING_MOD_AGI"] = {
      initialValue = 0,
      finalAdjust = 0,
   },
   ["ADD_HEALING_MOD_AP"] = {
      initialValue = 0,
      finalAdjust = 0,
   },
   ["ADD_MANA_REG_MOD_NORMAL_MANA_REG"] = {
      initialValue = 0,
      finalAdjust = 0,
   },
   ["MOD_ARMOR"] = {
      initialValue = 1,
      finalAdjust = 0,
   },
   ["MOD_HEALTH"] = {
      initialValue = 1,
      finalAdjust = 0,
   },
   ["MOD_MANA"] = {
      initialValue = 1,
      finalAdjust = 0,
   },
   ["MOD_STR"] = {
      initialValue = 0,
      finalAdjust = 1,
   },
   ["MOD_AGI"] = {
      initialValue = 0,
      finalAdjust = 1,
   },
   ["MOD_STA"] = {
      initialValue = 0,
      finalAdjust = 1,
   },
   ["MOD_INT"] = {
      initialValue = 0,
      finalAdjust = 1,
   },
   ["MOD_SPI"] = {
      initialValue = 0,
      finalAdjust = 1,
   },
   ["MOD_BLOCK_VALUE"] = {
      initialValue = 0,
      finalAdjust = 1,
   },
   ["MOD_AP"] = {
      initialValue = 0,
      finalAdjust = 1,
   },
   ["MOD_RANGED_AP"] = {
      initialValue = 0,
      finalAdjust = 1,
   },
   ["MOD_SPELL_DMG"] = {
      initialValue = 0,
      finalAdjust = 1,
   },
   ["MOD_HEALING"] = {
      initialValue = 0,
      finalAdjust = 1,
   },
}





local _classStatModTable = {
   ["DRUID"] = {


      ["ADD_SPELL_DMG_MOD_INT"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 12,
            ["rank"] = {
               0.08, 0.16, 0.25,
            },
         },
      },


      ["ADD_HEALING_MOD_INT"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 12,
            ["rank"] = {
               0.08, 0.16, 0.25,
            },
         },
      },


      ["ADD_HEALING_MOD_AGI"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 14,
            ["rank"] = {
               0.5, 1,
            },
         },
      },



      ["ADD_MANA_REG_MOD_NORMAL_MANA_REG"] = {
         [1] = {
            ["tab"] = 3,
            ["num"] = 6,
            ["rank"] = {
               0.1, 0.2, 0.3,
            },
         },
      },


      ["ADD_MANA_REG_MOD_INT"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 17,
            ["rank"] = {
               0.04, 0.07, 0.10,
            },
         },
      },


      ["ADD_DODGE"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 6,
            ["rank"] = {
               2, 4,
            },
            ["buff"] = GetSpellInfo(32357),
         },
         [2] = {
            ["tab"] = 2,
            ["num"] = 6,
            ["rank"] = {
               2, 4,
            },
            ["buff"] = GetSpellInfo(9634),
         },
         [3] = {
            ["tab"] = 2,
            ["num"] = 6,
            ["rank"] = {
               2, 4,
            },
            ["buff"] = GetSpellInfo(32356),
         },
      },








      ["MOD_ARMOR"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 5,
            ["rank"] = {
               1.04, 1.07, 1.1,
            },
         },
         [2] = {
            ["rank"] = {
               2.8,
            },
            ["buff"] = GetSpellInfo(32357),
         },
         [3] = {
            ["rank"] = {
               5,
            },
            ["buff"] = GetSpellInfo(9634),
         },
         [4] = {
            ["rank"] = {
               5,
            },
            ["buff"] = GetSpellInfo(24858),
         },
      },








      ["MOD_STA"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 15,
            ["rank"] = {
               0.04, 0.08, 0.12, 0.16, 0.2,
            },
            ["buff"] = GetSpellInfo(32357),
         },
         [2] = {
            ["tab"] = 2,
            ["num"] = 15,
            ["rank"] = {
               0.04, 0.08, 0.12, 0.16, 0.2,
            },
            ["buff"] = GetSpellInfo(9634),
         },
         [3] = {
            ["tab"] = 2,
            ["num"] = 16,
            ["rank"] = {
               0.01, 0.02, 0.03,
            },
         },
         [4] = {
            ["rank"] = {
               0.25,
            },
            ["buff"] = GetSpellInfo(32357),
         },
         [5] = {
            ["rank"] = {
               0.25,
            },
            ["buff"] = GetSpellInfo(9634),
         },
      },


      ["MOD_STR"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 16,
            ["rank"] = {
               0.01, 0.02, 0.03,
            },
         },
      },



      ["MOD_AP"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 15,
            ["rank"] = {
               0.02, 0.04, 0.06, 0.08, 0.1,
            },
            ["buff"] = GetSpellInfo(32356),
         },
      },


      ["MOD_AGI"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 16,
            ["rank"] = {
               0.01, 0.02, 0.03,
            },
         },
      },




      ["MOD_INT"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 15,
            ["rank"] = {
               0.04, 0.08, 0.12, 0.16, 0.2,
            },
         },
         [2] = {
            ["tab"] = 2,
            ["num"] = 16,
            ["rank"] = {
               0.01, 0.02, 0.03,
            },
         },
      },




      ["MOD_SPI"] = {
         [1] = {
            ["tab"] = 3,
            ["num"] = 16,
            ["rank"] = {
               0.05, 0.1, 0.15,
            },
         },
         [2] = {
            ["tab"] = 2,
            ["num"] = 16,
            ["rank"] = {
               0.01, 0.02, 0.03,
            },
         },
      },
   },
   ["HUNTER"] = {











      ["ADD_MANA_REG_MOD_INT"] = {
         [1] = {
            ["rank"] = {
               0.25,
            },
            ["buff"] = GetSpellInfo(34074),
         },
      },


      ["ADD_RANGED_AP_MOD_INT"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 16,
            ["rank"] = {
               0.15, 0.30, 0.45,
            },
         },
      },



      ["MOD_AP"] = {
         [1] = {
            ["tab"] = 3,
            ["num"] = 14,
            ["rank"] = {
               0.02, 0.04,
            },
         },
      },


      ["MOD_RANGED_AP"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 19,
            ["rank"] = {
               0.02, 0.04, 0.06, 0.08, 0.1,
            },
         },
      },


      ["MOD_ARMOR"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 5,
            ["rank"] = {
               1.04, 1.07, 1.1,
            },
         },
      },




      ["MOD_HEALTH"] = {
         [1] = {
            ["tab"] = 3,
            ["num"] = 9,
            ["rank"] = {
               1.02, 1.04, 1.06, 1.08, 1.1,
            },
         },
         [2] = {
            ["tab"] = 1,
            ["num"] = 2,
            ["rank"] = {
               1.01, 1.02, 1.03, 1.04, 1.05,
            },
         },
      },




      ["MOD_AGI"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 14,
            ["rank"] = {
               0.01, 0.02,
            },
         },
         [2] = {
            ["tab"] = 3,
            ["num"] = 18,
            ["rank"] = {
               0.03, 0.06, 0.09, 0.12, 0.15,
            },
         },
      },


      ["MOD_INT"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 14,
            ["rank"] = {
               0.03, 0.06,
            },
         },
      },
   },
   ["MAGE"] = {



      ["ADD_ARMOR_MOD_INT"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 9,
            ["rank"] = {
               1,
            },
         },
      },



      ["ADD_MANA_REG_MOD_NORMAL_MANA_REG"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 12,
            ["rank"] = {
               0.1, 0.2, 0.3,
            },
         },
      },


      ["ADD_SPELL_DMG_MOD_INT"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 22,
            ["rank"] = {
               0.05, 0.1, 0.15, 0.2, 0.25,
            },
         },
      },


      ["MOD_INT"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 15,
            ["rank"] = {
               0.03, 0.06, 0.09, 0.12, 0.15,
            },
         },
      },
   },
   ["PALADIN"] = {


      ["ADD_SPELL_DMG_MOD_INT"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 19,
            ["rank"] = {
               0.07, 0.14, 0.21, 0.28, 0.35,
            },
         },
      },


      ["ADD_HEALING_MOD_INT"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 19,
            ["rank"] = {
               0.07, 0.14, 0.21, 0.28, 0.35,
            },
         },
      },


      ["MOD_ARMOR"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 5,
            ["rank"] = {
               1.02, 1.04, 1.06, 1.08, 1.1,
            },
         },
      },


      ["MOD_STR"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 1,
            ["rank"] = {
               0.02, 0.04, 0.06, 0.08, 0.1,
            },
         },
      },




      ["MOD_STA"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 16,
            ["rank"] = {
               0.03, 0.06,
            },
         },
         [2] = {
            ["tab"] = 2,
            ["num"] = 21,
            ["rank"] = {
               0.02, 0.04, 0.06, 0.08, 0.1,
            },
         },
      },


      ["MOD_INT"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 2,
            ["rank"] = {
               0.02, 0.04, 0.06, 0.08, 0.1,
            },
         },
      },


      ["MOD_BLOCK_VALUE"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 8,
            ["rank"] = {
               0.1, 0.2, 0.3,
            },
         },
      },
   },
   ["PRIEST"] = {



      ["ADD_MANA_REG_MOD_NORMAL_MANA_REG"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 9,
            ["rank"] = {
               0.1, 0.2, 0.3,
            },
         },
      },




      ["ADD_SPELL_DMG_MOD_SPI"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 14,
            ["rank"] = {
               0.05, 0.1, 0.15, 0.2, 0.25,
            },
         },
         [2] = {
            ["tab"] = 1,
            ["num"] = 15,
            ["rank"] = {
               0.05, 0.1,
            },
            ["buff"] = GetSpellInfo(39234),
         },
         [3] = {
            ["tab"] = 1,
            ["num"] = 15,
            ["rank"] = {
               0.05, 0.1,
            },
            ["buff"] = GetSpellInfo(32999),
         },
      },




      ["ADD_HEALING_MOD_SPI"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 14,
            ["rank"] = {
               0.05, 0.1, 0.15, 0.2, 0.25,
            },
         },
         [2] = {
            ["tab"] = 1,
            ["num"] = 15,
            ["rank"] = {
               0.05, 0.1,
            },
            ["buff"] = GetSpellInfo(39234),
         },
         [3] = {
            ["tab"] = 1,
            ["num"] = 15,
            ["rank"] = {
               0.05, 0.1,
            },
            ["buff"] = GetSpellInfo(32999),
         },
      },


      ["MOD_MANA"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 13,
            ["rank"] = {
               1.02, 1.04, 1.06, 1.08, 1.1,
            },
         },
      },


      ["MOD_STA"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 20,
            ["rank"] = {
               0.01, 0.02, 0.03, 0.04, 0.05,
            },
         },
      },


      ["MOD_INT"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 20,
            ["rank"] = {
               0.01, 0.02, 0.03, 0.04, 0.05,
            },
         },
      },




      ["MOD_SPI"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 20,
            ["rank"] = {
               0.01, 0.02, 0.03, 0.04, 0.05,
            },
         },
         [2] = {
            ["tab"] = 2,
            ["num"] = 13,
            ["rank"] = {
               0.05,
            },
         },
      },
   },
   ["ROGUE"] = {


      ["MOD_AP"] = {
         [1] = {
            ["tab"] = 3,
            ["num"] = 17,
            ["rank"] = {
               0.02, 0.04, 0.06, 0.08, 0.1,
            },
         },
      },






      ["ADD_DODGE"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 3,
            ["rank"] = {
               1, 2, 3, 4, 5,
            },
         },
         [2] = {
            ["rank"] = {
               50, 50,
            },
            ["buff"] = GetSpellInfo(26669),
         },
         [3] = {
            ["rank"] = {
               15,
            },
            ["buff"] = GetSpellInfo(31022),
         },
      },




      ["MOD_AGI"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 20,
            ["rank"] = {
               0.01, 0.02,
            },
         },
         [2] = {
            ["tab"] = 3,
            ["num"] = 21,
            ["rank"] = {
               0.03, 0.06, 0.09, 0.12, 0.15,
            },
         },
      },


      ["MOD_STA"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 20,
            ["rank"] = {
               0.02, 0.04,
            },
         },
      },
   },
   ["SHAMAN"] = {


      ["ADD_SPELL_DMG_MOD_AP"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 15,
            ["rank"] = {
               0.1, 0.2, 0.3,
            },
         },
      },


      ["ADD_HEALING_MOD_AP"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 15,
            ["rank"] = {
               0.1, 0.2, 0.3,
            },
         },
      },


      ["ADD_MANA_REG_MOD_INT"] = {
         [1] = {
            ["tab"] = 1,
            ["num"] = 14,
            ["rank"] = {
               0.02, 0.04, 0.06, 0.08, 0.1,
            },
         },
      },


      ["ADD_SPELL_DMG_MOD_INT"] = {
         [1] = {
            ["tab"] = 3,
            ["num"] = 18,
            ["rank"] = {
               0.1, 0.2, 0.3,
            },
         },
      },


      ["ADD_HEALING_MOD_INT"] = {
         [1] = {
            ["tab"] = 3,
            ["num"] = 18,
            ["rank"] = {
               0.1, 0.2, 0.3,
            },
         },
      },


      ["ADD_DODGE"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 9,
            ["rank"] = {
               1, 2, 3, 4, 5,
            },
         },
      },


      ["MOD_ARMOR"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 11,
            ["rank"] = {
               1.02, 1.04, 1.06, 1.08, 1.1,
            },
         },
      },


      ["MOD_MANA"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 1,
            ["rank"] = {
               1.01, 1.02, 1.03, 1.04, 1.05,
            },
         },
      },


      ["MOD_BLOCK_VALUE"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 2,
            ["rank"] = {
               0.05, 0.1, 0.15, 0.2, 0.25,
            },
         },
      },
   },
   ["WARLOCK"] = {




      ["ADD_SPELL_DMG_MOD_INT"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 20,
            ["rank"] = {
               0.012, 0.024, 0.036,
            },
            ["condition"] = "UnitExists('pet')",
         },
      },




      ["ADD_SPELL_DMG_MOD_STA"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 20,
            ["rank"] = {
               0.012, 0.024, 0.036,
            },
            ["condition"] = "UnitExists('pet')",
         },
      },


      ["MOD_HEALTH"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 9,
            ["rank"] = {
               1.01, 1.02, 1.03,
            },
         },
      },


      ["MOD_MANA"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 6,
            ["rank"] = {
               1.01, 1.02, 1.03,
            },
         },
      },


      ["MOD_STA"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 3,
            ["rank"] = {
               0.03, 0.06, 0.09, 0.12, 0.15,
            },
         },
      },


      ["MOD_SPI"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 3,
            ["rank"] = {
               -0.01, -0.02, -0.03, -0.04, -0.05,
            },
         },
      },
   },
   ["WARRIOR"] = {


      ["MOD_AP"] = {
         [1] = {
            ["tab"] = 2,
            ["num"] = 20,
            ["rank"] = {
               0.02, 0.04, 0.06, 0.08, 0.1,
            },
            ["stance"] = "Interface\\Icons\\Ability_Racial_Avatar",
         },
      },


      ["MOD_ARMOR"] = {
         [1] = {
            ["tab"] = 3,
            ["num"] = 5,
            ["rank"] = {
               1.02, 1.04, 1.06, 1.08, 1.1,
            },
         },
      },


      ["MOD_STA"] = {
         [1] = {
            ["tab"] = 3,
            ["num"] = 21,
            ["rank"] = {
               0.01, 0.02, 0.03, 0.04, 0.05,
            },
         },
      },


      ["MOD_STR"] = {
         [1] = {
            ["tab"] = 3,
            ["num"] = 21,
            ["rank"] = {
               0.02, 0.04, 0.06, 0.08, 0.1,
            },
         },
      },


      ["MOD_BLOCK_VALUE"] = {
         [1] = {
            ["tab"] = 3,
            ["num"] = 16,
            ["rank"] = {
               0.1, 0.2, 0.3,
            },
         },
      },
   },
}


local _allStatModTable = {


   ["MOD_SPELL_DMG"] = {
      [1] = {
         ["rank"] = {
            0.2,
         },
         ["buff"] = GetSpellInfo(37274),
      },
   },


   ["MOD_HEALING"] = {
      [1] = {
         ["rank"] = {
            0.2,
         },
         ["buff"] = GetSpellInfo(37274),
      },
   },


   ["ADD_DODGE"] = {
      [1] = {
         ["rank"] = {
            1,
         },
         ["race"] = "NightElf",
      },
   },






   ["MOD_ARMOR"] = {
      [1] = {
         ["rank"] = {
            1.15, 1.30,
         },
         ["buff"] = GetSpellInfo(27154),
      },
      [2] = {
         ["rank"] = {
            1.08, 1.16, 1.25,
         },
         ["buff"] = GetSpellInfo(15363),
      },
      [3] = {
         ["rank"] = {
            1.08, 1.16, 1.25,
         },
         ["buff"] = GetSpellInfo(16237),
      },
   },


   ["MOD_HEALTH"] = {
      [1] = {
         ["rank"] = {
            1.05,
         },
         ["race"] = "Tauren",
      },
   },




   ["MOD_STR"] = {
      [1] = {
         ["rank"] = {
            0.1,
         },
         ["buff"] = GetSpellInfo(20217),
      },
      [2] = {
         ["rank"] = {
            0.1,
         },
         ["buff"] = GetSpellInfo(25898),
      },
   },




   ["MOD_AGI"] = {
      [1] = {
         ["rank"] = {
            0.1,
         },
         ["buff"] = GetSpellInfo(20217),
      },
      [2] = {
         ["rank"] = {
            0.1,
         },
         ["buff"] = GetSpellInfo(25898),
      },
   },




   ["MOD_STA"] = {
      [1] = {
         ["rank"] = {
            0.1,
         },
         ["buff"] = GetSpellInfo(20217),
      },
      [2] = {
         ["rank"] = {
            0.1,
         },
         ["buff"] = GetSpellInfo(25898),
      },
   },






   ["MOD_INT"] = {
      [1] = {
         ["rank"] = {
            0.1,
         },
         ["buff"] = GetSpellInfo(20217),
      },
      [2] = {
         ["rank"] = {
            0.1,
         },
         ["buff"] = GetSpellInfo(25898),
      },
      [3] = {
         ["rank"] = {
            0.05,
         },
         ["race"] = "Gnome",
      },
   },






   ["MOD_SPI"] = {
      [1] = {
         ["rank"] = {
            0.1,
         },
         ["buff"] = GetSpellInfo(20217),
      },
      [2] = {
         ["rank"] = {
            0.1,
         },
         ["buff"] = GetSpellInfo(25898),
      },
      [3] = {
         ["rank"] = {
            0.1,
         },
         ["race"] = "Human",
      },
   },
}



local function adjustStatModifier(statModInfo, race, table, modifier)
   for _, case in pairs(table) do
      local ok = true;

      local buffName = nil;
      if (case.buff) then
         buffName = case.buff;
      end
      if ok and case.condition and not loadstring("return " .. case.condition)() then ok = nil end
      if ok and case.buff and not AuraUtil.FindAuraByName(buffName, "player") then ok = nil end
      if ok and case.stance and case.stance ~= getStanceIcon() then ok = nil end
      if ok and case.race and case.race ~= race then ok = nil end
      if ok then
         local rank;

         if case.tab and case.num then
            local talentInfo = { GetTalentInfo(case.tab, case.num) };
            rank = talentInfo[5];

         elseif case.buff then
            rank = getPlayerBuffRank(buffName);

         elseif case.condition or case.stance or case.race then
            rank = 1;
         end
         if rank and rank ~= 0 and case.rank[rank] then
            if statModInfo.initialValue == 0 then
               modifier = modifier + case.rank[rank];
            else
               modifier = modifier * case.rank[rank];
            end
         end
      end
   end

   return modifier
end

local _config;
local function loadConfig()
   if (_config) then
      return _config
   else
      if (LB.Config) then
         _config = LB.Config.DisplayToggles;
         return _config
      else
         return nil
      end
   end
end
LB.Attributes.Core.LoadConfig = loadConfig;



local function getStatMod(stat, class, race)
   local statModInfo = _statModInfo[stat];
   local mod = statModInfo.initialValue;

   if type(_classStatModTable[class][stat]) == "table" then
      local talentModDetails = _classStatModTable[class][stat];
      mod = adjustStatModifier(statModInfo, race, talentModDetails, mod);
   end

   if type(_allStatModTable[stat]) == "table" then
      local allModDetails = _allStatModTable[stat];
      mod = adjustStatModifier(statModInfo, race, allModDetails, mod);
   end

   return mod + statModInfo.finalAdjust
end
LB.Attributes.Core.GetStatMod = getStatMod;

local function getBaseDodge(class)
   return _classBaseDodge[class]
end
LB.Attributes.Core.GetBaseDodge = getBaseDodge;


local function decimalFormat(value)
   if (value > 0 and value < 1) then
      return format("%.1F", value)
   else
      return format("%d", value)
   end
end
LB.Attributes.Core.DecimalFormat = decimalFormat;

local function getAttributeTable(stat)
   if stat == "ITEM_MOD_AGILITY" then
      return LB.Attributes.Agility
   end
   if stat == "ITEM_MOD_INTELLECT" then
      return LB.Attributes.Intellect
   end
   if stat == "ITEM_MOD_SPIRIT" then
      return LB.Attributes.Spirit
   end
   if stat == "ITEM_MOD_STAMINA" then
      return LB.Attributes.Stamina
   end
   if stat == "ITEM_MOD_STRENGTH" then
      return LB.Attributes.Strength
   end
end
LB.Attributes.GetAttributeTable = getAttributeTable;
