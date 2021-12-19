local args = { ... };
local LB = args[2];
local G = getfenv(0);
local _locale = nil;
local _goldColor = "|cfffffe8b";
local _colorEnd = "|r";



local StatDetails = LB.StatDetails;
local ShortStatKeys = LB.ShortStatKeys;
local StatKeyToRatingID = LB.StatKeyToRatingID;
local StatKeyIsPercentage = LB.StatKeyIsPercentage;


local GetEffectFromRating = LB.GetEffectFromRating;


local GetLocaleTable = LB.GetLocaleTable;


local GetAttributeTable = LB.Attributes.GetAttributeTable;


local TooltipType = {}






local TooltipState = {}





local LineModInfo = {}







local LineData = {}




local StatScanResult = {}








local _tooltipState = {
   ["GameTooltip"] = { itemKey = nil, modifiedLines = {}, timesSeen = 0 },
   ["ItemRefTooltip"] = { itemKey = nil, modifiedLines = {}, timesSeen = 0 },
   ["ShoppingTooltip1"] = { itemKey = nil, modifiedLines = {}, timesSeen = 0 },
   ["ShoppingTooltip2"] = { itemKey = nil, modifiedLines = {}, timesSeen = 0 },
}

local function getItemIDFromLink(itemLink)

   local firstColonIndex = string.find(itemLink, ":");
   local secondColonIndex = string.find(itemLink, ":", firstColonIndex + 1);
   local itemID = string.sub(itemLink, firstColonIndex + 1, secondColonIndex - 1);
   return tonumber(itemID)
end















local function scanForStat(text, statKey, _)
   local lowercaseText = text:lower();
   local discoveredCapture = nil;
   local successfulPattern = nil;


   for _, pattern in ipairs(_locale.AlternativePatterns[statKey]) do
      discoveredCapture = string.match(lowercaseText, pattern.pattern:lower());
      if (discoveredCapture ~= nil) then
         successfulPattern = pattern;
         break
      end
   end


   if (discoveredCapture == nil) then
      local shortStatKey = ShortStatKeys[statKey];
      if (shortStatKey == nil) then
         return nil
      end

      local shortStatString = (G[shortStatKey]):lower();
      local shortStatPatterns = _locale.GetShortStatPatterns(shortStatString, statKey);
      for _, pattern in ipairs(shortStatPatterns) do
         discoveredCapture = string.match(lowercaseText, pattern.pattern);
         if (discoveredCapture ~= nil) then
            successfulPattern = pattern;
            break
         end
      end
   end

   if (discoveredCapture == nil) then
      return nil
   end

   local patternStart, patternEnd = string.find(lowercaseText, successfulPattern.pattern);
   if (patternStart == nil or patternEnd == nil) then
      return nil
   end


   local value = tonumber(string.match(discoveredCapture, "(%d+)"));
   if (patternStart and patternEnd and value) then

      local patternSubstring = lowercaseText:sub(patternStart, patternEnd);
      local captureStart, captureEnd = string.find(patternSubstring, discoveredCapture);


      return {
         valueStart = captureStart + patternStart,
         valueEnd = captureEnd + patternStart,
         patternStart = patternStart,
         patternEnd = patternEnd,
         patternUsed = successfulPattern,
         valueFound = value,
      }
   end

   return nil
end



local function tryGenerateModifiedLine(text, statInfo, indicesProcessed)
   local statValue = nil;

   local found = scanForStat(text, statInfo.kind, statInfo.type);
   if (found and not (indicesProcessed[found.valueStart]) and found.valueFound) then

      if (statInfo.type == "Rating") then
         statValue = GetEffectFromRating(found.valueFound, StatKeyToRatingID[statInfo.kind]);
         if (found.valueStart and found.valueEnd and statValue) then
            local currentColorCode = (select(3, string.find(text, "(|c%x%x%x%x%x%x%x%x)")) or _colorEnd);
            local endFragment = StatKeyIsPercentage[statInfo.kind] and "%" or "";
            local formattedValue = _goldColor .. " (" .. format("%.2F", statValue) .. endFragment .. ")" .. currentColorCode;
            if (found.patternUsed.location == "AfterValue") then
               return { found.valueStart, found.valueEnd, formattedValue }
            elseif (found.patternUsed.location == "PatternEnd") then
               return { found.patternStart, found.patternEnd, formattedValue }
            end
         end

      elseif (statInfo.type == "Attribute") then
         local attributeTable = GetAttributeTable(statInfo.kind);
         local bonuses = attributeTable.GetBonusesString(found.valueFound);
         if (not bonuses) then
            return { nil, nil, nil }
         end
         local currentColorCode = (select(3, string.find(text, "(|c%x%x%x%x%x%x%x%x)")) or _colorEnd);
         local formattedValue = _goldColor .. " (" .. bonuses .. ")" .. currentColorCode;
         if (found.patternUsed.location == "AfterValue") then






            return { found.patternStart, found.valueEnd, formattedValue }
         elseif (found.patternUsed.location == "PatternEnd") then
            return { found.patternStart, found.patternEnd + 1, formattedValue }
         end
      end
   end

   return { nil, nil, nil }
