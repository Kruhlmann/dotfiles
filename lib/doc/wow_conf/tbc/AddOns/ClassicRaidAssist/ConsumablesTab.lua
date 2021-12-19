local ConsumablesTab =  {}
_G["ConsumablesTab"] = ConsumablesTab

local AceGUI = LibStub("AceGUI-3.0")

local specs = {
    ["All Classes"] = {
        ["englishClass"] = "",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {}
    },
    ["Ele Shaman"] = {
        ["englishClass"] = "SHAMAN",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Dark Rune"] = {
                ["icon"] = "Interface\\Icons\\spell_shadow_sealofkings",
                ["id"] = "20520",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20520",
                ["playerCheckBuff"] = false
            },
            ["Demonic Rune"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_rune_04",
                ["id"] = "12662",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "12662",
                ["playerCheckBuff"] = false
            },
            ["Major Mana Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_76",
                ["id"] = "13444",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13444",
                ["playerCheckBuff"] = false
            },
            ["Mageblood Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_45",
                ["id"] = "20007",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "24363",
                ["itemId"] = "20007",
                ["playerCheckBuff"] = false
            },
            ["Flask of Supreme Power"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_41",
                ["id"] = "13512",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17628",
                ["itemId"] = "13512",
                ["playerCheckBuff"] = false
            },
            ["Greater Arcane Elixir"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_25",
                ["id"] = "13454",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17539",
                ["itemId"] = "13454",
                ["playerCheckBuff"] = false
            },
            ["Nightfin Soup"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_17",
                ["id"] = "13931",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18233",
                ["itemId"] = "13931",
                ["playerCheckBuff"] = false
            },
            ["Sagefish Delight"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_fish_21",
                ["id"] = "21217",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25691",
                ["itemId"] = "21217",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Enh Shaman"] = {
        ["englishClass"] = "SHAMAN",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Dark Rune"] = {
                ["icon"] = "Interface\\Icons\\spell_shadow_sealofkings",
                ["id"] = "20520",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20520",
                ["playerCheckBuff"] = false
            },
            ["Demonic Rune"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_rune_04",
                ["id"] = "12662",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "12662",
                ["playerCheckBuff"] = false
            },
            ["Major Mana Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_76",
                ["id"] = "13444",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13444",
                ["playerCheckBuff"] = false
            },
            ["Mageblood Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_45",
                ["id"] = "20007",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "24363",
                ["itemId"] = "20007",
                ["playerCheckBuff"] = false
            },
            ["Elixir of the Mongoose"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_32",
                ["id"] = "13452",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17538",
                ["itemId"] = "13452",
                ["playerCheckBuff"] = false
            },
            ["Nightfin Soup"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_17",
                ["id"] = "13931",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18233",
                ["itemId"] = "13931",
                ["playerCheckBuff"] = false
            },
            ["Sagefish Delight"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_fish_21",
                ["id"] = "21217",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25691",
                ["itemId"] = "21217",
                ["playerCheckBuff"] = false
            },
            ["Grilled Squid"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_fish_13",
                ["id"] = "13928",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18230",
                ["itemId"] = "13928",
                ["playerCheckBuff"] = false
            },
            ["Flask of the Titans"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_62",
                ["id"] = "13510",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17626",
                ["itemId"] = "13510",
                ["playerCheckBuff"] = false
            },
            ["Juju Might"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_07",
                ["id"] = "12460",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16329",
                ["itemId"] = "12460",
                ["playerCheckBuff"] = false
            },
            ["Juju Power"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_11",
                ["id"] = "12451",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16323",
                ["itemId"] = "12451",
                ["playerCheckBuff"] = false
            },
            ["Ground Scorpok Assay"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_dust_02",
                ["id"] = "8412",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10669",
                ["itemId"] = "8412",
                ["playerCheckBuff"] = false
            },
            ["R.O.I.D.S."] = {
                ["icon"] = "Interface\\Icons\\inv_stone_15",
                ["id"] = "8410",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10667",
                ["itemId"] = "8410",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Feral DPS"] = {
        ["englishClass"] = "DRUID",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Flask of the Titans"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_62",
                ["id"] = "13510",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17626",
                ["itemId"] = "13510",
                ["playerCheckBuff"] = false
            },
            ["Elixir of the Mongoose"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_32",
                ["id"] = "13452",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17538",
                ["itemId"] = "13452",
                ["playerCheckBuff"] = false
            },
            ["Elixir of Giants"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_61",
                ["id"] = "9206",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "11405",
                ["itemId"] = "9206",
                ["playerCheckBuff"] = false
            },
            ["Blessed Sunfruit"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_41",
                ["id"] = "13810",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18124",
                ["itemId"] = "13810",
                ["playerCheckBuff"] = false
            },
            ["Grilled Squid"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_fish_13",
                ["id"] = "13928",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18230",
                ["itemId"] = "13928",
                ["playerCheckBuff"] = false
            },
            ["Rumsey Rum Black Label"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_04",
                ["id"] = "21151",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25804",
                ["itemId"] = "21151",
                ["playerCheckBuff"] = false
            },
            ["Gordok Green Grog"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_03",
                ["id"] = "18269",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22789",
                ["itemId"] = "18269",
                ["playerCheckBuff"] = false
            },
            ["Juju Might"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_07",
                ["id"] = "12460",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16329",
                ["itemId"] = "12460",
                ["playerCheckBuff"] = false
            },
            ["Juju Power"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_11",
                ["id"] = "12451",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16323",
                ["itemId"] = "12451",
                ["playerCheckBuff"] = false
            },
            ["Juju Flurry"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_17",
                ["id"] = "12450",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16322",
                ["itemId"] = "12450",
                ["playerCheckBuff"] = false
            },
            ["Ground Scorpok Assay"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_dust_02",
                ["id"] = "8412",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10669",
                ["itemId"] = "8412",
                ["playerCheckBuff"] = false
            },
            ["Lung Juice Cocktail"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_12",
                ["id"] = "8411",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10668",
                ["itemId"] = "8411",
                ["playerCheckBuff"] = false
            },
            ["R.O.I.D.S."] = {
                ["icon"] = "Interface\\Icons\\inv_stone_15",
                ["id"] = "8410",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10667",
                ["itemId"] = "8410",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            },
            ["Manual Crowd Pummeler"] = {
                ["icon"] = "Interface\\Icons\\inv_mace_14",
                ["id"] = "9449",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "13494",
                ["itemId"] = "9449",
                ["playerCheckBuff"] = false
            },
            ["Major Mana Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_76",
                ["id"] = "13444",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13444",
                ["playerCheckBuff"] = false
            },
            ["Dark Rune"] = {
                ["icon"] = "Interface\\Icons\\spell_shadow_sealofkings",
                ["id"] = "20520",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20520",
                ["playerCheckBuff"] = false
            },
            ["Demonic Rune"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_rune_04",
                ["id"] = "12662",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "12662",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Feral Tank"] = {
        ["englishClass"] = "DRUID",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Flask of the Titans"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_62",
                ["id"] = "13510",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17626",
                ["itemId"] = "13510",
                ["playerCheckBuff"] = false
            },
            ["Elixir of the Mongoose"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_32",
                ["id"] = "13452",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17538",
                ["itemId"] = "13452",
                ["playerCheckBuff"] = false
            },
            ["Blessed Sunfruit"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_41",
                ["id"] = "13810",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18124",
                ["itemId"] = "13810",
                ["playerCheckBuff"] = false
            },
            ["Grilled Squid"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_fish_13",
                ["id"] = "13928",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18230",
                ["itemId"] = "13928",
                ["playerCheckBuff"] = false
            },
            ["Rumsey Rum Black Label"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_04",
                ["id"] = "21151",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25804",
                ["itemId"] = "21151",
                ["playerCheckBuff"] = false
            },
            ["Gordok Green Grog"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_03",
                ["id"] = "18269",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22789",
                ["itemId"] = "18269",
                ["playerCheckBuff"] = false
            },
            ["Juju Might"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_07",
                ["id"] = "12460",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16329",
                ["itemId"] = "12460",
                ["playerCheckBuff"] = false
            },
            ["Juju Power"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_11",
                ["id"] = "12451",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16323",
                ["itemId"] = "12451",
                ["playerCheckBuff"] = false
            },
            ["Ground Scorpok Assay"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_dust_02",
                ["id"] = "8412",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10669",
                ["itemId"] = "8412",
                ["playerCheckBuff"] = false
            },
            ["Lung Juice Cocktail"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_12",
                ["id"] = "8411",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10668",
                ["itemId"] = "8411",
                ["playerCheckBuff"] = false
            },
            ["R.O.I.D.S."] = {
                ["icon"] = "Interface\\Icons\\inv_stone_15",
                ["id"] = "8410",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10667",
                ["itemId"] = "8410",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            },
            ["Manual Crowd Pummeler"] = {
                ["icon"] = "Interface\\Icons\\inv_mace_14",
                ["id"] = "9449",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "13494",
                ["itemId"] = "9449",
                ["playerCheckBuff"] = false
            },
            ["Dark Rune"] = {
                ["icon"] = "Interface\\Icons\\spell_shadow_sealofkings",
                ["id"] = "20520",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20520",
                ["playerCheckBuff"] = false
            },
            ["Demonic Rune"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_rune_04",
                ["id"] = "12662",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "12662",
                ["playerCheckBuff"] = false
            },
            ["Elixir of Giants"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_61",
                ["id"] = "9206",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "11405",
                ["itemId"] = "9206",
                ["playerCheckBuff"] = false
            },
            ["Juju Flurry"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_17",
                ["id"] = "12450",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16322",
                ["itemId"] = "12450",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Healing Priest"] = {
        ["englishClass"] = "PRIEST",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Major Mana Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_76",
                ["id"] = "13444",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13444",
                ["playerCheckBuff"] = false
            },
            ["Demonic Rune"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_rune_04",
                ["id"] = "12662",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "12662",
                ["playerCheckBuff"] = false
            },
            ["Flask of Distilled Wisdom"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_97",
                ["id"] = "13511",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17627",
                ["itemId"] = "13511",
                ["playerCheckBuff"] = false
            },
            ["Elixir of Greater Intellect"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_10",
                ["id"] = "9179",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "11396",
                ["itemId"] = "9179",
                ["playerCheckBuff"] = false
            },
            ["Mageblood Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_45",
                ["id"] = "20007",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "24363",
                ["itemId"] = "20007",
                ["playerCheckBuff"] = false
            },
            ["Nightfin Soup"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_17",
                ["id"] = "13931",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18233",
                ["itemId"] = "13931",
                ["playerCheckBuff"] = false
            },
            ["Sagefish Delight"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_fish_21",
                ["id"] = "21217",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25691",
                ["itemId"] = "21217",
                ["playerCheckBuff"] = false
            },
            ["Kreeg's Stout Beatdown"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_05",
                ["id"] = "18284",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22790",
                ["itemId"] = "18284",
                ["playerCheckBuff"] = false
            },
            ["Gizzard Gum"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_30",
                ["id"] = "8424",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10693",
                ["itemId"] = "8424",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Holy Paladin"] = {
        ["englishClass"] = "PALADIN",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Flask of Distilled Wisdom"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_97",
                ["id"] = "13511",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17627",
                ["itemId"] = "13511",
                ["playerCheckBuff"] = false
            },
            ["Mageblood Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_45",
                ["id"] = "20007",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "24363",
                ["itemId"] = "20007",
                ["playerCheckBuff"] = false
            },
            ["Nightfin Soup"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_17",
                ["id"] = "13931",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18233",
                ["itemId"] = "13931",
                ["playerCheckBuff"] = false
            },
            ["Gordok Green Grog"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_03",
                ["id"] = "18269",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22789",
                ["itemId"] = "18269",
                ["playerCheckBuff"] = false
            },
            ["Rumsey Rum Black Label"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_04",
                ["id"] = "21151",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25804",
                ["itemId"] = "21151",
                ["playerCheckBuff"] = false
            },
            ["Lung Juice Cocktail"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_12",
                ["id"] = "8411",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10668",
                ["itemId"] = "8411",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Major Mana Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_76",
                ["id"] = "13444",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13444",
                ["playerCheckBuff"] = false
            },
            ["Dark Rune"] = {
                ["icon"] = "Interface\\Icons\\spell_shadow_sealofkings",
                ["id"] = "20520",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20520",
                ["playerCheckBuff"] = false
            },
            ["Dark Rune"] = {
                ["icon"] = "Interface\\Icons\\spell_shadow_sealofkings",
                ["id"] = "20520",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20520",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Hunter"] = {
        ["englishClass"] = "HUNTER",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Doomshot"] = {
                ["icon"] = "Interface\\Icons\\ability_hunter_criticalshot",
                ["id"] = "12654",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "Doomshot",
                ["playerCheckBuff"] = false
            },
            ["Thorium Headed Arrow"] = {
                ["icon"] = "Interface\\Icons\\inv_ammo_arrow_02",
                ["id"] = "18042",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "Thorium Headed Arrow",
                ["playerCheckBuff"] = false
            },
            ["Thorium Shells"] = {
                ["icon"] = "Interface\\Icons\\inv_ammo_bullet_03",
                ["id"] = "15997",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "Thorium Shells",
                ["playerCheckBuff"] = false
            },
            ["Flask of the Titans"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_62",
                ["id"] = "13510",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17626",
                ["itemId"] = "13510",
                ["playerCheckBuff"] = false
            },
            ["Elixir of the Mongoose"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_32",
                ["id"] = "13452",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17538",
                ["itemId"] = "13452",
                ["playerCheckBuff"] = false
            },
            ["Elixir of Greater Agility"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_94",
                ["id"] = "9187",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "11334",
                ["itemId"] = "9187",
                ["playerCheckBuff"] = false
            },
            ["Grilled Squid"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_fish_13",
                ["id"] = "13928",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18230",
                ["itemId"] = "13928",
                ["playerCheckBuff"] = false
            },
            ["Gordok Green Grog"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_03",
                ["id"] = "18269",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22789",
                ["itemId"] = "18269",
                ["playerCheckBuff"] = false
            },
            ["Winterfall Firewater"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_92",
                ["id"] = "12820",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17038",
                ["itemId"] = "12820",
                ["playerCheckBuff"] = false
            },
            ["Major Mana Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_76",
                ["id"] = "13444",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13444",
                ["playerCheckBuff"] = false
            },
            ["Demonic Rune"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_rune_04",
                ["id"] = "12662",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "12662",
                ["playerCheckBuff"] = false
            },
            ["Dark Rune"] = {
                ["icon"] = "Interface\\Icons\\spell_shadow_sealofkings",
                ["id"] = "20520",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20520",
                ["playerCheckBuff"] = false
            },
            ["Juju Might"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_07",
                ["id"] = "12460",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16329",
                ["itemId"] = "12460",
                ["playerCheckBuff"] = false
            },
            ["Juju Power"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_11",
                ["id"] = "12451",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16323",
                ["itemId"] = "12451",
                ["playerCheckBuff"] = false
            },
            ["Ground Scorpok Assay"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_dust_02",
                ["id"] = "8412",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10669",
                ["itemId"] = "8412",
                ["playerCheckBuff"] = false
            },
            ["R.O.I.D.S."] = {
                ["icon"] = "Interface\\Icons\\inv_stone_15",
                ["id"] = "8410",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10667",
                ["itemId"] = "8410",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Rumsey Rum Black Label"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_04",
                ["id"] = "21151",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25804",
                ["itemId"] = "21151",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Mage"] = {
        ["englishClass"] = "MAGE",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Flask of Supreme Power"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_41",
                ["id"] = "13512",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17628",
                ["itemId"] = "13512",
                ["playerCheckBuff"] = false
            },
            ["Greater Arcane Elixir"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_25",
                ["id"] = "13454",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17539",
                ["itemId"] = "13454",
                ["playerCheckBuff"] = false
            },
            ["Elixir of Greater Firepower"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_60",
                ["id"] = "21546",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "26276",
                ["itemId"] = "21546",
                ["playerCheckBuff"] = false
            },
            ["Elixir of Frost Power"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_03",
                ["id"] = "17708",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "21920",
                ["itemId"] = "17708",
                ["playerCheckBuff"] = false
            },
            ["Elixir of the Sages"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_29",
                ["id"] = "13447",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17535",
                ["itemId"] = "13447",
                ["playerCheckBuff"] = false
            },
            ["Mageblood Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_45",
                ["id"] = "20007",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "24363",
                ["itemId"] = "20007",
                ["playerCheckBuff"] = false
            },
            ["Nightfin Soup"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_17",
                ["id"] = "13931",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18233",
                ["itemId"] = "13931",
                ["playerCheckBuff"] = false
            },
            ["Runn Tum Tuber Surprise"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_63",
                ["id"] = "18254",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22730",
                ["itemId"] = "18254",
                ["playerCheckBuff"] = false
            },
            ["Dark Rune"] = {
                ["icon"] = "Interface\\Icons\\spell_shadow_sealofkings",
                ["id"] = "20520",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20520",
                ["playerCheckBuff"] = false
            },
            ["Demonic Rune"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_rune_04",
                ["id"] = "12662",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "12662",
                ["playerCheckBuff"] = false
            },
            ["Major Mana Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_76",
                ["id"] = "13444",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13444",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Moonkin"] = {
        ["englishClass"] = "DRUID",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Flask of Supreme Power"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_41",
                ["id"] = "13512",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17628",
                ["itemId"] = "13512",
                ["playerCheckBuff"] = false
            },
            ["Greater Arcane Elixir"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_25",
                ["id"] = "13454",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17539",
                ["itemId"] = "13454",
                ["playerCheckBuff"] = false
            },
            ["Elixir of the Sages"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_29",
                ["id"] = "13447",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17535",
                ["itemId"] = "13447",
                ["playerCheckBuff"] = false
            },
            ["Mageblood Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_45",
                ["id"] = "20007",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "24363",
                ["itemId"] = "20007",
                ["playerCheckBuff"] = false
            },
            ["Nightfin Soup"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_17",
                ["id"] = "13931",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18233",
                ["itemId"] = "13931",
                ["playerCheckBuff"] = false
            },
            ["Gordok Green Grog"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_03",
                ["id"] = "18269",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22789",
                ["itemId"] = "18269",
                ["playerCheckBuff"] = false
            },
            ["Major Mana Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_76",
                ["id"] = "13444",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13444",
                ["playerCheckBuff"] = false
            },
            ["Demonic Rune"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_rune_04",
                ["id"] = "12662",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "12662",
                ["playerCheckBuff"] = false
            },
            ["Dark Rune"] = {
                ["icon"] = "Interface\\Icons\\spell_shadow_sealofkings",
                ["id"] = "20520",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20520",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Rumsey Rum Black Label"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_04",
                ["id"] = "21151",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25804",
                ["itemId"] = "21151",
                ["playerCheckBuff"] = false
            },
            ["Rumsey Rum Black Label"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_04",
                ["id"] = "21151",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25804",
                ["itemId"] = "21151",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Prot Paladin"] = {
        ["englishClass"] = "PALADIN",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Flask of the Titans"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_62",
                ["id"] = "13510",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17626",
                ["itemId"] = "13510",
                ["playerCheckBuff"] = false
            },
            ["Major Mana Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_76",
                ["id"] = "13444",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13444",
                ["playerCheckBuff"] = false
            },
            ["Demonic Rune"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_rune_04",
                ["id"] = "12662",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "12662",
                ["playerCheckBuff"] = false
            },
            ["Dark Rune"] = {
                ["icon"] = "Interface\\Icons\\spell_shadow_sealofkings",
                ["id"] = "20520",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20520",
                ["playerCheckBuff"] = false
            },
            ["Juju Power"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_11",
                ["id"] = "12451",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16323",
                ["itemId"] = "12451",
                ["playerCheckBuff"] = false
            },
            ["Juju Might"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_07",
                ["id"] = "12460",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16329",
                ["itemId"] = "12460",
                ["playerCheckBuff"] = false
            },
            ["Juju Flurry"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_17",
                ["id"] = "12450",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16322",
                ["itemId"] = "12450",
                ["playerCheckBuff"] = false
            },
            ["Elixir of the Mongoose"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_32",
                ["id"] = "13452",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17538",
                ["itemId"] = "13452",
                ["playerCheckBuff"] = false
            },
            ["Greater Arcane Elixir"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_25",
                ["id"] = "13454",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17539",
                ["itemId"] = "13454",
                ["playerCheckBuff"] = false
            },
            ["Elixir of Fortitude"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_43",
                ["id"] = "3825",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "3593",
                ["itemId"] = "3825",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            },
            ["R.O.I.D.S."] = {
                ["icon"] = "Interface\\Icons\\inv_stone_15",
                ["id"] = "8410",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10667",
                ["itemId"] = "8410",
                ["playerCheckBuff"] = false
            },
            ["Ground Scorpok Assay"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_dust_02",
                ["id"] = "8412",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10669",
                ["itemId"] = "8412",
                ["playerCheckBuff"] = false
            },
            ["Elemental Sharpening Stone"] = {
                ["icon"] = "Interface\\Icons\\inv_stone_02",
                ["id"] = "18262",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22756",
                ["itemId"] = "18262",
                ["playerCheckBuff"] = false
            },
            ["Blessed Sunfruit"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_41",
                ["id"] = "13810",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18124",
                ["itemId"] = "13810",
                ["playerCheckBuff"] = false
            },
            ["Rumsey Rum Black Label"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_04",
                ["id"] = "21151",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25804",
                ["itemId"] = "21151",
                ["playerCheckBuff"] = false
            },
            ["Gordok Green Grog"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_03",
                ["id"] = "18269",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22789",
                ["itemId"] = "18269",
                ["playerCheckBuff"] = false
            },
            ["Greater Arcane Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_83",
                ["id"] = "13461",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17549",
                ["itemId"] = "13461",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Prot Warrior"] = {
        ["englishClass"] = "WARRIOR",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Mighty Rage Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_41",
                ["id"] = "13442",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13442",
                ["playerCheckBuff"] = false
            },
            ["Flask of the Titans"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_62",
                ["id"] = "13510",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17626",
                ["itemId"] = "13510",
                ["playerCheckBuff"] = false
            },
            ["Elixir of the Mongoose"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_32",
                ["id"] = "13452",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17538",
                ["itemId"] = "13452",
                ["playerCheckBuff"] = false
            },
            ["Elixir of Greater Agility"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_94",
                ["id"] = "9187",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "11334",
                ["itemId"] = "9187",
                ["playerCheckBuff"] = false
            },
            ["Smoked Desert Dumplings"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_64",
                ["id"] = "20452",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "24800",
                ["itemId"] = "20452",
                ["playerCheckBuff"] = false
            },
            ["Blessed Sunfruit"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_41",
                ["id"] = "13810",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18124",
                ["itemId"] = "13810",
                ["playerCheckBuff"] = false
            },
            ["Tender Wolf Steak"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_47",
                ["id"] = "18045",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10256",
                ["itemId"] = "18045",
                ["playerCheckBuff"] = false
            },
            ["Dirge's Kickin' Chimaerok Chops"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_65",
                ["id"] = "21023",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25660",
                ["itemId"] = "21023",
                ["playerCheckBuff"] = false
            },
            ["Rumsey Rum Black Label"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_04",
                ["id"] = "21151",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25804",
                ["itemId"] = "21151",
                ["playerCheckBuff"] = false
            },
            ["Elemental Sharpening Stone"] = {
                ["icon"] = "Interface\\Icons\\inv_stone_02",
                ["id"] = "18262",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22756",
                ["itemId"] = "18262",
                ["playerCheckBuff"] = false
            },
            ["Dense Sharpening Stone"] = {
                ["icon"] = "Interface\\Icons\\inv_stone_sharpeningstone_05",
                ["id"] = "12404",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16138",
                ["itemId"] = "12404",
                ["playerCheckBuff"] = false
            },
            ["Juju Might"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_07",
                ["id"] = "12460",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16329",
                ["itemId"] = "12460",
                ["playerCheckBuff"] = false
            },
            ["Juju Power"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_11",
                ["id"] = "12451",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16323",
                ["itemId"] = "12451",
                ["playerCheckBuff"] = false
            },
            ["Ground Scorpok Assay"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_dust_02",
                ["id"] = "8412",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10669",
                ["itemId"] = "8412",
                ["playerCheckBuff"] = false
            },
            ["R.O.I.D.S."] = {
                ["icon"] = "Interface\\Icons\\inv_stone_15",
                ["id"] = "8410",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10667",
                ["itemId"] = "8410",
                ["playerCheckBuff"] = false
            },
            ["Lung Juice Cocktail"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_12",
                ["id"] = "8411",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10668",
                ["itemId"] = "8411",
                ["playerCheckBuff"] = false
            },
            ["Greater Stoneshield Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_69",
                ["id"] = "13455",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17540",
                ["itemId"] = "13455",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Resto Druid"] = {
        ["englishClass"] = "DRUID",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Flask of Distilled Wisdom"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_97",
                ["id"] = "13511",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17627",
                ["itemId"] = "13511",
                ["playerCheckBuff"] = false
            },
            ["Major Mana Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_76",
                ["id"] = "13444",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13444",
                ["playerCheckBuff"] = false
            },
            ["Dark Rune"] = {
                ["icon"] = "Interface\\Icons\\spell_shadow_sealofkings",
                ["id"] = "20520",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20520",
                ["playerCheckBuff"] = false
            },
            ["Demonic Rune"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_rune_04",
                ["id"] = "12662",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "12662",
                ["playerCheckBuff"] = false
            },
            ["Mageblood Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_45",
                ["id"] = "20007",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "24363",
                ["itemId"] = "20007",
                ["playerCheckBuff"] = false
            },
            ["Nightfin Soup"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_17",
                ["id"] = "13931",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18233",
                ["itemId"] = "13931",
                ["playerCheckBuff"] = false
            },
            ["Runn Tum Tuber Surprise"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_63",
                ["id"] = "18254",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22730",
                ["itemId"] = "18254",
                ["playerCheckBuff"] = false
            },
            ["Blessed Sunfruit Juice"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_16",
                ["id"] = "13813",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18140",
                ["itemId"] = "13813",
                ["playerCheckBuff"] = false
            },
            ["Kreeg's Stout Beatdown"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_05",
                ["id"] = "18284",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22790",
                ["itemId"] = "18284",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Resto Shaman"] = {
        ["englishClass"] = "SHAMAN",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Dark Rune"] = {
                ["icon"] = "Interface\\Icons\\spell_shadow_sealofkings",
                ["id"] = "20520",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20520",
                ["playerCheckBuff"] = false
            },
            ["Demonic Rune"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_rune_04",
                ["id"] = "12662",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "12662",
                ["playerCheckBuff"] = false
            },
            ["Major Mana Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_76",
                ["id"] = "13444",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13444",
                ["playerCheckBuff"] = false
            },
            ["Mageblood Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_45",
                ["id"] = "20007",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "24363",
                ["itemId"] = "20007",
                ["playerCheckBuff"] = false
            },
            ["Flask of Distilled Wisdom"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_97",
                ["id"] = "13511",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17627",
                ["itemId"] = "13511",
                ["playerCheckBuff"] = false
            },
            ["Nightfin Soup"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_17",
                ["id"] = "13931",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18233",
                ["itemId"] = "13931",
                ["playerCheckBuff"] = false
            },
            ["Sagefish Delight"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_fish_21",
                ["id"] = "21217",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25691",
                ["itemId"] = "21217",
                ["playerCheckBuff"] = false
            },
            ["Gizzard Gum"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_30",
                ["id"] = "8424",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10693",
                ["itemId"] = "8424",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Ret Paladin"] = {
        ["englishClass"] = "PALADIN",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Demonic Rune"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_rune_04",
                ["id"] = "12662",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "12662",
                ["playerCheckBuff"] = false
            },
            ["Dark Rune"] = {
                ["icon"] = "Interface\\Icons\\spell_shadow_sealofkings",
                ["id"] = "20520",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20520",
                ["playerCheckBuff"] = false
            },
            ["Elemental Sharpening Stone"] = {
                ["icon"] = "Interface\\Icons\\inv_stone_02",
                ["id"] = "18262",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22756",
                ["itemId"] = "18262",
                ["playerCheckBuff"] = false
            },
            ["Juju Might"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_07",
                ["id"] = "12460",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16329",
                ["itemId"] = "12460",
                ["playerCheckBuff"] = false
            },
            ["Juju Power"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_11",
                ["id"] = "12451",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16323",
                ["itemId"] = "12451",
                ["playerCheckBuff"] = false
            },
            ["Juju Flurry"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_17",
                ["id"] = "12450",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16322",
                ["itemId"] = "12450",
                ["playerCheckBuff"] = false
            },
            ["Winterfall Firewater"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_92",
                ["id"] = "12820",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17038",
                ["itemId"] = "12820",
                ["playerCheckBuff"] = false
            },
            ["Ground Scorpok Assay"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_dust_02",
                ["id"] = "8412",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10669",
                ["itemId"] = "8412",
                ["playerCheckBuff"] = false
            },
            ["R.O.I.D.S."] = {
                ["icon"] = "Interface\\Icons\\inv_stone_15",
                ["id"] = "8410",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10667",
                ["itemId"] = "8410",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            },
            ["Major Mana Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_76",
                ["id"] = "13444",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13444",
                ["playerCheckBuff"] = false
            },
            ["Greater Arcane Elixir"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_25",
                ["id"] = "13454",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17539",
                ["itemId"] = "13454",
                ["playerCheckBuff"] = false
            },
            ["Elixir of the Mongoose"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_32",
                ["id"] = "13452",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17538",
                ["itemId"] = "13452",
                ["playerCheckBuff"] = false
            },
            ["Flask of Distilled Wisdom"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_97",
                ["id"] = "13511",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17627",
                ["itemId"] = "13511",
                ["playerCheckBuff"] = false
            },
            ["Flask of the Titans"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_62",
                ["id"] = "13510",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17626",
                ["itemId"] = "13510",
                ["playerCheckBuff"] = false
            },
            ["Elixir of the Mongoose"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_32",
                ["id"] = "13452",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17538",
                ["itemId"] = "13452",
                ["playerCheckBuff"] = false
            },
            ["Smoked Desert Dumplings"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_64",
                ["id"] = "20452",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "24800",
                ["itemId"] = "20452",
                ["playerCheckBuff"] = false
            },
            ["Gordok Green Grog"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_03",
                ["id"] = "18269",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22789",
                ["itemId"] = "18269",
                ["playerCheckBuff"] = false
            },
            ["Rumsey Rum Black Label"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_04",
                ["id"] = "21151",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25804",
                ["itemId"] = "21151",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Rogue"] = {
        ["englishClass"] = "ROGUE",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Thistle Tea"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_milk_05",
                ["id"] = "7676",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "7676",
                ["playerCheckBuff"] = false
            },
            ["Flask of the Titans"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_62",
                ["id"] = "13510",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17626",
                ["itemId"] = "13510",
                ["playerCheckBuff"] = false
            },
            ["Elixir of the Mongoose"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_32",
                ["id"] = "13452",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17538",
                ["itemId"] = "13452",
                ["playerCheckBuff"] = false
            },
            ["Elixir of Giants"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_61",
                ["id"] = "9206",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "11405",
                ["itemId"] = "9206",
                ["playerCheckBuff"] = false
            },
            ["Elixir of Greater Agility"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_94",
                ["id"] = "9187",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "11334",
                ["itemId"] = "9187",
                ["playerCheckBuff"] = false
            },
            ["Grilled Squid"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_fish_13",
                ["id"] = "13928",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18230",
                ["itemId"] = "13928",
                ["playerCheckBuff"] = false
            },
            ["Blessed Sunfruit"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_41",
                ["id"] = "13810",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18124",
                ["itemId"] = "13810",
                ["playerCheckBuff"] = false
            },
            ["Winterfall Firewater"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_92",
                ["id"] = "12820",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17038",
                ["itemId"] = "12820",
                ["playerCheckBuff"] = false
            },
            ["Instant Poison VI"] = {
                ["icon"] = "Interface\\Icons\\ability_poisons",
                ["id"] = "8928",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "11340",
                ["itemId"] = "8928",
                ["playerCheckBuff"] = false
            },
            ["Juju Might"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_07",
                ["id"] = "12460",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16329",
                ["itemId"] = "12460",
                ["playerCheckBuff"] = false
            },
            ["Juju Power"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_11",
                ["id"] = "12451",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16323",
                ["itemId"] = "12451",
                ["playerCheckBuff"] = false
            },
            ["Ground Scorpok Assay"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_dust_02",
                ["id"] = "8412",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10669",
                ["itemId"] = "8412",
                ["playerCheckBuff"] = false
            },
            ["R.O.I.D.S."] = {
                ["icon"] = "Interface\\Icons\\inv_stone_15",
                ["id"] = "8410",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10667",
                ["itemId"] = "8410",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Shadow Priest"] = {
        ["englishClass"] = "PRIEST",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Dark Rune"] = {
                ["icon"] = "Interface\\Icons\\spell_shadow_sealofkings",
                ["id"] = "20520",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20520",
                ["playerCheckBuff"] = false
            },
            ["Demonic Rune"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_rune_04",
                ["id"] = "12662",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "12662",
                ["playerCheckBuff"] = false
            },
            ["Major Mana Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_76",
                ["id"] = "13444",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13444",
                ["playerCheckBuff"] = false
            },
            ["Mageblood Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_45",
                ["id"] = "20007",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "24363",
                ["itemId"] = "20007",
                ["playerCheckBuff"] = false
            },
            ["Flask of Distilled Wisdom"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_97",
                ["id"] = "13511",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17627",
                ["itemId"] = "13511",
                ["playerCheckBuff"] = false
            },
            ["Flask of Supreme Power"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_41",
                ["id"] = "13512",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17628",
                ["itemId"] = "13512",
                ["playerCheckBuff"] = false
            },
            ["Elixir of Shadow Power"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_46",
                ["id"] = "9264",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "11474",
                ["itemId"] = "9264",
                ["playerCheckBuff"] = false
            },
            ["Greater Arcane Elixir"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_25",
                ["id"] = "13454",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17539",
                ["itemId"] = "13454",
                ["playerCheckBuff"] = false
            },
            ["Nightfin Soup"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_17",
                ["id"] = "13931",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18233",
                ["itemId"] = "13931",
                ["playerCheckBuff"] = false
            },
            ["Sagefish Delight"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_fish_21",
                ["id"] = "21217",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25691",
                ["itemId"] = "21217",
                ["playerCheckBuff"] = false
            },
            ["Kreeg's Stout Beatdown"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_05",
                ["id"] = "18284",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22790",
                ["itemId"] = "18284",
                ["playerCheckBuff"] = false
            },
            ["Gizzard Gum"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_30",
                ["id"] = "8424",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10693",
                ["itemId"] = "8424",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["Warlock"] = {
        ["englishClass"] = "WARLOCK",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Flask of Supreme Power"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_41",
                ["id"] = "13512",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17628",
                ["itemId"] = "13512",
                ["playerCheckBuff"] = false
            },
            ["Greater Arcane Elixir"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_25",
                ["id"] = "13454",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17539",
                ["itemId"] = "13454",
                ["playerCheckBuff"] = false
            },
            ["Elixir of Shadow Power"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_46",
                ["id"] = "9264",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "11474",
                ["itemId"] = "9264",
                ["playerCheckBuff"] = false
            },
            ["Elixir of Greater Firepower"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_60",
                ["id"] = "21546",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "26276",
                ["itemId"] = "21546",
                ["playerCheckBuff"] = false
            },
            ["Runn Tum Tuber Surprise"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_63",
                ["id"] = "18254",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22730",
                ["itemId"] = "18254",
                ["playerCheckBuff"] = false
            },
            ["Demonic Rune"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_rune_04",
                ["id"] = "12662",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "12662",
                ["playerCheckBuff"] = false
            },
            ["Dark Rune"] = {
                ["icon"] = "Interface\\Icons\\spell_shadow_sealofkings",
                ["id"] = "20520",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20520",
                ["playerCheckBuff"] = false
            },
            ["Major Mana Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_76",
                ["id"] = "13444",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13444",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            },
            ["Rumsey Rum Black Label"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_04",
                ["id"] = "21151",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25804",
                ["itemId"] = "21151",
                ["playerCheckBuff"] = false
            },
            ["Gordok Green Grog"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_03",
                ["id"] = "18269",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22789",
                ["itemId"] = "18269",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Arcane Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_83",
                ["id"] = "13461",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17549",
                ["itemId"] = "13461",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            }
        }
    },
    ["DPS Warrior"] = {
        ["englishClass"] = "WARRIOR",
        ["currentBuffs"] = {},
        ["currentItems"] = {},
        ["consumables"] = {
            ["Mighty Rage Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_41",
                ["id"] = "13442",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "13442",
                ["playerCheckBuff"] = false
            },
            ["Flask of the Titans"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_62",
                ["id"] = "13510",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17626",
                ["itemId"] = "13510",
                ["playerCheckBuff"] = false
            },
            ["Elixir of the Mongoose"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_32",
                ["id"] = "13452",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17538",
                ["itemId"] = "13452",
                ["playerCheckBuff"] = false
            },
            ["Elixir of Giants"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_61",
                ["id"] = "9206",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "11405",
                ["itemId"] = "9206",
                ["playerCheckBuff"] = false
            },
            ["Elixir of Greater Agility"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_94",
                ["id"] = "9187",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "11334",
                ["itemId"] = "9187",
                ["playerCheckBuff"] = false
            },
            ["Smoked Desert Dumplings"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_64",
                ["id"] = "20452",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "24800",
                ["itemId"] = "20452",
                ["playerCheckBuff"] = false
            },
            ["Blessed Sunfruit"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_food_41",
                ["id"] = "13810",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "18124",
                ["itemId"] = "13810",
                ["playerCheckBuff"] = false
            },
            ["Rumsey Rum Black Label"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_04",
                ["id"] = "21151",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "25804",
                ["itemId"] = "21151",
                ["playerCheckBuff"] = false
            },
            ["Gordok Green Grog"] = {
                ["icon"] = "Interface\\Icons\\inv_drink_03",
                ["id"] = "18269",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22789",
                ["itemId"] = "18269",
                ["playerCheckBuff"] = false
            },
            ["Elemental Sharpening Stone"] = {
                ["icon"] = "Interface\\Icons\\inv_stone_02",
                ["id"] = "18262",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "22756",
                ["itemId"] = "18262",
                ["playerCheckBuff"] = false
            },
            ["Juju Might"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_07",
                ["id"] = "12460",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16329",
                ["itemId"] = "12460",
                ["playerCheckBuff"] = false
            },
            ["Juju Power"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_monsterscales_11",
                ["id"] = "12451",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "16323",
                ["itemId"] = "12451",
                ["playerCheckBuff"] = false
            },
            ["Ground Scorpok Assay"] = {
                ["icon"] = "Interface\\Icons\\inv_misc_dust_02",
                ["id"] = "8412",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10669",
                ["itemId"] = "8412",
                ["playerCheckBuff"] = false
            },
            ["R.O.I.D.S."] = {
                ["icon"] = "Interface\\Icons\\inv_stone_15",
                ["id"] = "8410",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "10667",
                ["itemId"] = "8410",
                ["playerCheckBuff"] = false
            },
            ["Greater Fire Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_24",
                ["id"] = "13457",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17543",
                ["itemId"] = "13457",
                ["playerCheckBuff"] = false
            },
            ["Greater Nature Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_22",
                ["id"] = "13458",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17546",
                ["itemId"] = "13458",
                ["playerCheckBuff"] = false
            },
            ["Greater Frost Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_20",
                ["id"] = "13456",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17544",
                ["itemId"] = "13456",
                ["playerCheckBuff"] = false
            },
            ["Greater Shadow Protection Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_23",
                ["id"] = "13459",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = "17548",
                ["itemId"] = "13459",
                ["playerCheckBuff"] = false
            },
            ["Free Action Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_04",
                ["id"] = "5634",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "5634",
                ["playerCheckBuff"] = false
            },
            ["Living Action Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_07",
                ["id"] = "20008",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "20008",
                ["playerCheckBuff"] = false
            },
            ["Limited Invulnerability Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_62",
                ["id"] = "3387",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "3387",
                ["playerCheckBuff"] = false
            },
            ["Restorative Potion"] = {
                ["icon"] = "Interface\\Icons\\inv_potion_01",
                ["id"] = "9030",
                ["checked"] = true,
                ["toolTip"] = nil,
                ["buffId"] = nil,
                ["itemId"] = "9030",
                ["playerCheckBuff"] = false
            }
        }
    }
}

