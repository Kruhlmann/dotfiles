-- local HelperFunction = {}
-- _G["HelperFunction"] = HelperFunction

local specIndexTotal = {
    [1] = 0, 
    [2] = 0, 
    [3] = 0
}
local talents = {}

local specs = {
    ['Priest'] = {
        ['Healing Priest'] = {
            ['index'] = {1, 2},
            ['talent'] = nil
        },
        ['Shadow Priest'] = {
            ['index'] = {3},
            ['talent'] = nil
        },
    },
    ['Paladin'] = {
        ['Holy Paladin'] = {
            ['index'] = {1},
            ['talent'] = nil
        },
        ['Prot Paladin'] = {
            ['index'] = {2},
            ['talent'] = nil
        },
        ['Ret Paladin'] = {
            ['index'] = {3},
            ['talent'] = nil
        },
    },
    ['Rogue'] = nil,
    ['Shaman'] = {
        ['Enh Shaman'] = {
            ['index'] = {2},
            ['talent'] = nil
        },
        ['Ele Shaman'] = {
            ['index'] = {1},
            ['talent'] = nil
        },
        ['Resto Shaman'] = {
            ['index'] = {3},
            ['talent'] = nil
        },
    },
    ['Hunter'] = nil,
    ['Mage'] = nil,
    ['Warlock'] = nil,
    ['Warrior'] = {
        ['Prot Warrior'] = {
            ['index'] = {3},
            ['talent'] = nil
        },
        ['DPS Warrior'] = {
            ['index'] = {1, 2},
            ['talent'] = nil
        }
    },
    ['Druid'] = {
        ['Resto Druid'] = {
            ['index'] = {3},
            ['talent'] = {
                {
                    ["talentName"] = "Heart of the Wild",
                    ['talentRank'] = 5
                },
                {
                    ["talentName"] = "Nature's Swiftness",
                    ['talentRank'] = 1
                }
            }
        },
        ['Boomkin'] = {
            ['index'] = {1},
            ['talent'] = nil
        },
        ['Feral Tank'] = {
            ['index'] = {2},
            ['talent'] = {
                {
                    ["talentName"] = "Primal Fury",
                    ['talentRank'] = 2
                },
            }
        },
        ['Feral DPS'] = {
            ['index'] = {2},
            ['talent'] = nil
        }
    }
}

function determineSpec(class)
    if(specs[class] == nil) then
        return class
    end
    for i = 1, 3 do
        for j = 1, GetNumTalents(i) do
            local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(i, j)
            if(currentRank ~= 0) then
                specIndexTotal[i] = specIndexTotal[i] + currentRank
                talents[name] = currentRank
            end
        end
    end

    local maxKey, maxValue = 0, 0
    for k, v in pairs(specIndexTotal) do
        if specIndexTotal[k] > maxValue then
            maxKey, maxValue = k, v
        end
    end
    
    for key, value in pairs(specs[class]) do
        local hasAllTalents = true
        if(value['talent'] ~= nil) then
            for _, talent in pairs(value['talent']) do
                if hasAllTalents then
                    talentName = talent['talentName']
                    talentRank = talent['talentRank']
                    if(talents[talentName] ~= talentRank) then
                        hasAllTalents = false
                    end
                end
            end
            if(hasAllTalents and value['talent'] ~= nil) then
                return key
            end
        end
        if(value['index'] ~= nil) then
            for _, index in pairs(value['index']) do
                if(index == maxKey) then
                    return key
                end
            end
        end
    end

    return "Unknown Spec"
end

local baseMessages = {
    ["SAY"] = "Say",
    ["PARTY"] = "Party",
    ["GUILD"] = "Guild",
    ["OFFICER"] = "Officer",
    ["RAID"] = "Raid",
    ["INSTANCE_CHAT"] = "BG",
}

local channelsToIgnore = {
    ["General"] = true,
    ["Trade"] = true,
    ["LocalDefense"] = true,
    ["WorldDefense"] = true,
    ["LookingForGroup"] = true,
    ["GuildRecruitment"] = true
}

function GetChatChannels()
    local channels = {}
    for k, v in pairs(baseMessages) do
        channels[k] = v
    end

    local chanList = { GetChannelList() }
    for i=1, #chanList, 3 do
        id = chanList[i]
        name = chanList[i+1]
        if (channelsToIgnore[name] == nil) then
            channels[id] = name
        end
    end

    return channels
end

function CRA_SendChatMessage(message, channel)
    if(baseMessages[channel] ~= nil) then
        SendChatMessage(message, channel)
    else
        SendChatMessage(message, "CHANNEL", nil, channel)
    end
end

function CheckUnitForBuff(unit, buffId)
    local buffPos = 1
    while true do
        local buffName, icon, count, debuffType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId = UnitAura(unit, buffPos)
        buffPos = buffPos + 1

        if(spellId == nil) then
            return false, nil, nil
        elseif(tostring(spellId) == buffId) then
            return true, duration, expirationTime
        end
    end
end

function splitString(inputstr, sep)
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

local functionIdentifiers = {}

function CRA_wait(time, currFunction, identifierString)
    unique = math.random()
    functionIdentifiers[identifierString] = unique

    _CRA_wait(time, function(t)
        unique = t[1]
        func = t[2]
        if(functionIdentifiers[identifierString] == unique) then
            func()
        end
    end, {unique, currFunction})
end

local waitTable = {};
local waitFrame = nil;

function _CRA_wait(delay, func, ...)
  if(type(delay)~="number" or type(func)~="function") then
    return false;
  end
  if(waitFrame == nil) then
    waitFrame = CreateFrame("Frame","WaitFrame", UIParent);
    waitFrame:SetScript("onUpdate",function (self,elapse)
      local count = #waitTable;
      local i = 1;
      while(i<=count) do
        local waitRecord = tremove(waitTable,i);
        local d = tremove(waitRecord,1);
        local f = tremove(waitRecord,1);
        local p = tremove(waitRecord,1);
        if(d>elapse) then
          tinsert(waitTable,i,{d-elapse,f,p});
          i = i + 1;
        else
          count = count - 1;
          f(unpack(p));
        end
      end
    end);
  end
  tinsert(waitTable,{delay,func,{...}});
  return true;
end