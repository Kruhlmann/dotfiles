local args = { ... };
local LB = args[2];

local _locale = LB.GetLocaleTable(GetLocale());
local _defaultConfig = {
   ConfigVersion = "1.12.1",
   DisplayToggles = {
      ["ITEM_MOD_DEFENSE_SKILL_RATING"] = true,
      ["ITEM_MOD_DODGE_RATING"] = true,
      ["ITEM_MOD_PARRY_RATING"] = true,
      ["ITEM_MOD_BLOCK_RATING"] = true,
      ["ITEM_MOD_HIT_SPELL_RATING"] = true,
      ["ITEM_MOD_CRIT_SPELL_RATING"] = true,
      ["ITEM_MOD_HASTE_SPELL_RATING"] = true,
      ["ITEM_MOD_HIT_RATING"] = true,
      ["ITEM_MOD_CRIT_RATING"] = true,
      ["ITEM_MOD_HASTE_RATING"] = true,
      ["ITEM_MOD_EXPERTISE_RATING"] = true,
      ["ITEM_MOD_HIT_MELEE_RATING"] = true,
      ["ITEM_MOD_HIT_RANGED_RATING"] = true,
      ["ITEM_MOD_CRIT_MELEE_RATING"] = true,
      ["ITEM_MOD_CRIT_RANGED_RATING"] = true,
      ["ITEM_MOD_AGILITY"] = true,
      ["Agility-Crit"] = true,
      ["Agility-AP"] = false,
      ["Agility-RAP"] = false,
      ["Agility-Armor"] = false,
      ["Agility-Healing"] = false,
      ["ITEM_MOD_INTELLECT"] = true,
      ["Intellect-Mana"] = true,
      ["Intellect-SpellCrit"] = true,
      ["Intellect-SpellDamage"] = false,
      ["Intellect-Healing"] = false,
      ["Intellect-ManaRegen"] = false,
      ["Intellect-RangedAP"] = false,
      ["Intellect-Armor"] = false,
      ["ITEM_MOD_SPIRIT"] = true,
      ["Spirit-ManaRegenNotCasting"] = true,
      ["Spirit-ManaRegenCasting"] = false,
      ["Spirit-HealthRegen"] = true,
      ["Spirit-SpellDamage"] = false,
      ["Spirit-Healing"] = false,
      ["ITEM_MOD_STAMINA"] = true,
      ["Stamina-Health"] = true,
      ["Stamina-SpellDamage"] = false,
      ["ITEM_MOD_STRENGTH"] = true,
      ["Strength-AttackPower"] = true,
      ["Strength-BlockValue"] = false,
   },
};


LB_Config = nil;


LB_CONF_STR = _locale.ConfigStrings;

local _currentTogglesState = {
   ["ITEM_MOD_DEFENSE_SKILL_RATING"] = true,
   ["ITEM_MOD_DODGE_RATING"] = true,
   ["ITEM_MOD_PARRY_RATING"] = true,
   ["ITEM_MOD_BLOCK_RATING"] = true,
   ["ITEM_MOD_HIT_SPELL_RATING"] = true,
   ["ITEM_MOD_CRIT_SPELL_RATING"] = true,
   ["ITEM_MOD_HASTE_SPELL_RATING"] = true,
   ["ITEM_MOD_HIT_RATING"] = true,
   ["ITEM_MOD_CRIT_RATING"] = true,
   ["ITEM_MOD_HASTE_RATING"] = true,
   ["ITEM_MOD_EXPERTISE_RATING"] = true,
   ["ITEM_MOD_HIT_MELEE_RATING"] = true,
   ["ITEM_MOD_HIT_RANGED_RATING"] = true,
   ["ITEM_MOD_CRIT_MELEE_RATING"] = true,
   ["ITEM_MOD_CRIT_RANGED_RATING"] = true,
   ["ITEM_MOD_AGILITY"] = true,
   ["Agility-Dodge"] = false,
   ["Agility-Crit"] = true,
   ["Agility-AP"] = false,
   ["Agility-RAP"] = false,
   ["Agility-Armor"] = false,
   ["Agility-Healing"] = false,
   ["ITEM_MOD_INTELLECT"] = true,
   ["Intellect-Mana"] = true,
   ["Intellect-SpellCrit"] = true,
   ["Intellect-SpellDamage"] = false,
   ["Intellect-Healing"] = false,
   ["Intellect-ManaRegen"] = false,
   ["Intellect-RangedAP"] = false,
   ["Intellect-Armor"] = false,
   ["ITEM_MOD_SPIRIT"] = true,
   ["Spirit-ManaRegenNotCasting"] = true,
   ["Spirit-ManaRegenCasting"] = false,
   ["Spirit-HealthRegen"] = true,
   ["Spirit-SpellDamage"] = false,
   ["Spirit-Healing"] = false,
   ["ITEM_MOD_STAMINA"] = true,
   ["Stamina-Health"] = true,
   ["Stamina-SpellDamage"] = false,
   ["ITEM_MOD_STRENGTH"] = true,
   ["Strength-AttackPower"] = true,
   ["Strength-BlockValue"] = false,
};