local function OnValueChanged(spellName)
    local currType = ClassicRaidAssist.db.char.currentConsumableType
    local currSpec = ClassicRaidAssist.db.char.currentSpecTab
    if(ClassicRaidAssist.db.char.consumablesToCheckFor[currSpec][currType][spellName] == false or ClassicRaidAssist.db.char.consumablesToCheckFor[currSpec][currType][spellName] == nil) then
        ClassicRaidAssist.db.char.consumablesToCheckFor[currSpec][currType][spellName] = true
    else
        ClassicRaidAssist.db.char.consumablesToCheckFor[currSpec][currType][spellName] = false
    end
end


function ConsumablesTab:getConsumables()
    return specs
end

-- buff or item scan
function ConsumablesTab:ScanConsumables(type, spec)
    if type == "ITEM" then
        if(spec == "All Classes") then
            for currSpec, specValue in pairs(specs) do
                specValue['currentItems'] = {}
                
                for key, value in pairs(specValue['consumables']) do
                    if(ClassicRaidAssist.db.char.consumablesToCheckFor[currSpec][type][key]) then
                        ClassicRaidAssist:ConsumableQuestion(currSpec, value['itemId'])
                    end
                end
            end
        else
            specs[spec]['currentItems'] = {}
            
            for key, value in pairs(specs[spec]['consumables']) do
                
                -- if(value['checked']) then
                if(ClassicRaidAssist.db.char.consumablesToCheckFor[spec][type][key]) then
                    ClassicRaidAssist:ConsumableQuestion(spec, value['itemId'])
                end
            end
        end
    elseif type == "BUFF" then
        if(spec == "All Classes") then
            for spec, specValue in pairs(specs) do
                specValue['currentBuffs'] = {}
                
                for key, value in pairs(specValue['consumables']) do            
                    if(ClassicRaidAssist.db.char.consumablesToCheckFor[spec][type][key]) then
                        if (value['buffId'] ~= nil) then
                            ClassicRaidAssist:QuestionBuffs("BUFF", key, spec, value['buffId'])
                        else
                            ClassicRaidAssist:QuestionBuffs("ITEM", key, spec, value['itemId'])
                        end
                    end
                end
            end
        else
            specs[spec]['currentBuffs'] = {}
        
            for key, value in pairs(specs[spec]['consumables']) do
                -- if(value['checked']) then
                
                if(ClassicRaidAssist.db.char.consumablesToCheckFor[spec][type][key]) then
                    if (value['buffId'] ~= nil) then
                        ClassicRaidAssist:QuestionBuffs("BUFF", key, spec, value['buffId'])
                    else
                        ClassicRaidAssist:QuestionBuffs("ITEM", key, spec, value['itemId'])
                    end
                end
            end
        end
    end
