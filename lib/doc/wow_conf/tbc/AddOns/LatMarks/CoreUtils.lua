--[[
  Name        : CoreUtils
  Version     : 1.0
  Author      : Letterix
  Website     : https://github.com/letterix
  Description : Exposes a CoreUtils library
]]

--[[ ================= CONSTANTS ====================== ]]

-- [[ Text reset token ]]
local T_R = '|r'

-- [[ Text color token ]]
local T_C = '|c'

-- [[ Text color tokens for specific colors ]]
local T_GREY = T_C.."ff999999";
local T_RED = T_C.."ffff0000";
local T_WHITE = T_C.."ffFFFFFF";
local T_GREEN = T_C.."ff1eff00";
local T_PURPLE = T_C.."ff9F3FFF";
local T_BLUE = T_C.."ff0070dd";
local T_ORANGE = T_C.."ffFF8400";

--[[ ================= FUNCTIONS ====================== ]]

--[[

  Prints a msg with a label: '[Print]: Some Message'

  @param msg - some text to print
  @param label - some label to prints as ['label']: before the msg, defaults to '[Print]:
  @param thex - some text hex color (ex '|cffAABBCC') to color the label with, defaults to nothing

]]
local function Print(msg, label, thex)
  if not label then label = "Print" end
  if not thex then thex = "" end

  local prefix = "["..thex..tostring(label)..T_R.."]: "

  DEFAULT_CHAT_FRAME:AddMessage(prefix..msg)
end

--[[

  Calculate the size of an array or a table

  @param t - an array or a table
  @return size - the num of entires in 't'

]]
local function Size(t)
  local size = 0;
  for _, v in pairs(t) do if v then size = size + 1 end end
  return size
end

--[[

  Checks if an array or table is empty

  @param t - an array or a table
  @return empty - boolean stating that the table is empty or not

]]
local function Empty(t)
  local empty = true;
  for _, v in pairs(t) do if v then empty = false; break end end
  return empty
end

--[[

  Clears an array or table, setting all values to nil

  @param t - an array or a table
  @return t - the cleared array or table

]]
local function Clear(t)
  for k in pairs(t) do t[k] = nil end
  return t
end


--[[

  Reduce function for an array

  @param t - an array or a table
  @param f - a function that takes three params:
    - the new structure
    - the current element
    - the current key <optional>
    - the current # <optional>
  @param acc - the new structure starting value
  @return acc - the reduced structure

]]
local function Reduce(t, f, acc)
  local count = 0;
  for k, v in pairs(t) do
    count = count + 1
    acc = f(acc, v, k, count)
  end
  return acc
end

--[[

  Map function for an array or table
  NOTE: This makes Array and Table a Functor!

  @param t - an array or a table
  @param f - a function that takes three params:
    - the current element
    - the current key <optional>
    - the current # <optional>
  @return mapped - an array or table, containing the results of each element applied to 'f'

]]
local function Map(t, f)
  return Reduce(t, function(mapped, v, k, i)
    mapped[k] = f(v, k, i)
    return mapped
  end, {})
end

--[[

  Filter function for an array or table

  @param t - an array or a table
  @param f - a function that takes three params:
    - the current element
    - the current key <optional>
    - the current # <optional>
  @return filtered - an array, containing the all the elements for which f returned truthfully

]]
local function Filter(t, f)
  return Reduce(t, function(filtered, v, k, i)
    if f(v, k, i) then
      if t[1] then table.insert(filtered, v)
      else filtered[k] = v end
    end

    return filtered
  end, {})
end

--[[

  Range function

  @param min - a number representing the start of the range
  @param max - a number representing the end of the range

  @return range - an array containing all the numbers from min to max

]]
local function Range(min, max)
  local range = {}
  for i = min, max do
    table.insert(range, i)
  end

  return range
end

--[[

  Flatten fuction for an array or table

  @param t - an array or a table, containing arrays or tables
  @return arr - an array containing the values from each array or table in f

]]
local function Flatten(t)
  return Reduce(t, function(arr, v, k, i)
    return Reduce(v, function(arr, v)
      table.insert(arr, v)
      return arr
    end, arr)
  end, {})
end

