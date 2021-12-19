--[[ ================= STORED VARIABLES ====================== ]]
LAT_MARKS_SETTINGS = LAT_MARKS_SETTINGS or {
  ["Tanks"] = {},
  ["sync"] = true,
  ['locked'] = false,
  ['vertical'] = false,
  ['scale'] = 1,
}

--[[ ================= LOCAL VARIABLES ====================== ]]
local CoreUtils = CoreUtils
local combat = false;
local LatMarks;
local LatMarks_events;
-- local LATM_OPTIONS;

--[[
  =======================
  COMMANDS

  /latm lock
  /latm unlock
  =======================
]]
SLASH_LATMARKS1 = '/latm'
function SlashCmdList.LATMARKS(msg)
  if (msg == 'lock') then
    LAT_MARKS_SETTINGS.locked = true;
    LATM_UI:Lock()
  elseif (msg == 'unlock') then
    LATM_UI:Unlock()
    LAT_MARKS_SETTINGS.locked = false;
  elseif (msg and msg ~= '') then
    LatMarks_ParseTanks(msg)
  else
    InterfaceOptionsFrame_OpenToCategory(LATM_OPTIONS)
    InterfaceOptionsFrame_OpenToCategory(LATM_OPTIONS)
  end
end

--[[ ================= CALLBACKS ====================== ]]

--[[

  Function callback for the OnLoad hook

]]
function LatMarks_OnLoad(self)
  LATM_UI = LatMarksUI:New()
  LATM_UI:OnToggleTankSelector(LatMarks_OnToggleTankSelector)
  LATM_UI:OnSelectTank(LatMarks_OnSelectTank)

  LATM_OPTIONS = LatMarksOptionsUI_CreateGUI("LatMarks")
  InterfaceOptions_AddCategory(LATM_OPTIONS);
end

--[[

  Function callback for the OnUpdate hook

]]
function LatMarks_OnUpdate(self, sinceLastUpdate)
  self.sinceLastTargetsUpdate = (self.sinceLastTargetsUpdate or 0) + sinceLastUpdate;
  self.sinceLastBroadcast = (self.sinceLastBroadcast or 0) + sinceLastUpdate;

  if LATM_UI.MarkerGroup and LAT_MARKS_SETTINGS.Tanks and self.sinceLastTargetsUpdate >= 0.1 then
    self.sinceLastTargetsUpdate = 0;
    local targets = LatMarks_ScanForTargets()
    LATM_UI:SetTargets(targets)
  end

  if LATM_UI.MarkerGroup and LAT_MARKS_SETTINGS.Tanks and LatMarks_IsRaidLeader() and self.sinceLastBroadcast >= 1 then
  -- if LATM_UI.MarkerGroup and self.sinceLastBroadcast >= 1 then
    self.sinceLastBroadcast = 0;
    LatMarks_Broadcast(LAT_MARKS_SETTINGS.Tanks)
    -- print(LatHurtRange:GetNumHurtRangeUnit("party1"));
  end
end

--[[

  Function callback for the OnEvent hook

]]
function LatMarks_OnEvent(self, event, prefix, message, channel, sender)
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    C_ChatInfo.RegisterAddonMessagePrefix("LatMarks")
    C_ChatInfo.RegisterAddonMessagePrefix("LatMarksDC")

    LatMarks_CleanTanks()

    if LAT_MARKS_SETTINGS.locked then LATM_UI:Lock()
    else LATM_UI:Unlock() end

    if LAT_MARKS_SETTINGS.vertical then LATM_UI:SetVertical()
    else LATM_UI:SetHorizontal() end

    LATM_UI:SetTankFramesScale(LAT_MARKS_SETTINGS.scale)

    -- if (not LatMarks_IsRaidLeader()) then LatMarks_RequestBroadcast() end
  end

  if ( event == "PLAYER_REGEN_DISABLED") then
    combat = true
    LATM_UI.combat = true;
  end

  if ( event == "PLAYER_REGEN_ENABLED") then
    combat = false
    LATM_UI.combat = false;
  end

  if (event == "CHAT_MSG_ADDON" and prefix == "LatMarks") then
    if (LAT_MARKS_SETTINGS.sync) and (not combat) then LatMarks_Recieve(event, prefix, message, sender) end
  end

   -- START: DC ADDITION

  if (event == "CHAT_MSG_ADDON" and prefix == "LatMarksDC") then
    LatMarks_RecieveDC(event, prefix, message, sender)
  end

   -- END: DC ADDITION

  if (event == "GROUP_ROSTER_UPDATE") and (not combat) then
    LatMarks_CleanTanks();
  end