end

local function DrawCurrentClassConsumables()
    local currentSpec = ClassicRaidAssist.db.char.currentSpecTab
    local raidContainer = AceGUI:Create("SimpleGroup")
    raidContainer:SetFullWidth(true)
    raidContainer:SetLayout("Flow")

    local groupContainer = AceGUI:Create("SimpleGroup")
    groupContainer:SetRelativeWidth(1)
    groupContainer:SetLayout("List")
    groupContainer:SetFullWidth(true)

    local currentTypeIteration = {}

    if ClassicRaidAssist.db.char.currentConsumableType == "ITEM" then
        currentTypeIteration = specs[currentSpec]['currentItems']
    elseif ClassicRaidAssist.db.char.currentConsumableType == "BUFF" then
        currentTypeIteration = specs[currentSpec]['currentBuffs']
    end

    local spellsPerRow = 15
    local currentSpells = 0

    for key, value in pairs(currentTypeIteration) do
        local playerContainer = AceGUI:Create("SimpleGroup")
        playerContainer:SetLayout("Flow")
        playerContainer:SetFullWidth(true)

        local spellContainer = nil
        local currName = AceGUI:Create("Label")
        currName:SetWidth(90)
        currName:SetText("|c" .. RAID_CLASS_COLORS[specs[currentSpec]['englishClass']].colorStr .. key .. "|r")

        spellContainer = AceGUI:Create("SimpleGroup")
        spellContainer:SetLayout("Flow")
        spellContainer:SetFullWidth(true)

        spellContainer:AddChild(currName)

        currentSpells = 0
        for spellName, hasConsume in pairs(value) do
            if(spellContainer == nil or currentSpells > spellsPerRow) then

                currName = AceGUI:Create("Label")
                currName:SetWidth(90)

                if(currentSpells >= spellsPerRow) then
                    currentSpells = 0
                    playerContainer:AddChild(spellContainer)
                else
                    currName:SetText("|c" .. RAID_CLASS_COLORS[specs[currentSpec]['englishClass']].colorStr .. key .. "|r")
                end

                spellContainer = AceGUI:Create("SimpleGroup")
                spellContainer:SetLayout("Flow")
                spellContainer:SetFullWidth(true)

                spellContainer:AddChild(currName)
                end
            local currSpell = AceGUI:Create("Icon")
            if(hasConsume == "-1") then
                currSpell:SetImage("Interface\\Icons\\inv_misc_questionmark")
            else
                currSpell:SetImage(specs[currentSpec]['consumables'][spellName]["icon"])
            end
            currSpell:SetImageSize("16", "16")
            -- currSpell:SetDisabled(true)
            -- currSpell.frame:SetScript("OnEnter", function() end)
            -- currSpell.frame:SetScript("OnLeave", function() end)
            currSpell.image:SetAllPoints()
            currSpell:SetWidth(16)
            currSpell:SetHeight(16)

            currSpell.frame:SetScript("OnEnter", function()
                if(specs[currentSpec]['consumables'][spellName]['toolTip'] == nil) then
                    specs[currentSpec]['consumables'][spellName]['toolTip'] = CreateFrame( "GameTooltip", spellName .. currentSpec .. currentSpec .. key, nil, "GameTooltipTemplate" )
                end
                MyToolTip = specs[currentSpec]['consumables'][spellName]['toolTip']
                MyToolTip:SetOwner(WorldFrame, "ANCHOR_CURSOR")
                MyToolTip:SetItemByID(specs[currentSpec]['consumables'][spellName]['id']) -- , 1, .82, 0, true)
                MyToolTip:Show() 
            end)
            currSpell.frame:SetScript("OnLeave", function() 
                MyToolTip:Hide() 
            end)

            if hasConsume == "0" then
                currSpell.image:SetVertexColor(1, 1, 1, 0.1)
            else
                currSpell.image:SetVertexColor(1, 1, 1, 1)
            end
            currentSpells = currentSpells + 1
            
            local spacer = AceGUI:Create("Label")
            spacer:SetWidth(2)

            spellContainer:AddChild(currSpell)
            spellContainer:AddChild(spacer)
            -- end
        end
        playerContainer:AddChild(spellContainer)
        groupContainer:AddChild(playerContainer)
    end
    raidContainer:AddChild(groupContainer)
    return raidContainer
