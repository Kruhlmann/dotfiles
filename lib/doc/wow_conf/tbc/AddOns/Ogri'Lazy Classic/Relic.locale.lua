local LL, _, T = {}, ...

-- Author:		Douglas R. Reno <renodr at linuxfromscratch dot org>
--				Known in game as "Nutterland" in Classic, or "Petadata" in Retail
-- Date:		2021-09-02
-- Purpose:		Provides locale information for Ogri'Lazy Classic
-- File Name:	Relic.locale.lua

-- English
LL["enUS"] = {
	colors={"|cff22ff22Green|r","|cffeeee22Yellow|r","|cff2288ffBlue|r","|cffff2200Red|r"},
	colorDefaultKeys={"G", "Y", "B", "R"},
	colorClick="Add %s Relic",
	colorHotkey="Alternatively, press %s.",
	caption="Ogri'Lazy Classic",
	remove="Left click to remove this.\nRight click to remove up to here.",
	unbinderror="You are in combat - keybindings will update when you're finished.",
	nosuchkeyset="Valid keysets: %s, or %s for default.",
	cfgShowTooltip="Show help tooltips",
	cfgUnbindInCombat="Disable Ogri'Lazy hotkeys while in combat",
	cfgEnableHotkeys="Enable hotkeys while Ogri'Lazy is shown",
	cfgLanguageSelector="Language: %s",
	cfgKeybindings="Key bindings",
};

-- German [contributed by Endeavour@Arthas-EU]
LL["deDE"] = {
	colors={"|cff22ff22Gr\195\188n|r","|cffeeee22Gelb|r","|cff2288ffBlau|r","|cffff2200Rot|r"},
	colorDefaultKeys = {"G", "E", "B", "R"},
	colorClick="%s - Relikt hinzuf\195\188gen.",
	colorHotkey="Alternativ %s dr\195\188cken.",
	caption="Ogri'Lazy Classic",
};

-- French [contributed by oXid_Fox]
LL["frFR"] = {
	colors={"|cff22ff22verte|r","|cffeeee22jaune|r","|cff2288ffbleue|r","|cffff2200rouge|r"},
	colorDefaultKeys={"V","J","B","R"},
	colorClick="Ajouter une relique %s",
	colorHotkey="Raccourci : %s",
	caption="Ogri'Lazy Classic",
	remove="Clic gauche pour supprimer cette couleur. Clic droit pour tout supprimer \195\160 partir d'ici.",
	unbinderror="Vous \195\170tes en combat - les associations de touches seront mises \195\160 jour en sortie de combat.",
	nosuchkeyset="Raccourcis valides: %s, ou %s par d\195\169faut.",
	cfgShowTooltip="Afficher les infobulles",
	cfgUnbindInCombat="Restaure les associations de touches  en combat",
	cfgEnableHotkeys="Activer les raccourcis quand Ogri'Lazy est affich\195\169",
	cfgLanguageSelector="Langue: %s",
	cfgKeybindings="Associations de touches"
};

local L, LD = LL[GetLocale()], LL.enUS
T.L = setmetatable({}, {__index=function(self, key)
	local s = L and L[key] or LD[key] or ("#NOLOC#" .. tostring(key) .. "#")
	self[key] = s
	return s
end, __call=function(self, key)
	return self[key]
end})