---@type Config
local Config = ECSLoader:ImportModule("Config")
local _Config = Config.private

---@type Stats
local Stats = ECSLoader:ImportModule("Stats")
---@type i18n
local i18n = ECSLoader:ImportModule("i18n")

function _Config:SpellBonusSection()
    return {
        type = "group",
        order = 7,
        inline = false,
        width = 2,
        name = function() return i18n("Spell Power") end,
        args = {
            showSpellBonusStats = {
                type = "toggle",
                order = 0,
                name = function() return i18n("Show Spell Power Stats") end,
                desc = function() return i18n("Shows/Hides all spell power stats.") end,
                width = 1.5,
                get = function () return ExtendedCharacterStats.profile.spellBonus.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.display = value
                    Stats:RebuildStatInfos()
                end,
            },
            bonusHealing = {
                type = "toggle",
                order = 1,
                name = function() return i18n("Healing Power") end,
                desc = function() return i18n("Shows/Hides the healing power value.") end,
                width = 1.5,
                disabled = function() return (not ExtendedCharacterStats.profile.spellBonus.display); end,
                get = function () return ExtendedCharacterStats.profile.spellBonus.bonusHealing.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.bonusHealing.display = value
                    Stats:RebuildStatInfos()
                end,
            },
            arcaneDmg = {
                type = "toggle",
                order = 2,
                name = function() return i18n("Arcane Damage") end,
                desc = function() return i18n("Shows/Hides the arcane damage value.") end,
                width = 1.5,
                disabled = function() return (not ExtendedCharacterStats.profile.spellBonus.display); end,
                get = function () return ExtendedCharacterStats.profile.spellBonus.arcaneDmg.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.arcaneDmg.display = value
                    Stats:RebuildStatInfos()
                end,
            },
            arcaneCrit = {
                type = "toggle",
                order = 3,
                name = function() return i18n("Arcane Crit") end,
                desc = function() return i18n("Shows/Hides the arcane crit chance.") end,
                width = 1.5,
                disabled = function() return (not ExtendedCharacterStats.profile.spellBonus.display); end,
                get = function () return ExtendedCharacterStats.profile.spellBonus.arcaneCrit.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.arcaneCrit.display = value
                    Stats:RebuildStatInfos()
                end,
            },
            fireDmg = {
                type = "toggle",
                order = 4,
                name = function() return i18n("Fire Damage") end,
                desc = function() return i18n("Shows/Hides the fire damage value.") end,
                width = 1.5,
                disabled = function() return (not ExtendedCharacterStats.profile.spellBonus.display); end,
                get = function () return ExtendedCharacterStats.profile.spellBonus.fireDmg.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.fireDmg.display = value
                    Stats:RebuildStatInfos()
                end,
            },
            fireCrit = {
                type = "toggle",
                order = 5,
                name = function() return i18n("Fire Crit") end,
                desc = function() return i18n("Shows/Hides the fire crit chance.") end,
                width = 1.5,
                disabled = function() return (not ExtendedCharacterStats.profile.spellBonus.display); end,
                get = function () return ExtendedCharacterStats.profile.spellBonus.fireCrit.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.fireCrit.display = value
                    Stats:RebuildStatInfos()
                end,
            },
            frostDmg = {
                type = "toggle",
                order = 6,
                name = function() return i18n("Frost Damage") end,
                desc = function() return i18n("Shows/Hides the frost damage value.") end,
                width = 1.5,
                disabled = function() return (not ExtendedCharacterStats.profile.spellBonus.display); end,
                get = function () return ExtendedCharacterStats.profile.spellBonus.frostDmg.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.frostDmg.display = value
                    Stats:RebuildStatInfos()
                end,
            },
            frostCrit = {
                type = "toggle",
                order = 7,
                name = function() return i18n("Frost Crit") end,
                desc = function() return i18n("Shows/Hides the frost crit chance.") end,
                width = 1.5,
                disabled = function() return (not ExtendedCharacterStats.profile.spellBonus.display); end,
                get = function () return ExtendedCharacterStats.profile.spellBonus.frostCrit.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.frostCrit.display = value
                    Stats:RebuildStatInfos()
                end,
            },
            holyDmg = {
                type = "toggle",
                order = 8,
                name = function() return i18n("Holy Damage") end,
                desc = function() return i18n("Shows/Hides the holy damage value.") end,
                width = 1.5,
                disabled = function() return (not ExtendedCharacterStats.profile.spellBonus.display); end,
                get = function () return ExtendedCharacterStats.profile.spellBonus.holyDmg.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.holyDmg.display = value
                    Stats:RebuildStatInfos()
                end,
            },
            holyCrit = {
                type = "toggle",
                order = 9,
                name = function() return i18n("Holy Crit") end,
                desc = function() return i18n("Shows/Hides the holy crit chance.") end,
                width = 1.5,
                disabled = function() return (not ExtendedCharacterStats.profile.spellBonus.display); end,
                get = function () return ExtendedCharacterStats.profile.spellBonus.holyCrit.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.holyCrit.display = value
                    Stats:RebuildStatInfos()
                end,
            },
            natureDmg = {
                type = "toggle",
                order = 10,
                name = function() return i18n("Nature Damage") end,
                desc = function() return i18n("Shows/Hides the nature damage value.") end,
                width = 1.5,
                disabled = function() return (not ExtendedCharacterStats.profile.spellBonus.display); end,
                get = function () return ExtendedCharacterStats.profile.spellBonus.natureDmg.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.natureDmg.display = value
                    Stats:RebuildStatInfos()
                end,
            },
            natureCrit = {
                type = "toggle",
                order = 11,
                name = function() return i18n("Nature Crit") end,
                desc = function() return i18n("Shows/Hides the nature crit chance.") end,
                width = 1.5,
                disabled = function() return (not ExtendedCharacterStats.profile.spellBonus.display); end,
                get = function () return ExtendedCharacterStats.profile.spellBonus.natureCrit.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.natureCrit.display = value
                    Stats:RebuildStatInfos()
                end,
            },
            physicalDmg = {
                type = "toggle",
                order = 12,
                name = function() return i18n("Physical Damage") end,
                desc = function() return i18n("Shows/Hides the physical damage value.") end,
                width = 1.5,
                disabled = function() return (not ExtendedCharacterStats.profile.spellBonus.display); end,
                get = function () return ExtendedCharacterStats.profile.spellBonus.physicalDmg.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.physicalDmg.display = value
                    Stats:RebuildStatInfos()
                end,
            },
            physicalCrit = {
                type = "toggle",
                order = 13,
                name = function() return i18n("Physical Crit") end,
                desc = function() return i18n("Shows/Hides the physical crit chance.") end,
                width = 1.5,
                disabled = function() return (not ExtendedCharacterStats.profile.spellBonus.display); end,
                get = function () return ExtendedCharacterStats.profile.spellBonus.physicalCrit.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.physicalCrit.display = value
                    Stats:RebuildStatInfos()
                end,
            },
            shadowDmg = {
                type = "toggle",
                order = 14,
                name = function() return i18n("Shadow Damage") end,
                desc = function() return i18n("Shows/Hides the shadow damage value.") end,
                width = 1.5,
                disabled = function() return (not ExtendedCharacterStats.profile.spellBonus.display); end,
                get = function () return ExtendedCharacterStats.profile.spellBonus.shadowDmg.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.shadowDmg.display = value
                    Stats:RebuildStatInfos()
                end,
            },
            shadowCrit = {
                type = "toggle",
                order = 15,
                name = function() return i18n("Shadow Crit") end,
                desc = function() return i18n("Shows/Hides the shadow crit chance.") end,
                width = 1.5,
                disabled = function() return (not ExtendedCharacterStats.profile.spellBonus.display); end,
                get = function () return ExtendedCharacterStats.profile.spellBonus.shadowCrit.display; end,
                set = function (_, value)
                    ExtendedCharacterStats.profile.spellBonus.shadowCrit.display = value
                    Stats:RebuildStatInfos()
                end,
            },
        },
    }
end