end

function ConsumablesTab:outputBuffs(channel, type, spec)
    if type == "ITEM" then
        local missingItems = {}
        if(spec == "All Classes") then
            for spec, specValue in pairs(specs) do 
                if(spec ~= "All Classes") then
                    for key, value in pairs(specs[spec]['currentItems']) do
                        for k, v in pairs(value) do
                            if(missingItems[k] == nil) then
                                missingItems[k] = {}
                            end
        
                            if(v == "0") then
                                table.insert(missingItems[k], key)
                            end
                        end
                    end
                end
            end
        else
            for key, value in pairs(specs[spec]['currentItems']) do
                for k, v in pairs(value) do
                    if(missingItems[k] == nil) then
                        missingItems[k] = {}
                    end

                    if(v == "0") then
                        table.insert(missingItems[k], key)
                    end
                end
            end
        end

        initialMessageSent = true
        for key, value in pairs(missingItems) do
            local beginningString = key .. ":"
            local stringCompose = beginningString
            for k, v in pairs(value) do
                stringToAdd = v:sub(1, 4) .. ","
                if ( string.len(stringCompose) + string.len(stringToAdd) ) >= 255 then    
                    if initialMessageSent then
                        initialMessageSent = false
                        CRA_SendChatMessage("[Classic Raid Assist] Ouputting " .. spec .." Missing Consumable Items: ", channel)
                    end
                    CRA_SendChatMessage(stringCompose:sub(1, -2), channel)
                    stringCompose = beginningString
                end
                stringCompose = stringCompose .. " " .. stringToAdd
            end
            if(stringCompose ~= beginningString) then
                if initialMessageSent then
                    initialMessageSent = false
                    CRA_SendChatMessage("[Classic Raid Assist] Ouputting " .. spec .." Missing Consumable Items: ", channel)
                end
                CRA_SendChatMessage(stringCompose:sub(1, -2), channel)
            end
        end
    elseif type == "BUFF" then
        local missingBuffs = {}
        if(spec == "All Classes") then
            for spec, specValue in pairs(specs) do
                if(spec ~= "All Classes") then
                    for key, value in pairs(specs[spec]['currentBuffs']) do
                        for k, v in pairs(value) do
                            if(missingBuffs[k] == nil) then
                                missingBuffs[k] = {}
                            end
        
                            if(v == "0") then
                                table.insert(missingBuffs[k], key)
                            end
                        end
                    end
                end
            end
        else
            for key, value in pairs(specs[spec]['currentBuffs']) do
                for k, v in pairs(value) do
                    if(missingBuffs[k] == nil) then
                        missingBuffs[k] = {}
                    end

                    if(v == "0") then
                        table.insert(missingBuffs[k], key)
                    end
                end
            end
        end
        
        
        initialMessageSent = true

        for key, value in pairs(missingBuffs) do
            local beginningString = key .. ":"
            local stringCompose = beginningString
            for k, v in pairs(value) do
                stringToAdd = v:sub(1, 4) .. ","
                if ( string.len(stringCompose) + string.len(stringToAdd) ) >= 255 then
                    if initialMessageSent then
                        initialMessageSent = false
                        CRA_SendChatMessage("[Classic Raid Assist] Ouputting " .. spec .." Missing Consumable Buffs/Items: ", channel)
                    end
                    CRA_SendChatMessage(stringCompose:sub(1, -2), channel)
                    stringCompose = beginningString
                end
                stringCompose = stringCompose .. " " .. stringToAdd
            end
            if(stringCompose ~= beginningString) then
                if initialMessageSent then
                    initialMessageSent = false
                    CRA_SendChatMessage("[Classic Raid Assist] Ouputting " .. spec .." Missing Consumable Buffs/Items: ", channel)
                end
                CRA_SendChatMessage(stringCompose:sub(1, -2), channel)
            end
        end
    end