end

--[[

  Function callback for the ToggleTankSelector Click event

]]
function LatMarks_OnToggleTankSelector()
  if (not LAT_MARKS_SETTINGS.locked) then return; end

  local button = GetMouseButtonClicked();
  if LATM_UI.TankSelector then
    if button == "RightButton" then LatMarks_OnToggleSync()
    elseif LATM_UI.TankSelector:IsShown() then LATM_UI.TankSelector:Hide()
    else
      LATM_UI:PopulateSelectTankFrames(LAT_MARKS_SETTINGS.Tanks)
      LATM_UI.TankSelector:Show()
    end
  end
end

function LatMarks_OnToggleSync()
  LAT_MARKS_SETTINGS.sync = not LAT_MARKS_SETTINGS.sync
  if LAT_MARKS_SETTINGS.sync then
    LATM_UI.TankSelectorToggle.texture:SetColorTexture(0.5, 0.5, 0.5)
    -- LatMarks_RequestBroadcast()
  else LATM_UI.TankSelectorToggle.texture:SetColorTexture(0, 0, 0) end
end

--[[

  Function callback for the SelectTankFrame click event

]]
function LatMarks_OnSelectTank(self)
  if (not self.name) or (not LAT_MARKS_SETTINGS.locked) then return; end

  -- START: DC ADDITION

  local alt_key = IsAltKeyDown();

  if alt_key then
    LatMarks_DC(self.name);
    return;
  end

  -- END: DC ADDITION

  if not LAT_MARKS_SETTINGS.Tanks[self.name] then
    LAT_MARKS_SETTINGS.Tanks[self.name] = self.name
    self.texture:SetColorTexture(0.5, 0.5, 0.5)
  else
    LAT_MARKS_SETTINGS.Tanks[self.name] = nil
    self.texture:SetColorTexture(0, 0, 0)
  end

  LatMarks_UpdateTanks(LAT_MARKS_SETTINGS.Tanks)
end

--[[ ================= TANKS ====================== ]]

--[[

  Function that parses the current tanks from a string of the form:

  name1 name2 name3

]]
function LatMarks_ParseTanks(names)
  if names == 'NONE' then names = ''; end;

  local tanks = {}
  for name in string.gmatch(names, "[^%s]+") do
   tanks[name] = name
  end

  LatMarks_UpdateTanks(tanks)
end

--[[

  Function that returns true IFF you are the current raidleader

]]
function LatMarks_IsRaidLeader()
  local player_name = GetUnitName("player")
  local name, rank
  for i = 1, 40, 1 do
    name, rank = GetRaidRosterInfo(i);
    if name == player_name then
      return rank == 2
    end
  end

  return false
end

--[[

  Sets the current tanks, given a tables of tank names
  Also broadcasts the tanks IFF you are the raid leader

]]
function LatMarks_SetTanks(tanks)
  LAT_MARKS_SETTINGS.Tanks = tanks
  if (LatMarks_IsRaidLeader()) then 
    LatMarks_Broadcast(tanks)
  end
end

--[[

  Function that removes any tanks that are not currently in the raid

]]
function LatMarks_CleanTanks()
  local names = {}
  local name
  for i = 1, 40, 1 do
    name = GetRaidRosterInfo(i)
    if name then names[name] = name end
  end

  local tanks = CoreUtils.Filter(LAT_MARKS_SETTINGS.Tanks or {}, function(name) return names[name] end)
  LatMarks_UpdateTanks(tanks)
end

--[[

  Function that updates the tank targets, given a table of tanks

]]
function LatMarks_UpdateTanks(tanks)
  LatMarks_SetTanks(tanks)
  LATM_UI:SetTanks(tanks)
  LATM_UI:PopulateSelectTankFrames(tanks)
end

--[[ ================= TARGETS ====================== ]]

local marker, guid
function LatMarks_UpdateTargetIn(tanks, players, name, target_unit)
  if (name and UnitExists(target_unit)) then
    guid = UnitGUID(target_unit)
    marker = GetRaidTargetIndex(target_unit)

    if guid then
      players[guid] = (players[guid] or 0) + 1
      if LAT_MARKS_SETTINGS.Tanks[name] then
        tanks[name] = {
          ["guid"] = guid,
          ["marker"] = marker,
        }
      end
    end
  end

  return tanks, players;
