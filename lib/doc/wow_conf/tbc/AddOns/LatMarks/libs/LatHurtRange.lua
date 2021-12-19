local rc = LibStub("LibRangeCheck-2.0")

--[[ ================= LOCAL VARIABLES ====================== ]]
local CoreUtils = CoreUtils
local combat = false;
local LatHurtRange_events;
local name_unit = {};
local hurt_range = {};

local function LatHurtRange_GetMissingHealth(unit)
  return UnitHealthMax(unit) - UnitHealth(unit)
end

local function LatHurtRange_GetNumHurtRange()
  local rangeChecker = rc:GetFriendMaxChecker(12)
  local hurt = 0;

  if IsInRaid() then
    for i = 1, 40 do
      -- TODO: check if unit is valid, etc
      if rangeChecker and rangeChecker('raid' .. i) and LatHurtRange_GetMissingHealth('raid' .. i) > 500 then
          hurt = hurt + 1;
      end
    end
  elseif IsInGroup() then
    for i = 1, 4 do
      -- TODO: check if unit is valid, etc
      if rangeChecker and rangeChecker('party' .. i) and LatHurtRange_GetMissingHealth('party' .. i) > 500 then
        hurt = hurt + 1;
      end
    end
  end

  return hurt;
end

local function LatHurtRange_InitUnit(unit)
  if (UnitExists(unit)) then
    local name = string.match(GetUnitName(unit, true), "[^-]+");
    name_unit[name] = unit;
  end
end

local function LatHurtRange_Init()
  name_unit = {};
  hurt_range = {};

  if IsInRaid() then
    for i = 1, 40 do
      LatHurtRange_InitUnit('raid' .. i);
    end
  elseif IsInGroup() then
    for i = 1, 4 do
      LatHurtRange_InitUnit('party' .. i);
    end
  end
end

local function LatHurtRange_SafeBroadcast(prefix, msg, channel)
  if msg and msg ~= "" then C_ChatInfo.SendAddonMessage(prefix, msg, channel) end
end

--[[

  Function callback for receiving a message from a broadcast

]]
local function LatHurtRange_Recieve(event, prefix, message, sender)
  if (prefix == "LatHurtRange") then
    local name = string.match(sender, "[^-]+");
    if (name ~= UnitName("player") and name_unit[name]) then
      hurt_range[name_unit[name]] = tonumber(message) or 0;
    end
  end
end

--[[ ================= CALLBACKS ====================== ]]

--[[

  Function callback for the OnUpdate hook

]]
local function LatHurtRange_OnUpdate(self, sinceLastUpdate)
  self.sinceLastBroadcast = (self.sinceLastBroadcast or 0) + sinceLastUpdate;

  if self.sinceLastBroadcast >= 1 then
    self.sinceLastBroadcast = 0;
    local hurt = LatHurtRange_GetNumHurtRange();
    LatHurtRange_SafeBroadcast('LatHurtRange', hurt, 'RAID');
  end
end

--[[

  Function callback for the OnEvent hook

]]
local function LatHurtRange_OnEvent(self, event, prefix, message, channel, sender)
  if ( event == "PLAYER_ENTERING_WORLD" ) then
    C_ChatInfo.RegisterAddonMessagePrefix("LatHurtRange")

    LatHurtRange_Init();
  end

  if (event == "CHAT_MSG_ADDON" and prefix == "LatHurtRange") then
    LatHurtRange_Recieve(event, prefix, message, sender)
  end

  if (event == "GROUP_ROSTER_UPDATE") then
    LatHurtRange_Init();
  end
end

if not LatHurtRange_events then
  LatHurtRange_events = CreateFrame('Frame');
  LatHurtRange_events:SetScript("OnEvent", LatHurtRange_OnEvent)
  LatHurtRange_events:SetScript("OnUpdate", LatHurtRange_OnUpdate)
  -- LatHurtRange_events:RegisterEvent("PLAYER_ENTERING_WORLD");
  -- LatHurtRange_events:RegisterEvent("GROUP_ROSTER_UPDATE");
  -- LatHurtRange_events:RegisterEvent("CHAT_MSG_ADDON");
end

-- PUBLIC

LatHurtRange = {};

function LatHurtRange:GetNumHurtRangeUnit(unit)
  return hurt_range[unit];
end