end

local function drawAllClassesTab()
    local tabWidth = 385
    local fullTab = AceGUI:Create("SimpleGroup")
    fullTab:SetWidth(tabWidth)
    fullTab:SetLayout("Flow")

    
    local allClassesNotice = AceGUI:Create("Label")
    allClassesNotice:SetFullWidth(true)
    allClassesNotice:SetText("Choose Buffs/Items from the individual spec")
    fullTab:AddChild(allClassesNotice)

    local raidContainer = AceGUI:Create("SimpleGroup")
    raidContainer:SetFullWidth(true)
    raidContainer:SetLayout("Flow")

    local groupContainer = AceGUI:Create("SimpleGroup")
    groupContainer:SetRelativeWidth(1)
    groupContainer:SetLayout("List")
    groupContainer:SetFullWidth(true)

    local currentTypeIteration = {}

    for currentSpec, specValue in pairs(specs) do 
        if(currentSpec ~= "All Classes") then
            if ClassicRaidAssist.db.char.currentConsumableType == "ITEM" then
                currentTypeIteration = specValue['currentItems']
            elseif ClassicRaidAssist.db.char.currentConsumableType == "BUFF" then
                currentTypeIteration = specs[currentSpec]['currentBuffs']
            end

            local spellsPerRow = 15
            local currentSpells = 0

            for key, value in pairs(currentTypeIteration) do
                local playerContainer = AceGUI:Create("SimpleGroup")
                playerContainer:SetLayout("Flow")
                playerContainer:SetFullWidth(true)

                local spellContainer = AceGUI:Create("SimpleGroup")
                spellContainer:SetLayout("Flow")
                spellContainer:SetFullWidth(true)
                
                local currName = AceGUI:Create("Label")
                currName:SetWidth(90)
                currName:SetText("|c" .. RAID_CLASS_COLORS[specs[currentSpec]['englishClass']].colorStr .. key .. "|r")
                spellContainer:AddChild(currName)

                currentSpells = 0
                for spellName, hasConsume in pairs(value) do
                    if(spellContainer == nil or currentSpells > spellsPerRow) then

                        currName = AceGUI:Create("Label")
                        currName:SetWidth(90)

                        if(currentSpells >= spellsPerRow) then
                            currentSpells = 0
                            playerContainer:AddChild(spellContainer)
                        else
                            currName:SetText("|c" .. RAID_CLASS_COLORS[specs[currentSpec]['englishClass']].colorStr .. key .. "|r")
                        end

                        spellContainer = AceGUI:Create("SimpleGroup")
                        spellContainer:SetLayout("Flow")
                        spellContainer:SetFullWidth(true)

                        spellContainer:AddChild(currName)
                        end
                    local currSpell = AceGUI:Create("Icon")
                    if(hasConsume == "-1") then
                        currSpell:SetImage("Interface\\Icons\\inv_misc_questionmark")
                    else
                        -- print(spellName)
                        currSpell:SetImage(specs[currentSpec]['consumables'][spellName]["icon"])
                    end
                    currSpell:SetImageSize("16", "16")
                    -- currSpell:SetDisabled(true)
                    -- currSpell.frame:SetScript("OnEnter", function() end)
                    -- currSpell.frame:SetScript("OnLeave", function() end)
                    currSpell.image:SetAllPoints()
                    currSpell:SetWidth(16)
                    currSpell:SetHeight(16)

                    currSpell.frame:SetScript("OnEnter", function()
                        if(specs[currentSpec]['consumables'][spellName]['toolTip'] == nil) then
                            specs[currentSpec]['consumables'][spellName]['toolTip'] = CreateFrame( "GameTooltip", spellName .. currentSpec .. currentSpec .. key, nil, "GameTooltipTemplate" )
                        end
                        MyToolTip = specs[currentSpec]['consumables'][spellName]['toolTip']
                        MyToolTip:SetOwner(WorldFrame, "ANCHOR_CURSOR")
                        MyToolTip:SetItemByID(specs[currentSpec]['consumables'][spellName]['id']) -- , 1, .82, 0, true)
                        MyToolTip:Show() 
                    end)
                    currSpell.frame:SetScript("OnLeave", function() 
                        MyToolTip:Hide() 
                    end)

                    if hasConsume == "0" then
                        currSpell.image:SetVertexColor(1, 1, 1, 0.1)
                    else
                        currSpell.image:SetVertexColor(1, 1, 1, 1)
                    end
                    currentSpells = currentSpells + 1
                    
                    local spacer = AceGUI:Create("Label")
                    spacer:SetWidth(2)

                    spellContainer:AddChild(currSpell)
                    spellContainer:AddChild(spacer)
                    -- end
                end
                playerContainer:AddChild(spellContainer)
                groupContainer:AddChild(playerContainer)
            end
            -- raidContainer:AddChild(groupContainer)

            -- fullTab:AddChild(raidContainer)
        end
    end
    raidContainer:AddChild(groupContainer)

    fullTab:AddChild(raidContainer)
    return fullTab

