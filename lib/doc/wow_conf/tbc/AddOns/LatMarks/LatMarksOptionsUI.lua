
-- local AceConfig = LibStub("AceConfig-3.0")
-- LatMarks_Options = {}
-- local AceConfig = LibStub("AceConfig-3.0")
-- local AceConfigDialog = LibStub("AceConfigDialog-3.0")
-- local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")

-- function LatMarks_Options:Show()
-- 	AceConfigDialog:Open("LatMarks")
-- end

-- function LatMarks_Options:Close()
-- 	AceConfigDialog:Close("LatMarks")
-- end

-- function LatMarks_Options:NotifyChange()
-- 	AceConfigRegistry:NotifyChange("LatMarks")
-- end

-- LatMarks_Options.table = {
--   type = "group",
--   args = {
--     enable = {
--       name = "Lock",
--       desc = "Locks / unlocks the frames",
--       type = "toggle",
--       set = function(info,val)
--         LAT_MARKS_SETTINGS.locked = val
--       end,
--       get = function(info) return LAT_MARKS_SETTINGS.locked end
--     },
--     enable = {
--       name = "Vertical",
--       desc = "Enable / Disable vertical layout for the tank marks",
--       type = "toggle",
--       set = function(info,val)
--         LAT_MARKS_SETTINGS.vertical = val;
--         LATM_UI:ReloadTankFrames();
--       end,
--       get = function(info) return LAT_MARKS_SETTINGS.vertical end
--     },
--   }
-- }

-- AceConfig:RegisterOptionsTable("LatMarks", LatMarks_Options.table)

local LatMarksOptionsCommands = {
  ["lock"] = function()
    if LAT_MARKS_SETTINGS.locked then LATM_UI:Unlock()
    else LATM_UI:Lock() end
  end,
  ["vertical"] = function()
    if LAT_MARKS_SETTINGS.vertical then LATM_UI:SetHorizontal()
    else LATM_UI:SetVertical() end
  end,
  ["scale"] = function(v)
    LATM_UI:SetTankFramesScale(v)
  end,
}

local tooltipOnEnter = function(self, event)
  GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
  GameTooltip:SetText(self.tooltipText, nil, nil, nil, nil, false);
  GameTooltip:Show();
end
local tooltipOnLeave = function(self, event)
  GameTooltip:Hide();
end
local function AddTooltip(widget, tooltipText)
  widget.tooltipText = tooltipText
  widget:SetScript("OnEnter", tooltipOnEnter)
  widget:SetScript("OnLeave", tooltipOnLeave)
end

local function MakeCheckbox(name, parent)
  local cb = CreateFrame("CheckButton", name, parent, "UICheckButtonTemplate")
  cb:SetWidth(25)
  cb:SetHeight(25)
  cb:Show()

  local cblabel = cb:CreateFontString(nil, "OVERLAY")
  cblabel:SetFontObject("GameFontHighlight")
  cblabel:SetPoint("LEFT", cb,"RIGHT", 5,0)
  cb.label = cblabel
  return cb
end

local function MakeSlider(name, parent, min, max, value)
  local slider = CreateFrame("Slider", name, parent, "OptionsSliderTemplate");
  slider:SetMinMaxValues(min, max);
  slider:SetValue(value);	-- Default value to start off with
  slider:SetValueStep(0.01); 	-- does not work without SetObeyStepOnDrag
  slider:SetObeyStepOnDrag(true);

  local sliderlabel = slider:CreateFontString(nil, "OVERLAY")
  sliderlabel:SetFontObject("GameFontHighlight")
  sliderlabel:SetPoint("LEFT", slider,"RIGHT", 5,0)
  slider.label = sliderlabel

  _G[slider:GetName().."Low"]:SetText(min)
  _G[slider:GetName().."High"]:SetText(max)
  return slider;
end

function LatMarksOptionsUI_CreateGUI(name, parent)
  local frame = CreateFrame("Frame", nil, InterfaceOptionsFrame)
  frame:Hide()
  frame.name = name

  frame:SetScript("OnShow", function(self)
    self.content.lock:SetChecked(LAT_MARKS_SETTINGS.locked)
    self.content.vertical:SetChecked(LAT_MARKS_SETTINGS.vertical)
    self.content.scale:SetValue(LAT_MARKS_SETTINGS.scale or 1)
  end)

  local label = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
	label:SetPoint("TOPLEFT", 10, -15)
	label:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", 10, -45)
	label:SetJustifyH("LEFT")
  label:SetJustifyV("TOP")

  label:SetText(name)

	local content = CreateFrame("Frame", "LATMOptionsContent", frame)
	content:SetPoint("TOPLEFT", 10, -10)
  content:SetPoint("BOTTOMRIGHT", -10, 10)

  frame.content = content

  local lock = MakeCheckbox(nil, content)
  lock.label:SetText("Lock frames")
  lock:SetPoint("TOPLEFT", 10, -60)
  content.lock = lock
  lock:SetScript("OnClick",function(self,button)
    LatMarksOptionsCommands.lock()
  end)
  AddTooltip(lock, "Enable aura durations on target frame")

  local vertical = MakeCheckbox(nil, content)
  vertical.label:SetText("Vertical layout")
  vertical:SetPoint("TOPLEFT", 10, -80)
  content.vertical = vertical
  vertical:SetScript("OnClick",function(self,button)
    LatMarksOptionsCommands.vertical()
  end)
  AddTooltip(vertical, "Enable vertical layout of tank marks")


  local scale = MakeSlider("LatMarks_Scale", content, 0.01, 2, 1)
  scale:SetPoint("TOPLEFT", 10, -120)
  content.scale = scale;
  scale.label:SetText("Tank marks scale")
  scale:SetScript("OnValueChanged", function(self)
    local value = self:GetValue()
    LatMarksOptionsCommands.scale(value)
  end)
  AddTooltip(scale, "Set the scale of the tank marks")

  local t = content:CreateTexture(nil,"BACKGROUND",nil,-8)
  t:SetTexture("Interface\\AddOns\\LatMarks\\icons\\pikachu")
  t:SetWidth(150);
  t:SetHeight(150);
  t:SetPoint("TOPLEFT", 10, -160)

  return frame
end