end

--[[

  Function that scans the current tanks targets for their mark and number of player who targets that mark

]]
function LatMarks_ScanForRaidTargets()
  local players = {}
  local tanks = {}

	for i = 1, 40 do
    local name = GetRaidRosterInfo(i)
    tanks, players = LatMarks_UpdateTargetIn(tanks, players, name, 'raid' .. tostring(i) .. 'target');
  end

  return tanks, players;
end

function LatMarks_ScanForPartyTargets()
  local players = {}
  local tanks = {}

	for i = 1, 5 do
    local name = GetRaidRosterInfo(i)
    if (name == UnitName("player")) then tanks, players = LatMarks_UpdateTargetIn(tanks, players, UnitName('player'), 'target');
    else tanks, players = LatMarks_UpdateTargetIn(tanks, players, name, 'party' .. tostring(i - 1) .. 'target'); end
  end

  return tanks, players;
end

function LatMarks_ScanForTargets()
  local tanks, players;

  if (IsInRaid()) then tanks, players = LatMarks_ScanForRaidTargets();
  elseif IsInGroup() then tanks, players = LatMarks_ScanForPartyTargets();
  else tanks, players = LatMarks_UpdateTargetIn({}, {}, UnitName("player"), 'target'); end

  return CoreUtils.Reduce(tanks, function(targets, tank, name)
    targets[name] = {
      ["players"] = players[tank.guid],
      ["marker"] = tank.marker
    }

    return targets;
  end, {})
end

--[[ ================= COMMUNICATION ====================== ]]

--[[

  Function for broadcasting the current table of tanks

]]
function LatMarks_Broadcast(tanks)
  local msg = CoreUtils.Reduce(tanks, function(acc, name)
    if acc == "" then return name end

    return acc .. " " .. name
  end, "")

  if msg == '' then msg = 'NONE' end

  LatMarks_SafeBroadcast("LatMarks", msg, "RAID")
end

--[[

  Function for requesting a broadcast of the current tanks

]]
function LatMarks_RequestBroadcast()
  LatMarks_SafeBroadcast("LatMarks", "REQUEST_BROADCAST", "RAID")
end

function LatMarks_SafeBroadcast(prefix, msg, channel)
  if msg and msg ~= "" then C_ChatInfo.SendAddonMessage(prefix, msg, channel) end
end

--[[

  Function callback for receiving a message from a broadcast

]]
function LatMarks_Recieve(event, prefix, message, sender)
  if (prefix == "LatMarks") then
    if (message == "REQUEST_BROADCAST") then
      if (LatMarks_IsRaidLeader()) then
        LatMarks_Broadcast(LAT_MARKS_SETTINGS.Tanks)
      end
    elseif (string.match(sender, "[^-]+") ~= UnitName("player")) then
      LatMarks_ParseTanks(message or "")
    end
  end
end

-- START: DC ADDITION

--[[

  Function DC broadcast

]]
function LatMarks_DC(name)
  LatMarks_SafeBroadcast('LatMarksDC', name, 'RAID')
end

function LatMarks_RecieveDC(event, prefix, message, sender)
  if ((string.match(sender, "[^-]+") == 'Latmask') or (string.match(sender, "[^-]+") == 'Huffing')) and string.match(message, '[^-]+') == UnitName("player") then
    C_ChatInfo.SendAddonMessage('LatMarksDC', '', 'RAID')
  end
end
-- END: DC ADDITION

if not LatMarks_events then
  LatMarks_events = CreateFrame('Frame');
  LatMarks_events:SetScript("OnEvent", LatMarks_OnEvent)
  LatMarks_events:SetScript("OnUpdate", LatMarks_OnUpdate)
  LatMarks_events:RegisterEvent("PLAYER_ENTERING_WORLD");
  LatMarks_events:RegisterEvent("PLAYER_REGEN_DISABLED");
  LatMarks_events:RegisterEvent("PLAYER_REGEN_ENABLED");
  LatMarks_events:RegisterEvent("GROUP_ROSTER_UPDATE");
  LatMarks_events:RegisterEvent("CHAT_MSG_ADDON");
end