end

local function drawClassTab(spec)
    if(spec == "All Classes") then
        return drawAllClassesTab()
    end

    local rowSize = 6
    local spacerWidth = 10
    local tabWidth = 385
    local fullTab = AceGUI:Create("SimpleGroup")
    fullTab:SetWidth(tabWidth)
    fullTab:SetLayout("Flow")

    local totalConsumables = 0
    for key, value in pairs(specs[spec]['consumables']) do
        if (ClassicRaidAssist.db.char.currentConsumableType == "ITEM" or value['buffId'] ~= nil) then
            totalConsumables = totalConsumables + 1
        end
    end
    local remainingConsumables = totalConsumables

    if(totalConsumables % rowSize == 1 or totalConsumables % rowSize == 2) then
        rowSize = rowSize - 1
    end
        
    if(totalConsumables % rowSize == 1 or totalConsumables % rowSize == 2) then
        rowSize = rowSize + 2
    end

    local totalWidth = (tabWidth-30-spacerWidth)/(rowSize)

    local consumableCheckBoxRows = {}
    local consumableCheckBox = AceGUI:Create("InlineGroup")
    consumableCheckBox:SetTitle("Check for these Consumables:")
    consumableCheckBox:SetFullWidth(true)
    consumableCheckBox:SetLayout("Flow")

    local consumableCheckBoxRow = nil
    -- AceGUI:Create("Simple Group")
    -- consumableCheckBox:SetFullWidth(true)
    -- consumableCheckBox:SetLayout("Flow")

    -- local spacerGroup = AceGUI:Create("Label")
    -- spacerGroup:SetWidth(10)
    -- consumableCheckBox:AddChild(spacerGroup)

    local currentRowSize = 0
    for consumable, consumableValues in pairs(specs[spec]['consumables']) do
        if(ClassicRaidAssist.db.char.currentConsumableType == "ITEM" or consumableValues['buffId'] ~= nil) then
            if(currentRowSize >= rowSize or currentRowSize == 0) then
                if(consumableCheckBoxRow ~= nil) then
                    remainingConsumables = remainingConsumables - rowSize
                    table.insert(consumableCheckBoxRows, consumableCheckBoxRow)
                end
                if remainingConsumables < rowSize then
                    spacerWidth = spacerWidth * (rowSize - remainingConsumables + 1)
                    totalWidth = (tabWidth-30-spacerWidth)/(remainingConsumables)
                end
                consumableCheckBoxRow = AceGUI:Create("SimpleGroup")
                consumableCheckBoxRow:SetFullWidth(true)
                consumableCheckBoxRow:SetLayout("Flow")
                
                local spacerGroup = AceGUI:Create("Label")
                spacerGroup:SetWidth(spacerWidth)
                consumableCheckBoxRow:AddChild(spacerGroup)
                currentRowSize = 0
            end
            local tempCheckBox = AceGUI:Create("CheckBox")
            tempCheckBox:SetWidth(totalWidth)
            tempCheckBox:SetLabel("")
            tempCheckBox:SetValue(ClassicRaidAssist.db.char.consumablesToCheckFor[spec][ClassicRaidAssist.db.char.currentConsumableType][consumable])
            -- tempCheckBox:SetValue(consumableValues['checked'])
            tempCheckBox:SetImage(consumableValues["icon"])
            tempCheckBox:SetCallback("OnValueChanged", function() OnValueChanged(consumable) end)
            tempCheckBox:SetCallback("OnEnter", function() 
                if(consumableValues['toolTip'] == nil) then
                    consumableValues['toolTip'] = CreateFrame( "GameTooltip", consumable .. spec .. ClassicRaidAssist.db.char.currentConsumableType .. "checkbox" , nil, "GameTooltipTemplate" )
                end
                MyToolTip = consumableValues['toolTip']
                MyToolTip:SetOwner(tempCheckBox.frame, "ANCHOR_CURSOR")
                MyToolTip:SetItemByID(consumableValues['id']) -- , 1, .82, 0, true)
                MyToolTip:Show() 
            end)
            tempCheckBox:SetCallback("OnLeave", function() 
                MyToolTip:Hide() 
            end)
            consumableCheckBoxRow:AddChild(tempCheckBox)
            currentRowSize = currentRowSize + 1
        else
            
            ClassicRaidAssist.db.char.consumablesToCheckFor[spec][ClassicRaidAssist.db.char.currentConsumableType][consumable] = false
            -- consumableValues['checked'] = false
        end
    end
    table.insert(consumableCheckBoxRows, consumableCheckBoxRow)
    for key, value in pairs(consumableCheckBoxRows) do
        -- print(key)
        consumableCheckBox:AddChild(value)
    end
    fullTab:AddChild(consumableCheckBox)
    fullTab:AddChild(DrawCurrentClassConsumables())
    return fullTab
