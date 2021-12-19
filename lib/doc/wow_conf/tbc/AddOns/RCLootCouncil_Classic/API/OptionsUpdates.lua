--- Includes all changes to the options menu for Classic
local _, addon = ...
local RCClassic = addon:GetModule("RCClassic")
local L = LibStub("AceLocale-3.0"):GetLocale("RCLootCouncil")
local LC = LibStub("AceLocale-3.0"):GetLocale("RCLootCouncil_Classic")

local old_options_func = addon.OptionsTable
function addon:OptionsTable ()
   local options = old_options_func(addon)
   -- Inject RCClassic version in the description
   options.args.settings.args.version.name = function ()
      local desc = "Classic: "
      -- Classic version
      if RCClassic.tVersion then
         desc = desc .. "|cFFff9100v"..RCClassic.version.."|r-"..RCClassic.tVersion
      else
         desc = desc .. "|cFFff9100v"..RCClassic.version.."|r"
      end
      -- Core version
      desc = desc .. "\nCore: "
      if RCClassic.RCLootCouncil.tVersion then
         desc = desc .. "|cFF87CEFAv"..RCClassic.RCLootCouncil.version.."|r-"..RCClassic.RCLootCouncil.tVersion
      else
         desc = desc .. "|cFF87CEFAv"..RCClassic.RCLootCouncil.version.."|r"
      end
      return desc
   end
   -- Usage options
   options.args.mlSettings.args.generalTab.args.usageOptions.args.usage.values = {
      ml = LC["opt_usage_ml"],
      ask_ml = LC["opt_usage_ask_ml"],
      --	leader 		= "Always use RCLootCouncil when I'm the group leader and enter a raid",
      --	ask_leader	= "Ask me every time I'm the group leader and enter a raid",
      never = L["Never use RCLootCouncil"],
   }
   options.args.mlSettings.args.generalTab.args.usageOptions.args.leaderUsage = { -- Add leader options here since we can only make a single select dropdown
      order = 3,
      name = function() return self.db.profile.usage.ml and LC["opt_usage_leader_always"] or LC["opt_usage_leader_ask"] end,
      desc = LC["leaderUsage_desc"],
      type = "toggle",
      get = function() return self.db.profile.usage.leader or self.db.profile.usage.ask_leader end,
      set = function(_, val)
         self.db.profile.usage.leader, self.db.profile.usage.ask_leader = false, false -- Reset for zzzzz
         if self.db.profile.usage.ml then self.db.profile.usage.leader = val end
         if self.db.profile.usage.ask_ml then self.db.profile.usage.ask_leader = val end
      end,
      disabled = function() return self.db.profile.usage.never end,
   }

   -- Disable "Allow Keeping" and "Trade Messages" options
   options.args.mlSettings.args.generalTab.args.lootingOptions.args.printCompletedTrades = nil
   options.args.mlSettings.args.generalTab.args.lootingOptions.args.rejectTrade = nil

   -- Remove "Spec Icon" as there's no clear definition of a spec
   options.args.settings.args.generalSettingsTab.args.frameOptions.args.showSpecIcon = nil

   -- Update "Patch" values in delete history
   options.args.settings.args.generalSettingsTab.args.lootHistoryOptions.args.deletePatch.values =
   {
      [1566900000] = "Phase 1 (Classic Launch)",
      [1571097600] = "Diremaul Release",
      [1576029600] = "Patch 1.13.3",
      [1583798400] = "Patch 1.13.4",
      [1606953600] = "Patch 1.13.6"
   }
   -- "_G.INSTANCE" isn't available for localization - use our own
   options.args.settings.args.generalSettingsTab.args.lootHistoryOptions.args.deleteRaid.name = LC["Instance"]

   -- Remove "Bonus Rolls" option
   options.args.mlSettings.args.generalTab.args.lootingOptions.args.saveBonusRolls = nil

   -- Add Rep Items options
   options.args.mlSettings.args.awardsTab.args.repItems = {
      order = 1.5,
      name = LC["Auto Award Reputation Items"],
      type = "group",
      inline = true,
      disabled = function () return not self.db.profile.autoAwardRepItems  end,
      args = {
         autoAwardRepItems = {
            order = 1,
            name = LC["Auto Award Reputation Items"],
            desc = LC["opt_autoAwardRepItems_desc"],
            type = "toggle",
            width = "double",
            disabled = false
         },
         autoAwardRepItemsMode = {
            order = 2,
            name = _G.MODE,
            desc = LC["opt_autoAwardRepItemsMode_desc"],
            type = "select",
            style = "dropdown",
            values = self.defaults.profile.autoAwardRepItemsModeOptions,
            set = function(_,k)
               self.db.profile.autoAwardRepItemsMode = k
            end
         },
         autoAwardRepItemsTo2 = {
            order = 3,
            name = L["Auto Award to"],
				desc = L["auto_award_to_desc"],
            width = "double",
            type = "input",
            hidden = function()
               return GetNumGroupMembers() > 0
               or self.db.profile.autoAwardRepItemsMode == "RR"
             end,
            get = function() return self.db.profile.autoAwardRepItemsTo end,
            set = function(_,v) self.db.profile.autoAwardRepItemsTo = v end
         },
         autoAwardRepItemsTo = {
            order = 3,
				name = L["Auto Award to"],
				desc = L["auto_award_to_desc"],
            width = "double",
				type = "select",
				style = "dropdown",
				values = function()
					local t = {}
					for i = 1, GetNumGroupMembers() do
						local name = GetRaidRosterInfo(i)
						t[name] = name
					end
					return t;
				end,
				hidden = function()
               return GetNumGroupMembers() == 0
               or self.db.profile.autoAwardRepItemsMode == "RR"
            end,
         },
         autoAwardRepItemsReason = {
            order = 4,
				name = L["Reason"],
				desc = L["reason_desc"],
				type = "select",
				style = "dropdown",
				values = function()
					local t = {}
					for i = 1, self.db.profile.numAwardReasons do
						t[i] = self.db.profile.awardReasons[i].text
					end
					return t
				end,
			},
      }
   }

   -- Group Loot
   options.args.mlSettings.args.generalTab.args.usageOptions.args.useWithGroupLoot = {
      order = 3,
      name = LC["opt_groupLoot_name"],
      desc = LC["opt_groupLoot_desc"],
      type = "toggle"
   }

   return options
end