--[[

  Split an array or a table into chunks of size 'size'

  @param t - an array or a table
  @param size - the size of each chunk
  @return chunks - an array containing the chunks

]]
local function Chunks(t, size)
  local chunks = {}
  table.insert(chunks, {})

  return Reduce(t, function(chunks, v, k, i)
    chunks[#chunks][k] = v
    if (i % size == 0) then table.insert(chunks, {}) end

    return chunks
  end, chunks)
end

--[[

  Extract all the values from an array or table

  @param t - an array or a table
  @return arr - the array of values in 't'

]]
local function Values(t)
  local f = function(acc, v, _, i) acc[i] = v; return acc end
  return Reduce(t, f, {})
end

--[[

  Extract all the keys from an array or table

  @param t - an array or a table
  @return arr - the array of keys in 't'

]]
local function Keys(t)
  local f = function(acc, _, k, i) acc[i] = k; return acc end
  return Reduce(t, f, {})
end

--[[

  Finds an entry in the array where the function 'f' returns truthfully

  @param t - an array or a table
  @return found - the first entry returning truthfully for 'f'

]]
local function Find(t, f)
  local i = 0;
  for k, v in pairs(t) do
    i = i + 1
    if (f(v, k, i)) then return v, k, i end
  end
end

--[[

  Checks if every entry in an array or table returns true fro the function 'f'

  @param t - an array or a table
  @return every - boolean representing whether all entries passed

]]
local function Every(t, f)
  local g = function(v, k, i) return not f(v, k, i) end
  return not find(t, g)
end

--[[

  Retrieves the first value in an array or table

  @param t - an array or a table
  @return first - the first value in the array

]]
local function First(t, f)
  for k, v in pairs(t) do
    if v then return v, k end
  end
end

--[[

  Converts an rgb { 1, 1, 1 } color to the representing hex bytes

  @param color - a rgb color table { r, g, b, a<optional> }
  @return r - the num of bytes for color.r
  @return g - the num of bytes for color.g
  @return b - the num of bytes for color.b
  @return a - the num of bytes for color.a

]]
local function GetRGBAAsBytes(color)
  return color.r * 255, color.g * 255, color.b * 255, (color.a or 1) * 255;
end

--[[

  Converts an rgb { 1, 1, 1 } color to the representing hex string

  @param color - a rgb color object { r, g, b, a<optional> }
  @return hex - a hex string representing the color object

]]
local function GetRGBAAsHex(color)
  return ("ff%.2x%.2x%.2x"):format(GetRGBAAsBytes(color));
end

--[[

  Generates a text color from an rgb color { 1, 1, 1 }

  @param color - a rgb color table { r, g, b, a<optional> }
  @return thex - the hex string, representing the color table, prepended with color format for printing

]]
local function GenerateTextColor(color)
  return "|c"..GetRGBAAsHex(color);
end

--[[

  Fetches the current class and its representing rgb color

  @return color - the rgb color of the current class
  @return class - the string token of the current class; ex 'Hunter'

]]
local function GetClassColor()
  local class, classFileName = UnitClass("player")
  local color = TEXT_CLASS_COLORS[classFileName]
  return color, class;
end

--[[

  Fetches the current class and its representing text hex color

  @return color - the hex color of the current class, prepended with color token; ex '|cffaabbcc'
  @return class - the string token of the current class; ex 'Hunter'

]]
local function GetClassTextColor()
  local class, classFileName = UnitClass("player")
  local color = RAID_CLASS_COLORS[classFileName]
  return color, class;
end

--[[ ================= GENERATED CONSTANTS ====================== ]]

-- [[ Text class color table (Hunter -> '|cffaabbcc') ]]
local TEXT_CLASS_COLORS = {}
for k, v in pairs(RAID_CLASS_COLORS) do
  TEXT_CLASS_COLORS[k] = GenerateTextColor(v)
end

--[[ ================= WORK QUEUE ====================== ]]

--[[

  Simple WorkQueue; a wrapper for work that needs to be done

]]
local WorkQueue = { size = 0, on_done = nil, done = {}, work = {} }

--[[

  Constructor

]]
function WorkQueue:New()
  local q = q or {}
  setmetatable(q, self)
  self.__index = self
  self.on_done = nil
  self.done = {}
  self.work = {}
  return q
end

--[[

  Get size of work left to do

]]
function WorkQueue:Size()
  return self.size
end

--[[

  Set work to be executed

]]
function WorkQueue:SetWork(work, on_done)
  --CoreUtils.Print('Setting work!', 'WorkQueue', CoreUtils.T_RED)
  self.work = work
  self.on_done = on_done
  self.done = {}
  self.size = Size(work)
end


--[[

  Execute next work to be done

]]
function WorkQueue:Work()
  local first, i = First(self.work)
  --CoreUtils.Print('Checking for work..', 'WorkQueue', CoreUtils.T_RED)
  if not first then return end

  --CoreUtils.Print('Found work!', 'WorkQueue', CoreUtils.T_RED)
  local res = first()
  self.work[i] = nil
  self.done[i] = res
  self.size = self.size - 1

  --CoreUtils.Print('Work done!', 'WorkQueue', CoreUtils.T_RED)

  if Empty(self.work) and self.on_done then self.on_done(self.done) end
end

--[[ ================= EXPORTED ====================== ]]

local function IsMomentum()
  print(GetGuildInfo("player"))
  return GetGuildInfo("player") == "Momentum"
end

CoreUtils = {

  -- [[ Constants ]] --
  T_R = T_R,
  T_C = T_C,
  T_GREY = T_GREY,
  T_RED = T_RED,
  T_WHITE = T_WHITE,
  T_GREEN = T_GREEN,
  T_PURPLE = T_PURPLE,
  T_BLUE = T_BLUE,
  T_ORANGE = T_ORANGE,

  -- [[ Functions ]] --
  Print = Print,
  Size = Size,
  Clear = Clear,
  Empty = Empty,
  Reduce = Reduce,
  Map = Map,
  Filter = Filter,
  Range = Range,
  Flatten = Flatten,
  Chunks = Chunks,
  Values = Values,
  Keys = Keys,
  Find = Find,
  Every = Every,
  GetRGBAAsBytes = GetRGBAAsBytes,
  GetRGBAAsHex = GetRGBAAsHex,
  GenerateTextColor = GenerateTextColor,
  GetClassColor = GetClassColor,
  GetClassTextColor = GetClassTextColor,

  -- [[ Generated Constants ]] --
  TEXT_CLASS_COLORS = TEXT_CLASS_COLORS,

  -- [[ Classes ]] --
  WorkQueue = WorkQueue,

  -- [[ GUILD ]]
  IsMomentum = IsMomentum
}

return CoreUtils