end

function ConsumablesTab:DrawConsumables(container)
    ClassicRaidAssist:ClearCooldowns()

    local specChoosingGroup = AceGUI:Create("SimpleGroup")
    specChoosingGroup:SetFullWidth(true)
    specChoosingGroup:SetLayout("Flow")

    local specChoosingLabel = AceGUI:Create("Label")
    specChoosingLabel:SetWidth(175)
    specChoosingLabel:SetText("Choose Item or Buff and Class to Check for:")
    specChoosingGroup:AddChild(specChoosingLabel)

    local typeDropdown = AceGUI:Create("Dropdown")
    typeDropdown:SetWidth(75)
    typeDropdown:SetList({["ITEM"] = "Item", ["BUFF"] = "Buff"})
    typeDropdown:SetValue(ClassicRaidAssist.db.char.currentConsumableType)
    typeDropdown:SetCallback("OnValueChanged", function(widget, event, key)
        container:ReleaseChildren()
        ClassicRaidAssist.db.char.currentConsumableType = key
        ClassicRaidAssist.db.char.consumablesContainer = container
        ConsumablesTab:DrawConsumables(container)
    end)
    specChoosingGroup:AddChild(typeDropdown)

    local specDropDown = AceGUI:Create("Dropdown")
    specDropDown:SetWidth(150)
    local dropdown = {}
    for key, value in pairs(specs) do
        dropdown[key] = key
    end
    specDropDown:SetList(dropdown)
    specDropDown:SetValue(ClassicRaidAssist.db.char.currentSpecTab)
    specDropDown:SetCallback("OnValueChanged", function(widget, event, key)
        container:ReleaseChildren()
        ClassicRaidAssist.db.char.currentSpecTab = key
        ClassicRaidAssist.db.char.consumablesContainer = container
        ConsumablesTab:DrawConsumables(container)
    end)
    specChoosingGroup:AddChild(specDropDown)
    container:AddChild(specChoosingGroup)

    local spacer = AceGUI:Create("SimpleGroup")
    spacer:SetFullWidth(true)
    spacer:SetLayout("Flow")
    spacer:SetHeight(80)
    
    local scanBtn = AceGUI:Create("Button")
    scanBtn:SetText("Scan " .. ClassicRaidAssist.db.char.currentSpecTab) --.. " consumables")
    scanBtn:SetWidth(200)
    if not (IsInGroup() or IsInRaid()) then
        scanBtn:SetDisabled(true)
        scanBtn:SetText("Can't scan, not in a group")
    end
    scanBtn:SetCallback("OnClick", function()
        container:ReleaseChildren()
        ClassicRaidAssist.db.char.consumablesContainer = container
        ConsumablesTab:ScanConsumables(ClassicRaidAssist.db.char.currentConsumableType, ClassicRaidAssist.db.char.currentSpecTab)
        ConsumablesTab:DrawConsumables(container)
    end)
    spacer:AddChild(scanBtn)
    
    local reportBtn = AceGUI:Create("Button")
    reportBtn:SetText("Report")
    reportBtn:SetWidth(100)
    reportBtn:SetCallback("OnClick", function()
        ConsumablesTab:outputBuffs(ClassicRaidAssist.db.char.CurrentConsumablesOutputChannel, ClassicRaidAssist.db.char.currentConsumableType, ClassicRaidAssist.db.char.currentSpecTab)
    end)
    spacer:AddChild(reportBtn)

    local reportDropdown = AceGUI:Create("Dropdown")
    reportDropdown:SetWidth(100)
    reportDropdown:SetList(GetChatChannels())
    reportDropdown:SetValue(ClassicRaidAssist.db.char.CurrentConsumablesOutputChannel)
    reportDropdown:SetCallback("OnValueChanged", function(widget, event, key)
        ClassicRaidAssist.db.char.CurrentConsumablesOutputChannel = key
    end)
    spacer:AddChild(reportDropdown)

    container:AddChild(spacer)

    local scrollContainer = AceGUI:Create("SimpleGroup")
    scrollContainer:SetFullWidth(true)
    scrollContainer:SetHeight(300)
    scrollContainer:SetLayout("Fill")

    local scroll = AceGUI:Create("ScrollFrame")
    scroll:SetLayout("Flow")
    scrollContainer:AddChild(scroll)

    local raidContainer = AceGUI:Create("SimpleGroup")
    
    scroll:AddChild(drawClassTab(ClassicRaidAssist.db.char.currentSpecTab))
    container:AddChild(scrollContainer)
    
    local bottomNote = AceGUI:Create("Label")
    bottomNote:SetFullWidth(true)
    bottomNote:SetText("Everyone in the raid needs the addon to be shown here.")
    container:AddChild(bottomNote)
end