end



local function modifyLines(statsFound)
   local modifiedLines = {};
   for lineNum, lineData in pairs(statsFound) do


      local indexOffset = 0;
      local currentLine = lineData.originalText;

      table.sort(lineData.modifications, function(modA, modB)
         return modA.startIndex < modB.startIndex
      end)
      for _, statData in ipairs(lineData.modifications) do
         local prevLen = currentLine:len();
         currentLine = currentLine:sub(1, statData.endIndex - 1 + indexOffset) ..
         statData.formattedString ..
         currentLine:sub(statData.endIndex + indexOffset);
         local lenDiff = currentLine:len() - prevLen;
         indexOffset = indexOffset + lenDiff;
      end
      modifiedLines[lineNum] = currentLine;
   end

   return modifiedLines
end

local function generateModifiedTooltipLines(tooltip)
   local statsFound = {};

   for i = 2, tooltip:NumLines() do
      local lineRef = G[tooltip:GetName() .. "TextLeft" .. i];
      local text = lineRef:GetText();
      local indicesProcessed = {};
      if (text) then
         for _, statKind in ipairs(StatDetails) do
            local modifiedLineInfo = 
            tryGenerateModifiedLine(text, statKind, indicesProcessed);
            local injectStart = modifiedLineInfo[1];
            local injectEnd = modifiedLineInfo[2];
            local formattedValue = modifiedLineInfo[3];
            if (injectStart and injectEnd and formattedValue) then




               if (not LB.Config.DisplayToggles[statKind.kind]) then
                  formattedValue = "";
               end

               local lineData = statsFound[i];
               if (lineData == nil) then
                  lineData = { originalText = text, modifications = {} };
                  statsFound[i] = lineData;
               end
               table.insert(lineData.modifications, {
                  stat = statKind.kind,
                  statType = statKind.type,
                  startIndex = injectStart,
                  endIndex = injectEnd,
                  formattedString = formattedValue,
               });

               indicesProcessed[injectStart] = true;
            end
         end
      end
   end

   return modifyLines(statsFound)
end

local function injectModifiedLines(tooltip, modifiedLines)

   if (next(modifiedLines) == nil) then
      return
   end
   for i = 2, tooltip:NumLines() do
      local modifiedText = modifiedLines[i]
      if (modifiedText) then
         local lineRef = (G[tooltip:GetName() .. "TextLeft" .. i]);
         lineRef:SetText(modifiedText);
      end
   end
end

local function injectStats(tooltip, tooltipType)
   local item = { tooltip:GetItem() };
   if (not item or not item[2]) then

      return
   end

   local itemKey = tostring(getItemIDFromLink(item[2])) .. "-" .. item[1];
   local tooltipState = _tooltipState[tooltipType];





   if (tooltipState.itemKey == itemKey and tooltipState.timesSeen > 1) then
      tooltipState.timesSeen = tooltipState.timesSeen + 1;
      injectModifiedLines(tooltip, tooltipState.modifiedLines);
      return
   end

   local linesModified = generateModifiedTooltipLines(tooltip);

   if (tooltipState.itemKey == itemKey) then
      tooltipState.timesSeen = tooltipState.timesSeen + 1;
   else
      tooltipState.timesSeen = 0;
   end
   tooltipState.itemKey = itemKey;
   tooltipState.modifiedLines = linesModified;
   injectModifiedLines(tooltip, linesModified);
end


_locale = GetLocaleTable(GetLocale());

GameTooltip:HookScript("OnTooltipSetItem", function(self)
   injectStats(self, "GameTooltip");
end);
ItemRefTooltip:HookScript("OnTooltipSetItem", function(self)
   injectStats(self, "ItemRefTooltip");
end);
ShoppingTooltip1:HookScript("OnTooltipSetItem", function(self)
   injectStats(self, "ShoppingTooltip1");
end);
ShoppingTooltip2:HookScript("OnTooltipSetItem", function(self)
   injectStats(self, "ShoppingTooltip2");
end);