local function drawCurrentState()

   LB_DefenseRatingCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_DEFENSE_SKILL_RATING"]);
   LB_DodgeRatingCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_DODGE_RATING"]);
   LB_ParryRatingCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_PARRY_RATING"]);
   LB_BlockRatingCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_BLOCK_RATING"]);


   LB_SpellHitRatingCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_HIT_SPELL_RATING"]);
   LB_SpellCritRatingCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_CRIT_SPELL_RATING"]);
   LB_SpellHasteRatingCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_HASTE_SPELL_RATING"]);


   LB_PhysicalHitRatingCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_HIT_RATING"]);
   LB_PhysicalCritRatingCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_CRIT_RATING"]);
   LB_PhysicalHasteRatingCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_HASTE_RATING"]);
   LB_PhysicalExpertiseRatingCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_EXPERTISE_RATING"]);



   LB_AgilityCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_AGILITY"]);
   local agilityChecked = LB_AgilityCheckbox:GetChecked();

   LB_AgilityDodgeCheckbox:SetChecked(_currentTogglesState["Agility-Dodge"]);
   LB_AgilityDodgeCheckbox:SetEnabled(agilityChecked);
   LB_AgilityCritCheckbox:SetChecked(_currentTogglesState["Agility-Crit"])
   LB_AgilityCritCheckbox:SetEnabled(agilityChecked);
   LB_AgilityAPCheckbox:SetChecked(_currentTogglesState["Agility-AP"]);
   LB_AgilityAPCheckbox:SetEnabled(agilityChecked);
   LB_AgilityRAPCheckbox:SetChecked(_currentTogglesState["Agility-RAP"]);
   LB_AgilityRAPCheckbox:SetEnabled(agilityChecked);
   LB_AgilityArmorCheckbox:SetChecked(_currentTogglesState["Agility-Armor"]);
   LB_AgilityArmorCheckbox:SetEnabled(agilityChecked);
   LB_AgilityHealingCheckbox:SetChecked(_currentTogglesState["Agility-Healing"]);
   LB_AgilityHealingCheckbox:SetEnabled(agilityChecked);


   LB_IntellectCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_INTELLECT"]);
   local intellectChecked = LB_IntellectCheckbox:GetChecked();

   LB_IntellectManaCheckbox:SetChecked(_currentTogglesState["Intellect-Mana"]);
   LB_IntellectManaCheckbox:SetEnabled(intellectChecked);
   LB_IntellectSpellCritCheckbox:SetChecked(_currentTogglesState["Intellect-SpellCrit"]);
   LB_IntellectSpellCritCheckbox:SetEnabled(intellectChecked);
   LB_IntellectSpellDamageCheckbox:SetChecked(_currentTogglesState["Intellect-SpellDamage"]);
   LB_IntellectSpellDamageCheckbox:SetEnabled(intellectChecked);
   LB_IntellectHealingCheckbox:SetChecked(_currentTogglesState["Intellect-Healing"]);
   LB_IntellectHealingCheckbox:SetEnabled(intellectChecked);
   LB_IntellectManaRegenCheckbox:SetChecked(_currentTogglesState["Intellect-ManaRegen"]);
   LB_IntellectManaRegenCheckbox:SetEnabled(intellectChecked);
   LB_IntellectRangedAPCheckbox:SetChecked(_currentTogglesState["Intellect-RangedAP"]);
   LB_IntellectRangedAPCheckbox:SetEnabled(intellectChecked);
   LB_IntellectArmorCheckbox:SetChecked(_currentTogglesState["Intellect-Armor"]);
   LB_IntellectArmorCheckbox:SetEnabled(intellectChecked);


   LB_SpiritCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_SPIRIT"]);
   local spiritChecked = LB_SpiritCheckbox:GetChecked();

   LB_SpiritManaRegenNotCastingCheckbox:SetChecked(_currentTogglesState["Spirit-ManaRegenNotCasting"]);
   LB_SpiritManaRegenNotCastingCheckbox:SetEnabled(spiritChecked);
   LB_SpiritManaRegenCastingCheckbox:SetChecked(_currentTogglesState["Spirit-ManaRegenCasting"]);
   LB_SpiritManaRegenCastingCheckbox:SetEnabled(spiritChecked);
   LB_SpiritHealthRegenCheckbox:SetChecked(_currentTogglesState["Spirit-HealthRegen"]);
   LB_SpiritHealthRegenCheckbox:SetEnabled(spiritChecked);
   LB_SpiritSpellDamageCheckbox:SetChecked(_currentTogglesState["Spirit-SpellDamage"]);
   LB_SpiritSpellDamageCheckbox:SetEnabled(spiritChecked);


   LB_StaminaCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_STAMINA"]);
   local staminaChecked = LB_StaminaCheckbox:GetChecked();

   LB_StaminaHealthCheckbox:SetChecked(_currentTogglesState["Stamina-Health"]);
   LB_StaminaHealthCheckbox:SetEnabled(staminaChecked);
   LB_StaminaSpellDamageCheckbox:SetChecked(_currentTogglesState["Stamina-SpellDamage"]);
   LB_StaminaSpellDamageCheckbox:SetEnabled(staminaChecked);


   LB_StrengthCheckbox:SetChecked(_currentTogglesState["ITEM_MOD_STRENGTH"]);
   local strChecked = LB_StrengthCheckbox:GetChecked();

   LB_StrengthAttackPowerCheckbox:SetChecked(_currentTogglesState["Strength-AttackPower"]);
   LB_StrengthAttackPowerCheckbox:SetEnabled(strChecked);
   LB_StrengthBlockValueCheckbox:SetChecked(_currentTogglesState["Strength-BlockValue"]);
   LB_StrengthBlockValueCheckbox:SetEnabled(strChecked);

end

function LB_Config_CheckButtonChanged(_, statKey, isChecked)

   _currentTogglesState[statKey] = isChecked;
   drawCurrentState();
end

local function configFrame_OnRefresh(_)


   for k, v in pairs(LB.Config.DisplayToggles) do
      _currentTogglesState[k] = v;
   end
   drawCurrentState();
end

local function configFrame_OnOkay(_)
   for k, v in pairs(_currentTogglesState) do
      LB.Config.DisplayToggles[k] = v;
      LB_Config.DisplayToggles[k] = v;
   end
end

local function configFrame_OnCancel(_)

   for k, v in pairs(LB.Config.DisplayToggles) do
      _currentTogglesState[k] = v;
   end
end

local function configFrame_OnDefault(_)

   for k, v in pairs(_defaultConfig.DisplayToggles) do
      _currentTogglesState[k] = v;
      LB_Config.DisplayToggles[k] = v;
      LB.Config.DisplayToggles[k] = v;
   end
   drawCurrentState();
end

local function loadCompleted(configFrame)
   configFrame.name = "Little Buster";
   configFrame.okay = configFrame_OnOkay;
   configFrame.cancel = configFrame_OnCancel;
   configFrame.refresh = configFrame_OnRefresh;
   configFrame.default = configFrame_OnDefault;


   if (not LB_Config) then
      LB_Config = _defaultConfig;
   end



   for k, v in pairs(_defaultConfig) do
      if (LB_Config)[k] == nil then
         (LB_Config)[k] = v;
      end
   end


   local settingsVersion = LB_Config.ConfigVersion;


   if (type(settingsVersion) == "number") then
      settingsVersion = tostring(settingsVersion);
      LB_Config.ConfigVersion = settingsVersion;
   end


   local storedVersion = { strsplit(".", settingsVersion) };
   local currentVersion = { strsplit(".", _defaultConfig.ConfigVersion) };
   if (storedVersion[1] < currentVersion[1]) then

   end
   if (storedVersion[2] < currentVersion[2]) then

   end


   for k, v in pairs(_defaultConfig.DisplayToggles) do
      if LB_Config.DisplayToggles[k] == nil then
         LB_Config.DisplayToggles[k] = v;
      end
   end
   LB.Config = LB_Config;

   InterfaceOptions_AddCategory(configFrame);
end

function LB_ConfigRootFrame_OnEvent(self, _, ...)

   local addonName = ...;
   if (addonName == "LittleBuster") then
      loadCompleted(self);
   end
end

function LB_ConfigRootFrame_OnLoad(self)
   self:RegisterEvent("ADDON_LOADED");
end
