
WeakAurasSaved = {
	["dynamicIconCache"] = {
	},
	["editor_tab_spaces"] = 4,
	["displays"] = {
		["Hunter::Aspect"] = {
			["iconSource"] = -1,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = -175,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_START",
						["ownOnly"] = true,
						["event"] = "Health",
						["unit"] = "player",
						["matchesShowOn"] = "showAlways",
						["spellIds"] = {
						},
						["auranames"] = {
							"Aspect of the Hawk", -- [1]
							"Aspect of the Monkey", -- [2]
							"Aspect of the Beast", -- [3]
							"Aspect of the Pack", -- [4]
							"Aspect of the Cheetah", -- [5]
							"Striped Nightsaber", -- [6]
						},
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["useName"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["customTriggerLogic"] = "function(trigger)\n  return trigger[1]\nend",
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [1]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [2]
			},
			["height"] = 24,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["regionType"] = "icon",
			["cooldown"] = true,
			["parent"] = "Hunter",
			["authorOptions"] = {
			},
			["displayIcon"] = 136076,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["zoom"] = 0.3,
			["xOffset"] = -100,
			["config"] = {
			},
			["id"] = "Hunter::Aspect",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["width"] = 48,
			["uid"] = "b5dg1di7l9G",
			["inverse"] = false,
			["cooldownTextDisabled"] = false,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.2.glow",
						}, -- [1]
					},
				}, -- [1]
			},
			["information"] = {
			},
			["icon"] = true,
		},
		["Death Coil"] = {
			["iconSource"] = 0,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["do_loop"] = false,
					["do_sound"] = true,
					["sound_path"] = "CustomSounds\\stoopid.mp3",
					["do_message"] = false,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_destFlags2"] = false,
						["duration"] = "3.5",
						["subeventPrefix"] = "SPELL",
						["destUnit"] = "player",
						["sourceFlags3"] = "Player",
						["use_destName"] = false,
						["use_cloneId"] = true,
						["spellName"] = "Death Coil",
						["type"] = "combatlog",
						["unevent"] = "timed",
						["sourceFlags2"] = "Hostile",
						["use_sourceFlags3"] = true,
						["event"] = "Combat Log",
						["use_sourceFlags2"] = true,
						["unit"] = "target",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_sourceUnit"] = false,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["use_destUnit"] = true,
						["debuffType"] = "HELPFUL",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 6,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_1.sourceName_format"] = "none",
					["text_text"] = "%1.sourceName",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_TOP",
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [1]
			},
			["height"] = 64,
			["load"] = {
				["ingroup"] = {
				},
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["use_zone"] = false,
				["zoneIds"] = "",
				["use_level"] = false,
				["level_operator"] = "==",
				["level"] = "60",
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["config"] = {
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["url"] = "https://wago.io/xaZ5SVcnJ/6",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 64,
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 11401,
			["id"] = "Death Coil",
			["semver"] = "1.0.5",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0,
			["uid"] = "OLtLyEUyUI2",
			["inverse"] = false,
			["icon"] = true,
			["displayIcon"] = "136145",
			["cooldown"] = true,
			["parent"] = "PVP warnings",
		},
		["Flash bomb Warning"] = {
			["outline"] = "OUTLINE",
			["iconSource"] = 0,
			["xOffset"] = -411.2705078125,
			["displayText"] = "%sourceName is casting %spellName",
			["shadowYOffset"] = -1,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
					["do_loop"] = false,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",
					["do_sound"] = true,
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["spellId"] = "5134",
						["duration"] = "2",
						["unit"] = "player",
						["use_sourceFlags"] = true,
						["debuffType"] = "HELPFUL",
						["type"] = "combatlog",
						["unevent"] = "timed",
						["spellName"] = "Flash Bomb",
						["event"] = "Combat Log",
						["use_sourceFlags2"] = true,
						["use_spellId"] = true,
						["use_spellName"] = false,
						["spellIds"] = {
						},
						["sourceFlags2"] = "Hostile",
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["sourceFlags"] = "NotInGroup",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "combatlog",
						["spellId"] = "5134",
						["unevent"] = "timed",
						["duration"] = "2",
						["event"] = "Combat Log",
						["subeventPrefix"] = "SPELL",
						["spellName"] = "Flash Bomb",
						["use_spellId"] = true,
						["sourceFlags2"] = "Hostile",
						["use_sourceFlags2"] = true,
						["use_spellName"] = false,
						["use_sourceFlags"] = true,
						["subeventSuffix"] = "_CAST_START",
						["sourceFlags"] = "NotInGroup",
					},
					["untrigger"] = {
					},
				}, -- [2]
				{
					["trigger"] = {
						["type"] = "combatlog",
						["spellId"] = "5134",
						["unevent"] = "timed",
						["duration"] = "2",
						["event"] = "Combat Log",
						["subeventPrefix"] = "SPELL",
						["spellName"] = "Flash Bomb",
						["use_spellId"] = true,
						["sourceFlags2"] = "Hostile",
						["use_sourceFlags2"] = true,
						["use_spellName"] = false,
						["use_sourceFlags"] = true,
						["subeventSuffix"] = "_CAST_START",
						["sourceFlags"] = "NotInGroup",
					},
					["untrigger"] = {
					},
				}, -- [3]
				{
					["trigger"] = {
						["type"] = "combatlog",
						["spellId"] = "5134",
						["unevent"] = "timed",
						["duration"] = "2",
						["event"] = "Combat Log",
						["subeventPrefix"] = "SPELL",
						["spellName"] = "Flash Bomb",
						["use_spellId"] = true,
						["sourceFlags2"] = "Hostile",
						["use_sourceFlags2"] = true,
						["use_spellName"] = false,
						["use_sourceFlags"] = true,
						["subeventSuffix"] = "_CAST_START",
						["sourceFlags"] = "NotInGroup",
					},
					["untrigger"] = {
					},
				}, -- [4]
				{
					["trigger"] = {
						["spellId"] = "5134",
						["use_destRaidFlags"] = false,
						["subeventPrefix"] = "SPELL",
						["use_destName"] = false,
						["spellName"] = "flash bomb",
						["type"] = "combatlog",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Combat Log",
						["use_sourceFlags2"] = true,
						["use_sourceFlags"] = true,
						["use_spellId"] = true,
						["sourceFlags2"] = "Hostile",
						["unevent"] = "timed",
						["duration"] = "2",
						["use_destUnit"] = false,
						["use_spellName"] = false,
						["sourceFlags"] = "NotInGroup",
					},
					["untrigger"] = {
					},
				}, -- [5]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = false,
			["wordWrap"] = "WordWrap",
			["desaturate"] = false,
			["selfPoint"] = "BOTTOM",
			["font"] = "PT Sans Narrow",
			["version"] = 1,
			["subRegions"] = {
				{
					["glowFrequency"] = 0.25,
					["glow"] = true,
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [1]
			},
			["height"] = 100,
			["justify"] = "LEFT",
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["url"] = "https://wago.io/qE9ZINeOs/1",
			["fontSize"] = 72,
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["shadowXOffset"] = 1,
			["authorOptions"] = {
			},
			["animation"] = {
				["start"] = {
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["duration_type"] = "seconds",
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 0.96470588235294,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["use_scale"] = false,
					["rotate"] = 0,
					["use_translate"] = false,
					["use_alpha"] = false,
					["colorR"] = 1,
					["type"] = "none",
					["scaleType"] = "straightScale",
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["scaley"] = 1,
					["alpha"] = 0,
					["colorType"] = "pulseColor",
					["y"] = 0,
					["x"] = 0,
					["translateType"] = "straightTranslate",
					["use_color"] = true,
					["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      local newProgress = ((math.sin(angle) + 1)/2);\n      return r1 + (newProgress * (r2 - r1)),\n           g1 + (newProgress * (g2 - g1)),\n           b1 + (newProgress * (b2 - b1)),\n           a1 + (newProgress * (a2 - a1))\n    end\n  ",
					["easeStrength"] = 3,
					["scalex"] = 1,
					["colorB"] = 0.96078431372549,
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["cooldownEdge"] = false,
			["regionType"] = "icon",
			["config"] = {
			},
			["icon"] = true,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["zoom"] = 0.38,
			["auto"] = false,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.0",
			["tocversion"] = 11401,
			["id"] = "Flash bomb Warning",
			["color"] = {
				0.98823529411765, -- [1]
				0.92549019607843, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["width"] = 100,
			["yOffset"] = -12.5,
			["uid"] = "BvNvjsXGNst",
			["inverse"] = false,
			["displayIcon"] = 136142,
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["fixedWidth"] = 200,
			["cooldown"] = false,
			["preferToUpdate"] = false,
		},
		["Debuff"] = {
			["iconSource"] = -1,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["ownOnly"] = true,
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["useMatch_count"] = true,
						["spellIds"] = {
						},
						["unit"] = "nameplate",
						["match_count"] = "0",
						["names"] = {
						},
						["match_countOperator"] = ">",
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [1]
			},
			["height"] = 24,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["regionType"] = "icon",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["information"] = {
			},
			["xOffset"] = 0,
			["zoom"] = 0.25,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["anchorFrameType"] = "SCREEN",
			["id"] = "Debuff",
			["uid"] = "M5AcPz6Mf)s",
			["frameStrata"] = 1,
			["width"] = 32,
			["cooldownTextDisabled"] = false,
			["config"] = {
			},
			["inverse"] = false,
			["alpha"] = 1,
			["conditions"] = {
			},
			["cooldown"] = true,
			["parent"] = "Debuffs",
		},
		["One Bar Auto"] = {
			["sparkWidth"] = 10,
			["iconSource"] = -1,
			["wagoID"] = "bNtdbWZ-W",
			["xOffset"] = 0,
			["adjustedMax"] = 3,
			["customText"] = "function()   \n    return string.format(\"%.2f\",max(0.00,aura_env.delay))\nend\n\n\n",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["zoom"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "https://wago.io/bNtdbWZ-W/36",
			["icon"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["use_inverse"] = false,
						["use_spell"] = true,
						["names"] = {
						},
						["use_unit"] = true,
						["duration"] = "3",
						["debuffType"] = "HELPFUL",
						["use_hand"] = true,
						["buffShowOn"] = "showOnActive",
						["use_remaining"] = false,
						["use_cloneId"] = false,
						["custom_hide"] = "timed",
						["events"] = "",
						["type"] = "unit",
						["unevent"] = "auto",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["spell"] = "aimed shot",
						["event"] = "Swing Timer",
						["spellName"] = "Aimed Shot",
						["custom_type"] = "status",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_sourceUnit"] = true,
						["check"] = "event",
						["hand"] = "ranged",
						["sourceUnit"] = "player",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
						["hand"] = "ranged",
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "unit",
						["use_alwaystrue"] = true,
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
						["event"] = "Conditions",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [2]
				{
					["trigger"] = {
						["unit"] = "player",
						["type"] = "custom",
						["events"] = "PLAYER_ENTERING_WORLD PLAYER_REGEN_ENABLED PLAYER_REGEN_DISABLED PLAYER_TARGET_CHANGED PLAYER_ALIVE PLAYER_DEAD PLAYER_UNGHOST",
						["custom_type"] = "status",
						["check"] = "event",
						["custom_hide"] = "timed",
						["custom"] = "function()\n    if aura_env.config[\"oneBar\"] then\n        return true\n    end\nend\n\n\n",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [3]
				["disjunctive"] = "any",
				["customTriggerLogic"] = "function(trigger)\n    return trigger[1] and trigger[2] and trigger[5] and trigger[7]\nend",
				["activeTriggerMode"] = 1,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 45,
			["sparkOffsetX"] = 0,
			["selfPoint"] = "CENTER",
			["authorOptions"] = {
				{
					["type"] = "toggle",
					["key"] = "oneBar",
					["desc"] = "Enable One Bar",
					["default"] = false,
					["useDesc"] = true,
					["name"] = "One Bar - L2R",
					["width"] = 1,
				}, -- [1]
			},
			["adjustedMin"] = "0.5",
			["barColor"] = {
				0.19607843137255, -- [1]
				0.1843137254902, -- [2]
				0.1921568627451, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["customTextUpdate"] = "update",
			["backgroundColor"] = {
				0.78039215686275, -- [1]
				0.78039215686275, -- [2]
				0.78039215686275, -- [3]
				1, -- [4]
			},
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "Auto Shot",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_anchorXOffset"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "2002 Bold",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = false,
					["text_anchorPoint"] = "INNER_LEFT",
					["text_fontType"] = "OUTLINE",
					["text_fontSize"] = 11,
					["anchorXOffset"] = 0,
					["text_anchorYOffset"] = 0,
				}, -- [2]
				{
					["type"] = "subborder",
					["border_anchor"] = "bar",
					["border_offset"] = 0,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["border_size"] = 1,
				}, -- [3]
				{
					["tick_blend_mode"] = "ADD",
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["automatic_length"] = true,
					["tick_thickness"] = 2,
					["tick_color"] = {
						1, -- [1]
						0.027450980392157, -- [2]
						0.10980392156863, -- [3]
						1, -- [4]
					},
					["use_texture"] = false,
					["tick_placement_mode"] = "AtValue",
					["tick_visible"] = true,
					["tick_placement"] = "0.5",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_yOffset"] = 0,
					["tick_length"] = 30,
					["tick_mirror"] = false,
					["type"] = "subtick",
				}, -- [4]
				{
					["text_text_format_t_time_precision"] = 2,
					["text_text"] = "%p",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_format"] = "timed",
					["anchorXOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_t_time_format"] = 0,
					["anchorYOffset"] = 0,
					["text_justify"] = "RIGHT",
					["rotateText"] = "NONE",
					["text_text_format_t_format"] = "timed",
					["text_text_format_p_time_format"] = 0,
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_anchorXOffset"] = -2,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "2002 Bold",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_text_format_c2_format"] = "none",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_wordWrap"] = "WordWrap",
					["text_anchorYOffset"] = 0,
					["text_fontSize"] = 10,
					["text_text_format_t_time_dynamic_threshold"] = 60,
					["text_shadowColor"] = {
						0.11764705882353, -- [1]
						0.11764705882353, -- [2]
						0.11764705882353, -- [3]
						1, -- [4]
					},
				}, -- [5]
			},
			["height"] = 14,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["load"] = {
				["use_class"] = true,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "HUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["uid"] = "fMg480a)8Ro",
			["version"] = 36,
			["width"] = 252,
			["frameStrata"] = 3,
			["semver"] = "1.1.11",
			["smoothProgress"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["sparkHidden"] = "NEVER",
			["sparkHeight"] = 30,
			["icon_side"] = "LEFT",
			["spark"] = false,
			["anchorFrameParent"] = false,
			["texture"] = "Blizzard Raid Bar",
			["config"] = {
				["oneBar"] = false,
			},
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["auto"] = true,
			["tocversion"] = 20501,
			["id"] = "One Bar Auto",
			["anchorFrameFrame"] = "WeakAuras:Auto Border",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = true,
				},
				["finish"] = {
				},
			},
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["parent"] = "TBC Hunter Castbar",
			["orientation"] = "HORIZONTAL_INVERSE",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = -1,
						["variable"] = "incombat",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = false,
							["property"] = "sub.2.text_visible",
						}, -- [1]
						{
							["value"] = false,
							["property"] = "sub.5.text_visible",
						}, -- [2]
						{
							["value"] = false,
						}, -- [3]
						{
							["property"] = "sub.4.tick_visible",
						}, -- [4]
						{
							["value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								0, -- [4]
							},
							["property"] = "barColor",
						}, -- [5]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 3,
						["variable"] = "show",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = 0,
							["property"] = "alpha",
						}, -- [1]
					},
				}, -- [2]
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Hunter::Aimed Shot"] = {
			["iconSource"] = -1,
			["authorOptions"] = {
			},
			["yOffset"] = -150,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "spell",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showAlways",
						["subeventPrefix"] = "SPELL",
						["realSpellName"] = "Aimed Shot",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["unit"] = "player",
						["names"] = {
						},
						["event"] = "Cooldown Progress (Spell)",
						["use_track"] = true,
						["spellName"] = 20903,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [1]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [2]
			},
			["height"] = 24,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["regionType"] = "icon",
			["parent"] = "Hunter",
			["cooldownTextDisabled"] = false,
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["zoom"] = 0.3,
			["xOffset"] = -100,
			["alpha"] = 1,
			["id"] = "Hunter::Aimed Shot",
			["uid"] = "TUEmz5M5Q)L",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["width"] = 48,
			["config"] = {
			},
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "insufficientResources",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0.3450980392156863, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellUsable",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
					},
				}, -- [2]
			},
			["cooldown"] = true,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
		},
		["Hunter::Scatter Shot"] = {
			["iconSource"] = -1,
			["parent"] = "Hunter",
			["yOffset"] = -150,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_START",
						["ownOnly"] = true,
						["event"] = "Health",
						["unit"] = "target",
						["spellIds"] = {
						},
						["auranames"] = {
							"Scatter Shot", -- [1]
						},
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["useName"] = true,
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "spell",
						["subeventSuffix"] = "_CAST_START",
						["spellName"] = 19503,
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showAlways",
						["subeventPrefix"] = "SPELL",
						["realSpellName"] = "Scatter Shot",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["unit"] = "player",
						["event"] = "Cooldown Progress (Spell)",
						["names"] = {
						},
						["use_track"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "any",
				["customTriggerLogic"] = "function(trigger)\n  return trigger[1]\nend",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [1]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [2]
			},
			["height"] = 24,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["regionType"] = "icon",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["zoom"] = 0.3,
			["cooldown"] = true,
			["authorOptions"] = {
			},
			["cooldownTextDisabled"] = false,
			["xOffset"] = 50,
			["anchorFrameType"] = "SCREEN",
			["id"] = "Hunter::Scatter Shot",
			["config"] = {
			},
			["alpha"] = 1,
			["width"] = 48,
			["frameStrata"] = 1,
			["uid"] = "AezJopV79hx",
			["inverse"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "insufficientResources",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0.3450980392156863, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "spellUsable",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "expirationTime",
						["value"] = "2",
						["op"] = ">",
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.2.glow",
						}, -- [1]
					},
				}, -- [3]
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
		},
		["New"] = {
			["color"] = {
				0.3686274509803922, -- [1]
				0.5764705882352941, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = 150,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["auranames"] = {
							"Quick Shots", -- [1]
						},
						["subeventPrefix"] = "SPELL",
						["use_genericShowOn"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["names"] = {
						},
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["useName"] = true,
						["unit"] = "player",
						["genericShowOn"] = "showOnCooldown",
						["use_track"] = true,
						["spellName"] = 0,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
			},
			["height"] = 125,
			["rotate"] = true,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\PVPFrame\\Icons\\PVP-Banner-Emblem-3",
			["parent"] = "Hunter",
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "shrink",
				},
			},
			["anchorFrameType"] = "SCREEN",
			["id"] = "New",
			["authorOptions"] = {
			},
			["frameStrata"] = 1,
			["width"] = 125,
			["xOffset"] = 0,
			["uid"] = "nvUbJq2TVmI",
			["config"] = {
			},
			["discrete_rotation"] = 0,
			["conditions"] = {
			},
			["information"] = {
			},
			["alpha"] = 1,
		},
		["Fire Reflector"] = {
			["iconSource"] = 0,
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["url"] = "https://wago.io/xaZ5SVcnJ/6",
			["actions"] = {
				["start"] = {
					["sound_path"] = "CustomSounds\\stoopid.mp3",
					["do_message"] = false,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BananaPeelSlip.ogg",
					["do_sound"] = true,
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["duration"] = "5",
						["unit"] = "target",
						["destUnit"] = "target",
						["sourceFlags3"] = "Player",
						["use_destName"] = false,
						["use_cloneId"] = true,
						["spellName"] = "Fire Reflector",
						["type"] = "combatlog",
						["unevent"] = "timed",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Combat Log",
						["sourceFlags2"] = "Hostile",
						["use_sourceFlags2"] = true,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["debuffType"] = "HELPFUL",
						["subeventPrefix"] = "SPELL",
						["use_destUnit"] = false,
						["names"] = {
						},
						["use_sourceFlags3"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 6,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_1.sourceName_format"] = "none",
					["text_text"] = "%1.sourceName",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_TOP",
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [1]
			},
			["height"] = 64,
			["load"] = {
				["ingroup"] = {
				},
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["use_zone"] = false,
				["zoneIds"] = "",
				["use_level"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["level"] = "60",
				["level_operator"] = "==",
				["size"] = {
					["multi"] = {
					},
				},
			},
			["config"] = {
			},
			["cooldownEdge"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["icon"] = true,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 11401,
			["id"] = "Fire Reflector",
			["semver"] = "1.0.5",
			["frameStrata"] = 1,
			["width"] = 64,
			["zoom"] = 0,
			["uid"] = "asshAwDBnye",
			["inverse"] = false,
			["authorOptions"] = {
			},
			["displayIcon"] = "135824",
			["cooldown"] = true,
			["parent"] = "PVP warnings",
		},
		["Castbar"] = {
			["overlays"] = {
				{
					1, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				}, -- [1]
			},
			["sparkOffsetX"] = 0,
			["wagoID"] = "bNtdbWZ-W",
			["parent"] = "TBC Hunter Castbar",
			["preferToUpdate"] = false,
			["customText"] = "function(expirationTime, rawDuration, progress, formatedDuration, name, icon, stacks)\n    local function round(number, decimals)\n        return ((\"%%.%df\"):format(decimals)):format(number)\n    end\n    \n    return progress\n    \nend\n\n\n\n",
			["yOffset"] = -20,
			["anchorPoint"] = "CENTER",
			["sparkWidth"] = 10,
			["sparkRotation"] = 0,
			["customTextUpdate"] = "event",
			["url"] = "https://wago.io/bNtdbWZ-W/36",
			["icon"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["duration"] = "3",
						["use_spell"] = true,
						["names"] = {
						},
						["use_unit"] = true,
						["customOverlay1"] = "",
						["events"] = "CLEU",
						["customIcon"] = "function()\n    return aura_env.icon\nend",
						["type"] = "custom",
						["custom_type"] = "status",
						["use_cloneId"] = false,
						["custom_hide"] = "timed",
						["spellIds"] = {
						},
						["spell"] = "aimed shot",
						["customName"] = "function()\n    return aura_env.name\nend\n\n\n",
						["subeventSuffix"] = "_CAST_START",
						["spellName"] = "Aimed Shot",
						["unit"] = "player",
						["event"] = "Cast",
						["unevent"] = "auto",
						["customDuration"] = "function()\n    local haste = (1+GetRangedHaste()/100) * 1.15 --assumes 15% quiver\n    local castTime = aura_env.castTime / 1000\n    \n    local duration = castTime / haste\n    aura_env.duration = duration\n    aura_env.expirationTime = duration + GetTime()\n    \n    return aura_env.duration, aura_env.expirationTime\nend\n\n\n\n",
						["use_spellName"] = true,
						["custom"] = "function(event, _, subEvent, _, _, sourceName, _, _, _, targetName, _, _, _, spellName, _, failType)\n    if subEvent == \"SPELL_CAST_START\" and sourceName == UnitName(\"player\") and not aura_env.casting then\n        aura_env.duration = 0\n        aura_env.expirationTime = 0\n        \n        if (aura_env.shots[\"multi\"] == spellName) then\n            aura_env.name, _, aura_env.icon, aura_env.castTime, _, _, aura_env.id = GetSpellInfo(spellName)\n            aura_env.casting = true\n            return true\n        end\n    end\n    \nend\n\n\n",
						["use_sourceUnit"] = true,
						["check"] = "event",
						["debuffType"] = "HELPFUL",
						["sourceUnit"] = "player",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
						["custom"] = "function(event, _, subEvent, _, _, sourceName, _, _, _, _, _, _, _, spellName, _, failType)\n    if subEvent == \"SPELL_CAST_FAILED\" and sourceName == UnitName(\"player\") and failType ~= getglobal(\"SPELL_FAILED_SPELL_IN_PROGRESS\") and aura_env.name == spellName then\n        aura_env.name = nil\n        aura_env.casting = nil\n        return true\n    end \n    if subEvent == \"SPELL_CAST_SUCCESS\" and sourceName == UnitName(\"player\") and aura_env.name == spellName then\n        aura_env.name = nil\n        aura_env.casting = nil\n        return true\n    end\n    if aura_env.expirationTime - GetTime() <= 0 then -- Fixes bar being stuck because SPELL_CAST_FAILED is not always fired\n        aura_env.name = nil\n        aura_env.casting = nil\n        return true\n    end\nend",
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "custom",
						["custom_type"] = "status",
						["unit"] = "player",
						["customDuration"] = "function()\n    if not aura_env.pushback then\n        local haste = (1+GetRangedHaste()/100) * 1.15 --assumes 15% quiver\n        local castTime = aura_env.castTime / 1000\n        \n        local duration = castTime / haste\n        aura_env.duration = duration\n        aura_env.expirationTime = GetTime() + duration\n    end\n    return aura_env.duration, aura_env.expirationTime\nend",
						["customName"] = "function()\n    return aura_env.name\nend",
						["events"] = "CLEU",
						["customIcon"] = "function()\n    return aura_env.icon\nend",
						["check"] = "event",
						["customOverlay1"] = "\n\n",
						["custom"] = "function(event, _, subEvent, _, _, sourceName, _, _, _, targetName, _, _, _, spellName, _, failType)\n    if subEvent == \"SPELL_CAST_START\" and sourceName == UnitName(\"player\") and not aura_env.casting then\n        aura_env.duration = 0\n        aura_env.expirationTime = 0\n        if ( aura_env.shots[\"auto\"] == spellName) then\n            aura_env.name, _, aura_env.icon, aura_env.castTime, _, _, aura_env.id = GetSpellInfo(spellName)\n            aura_env.casting = true\n            return true\n        end\n    end\n    \nend\n\n\n",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["custom"] = "function(event, _, subEvent, _, _, sourceName, _, _, _, _, _, _, _, spellName, _, failType)\n    if subEvent == \"SPELL_CAST_FAILED\" and sourceName == UnitName(\"player\") and failType ~= getglobal(\"SPELL_FAILED_SPELL_IN_PROGRESS\") and aura_env.name == spellName then\n        aura_env.name = nil\n        aura_env.casting = nil\n        return true\n    end \n    if subEvent == \"SPELL_CAST_SUCCESS\" and sourceName == UnitName(\"player\") and aura_env.name == spellName then\n        aura_env.name = nil\n        aura_env.casting = nil\n        return true\n    end\n    if aura_env.expirationTime - GetTime() <= 0 then -- Fixes bar being stuck because SPELL_CAST_FAILED is not always fired\n        aura_env.name = nil\n        aura_env.casting = nil\n        return true\n    end\nend",
					},
				}, -- [2]
				{
					["trigger"] = {
						["use_unit"] = true,
						["type"] = "unit",
						["use_spellId"] = true,
						["use_inverse"] = false,
						["debuffType"] = "HELPFUL",
						["use_exact_spellId"] = false,
						["event"] = "Cast",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [3]
				{
					["trigger"] = {
						["type"] = "custom",
						["use_alwaystrue"] = true,
						["custom_type"] = "status",
						["event"] = "Conditions",
						["use_unit"] = true,
						["events"] = "PLAYER_ENTERING_WORLD PLAYER_REGEN_ENABLED PLAYER_REGEN_DISABLED PLAYER_TARGET_CHANGED PLAYER_ALIVE PLAYER_DEAD PLAYER_UNGHOST",
						["custom_hide"] = "timed",
						["check"] = "event",
						["unit"] = "player",
						["custom"] = "function()\n    if aura_env.config[\"alwaysShown\"] then\n        return true\n    end\nend\n\n\n",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [4]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 45,
			["useAdjustededMin"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "custom",
					["easeType"] = "none",
					["scaley"] = 1,
					["alpha"] = 0,
					["colorB"] = 1,
					["y"] = 0,
					["colorType"] = "custom",
					["scalex"] = 1,
					["easeStrength"] = 3,
					["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      local newProgress = ((math.sin(angle) + 1)/2);\n      return r1 + (newProgress * (r2 - r1)),\n           g1 + (newProgress * (g2 - g1)),\n           b1 + (newProgress * (b2 - b1)),\n           a1 + (newProgress * (a2 - a1))\n    end\n  ",
					["rotate"] = 0,
					["x"] = 0,
					["use_color"] = false,
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["iconSource"] = -1,
			["authorOptions"] = {
				{
					["type"] = "toggle",
					["key"] = "alwaysShown",
					["desc"] = "Enable/Disable having the placeholder for the castbar when no abilites are being cast",
					["default"] = false,
					["useDesc"] = true,
					["name"] = "Castbar Placeholder",
					["width"] = 1,
				}, -- [1]
			},
			["barColor"] = {
				0.16862745098039, -- [1]
				0.17254901960784, -- [2]
				0.17254901960784, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["adjustedMax"] = 3,
			["anchorFrameParent"] = false,
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%n",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_precision"] = 1,
					["anchorXOffset"] = 0,
					["type"] = "subtext",
					["text_anchorXOffset"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "2002 Bold",
					["text_shadowYOffset"] = 0,
					["text_anchorYOffset"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_LEFT",
					["text_visible"] = false,
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 12,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_n_format"] = "none",
				}, -- [2]
				{
					["text_text_format_t_time_precision"] = 2,
					["text_text"] = "%c1",
					["text_shadowColor"] = {
						0.12549019607843, -- [1]
						0.12549019607843, -- [2]
						0.12549019607843, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_t_time_format"] = 0,
					["anchorYOffset"] = 0,
					["text_justify"] = "RIGHT",
					["rotateText"] = "NONE",
					["text_text_format_t_format"] = "timed",
					["text_visible"] = false,
					["type"] = "subtext",
					["text_anchorXOffset"] = -2,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "2002 Bold",
					["anchorXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text_format_c1_format"] = "none",
					["text_text_format_c2_format"] = "none",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_shadowXOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontSize"] = 10,
					["text_text_format_t_time_dynamic_threshold"] = 60,
					["text_anchorYOffset"] = 0,
				}, -- [3]
				{
					["type"] = "subborder",
					["border_anchor"] = "bar",
					["border_offset"] = 0,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["border_size"] = 1,
				}, -- [4]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text"] = "%p",
					["text_text_format_p_format"] = "timed",
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "RIGHT",
					["rotateText"] = "NONE",
					["text_text_format_n_format"] = "none",
					["type"] = "subtext",
					["text_anchorXOffset"] = -2,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "2002 Bold",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_shadowYOffset"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_fontType"] = "OUTLINE",
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 10,
					["anchorXOffset"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [5]
			},
			["height"] = 18,
			["sparkRotationMode"] = "AUTO",
			["load"] = {
				["use_class"] = true,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "HUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["backgroundColor"] = {
				0.13725490196078, -- [1]
				0.13725490196078, -- [2]
				0.13725490196078, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["xOffset"] = 0,
			["zoom"] = 0,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "aura_env.shots = {\n    aimed = GetSpellInfo(19434),\n    multi = GetSpellInfo(27021),\n    volley = GetSpellInfo(27022),\n    auto = GetSpellInfo(75),\n    steady = GetSpellInfo(34120),\n}\naura_env.expirationTime = 0\naura_env.pushbackTotal = 0",
					["do_custom"] = true,
				},
				["finish"] = {
				},
			},
			["smoothProgress"] = false,
			["anchorFrameFrame"] = "WeakAuras:Auto Border",
			["regionType"] = "aurabar",
			["version"] = 36,
			["uid"] = "Pk82XcBzKuK",
			["icon_side"] = "LEFT",
			["auto"] = true,
			["width"] = 252,
			["sparkHeight"] = 30,
			["texture"] = "Blizzard Raid Bar",
			["frameStrata"] = 2,
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["semver"] = "1.1.11",
			["tocversion"] = 20501,
			["id"] = "Castbar",
			["config"] = {
				["alwaysShown"] = false,
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["sparkHidden"] = "NEVER",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["spark"] = false,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 2,
						["op"] = "find('%s')",
						["variable"] = "show",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0.44705882352941, -- [1]
								0.45490196078431, -- [2]
								0.44705882352941, -- [3]
								1, -- [4]
							},
							["property"] = "barColor",
						}, -- [1]
						{
							["value"] = true,
							["property"] = "sub.2.text_visible",
						}, -- [2]
						{
							["value"] = true,
							["property"] = "inverse",
						}, -- [3]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "OR",
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "show",
								["value"] = 1,
							}, -- [1]
							{
								["trigger"] = 3,
								["variable"] = "show",
								["value"] = 1,
							}, -- [2]
						},
					},
					["changes"] = {
						{
							["value"] = {
								0.44313725490196, -- [1]
								0.68235294117647, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "barColor",
						}, -- [1]
						{
							["value"] = true,
							["property"] = "sub.2.text_visible",
						}, -- [2]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "show",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "inverse",
						}, -- [1]
					},
				}, -- [3]
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["overlayclip"] = true,
		},
		["PVP warnings"] = {
			["arcLength"] = 360,
			["controlledChildren"] = {
				"Death Coil", -- [1]
				"Helmet", -- [2]
				"Frost Reflector", -- [3]
				"Fire Reflector", -- [4]
				"Shadow Reflector", -- [5]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = -130.3936767578125,
			["preferToUpdate"] = false,
			["yOffset"] = 349.494384765625,
			["gridType"] = "RD",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["space"] = 2,
			["url"] = "https://wago.io/xaZ5SVcnJ/6",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 1,
			["internalVersion"] = 45,
			["useLimit"] = false,
			["align"] = "CENTER",
			["stagger"] = 0,
			["version"] = 6,
			["subRegions"] = {
			},
			["radius"] = 200,
			["uid"] = "ql14LEbuo)G",
			["load"] = {
				["use_class"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["authorOptions"] = {
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["fullCircle"] = true,
			["animate"] = false,
			["rotation"] = 0,
			["scale"] = 1,
			["selfPoint"] = "LEFT",
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "dynamicgroup",
			["borderSize"] = 2,
			["sort"] = "none",
			["grow"] = "RIGHT",
			["rowSpace"] = 1,
			["constantFactor"] = "RADIUS",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["borderOffset"] = 4,
			["semver"] = "1.0.5",
			["tocversion"] = 11401,
			["id"] = "PVP warnings",
			["frameStrata"] = 1,
			["gridWidth"] = 5,
			["anchorFrameType"] = "SCREEN",
			["groupIcon"] = 132337,
			["borderInset"] = 1,
			["anchorPoint"] = "CENTER",
			["limit"] = 5,
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["config"] = {
			},
		},
		["Auto Left"] = {
			["sparkWidth"] = 10,
			["iconSource"] = -1,
			["wagoID"] = "bNtdbWZ-W",
			["xOffset"] = -63,
			["adjustedMax"] = 3,
			["customText"] = "function()   \n    return string.format(\"%.2f\",max(0.00,aura_env.delay))\nend\n\n\n",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["zoom"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "https://wago.io/bNtdbWZ-W/36",
			["icon"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["use_inverse"] = false,
						["use_spell"] = true,
						["names"] = {
						},
						["use_unit"] = true,
						["duration"] = "3",
						["debuffType"] = "HELPFUL",
						["use_hand"] = true,
						["buffShowOn"] = "showOnActive",
						["use_remaining"] = false,
						["use_cloneId"] = false,
						["custom_hide"] = "timed",
						["events"] = "",
						["type"] = "unit",
						["unevent"] = "auto",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["spell"] = "aimed shot",
						["event"] = "Swing Timer",
						["spellName"] = "Aimed Shot",
						["custom_type"] = "status",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_sourceUnit"] = true,
						["check"] = "event",
						["hand"] = "ranged",
						["sourceUnit"] = "player",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
						["hand"] = "ranged",
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "unit",
						["use_alwaystrue"] = true,
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
						["event"] = "Conditions",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "any",
				["customTriggerLogic"] = "function(trigger)\n    return trigger[1] and trigger[2] and trigger[5] and trigger[7]\nend",
				["activeTriggerMode"] = 1,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 45,
			["sparkOffsetX"] = 0,
			["selfPoint"] = "CENTER",
			["authorOptions"] = {
			},
			["adjustedMin"] = "0.5",
			["barColor"] = {
				0.19607843137255, -- [1]
				0.1843137254902, -- [2]
				0.1921568627451, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["customTextUpdate"] = "update",
			["backgroundColor"] = {
				0.78039215686275, -- [1]
				0.78039215686275, -- [2]
				0.78039215686275, -- [3]
				1, -- [4]
			},
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "Auto Shot",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_anchorXOffset"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "2002 Bold",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = false,
					["text_anchorPoint"] = "INNER_LEFT",
					["text_fontType"] = "OUTLINE",
					["text_fontSize"] = 11,
					["anchorXOffset"] = 0,
					["text_anchorYOffset"] = 0,
				}, -- [2]
				{
					["type"] = "subborder",
					["border_anchor"] = "bar",
					["border_offset"] = 0,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Square Full White",
					["border_size"] = 1,
				}, -- [3]
				{
					["tick_blend_mode"] = "ADD",
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["automatic_length"] = true,
					["tick_thickness"] = 2,
					["tick_color"] = {
						1, -- [1]
						0.027450980392157, -- [2]
						0.10980392156863, -- [3]
						1, -- [4]
					},
					["use_texture"] = false,
					["tick_placement_mode"] = "AtValue",
					["tick_visible"] = true,
					["tick_placement"] = "0.5",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_yOffset"] = 0,
					["tick_length"] = 30,
					["tick_mirror"] = false,
					["type"] = "subtick",
				}, -- [4]
			},
			["height"] = 14,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["load"] = {
				["use_class"] = true,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "HUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["uid"] = "C)rLwrxhvTH",
			["version"] = 36,
			["width"] = 126,
			["frameStrata"] = 2,
			["semver"] = "1.1.11",
			["smoothProgress"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["sparkHidden"] = "NEVER",
			["sparkHeight"] = 30,
			["icon_side"] = "LEFT",
			["spark"] = false,
			["anchorFrameParent"] = true,
			["texture"] = "Blizzard Raid Bar",
			["config"] = {
			},
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["auto"] = true,
			["tocversion"] = 20501,
			["id"] = "Auto Left",
			["anchorFrameFrame"] = "WeakAuras:Auto Border",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = true,
				},
				["finish"] = {
				},
			},
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["parent"] = "TBC Hunter Castbar",
			["orientation"] = "HORIZONTAL_INVERSE",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = -1,
						["variable"] = "incombat",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = false,
							["property"] = "sub.2.text_visible",
						}, -- [1]
						{
							["value"] = false,
						}, -- [2]
						{
							["value"] = false,
						}, -- [3]
						{
							["value"] = false,
							["property"] = "sub.4.tick_visible",
						}, -- [4]
						{
							["value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								0, -- [4]
							},
							["property"] = "barColor",
						}, -- [5]
					},
				}, -- [1]
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Hunter::Hunter's Mark"] = {
			["iconSource"] = -1,
			["authorOptions"] = {
			},
			["yOffset"] = -175,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_START",
						["matchesShowOn"] = "showAlways",
						["event"] = "Health",
						["unit"] = "target",
						["unitExists"] = true,
						["spellIds"] = {
						},
						["useName"] = true,
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["auranames"] = {
							"Hunter's Mark", -- [1]
						},
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "spell",
						["use_genericShowOn"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["unit"] = "player",
						["realSpellName"] = "Hunter's Mark",
						["use_spellName"] = true,
						["spellName"] = 14324,
						["genericShowOn"] = "showOnCooldown",
						["use_track"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "any",
				["customTriggerLogic"] = "function(trigger)\n  return trigger[1]\nend",
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [1]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [2]
			},
			["height"] = 24,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["regionType"] = "icon",
			["information"] = {
			},
			["icon"] = true,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = false,
							["property"] = "sub.2.glow",
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "spellUsable",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = false,
							["property"] = "sub.2.glow",
						}, -- [1]
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [2]
					},
				}, -- [2]
			},
			["cooldownTextDisabled"] = false,
			["zoom"] = 0.3,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["uid"] = "8UbRP8GoCfR",
			["id"] = "Hunter::Hunter's Mark",
			["alpha"] = 1,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["width"] = 48,
			["config"] = {
			},
			["inverse"] = false,
			["parent"] = "Hunter",
			["displayIcon"] = 136076,
			["cooldown"] = true,
			["xOffset"] = -50,
		},
		["Hunter::Multi-Shot"] = {
			["iconSource"] = -1,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = -150,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "spell",
						["subeventSuffix"] = "_CAST_START",
						["spellName"] = 14288,
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showAlways",
						["subeventPrefix"] = "SPELL",
						["realSpellName"] = "Multi-Shot",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["unit"] = "player",
						["event"] = "Cooldown Progress (Spell)",
						["names"] = {
						},
						["use_track"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [1]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [2]
			},
			["height"] = 24,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["regionType"] = "icon",
			["parent"] = "Hunter",
			["xOffset"] = -50,
			["cooldown"] = true,
			["authorOptions"] = {
			},
			["zoom"] = 0.3,
			["frameStrata"] = 1,
			["width"] = 48,
			["id"] = "Hunter::Multi-Shot",
			["config"] = {
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["cooldownTextDisabled"] = false,
			["uid"] = "Oar7Ze77Ht3",
			["inverse"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "insufficientResources",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0.3450980392156863, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellUsable",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
					},
				}, -- [2]
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
		},
		["Avoid lava damage"] = {
			["sparkWidth"] = 10,
			["glow"] = false,
			["iconSource"] = 0,
			["xOffset"] = -7.8643798828125,
			["preferToUpdate"] = false,
			["yOffset"] = -302.0346984863281,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["url"] = "https://wago.io/AvoidLavaDamage/2",
			["actions"] = {
				["start"] = {
					["custom"] = "if aura_env.state and aura_env.state.duration then\n    aura_env.region.tickPool:ReleaseAll()\n    \n    local WidthPerSegment = aura_env.region.bar:GetWidth() / aura_env.state.duration\n    local offset = WidthPerSegment*aura_env.moveMe\n    \n    local tick = aura_env.Acquire()\n    tick:SetColorTexture(0, 1, 0, 1)\n    tick:ClearAllPoints()\n    tick:SetPoint(\"LEFT\", aura_env.region.bar, \"LEFT\", offset, 0)\n    tick:Show()\nend\n\n\n",
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "aura_env.moveMe = 0.7 --change from 0.1 to max bar progress (2)\n\n\nlocal aura_env = aura_env\nif not WA_JUMP then\n    hooksecurefunc(\"JumpOrAscendStart\",\n        function()\n            if not IsFalling() then\n                WeakAuras.ScanEvents(\"PLAYER_JUMPED\", true)\n            end\n        end\n    )\nend\nWA_JUMP = true\n\nlocal r = aura_env.region\n\nif not r.tickPool then\n    r.tickPool = CreateTexturePool(r.bar, \"OVERLAY\", 7, nil) \nend\n\nr.tickPool:ReleaseAll();\n\naura_env.Acquire = function()\n    local tick = r.tickPool:Acquire()\n    tick:SetDrawLayer(\"ARTWORK\", 3);\n    tick:SetColorTexture(0, 1, 0, 1)\n    tick:SetWidth(3);\n    tick:SetHeight(r.height);\n    return tick\nend\n\naura_env.region.tickPool:ReleaseAll()\n\nlocal WidthPerSegment = aura_env.region.bar:GetWidth() / 2\nlocal offset = WidthPerSegment*aura_env.moveMe\n\nlocal tick = aura_env.Acquire()\ntick:SetColorTexture(0, 1, 0, 1)\ntick:ClearAllPoints()\ntick:SetPoint(\"LEFT\", aura_env.region.bar, \"LEFT\", offset, 0)\ntick:Show()",
					["do_custom"] = true,
				},
				["finish"] = {
					["custom"] = "aura_env.region.tickPool:ReleaseAll()",
					["do_custom"] = true,
				},
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0.203921568627451, -- [1]
				0.4862745098039216, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkOffsetY"] = 0,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 1,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["texture"] = "Clean",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["auto"] = false,
			["tocversion"] = 11401,
			["alpha"] = 1,
			["glowYOffset"] = 0,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayIcon"] = 135830,
			["sparkOffsetX"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["cooldownSwipe"] = true,
			["sparkRotationMode"] = "AUTO",
			["cooldownEdge"] = false,
			["useglowColor"] = false,
			["internalVersion"] = 45,
			["glowXOffset"] = 0,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "000 PFSquareSansPro-Medium",
					["text_text_format_p_time_format"] = 0,
					["text_shadowYOffset"] = 0,
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_text_format_p_format"] = "timed",
					["text_visible"] = true,
					["text_fontSize"] = 21,
					["anchorXOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
				}, -- [2]
			},
			["height"] = 30,
			["glowLines"] = 8,
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["config"] = {
			},
			["useAdjustedMax"] = false,
			["cooldown"] = true,
			["zoom"] = 0,
			["glowScale"] = 1,
			["glowFrequency"] = 0.25,
			["useAdjustedMin"] = false,
			["icon_side"] = "LEFT",
			["cooldownTextDisabled"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["custom_hide"] = "timed",
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_type"] = "stateupdate",
						["unit"] = "player",
						["duration"] = "2",
						["event"] = "Health",
						["names"] = {
						},
						["customDuration"] = "function()\n    return aura_env.duration, aura_env.duration + GetTime()\nend",
						["custom"] = "function(states, event, ...)\n    if event == \"OPTIONS\" then\n        states[\"\"] = {\n            name = \"lava\",\n            duration = 2,\n            expirationTime = GetTime() + 2,\n            progressType = \"timed\",\n            autoHide = true,\n            changed = true,\n            show = true,\n        }\n        return true\n    end\n    if event == \"COMBAT_LOG_EVENT_UNFILTERED\" and ... then\n        local _, message, _, _, _, _, _, destGUID, _, _, _, envType = ...\n        if message == \"ENVIRONMENTAL_DAMAGE\" and destGUID == WeakAuras.myGUID and envType == \"Lava\" then\n            states[\"\"] = {\n                name = \"lava\",\n                duration = 2,\n                expirationTime = GetTime() + 2,\n                progressType = \"timed\",\n                autoHide = true,\n                changed = true,\n                show = true,\n            }\n        end\n    end\n    if event == \"PLAYER_JUMPED\" and ... and states[\"\"] and not WeakAuras.IsOptionsOpen() then\n        local duration = states[\"\"].expirationTime - GetTime()\n        C_Timer.After(duration,\n            function()\n                WeakAuras.ScanEvents(\"WA_NEW_LAVA_TIMER\", true)\n            end\n        )\n    end\n    if event == \"WA_NEW_LAVA_TIMER\" and ... then\n        states[\"\"] = {\n            name = \"lava\",\n            duration = 2,\n            expirationTime = GetTime() + 2,\n            progressType = \"timed\",\n            autoHide = true,\n            changed = true,\n            show = true,\n        }\n    end\n    return true\nend",
						["spellIds"] = {
						},
						["dynamicDuration"] = true,
						["check"] = "event",
						["events"] = "CLEU:ENVIRONMENTAL_DAMAGE PLAYER_JUMPED WA_NEW_LAVA_TIMER",
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["custom"] = "function()\n    return true\nend",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["sparkHeight"] = 30,
			["width"] = 300,
			["glowLength"] = 10,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["semver"] = "1.0.1",
			["id"] = "Avoid lava damage",
			["sparkHidden"] = "NEVER",
			["spark"] = false,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["icon"] = true,
			["authorOptions"] = {
			},
			["inverse"] = false,
			["uid"] = "NdY1yhRdahS",
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["glowBorder"] = false,
		},
		["Rocket Helm Warning"] = {
			["outline"] = "OUTLINE",
			["iconSource"] = 0,
			["xOffset"] = -407.504638671875,
			["displayText"] = "%sourceName is casting %spellName",
			["yOffset"] = -91.84320068359375,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",
					["do_sound"] = true,
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["sourceFlags"] = "NotInGroup",
						["type"] = "combatlog",
						["spellId"] = "22641",
						["unevent"] = "timed",
						["unit"] = "player",
						["duration"] = "2",
						["event"] = "Combat Log",
						["sourceFlags2"] = "Hostile",
						["names"] = {
						},
						["use_spellId"] = true,
						["spellIds"] = {
						},
						["use_sourceFlags2"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_sourceFlags"] = true,
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "combatlog",
						["spellId"] = "22641",
						["subeventSuffix"] = "_CAST_START",
						["duration"] = "2",
						["event"] = "Combat Log",
						["use_sourceFlags2"] = true,
						["use_spellId"] = true,
						["unevent"] = "timed",
						["sourceFlags2"] = "Hostile",
						["use_sourceFlags"] = true,
						["subeventPrefix"] = "SPELL",
						["sourceFlags"] = "NotInGroup",
					},
					["untrigger"] = {
					},
				}, -- [2]
				{
					["trigger"] = {
						["type"] = "combatlog",
						["spellId"] = "22641",
						["subeventSuffix"] = "_CAST_START",
						["duration"] = "2",
						["event"] = "Combat Log",
						["use_sourceFlags2"] = true,
						["use_spellId"] = true,
						["unevent"] = "timed",
						["sourceFlags2"] = "Hostile",
						["use_sourceFlags"] = true,
						["subeventPrefix"] = "SPELL",
						["sourceFlags"] = "NotInGroup",
					},
					["untrigger"] = {
					},
				}, -- [3]
				{
					["trigger"] = {
						["type"] = "combatlog",
						["spellId"] = "22641",
						["subeventSuffix"] = "_CAST_START",
						["duration"] = "2",
						["event"] = "Combat Log",
						["use_sourceFlags2"] = true,
						["use_spellId"] = true,
						["unevent"] = "timed",
						["sourceFlags2"] = "Hostile",
						["use_sourceFlags"] = true,
						["subeventPrefix"] = "SPELL",
						["sourceFlags"] = "NotInGroup",
					},
					["untrigger"] = {
					},
				}, -- [4]
				{
					["trigger"] = {
						["type"] = "combatlog",
						["spellId"] = "22641",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["duration"] = "2",
						["event"] = "Combat Log",
						["subeventPrefix"] = "SPELL",
						["sourceFlags2"] = "Hostile",
						["use_spellId"] = true,
						["use_destName"] = false,
						["use_sourceFlags"] = true,
						["use_sourceFlags2"] = true,
						["use_destUnit"] = false,
						["unevent"] = "timed",
						["sourceFlags"] = "NotInGroup",
					},
					["untrigger"] = {
					},
				}, -- [5]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["translateType"] = "straightTranslate",
					["scalex"] = 1,
					["colorB"] = 0.96078431372549,
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 0.96470588235294,
					["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["rotate"] = 0,
					["use_translate"] = false,
					["use_alpha"] = false,
					["colorR"] = 1,
					["type"] = "none",
					["scaley"] = 1,
					["easeType"] = "none",
					["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
					["use_color"] = true,
					["alpha"] = 0,
					["use_scale"] = false,
					["y"] = 0,
					["colorType"] = "pulseColor",
					["x"] = 0,
					["scaleType"] = "straightScale",
					["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      local newProgress = ((math.sin(angle) + 1)/2);\n      return r1 + (newProgress * (r2 - r1)),\n           g1 + (newProgress * (g2 - g1)),\n           b1 + (newProgress * (b2 - b1)),\n           a1 + (newProgress * (a2 - a1))\n    end\n  ",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["duration"] = "1",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["justify"] = "LEFT",
			["font"] = "PT Sans Narrow",
			["version"] = 1,
			["subRegions"] = {
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowScale"] = 1,
					["glowThickness"] = 1,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glow"] = true,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [1]
			},
			["height"] = 100,
			["selfPoint"] = "BOTTOM",
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["cooldownEdge"] = false,
			["fontSize"] = 72,
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["displayIcon"] = 136010,
			["shadowXOffset"] = 1,
			["color"] = {
				0.98823529411765, -- [1]
				0.92549019607843, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["shadowYOffset"] = -1,
			["url"] = "https://wago.io/jArXXMcon/1",
			["regionType"] = "icon",
			["uid"] = "g2LOXo(Fu0w",
			["authorOptions"] = {
			},
			["width"] = 100,
			["alpha"] = 1,
			["zoom"] = 0,
			["auto"] = false,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.0",
			["tocversion"] = 11401,
			["id"] = "Rocket Helm Warning",
			["icon"] = true,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["conditions"] = {
			},
			["config"] = {
			},
			["inverse"] = false,
			["wordWrap"] = "WordWrap",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["fixedWidth"] = 200,
			["cooldown"] = false,
			["preferToUpdate"] = false,
		},
		["Hunter::Ammo"] = {
			["sparkWidth"] = 10,
			["sparkOffsetX"] = 0,
			["xOffset"] = 0,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["customDuration"] = "function()\n    local ammo_slot_id = GetInventorySlotInfo(\"AmmoSlot\")\n    local ammo_id = GetInventoryItemID(\"player\", ammo_slot_id)\n    local ammo = GetItemCount(ammo_id)\n    local max = 200 * 16\n    local progress = max - ammo\n    return progress, max, 1\nend",
						["spellIds"] = {
						},
						["events"] = "BAG_UPDATE",
						["custom_type"] = "status",
						["check"] = "event",
						["names"] = {
						},
						["custom"] = "function()\nreturn true\nend",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["custom"] = "function()\nreturn true\nend",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 45,
			["selfPoint"] = "CENTER",
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
			},
			["height"] = 32,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["parent"] = "Hunter",
			["iconSource"] = -1,
			["icon"] = false,
			["anchorFrameFrame"] = "CharacterBag3Slot",
			["regionType"] = "aurabar",
			["useAdjustededMin"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["icon_side"] = "RIGHT",
			["authorOptions"] = {
			},
			["sparkHeight"] = 30,
			["texture"] = "Details Flat",
			["zoom"] = 0,
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["spark"] = false,
			["anchorFrameType"] = "SELECTFRAME",
			["sparkHidden"] = "NEVER",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["width"] = 32,
			["id"] = "Hunter::Ammo",
			["config"] = {
			},
			["inverse"] = false,
			["uid"] = "toB6)pwCk7H",
			["orientation"] = "VERTICAL_INVERSE",
			["conditions"] = {
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
		},
		["Debuffs"] = {
			["grow"] = "DOWN",
			["controlledChildren"] = {
				"Debuff", -- [1]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = -330.6666259765625,
			["yOffset"] = -193.2548065185547,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["space"] = 2,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 1,
			["radius"] = 200,
			["selfPoint"] = "TOP",
			["align"] = "CENTER",
			["stagger"] = 0,
			["subRegions"] = {
			},
			["uid"] = "A6jTItX2m3t",
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["arcLength"] = 360,
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["borderEdge"] = "Square Full White",
			["animate"] = false,
			["rotation"] = 0,
			["scale"] = 1,
			["customAnchor"] = "\n\n",
			["border"] = true,
			["anchorFrameFrame"] = "AceGUI30Button6",
			["regionType"] = "dynamicgroup",
			["borderSize"] = 2,
			["sort"] = "none",
			["fullCircle"] = true,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["constantFactor"] = "RADIUS",
			["config"] = {
			},
			["borderOffset"] = 4,
			["rowSpace"] = 1,
			["limit"] = 5,
			["id"] = "Debuffs",
			["frameStrata"] = 1,
			["gridWidth"] = 5,
			["anchorFrameType"] = "CUSTOM",
			["gridType"] = "RD",
			["borderInset"] = 1,
			["internalVersion"] = 45,
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["useLimit"] = false,
		},
		["Shadow Reflector"] = {
			["iconSource"] = 0,
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["url"] = "https://wago.io/xaZ5SVcnJ/6",
			["actions"] = {
				["start"] = {
					["sound_path"] = "CustomSounds\\stoopid.mp3",
					["do_message"] = false,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BananaPeelSlip.ogg",
					["do_sound"] = true,
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["duration"] = "5",
						["names"] = {
						},
						["destUnit"] = "target",
						["sourceFlags3"] = "Player",
						["use_destName"] = false,
						["use_cloneId"] = true,
						["spellName"] = "Shadow Reflector",
						["type"] = "combatlog",
						["unevent"] = "timed",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Combat Log",
						["use_sourceFlags2"] = true,
						["sourceFlags2"] = "Hostile",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["debuffType"] = "HELPFUL",
						["unit"] = "target",
						["use_destUnit"] = false,
						["subeventPrefix"] = "SPELL",
						["use_sourceFlags3"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["version"] = 6,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_1.sourceName_format"] = "none",
					["text_text"] = "%1.sourceName",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_TOP",
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [1]
			},
			["height"] = 64,
			["load"] = {
				["ingroup"] = {
				},
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["use_zone"] = false,
				["zoneIds"] = "",
				["use_level"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["level"] = "60",
				["level_operator"] = "==",
				["size"] = {
					["multi"] = {
					},
				},
			},
			["config"] = {
			},
			["icon"] = true,
			["selfPoint"] = "CENTER",
			["regionType"] = "icon",
			["semver"] = "1.0.5",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["authorOptions"] = {
			},
			["anchorFrameType"] = "SCREEN",
			["cooldownEdge"] = false,
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 11401,
			["id"] = "Shadow Reflector",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["width"] = 64,
			["zoom"] = 0,
			["uid"] = "GQD0SMSELez",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayIcon"] = "136121",
			["cooldown"] = true,
			["parent"] = "PVP warnings",
		},
		["Helmet"] = {
			["iconSource"] = 0,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["url"] = "https://wago.io/xaZ5SVcnJ/6",
			["actions"] = {
				["start"] = {
					["do_loop"] = false,
					["do_sound"] = true,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",
					["sound_path"] = "CustomSounds\\stoopid.mp3",
					["do_message"] = false,
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_destFlags2"] = false,
						["spellId"] = "22641",
						["duration"] = "3.5",
						["names"] = {
						},
						["destUnit"] = "player",
						["sourceFlags3"] = "Player",
						["use_destName"] = false,
						["use_cloneId"] = true,
						["spellName"] = "Death Coil",
						["type"] = "combatlog",
						["use_sourceFlags3"] = true,
						["unevent"] = "timed",
						["use_sourceFlags2"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Combat Log",
						["sourceFlags2"] = "Hostile",
						["use_spellId"] = true,
						["use_spellName"] = false,
						["spellIds"] = {
						},
						["use_sourceUnit"] = false,
						["debuffType"] = "HELPFUL",
						["use_destUnit"] = true,
						["subeventPrefix"] = "SPELL",
						["unit"] = "target",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 6,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_1.sourceName_format"] = "none",
					["text_text"] = "%1.sourceName",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_TOP",
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [1]
			},
			["height"] = 64,
			["load"] = {
				["ingroup"] = {
				},
				["use_level"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["use_zone"] = false,
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["level_operator"] = "==",
				["level"] = "60",
				["use_never"] = false,
				["zoneIds"] = "",
			},
			["uid"] = "yqUEUhwvHxU",
			["zoom"] = 0,
			["icon"] = true,
			["regionType"] = "icon",
			["cooldownEdge"] = false,
			["cooldown"] = true,
			["displayIcon"] = "136010",
			["xOffset"] = 0,
			["width"] = 64,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 11401,
			["id"] = "Helmet",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["semver"] = "1.0.5",
			["config"] = {
			},
			["inverse"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["parent"] = "PVP warnings",
		},
		["Alpha Options"] = {
			["iconSource"] = 0,
			["xOffset"] = 16,
			["displayText"] = "Alpha Options - Luxthos",
			["yOffset"] = -16,
			["anchorPoint"] = "CENTER",
			["url"] = "https://wago.io/bNtdbWZ-W/36",
			["icon"] = true,
			["keepAspectRatio"] = false,
			["selfPoint"] = "BOTTOM",
			["desaturate"] = false,
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "ROGUE",
					["multi"] = {
						["ROGUE"] = true,
						["SHAMAN"] = true,
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["shadowXOffset"] = 1,
			["regionType"] = "icon",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["zoom"] = 0,
			["auto"] = true,
			["tocversion"] = 20501,
			["alpha"] = 0,
			["uid"] = "4jdUn0M12Fd",
			["displayIcon"] = 134520,
			["outline"] = "OUTLINE",
			["wagoID"] = "bNtdbWZ-W",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["customText"] = "function()\n    return aura_env.frame[1]\nend\n\n\n",
			["shadowYOffset"] = -1,
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "event",
			["cooldownEdge"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["duration"] = "1",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["spellName"] = 0,
						["custom_hide"] = "custom",
						["debuffType"] = "HELPFUL",
						["use_genericShowOn"] = true,
						["type"] = "custom",
						["unit"] = "player",
						["custom_type"] = "event",
						["custom"] = "function(event, ...)\n    local data = WeakAuras.GetData(aura_env.id)\n    local frame = WeakAuras.GetRegion(data.parent)\n    \n    if frame then\n        local alpha = 1\n        local cfgAlpha = aura_env.config\n        \n        if not UnitAffectingCombat(\"player\") then\n            alpha = cfgAlpha[\"oocAlpha\"]\n            \n        end\n        \n        frame:SetAlpha(alpha)\n        \n        return true\n    end\n    \n    return false\n    \nend\n\n\n--WeakAuras.regions[\"Melee\"].region:SetAlpha(alpha)\n\n\n",
						["events"] = "PLAYER_ENTERING_WORLD PLAYER_REGEN_ENABLED PLAYER_REGEN_DISABLED PLAYER_TARGET_CHANGED PLAYER_ALIVE PLAYER_DEAD PLAYER_UNGHOST",
						["event"] = "Combat Log",
						["eventtype"] = "PLAYER_REGEN_DISABLED",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["unevent"] = "timed",
						["use_eventtype"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_track"] = true,
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
						["custom"] = "",
						["eventtype"] = "PLAYER_REGEN_DISABLED",
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["internalVersion"] = 45,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["discrete_rotation"] = 0,
			["version"] = 36,
			["subRegions"] = {
			},
			["height"] = 32,
			["rotate"] = true,
			["fontSize"] = 12,
			["mirror"] = false,
			["authorOptions"] = {
				{
					["type"] = "range",
					["useDesc"] = true,
					["max"] = 1,
					["step"] = 0.05,
					["width"] = 2,
					["min"] = 0,
					["key"] = "oocAlpha",
					["desc"] = "Set the out of combat alpha (opacity)",
					["name"] = "Out of Combat Alpha",
					["default"] = 1,
				}, -- [1]
			},
			["information"] = {
			},
			["displayText_format_p_time_dynamic"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["parent"] = "TBC Hunter Castbar",
			["displayText_format_p_time_precision"] = 1,
			["cooldownTextDisabled"] = false,
			["config"] = {
				["oocAlpha"] = 1,
			},
			["semver"] = "1.1.11",
			["justify"] = "LEFT",
			["anchorFrameType"] = "SCREEN",
			["id"] = "Alpha Options",
			["desc"] = "",
			["frameStrata"] = 1,
			["width"] = 32,
			["wordWrap"] = "WordWrap",
			["automaticWidth"] = "Auto",
			["inverse"] = false,
			["fixedWidth"] = 200,
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = false,
			["preferToUpdate"] = false,
		},
		["Hunter::Serpent Sting"] = {
			["iconSource"] = -1,
			["xOffset"] = 0,
			["yOffset"] = -150,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_START",
						["ownOnly"] = true,
						["event"] = "Health",
						["unit"] = "target",
						["spellIds"] = {
						},
						["auranames"] = {
							"Serpent Sting", -- [1]
						},
						["useName"] = true,
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "spell",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showAlways",
						["subeventPrefix"] = "SPELL",
						["realSpellName"] = "Serpent Sting",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["unit"] = "player",
						["names"] = {
						},
						["event"] = "Cooldown Progress (Spell)",
						["use_track"] = true,
						["spellName"] = 13552,
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "any",
				["customTriggerLogic"] = "function(trigger)\n  return trigger[1]\nend",
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [1]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [2]
			},
			["height"] = 24,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["regionType"] = "icon",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["parent"] = "Hunter",
			["information"] = {
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["zoom"] = 0.3,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["id"] = "Hunter::Serpent Sting",
			["uid"] = ")XiAmf7SbLL",
			["frameStrata"] = 1,
			["width"] = 48,
			["anchorFrameType"] = "SCREEN",
			["config"] = {
			},
			["inverse"] = false,
			["cooldownTextDisabled"] = false,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "insufficientResources",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0.3450980392156863, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "spellUsable",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "expirationTime",
						["op"] = ">",
						["value"] = "2",
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.2.glow",
						}, -- [1]
					},
				}, -- [3]
			},
			["cooldown"] = true,
			["authorOptions"] = {
			},
		},
		["Health_Tick"] = {
			["sparkWidth"] = 7,
			["iconSource"] = -1,
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "https://wago.io/DgEh8a3hj/1",
			["icon"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["duration"] = "2",
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["custom_hide"] = "custom",
						["unevent"] = "timed",
						["subeventSuffix"] = "_CAST_START",
						["dynamicDuration"] = false,
						["event"] = "Chat Message",
						["custom_type"] = "stateupdate",
						["customDuration"] = "",
						["custom"] = "function(a, e, t)\n    local currentHP = UnitHealth(\"player\")\n    -- print(tostring(currentHP)..':'..tostring(aura_env.lastHP))\n    local dur = 2\n    local tick = \"REGENTICK\"\n    \n    if e == \"UNIT_HEALTH_FREQUENT\" then\n        if currentHP > (aura_env.lastHP) and not(UnitAffectingCombat(\"player\")) then\n            local time = GetTime()\n            if time-aura_env.tickTimer > dur - 0.25 then\n                aura_env.tickTimer = time\n                a[\"\"] = {\n                    show = true,\n                    changed = true,\n                    duration = dur,\n                    expirationTime = time + dur,\n                    progressType = \"timed\",\n                    autoHide = true\n                }\n                C_Timer.After(dur, function() WeakAuras.ScanEvents(tick, true) end)\n            end\n        end\n        \n        aura_env.lastHP = currentHP \n\n    elseif e == \"REGENTICK\" and GetTime() - aura_env.previousTick >= dur and GetTime() - aura_env.tickTimer >= dur then\n        aura_env.previousTick = GetTime()\n        a[\"\"] = {\n            show = true,\n            changed = true,\n            duration = dur,\n            expirationTime = GetTime() + dur,\n            progressType = \"timed\",\n            autoHide = true\n        }\n        C_Timer.After(dur, function() WeakAuras.ScanEvents(tick, true) end)\n    end\n    \n    return true\nend",
						["spellIds"] = {
						},
						["events"] = "UNIT_SPELLCAST_SUCCEEDED:player UNIT_POWER_FREQUENT:player UNIT_HEALTH_FREQUENT:player UNIT_SPELLCAST_SUCCEEDED:player REGENTICK",
						["check"] = "event",
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["customVariables"] = "{\n    duration = true\n}",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 45,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["barColor"] = {
				0.60392156862745, -- [1]
				0.8078431372549, -- [2]
				0.87450980392157, -- [3]
				0, -- [4]
			},
			["desaturate"] = false,
			["version"] = 1,
			["desc"] = "물빵런용 ManaTick - 좌상탄열발이상무",
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
			},
			["height"] = 20,
			["selfPoint"] = "CENTER",
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_class"] = false,
				["zoneIds"] = "",
				["level_operator"] = ">",
				["use_level"] = false,
				["level"] = "2",
				["class"] = {
					["single"] = "DRUID",
					["multi"] = {
						["WARRIOR"] = true,
						["ROGUE"] = true,
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["config"] = {
			},
			["color"] = {
			},
			["uid"] = "B15JWkiDci9",
			["auto"] = true,
			["anchorFrameType"] = "SELECTFRAME",
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["frameStrata"] = 5,
			["zoom"] = 0,
			["icon_side"] = "RIGHT",
			["id"] = "Health_Tick",
			["sparkHeight"] = 20,
			["texture"] = "Details Flat",
			["spark"] = true,
			["sparkTexture"] = "honorsystem-bar-spark",
			["semver"] = "1.0.0",
			["tocversion"] = 11401,
			["sparkHidden"] = "NEVER",
			["anchorFrameFrame"] = "PlayerFrameHealthBar",
			["alpha"] = 1,
			["width"] = 114,
			["sparkOffsetX"] = 0,
			["sparkColor"] = {
				0.60392156862745, -- [1]
				0.8078431372549, -- [2]
				0.87450980392157, -- [3]
				1, -- [4]
			},
			["inverse"] = true,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.lastHP = UnitHealth(\"player\")\naura_env.tickTimer = GetTime()\naura_env.previousTick = 0",
					["do_custom"] = true,
				},
			},
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["parent"] = "Eat & Run, Mana & Health Regen Tick",
		},
		["Auto Border & Delay"] = {
			["sparkWidth"] = 10,
			["iconSource"] = -1,
			["wagoID"] = "bNtdbWZ-W",
			["xOffset"] = 0,
			["adjustedMax"] = 3,
			["customText"] = "function()   \n    return string.format(\"%.2f\",math.max(0.00,aura_env.delay))\nend\n\n\n",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["zoom"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "https://wago.io/bNtdbWZ-W/36",
			["icon"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["use_alwaystrue"] = true,
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Conditions",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["use_unit"] = true,
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "custom",
						["custom"] = "function(...)\n    \n    if UnitAffectingCombat(\"player\") == false then\n        aura_env.first = 1\n    end\n    \n    -- Scans for events in combat log\n    if bit.band(select(7, ...), COMBATLOG_OBJECT_TYPE_PLAYER) > 0 and select(14, ...) == GetSpellInfo(75) and select(3, ...) == \"SPELL_CAST_SUCCESS\" and select(6, ...) == GetUnitName(\"player\")  then\n        \n        aura_env.start_time = GetTime()\n        \n        if (aura_env.prev_time) and (aura_env.auto_speed) then \n            \n            -- Calculate delay from elapsed time\n            aura_env.elapsed_time = aura_env.start_time - aura_env.prev_time\n            aura_env.delay = aura_env.elapsed_time - aura_env.auto_speed\n            if aura_env.first == 1 then\n                aura_env.delay = 0\n            end\n        end\n        -- Get speed of auto shots at start of cast\n        aura_env.auto_speed = UnitRangedDamage(\"player\")\n        \n        -- Set previous time for next iteration\n        aura_env.prev_time = aura_env.start_time\n        aura_env.first = 0\n        return\n    end\nend\n\n\n",
						["custom_type"] = "event",
						["custom_hide"] = "timed",
						["unit"] = "player",
						["events"] = "CLEU:SPELL_CAST_SUCCESS ",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "any",
				["customTriggerLogic"] = "function(trigger)\n    return trigger[1] and trigger[2] and trigger[5] and trigger[7]\nend",
				["activeTriggerMode"] = 2,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 45,
			["sparkOffsetX"] = 0,
			["selfPoint"] = "CENTER",
			["authorOptions"] = {
			},
			["adjustedMin"] = "0.5",
			["barColor"] = {
				0.19607843137255, -- [1]
				0.1843137254902, -- [2]
				0.1921568627451, -- [3]
				0, -- [4]
			},
			["desaturate"] = false,
			["customTextUpdate"] = "update",
			["backgroundColor"] = {
				0.78039215686275, -- [1]
				0.78039215686275, -- [2]
				0.78039215686275, -- [3]
				0, -- [4]
			},
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
				{
					["type"] = "subborder",
					["border_anchor"] = "bar",
					["border_offset"] = 0,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["border_size"] = 1,
				}, -- [2]
				{
					["text_text_format_n_format"] = "none",
					["text_text"] = "(+%c)",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "2002 Bold",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_CENTER",
					["text_visible"] = true,
					["text_fontSize"] = 8,
					["anchorXOffset"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [3]
			},
			["height"] = 14,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["load"] = {
				["use_class"] = true,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "HUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["uid"] = "yrwkF0WP4ri",
			["version"] = 36,
			["width"] = 252,
			["frameStrata"] = 2,
			["semver"] = "1.1.11",
			["smoothProgress"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["sparkHidden"] = "NEVER",
			["sparkHeight"] = 30,
			["icon_side"] = "LEFT",
			["spark"] = false,
			["anchorFrameParent"] = false,
			["texture"] = "Blizzard Raid Bar",
			["config"] = {
			},
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["auto"] = true,
			["tocversion"] = 20501,
			["id"] = "Auto Border & Delay",
			["anchorFrameFrame"] = "WeakAuras:Hunter Castbar",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "aura_env.delay = 0",
					["do_custom"] = true,
				},
				["finish"] = {
				},
			},
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["parent"] = "TBC Hunter Castbar",
			["orientation"] = "HORIZONTAL_INVERSE",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = -1,
						["variable"] = "incombat",
						["value"] = 0,
					},
					["changes"] = {
						{
							["property"] = "sub.3.text_visible",
						}, -- [1]
					},
				}, -- [1]
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Melee"] = {
			["sparkWidth"] = 10,
			["iconSource"] = -1,
			["wagoID"] = "bNtdbWZ-W",
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = 11,
			["anchorPoint"] = "CENTER",
			["useAdjustededMin"] = false,
			["borderBackdrop"] = "None",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "https://wago.io/bNtdbWZ-W/36",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["genericShowOn"] = "showOnActive",
						["unevent"] = "auto",
						["use_unit"] = true,
						["duration"] = "1",
						["event"] = "Swing Timer",
						["names"] = {
						},
						["use_absorbMode"] = true,
						["unit"] = "player",
						["spellIds"] = {
						},
						["use_hand"] = true,
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["hand"] = "main",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "custom",
						["use_alwaystrue"] = true,
						["custom_type"] = "status",
						["event"] = "Conditions",
						["use_unit"] = true,
						["events"] = "PLAYER_ENTERING_WORLD PLAYER_REGEN_ENABLED PLAYER_REGEN_DISABLED PLAYER_TARGET_CHANGED PLAYER_ALIVE PLAYER_DEAD PLAYER_UNGHOST",
						["custom_hide"] = "timed",
						["check"] = "event",
						["unit"] = "player",
						["custom"] = "function()\n    if aura_env.config[\"melee\"] then\n        return true\n    end\nend\n\n\n",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "custom",
				["customTriggerLogic"] = "function(t) \n    return t[2]\nend",
				["activeTriggerMode"] = 1,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 45,
			["parent"] = "TBC Hunter Castbar",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["backdropInFront"] = false,
			["zoom"] = 0,
			["barColor"] = {
				0.69411764705882, -- [1]
				0.38039215686275, -- [2]
				0.16470588235294, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["backgroundColor"] = {
				0.25490196078431, -- [1]
				0.26666666666667, -- [2]
				0.25882352941176, -- [3]
				1, -- [4]
			},
			["icon"] = false,
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
				{
					["type"] = "subborder",
					["border_anchor"] = "bar",
					["border_offset"] = 0,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["border_size"] = 1,
				}, -- [2]
			},
			["height"] = 8,
			["fontFlags"] = "OUTLINE",
			["load"] = {
				["ingroup"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "HUNTER",
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["use_class"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["sparkBlendMode"] = "ADD",
			["backdropColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["authorOptions"] = {
				{
					["type"] = "toggle",
					["key"] = "melee",
					["desc"] = "Enable/Disable Melee Swing Timer",
					["default"] = false,
					["useDesc"] = true,
					["name"] = "Melee",
					["width"] = 1,
				}, -- [1]
			},
			["selfPoint"] = "CENTER",
			["stickyDuration"] = false,
			["version"] = 36,
			["uid"] = "sAVLtqBVVd8",
			["useAdjustededMax"] = false,
			["anchorFrameFrame"] = "WeakAuras:Auto Border",
			["regionType"] = "aurabar",
			["borderInFront"] = true,
			["auto"] = true,
			["icon_side"] = "RIGHT",
			["width"] = 252,
			["frameStrata"] = 1,
			["sparkHeight"] = 30,
			["texture"] = "Blizzard Raid Bar",
			["config"] = {
				["melee"] = true,
			},
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["semver"] = "1.1.11",
			["tocversion"] = 20501,
			["sparkHidden"] = "NEVER",
			["id"] = "Melee",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["spark"] = false,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["sparkDesature"] = false,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["sparkOffsetX"] = 0,
		},
		["TBC Hunter Castbar"] = {
			["controlledChildren"] = {
				"Alpha Options", -- [1]
				"Melee", -- [2]
				"One Bar Auto", -- [3]
				"Auto Left", -- [4]
				"Auto Right", -- [5]
				"Auto Border & Delay", -- [6]
				"Castbar", -- [7]
				"Global Cooldown", -- [8]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["wagoID"] = "bNtdbWZ-W",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = -88.3134765625,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "https://wago.io/bNtdbWZ-W/36",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["unit"] = "player",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 45,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["version"] = 36,
			["subRegions"] = {
			},
			["load"] = {
				["use_class"] = "true",
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "HUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["scale"] = 1,
			["border"] = false,
			["anchorFrameFrame"] = "ElvUF_Player",
			["regionType"] = "group",
			["borderSize"] = 2,
			["anchorFrameParent"] = false,
			["uid"] = "k5AqSh4K4VP",
			["borderOffset"] = 4,
			["semver"] = "1.1.11",
			["tocversion"] = 20501,
			["id"] = "TBC Hunter Castbar",
			["xOffset"] = 6.9022216796875,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["groupIcon"] = 132212,
			["borderInset"] = 1,
			["config"] = {
			},
			["borderEdge"] = "Square Full White",
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
				["groupOffset"] = true,
			},
			["selfPoint"] = "BOTTOMLEFT",
		},
		["Auto Right"] = {
			["sparkWidth"] = 10,
			["iconSource"] = -1,
			["wagoID"] = "bNtdbWZ-W",
			["xOffset"] = 63,
			["adjustedMax"] = 3,
			["customText"] = "function()   \n    return string.format(\"%.2f\",max(0.00,aura_env.delay))\nend\n\n\n",
			["yOffset"] = 0,
			["anchorPoint"] = "RIGHT",
			["zoom"] = 0,
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "https://wago.io/bNtdbWZ-W/36",
			["icon"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["use_inverse"] = false,
						["use_spell"] = true,
						["names"] = {
						},
						["use_unit"] = true,
						["duration"] = "3",
						["debuffType"] = "HELPFUL",
						["use_hand"] = true,
						["buffShowOn"] = "showOnActive",
						["use_remaining"] = false,
						["use_cloneId"] = false,
						["custom_hide"] = "timed",
						["events"] = "",
						["type"] = "unit",
						["unevent"] = "auto",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["spell"] = "aimed shot",
						["event"] = "Swing Timer",
						["spellName"] = "Aimed Shot",
						["custom_type"] = "status",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_sourceUnit"] = true,
						["check"] = "event",
						["hand"] = "ranged",
						["sourceUnit"] = "player",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
						["hand"] = "ranged",
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "unit",
						["use_alwaystrue"] = true,
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
						["event"] = "Conditions",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "any",
				["customTriggerLogic"] = "function(trigger)\n    return trigger[1] and trigger[2] and trigger[5] and trigger[7]\nend",
				["activeTriggerMode"] = 1,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 45,
			["sparkOffsetX"] = 0,
			["selfPoint"] = "CENTER",
			["authorOptions"] = {
			},
			["adjustedMin"] = "0.5",
			["barColor"] = {
				0.19607843137255, -- [1]
				0.1843137254902, -- [2]
				0.1921568627451, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["customTextUpdate"] = "update",
			["backgroundColor"] = {
				0.78039215686275, -- [1]
				0.78039215686275, -- [2]
				0.78039215686275, -- [3]
				1, -- [4]
			},
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "Auto Shot",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_anchorXOffset"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "2002 Bold",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = false,
					["text_anchorPoint"] = "INNER_LEFT",
					["text_fontType"] = "OUTLINE",
					["text_fontSize"] = 11,
					["anchorXOffset"] = 0,
					["text_anchorYOffset"] = 0,
				}, -- [2]
				{
					["type"] = "subborder",
					["border_anchor"] = "bar",
					["border_offset"] = 0,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Square Full White",
					["border_size"] = 1,
				}, -- [3]
				{
					["tick_blend_mode"] = "ADD",
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["automatic_length"] = true,
					["tick_thickness"] = 2,
					["tick_color"] = {
						1, -- [1]
						0.027450980392157, -- [2]
						0.10980392156863, -- [3]
						1, -- [4]
					},
					["use_texture"] = false,
					["tick_placement_mode"] = "AtValue",
					["tick_visible"] = true,
					["tick_placement"] = "0.5",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_yOffset"] = 0,
					["tick_length"] = 30,
					["tick_mirror"] = false,
					["type"] = "subtick",
				}, -- [4]
				{
					["text_text_format_t_time_precision"] = 2,
					["text_text"] = "%p",
					["text_text_format_p_time_dynamic_threshold"] = 60,
					["text_text_format_p_format"] = "timed",
					["anchorXOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_t_time_format"] = 0,
					["anchorYOffset"] = 0,
					["text_justify"] = "RIGHT",
					["rotateText"] = "NONE",
					["text_text_format_t_format"] = "timed",
					["text_text_format_p_time_format"] = 0,
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_anchorXOffset"] = -2,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "2002 Bold",
					["text_text_format_p_time_precision"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_text_format_c2_format"] = "none",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_RIGHT",
					["text_wordWrap"] = "WordWrap",
					["text_anchorYOffset"] = -0.5,
					["text_fontSize"] = 10,
					["text_text_format_t_time_dynamic_threshold"] = 60,
					["text_shadowColor"] = {
						0.11764705882353, -- [1]
						0.11764705882353, -- [2]
						0.11764705882353, -- [3]
						1, -- [4]
					},
				}, -- [5]
			},
			["height"] = 14,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["load"] = {
				["use_class"] = true,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["single"] = "HUNTER",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["uid"] = ")SrpQ1peOgo",
			["version"] = 36,
			["width"] = 126,
			["frameStrata"] = 2,
			["semver"] = "1.1.11",
			["smoothProgress"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["sparkHidden"] = "NEVER",
			["sparkHeight"] = 30,
			["icon_side"] = "RIGHT",
			["spark"] = false,
			["anchorFrameParent"] = true,
			["texture"] = "Blizzard Raid Bar",
			["config"] = {
			},
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["auto"] = true,
			["tocversion"] = 20501,
			["id"] = "Auto Right",
			["anchorFrameFrame"] = "WeakAuras:Auto Border",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "aura_env.delay = 0",
					["do_custom"] = true,
				},
				["finish"] = {
				},
			},
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["parent"] = "TBC Hunter Castbar",
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = -1,
						["variable"] = "incombat",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = false,
							["property"] = "sub.2.text_visible",
						}, -- [1]
						{
							["value"] = false,
							["property"] = "sub.5.text_visible",
						}, -- [2]
						{
							["property"] = "sub.4.tick_visible",
						}, -- [3]
						{
							["value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								0, -- [4]
							},
							["property"] = "barColor",
						}, -- [4]
					},
				}, -- [1]
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["BG Rez Timer + Dead Enemy Tracker"] = {
			["outline"] = "OUTLINE",
			["authorOptions"] = {
				{
					["type"] = "number",
					["useDesc"] = true,
					["max"] = 5,
					["step"] = 1,
					["width"] = 1,
					["min"] = 1,
					["key"] = "avRezThreshold",
					["default"] = 2,
					["name"] = "AV Rez Threshold",
					["desc"] = "This # is how many people must rez within 100ms to resync the timer!",
				}, -- [1]
				{
					["type"] = "number",
					["useDesc"] = true,
					["max"] = 5,
					["step"] = 1,
					["width"] = 1,
					["min"] = 1,
					["key"] = "wsgRezThreshold",
					["default"] = 2,
					["name"] = "WSG Rez Threshold",
					["desc"] = "This # is how many people must rez within 100ms to resync the timer!",
				}, -- [2]
				{
					["text"] = "",
					["type"] = "header",
					["useName"] = false,
					["width"] = 1,
				}, -- [3]
				{
					["type"] = "toggle",
					["key"] = "manual",
					["width"] = 1,
					["name"] = "Manual Sync",
					["useDesc"] = true,
					["default"] = true,
					["desc"] = "Allows you to use a macro to manually sync everyones Graveyard Timer, Uncheck if you don't want this feature",
				}, -- [4]
				{
					["text"] = "\nManual Sync Macro\nPress When Enemy Rez's If Timer Is Wrong\n\n/script WeakAuras.ScanEvents(\"BG_REZ_SYNC\", \"SYNC\");",
					["type"] = "description",
					["fontSize"] = "medium",
					["width"] = 2,
				}, -- [5]
				{
					["type"] = "number",
					["useDesc"] = false,
					["max"] = 1,
					["step"] = 0.05,
					["width"] = 1,
					["min"] = 0,
					["key"] = "option6",
					["default"] = 0,
					["name"] = "Lag Tolereance",
				}, -- [6]
			},
			["displayText"] = "%c",
			["customText"] = "function()\n    local now = GetTime();\n    aura_env.HordeRess = aura_env.numHorde - aura_env.numHordeOld;\n    aura_env.AllyRess = aura_env.numAlliance - aura_env.numAllianceOld;\n    \n    if ((aura_env.aliveLC == nil or aura_env.totalUnitsLC == nil) and aura_env.enabled) then\n        aura_env.aliveLC, aura_env.totalUnitsLC = aura_env.getRaidInfo();\n    end\n    \n    if (aura_env.aliveLC ~= nil and aura_env.totalUnitsLC ~= nil and (aura_env.lastRezCheck == nil or aura_env.lastRezCheck + aura_env.lastRezThrottle <= now)) then\n        local alive, totalUnits = aura_env.getRaidInfo();\n        if (aura_env.shouldUpdateRezTimer(alive, aura_env.aliveLC, totalUnits, aura_env.totalUnitsLC)) then\n            aura_env.nextRez = now + aura_env.rezInterval;\n            aura_env.numHordeOld = aura_env.numHorde;\n            aura_env.numAllianceOld = aura_env.numAlliance;\n            \n            if ((UnitFactionGroup(\"player\") == \"Horde\") and aura_env.AllyRess > 0) then\n                print(string.format(\"Enemies Ressed: %d\", aura_env.AllyRess))\n            elseif ((UnitFactionGroup(\"player\") == \"Alliance\") and aura_env.HordeRess > 0) then\n                print(string.format(\"Enemies Ressed: %d\", aura_env.HordeRess))\n            end\n            \n            aura_env.HordeRess = 0;\n            aura_env.AllyRess = 0;\n        end\n        aura_env.lastRezCheck = now;\n        aura_env.aliveLC = alive;\n        aura_env.totalUnitsLC = totalUnits\n    end\n    \n    if (aura_env.nextRez ~= nil) then\n        local time = aura_env.nextRez - now;\n        \n        if (time <= 0) then\n            aura_env.nextRez = now + aura_env.rezInterval;\n            aura_env.numHordeOld = aura_env.numHorde;\n            aura_env.numAllianceOld = aura_env.numAlliance;\n            \n            if ((UnitFactionGroup(\"player\") == \"Horde\") and aura_env.AllyRess > 0) then\n                print(string.format(\"Enemies Ressed: %d\", aura_env.AllyRess))\n            elseif ((UnitFactionGroup(\"player\") == \"Alliance\") and aura_env.HordeRess > 0) then\n                print(string.format(\"Enemies Ressed: %d\", aura_env.HordeRess))\n            end\n            \n            aura_env.HordeRess = 0;\n            aura_env.AllyRess = 0;\n        end\n        \n        if (time <= 2) then\n            RequestBattlefieldScoreData();\n        end\n        \n        if ((UnitFactionGroup(\"player\") == \"Horde\") and aura_env.AllyRess >= 0) then\n            return string.format(\"GY Timer: %.1f \\n Ressing: %d\", time, aura_env.AllyRess);\n        elseif ((UnitFactionGroup(\"player\") == \"Alliance\") and aura_env.HordeRess >= 0) then\n            return string.format(\"GY Timer: %.1f \\n Ressing: %d\", time, aura_env.HordeRess);\n        else\n            return string.format(\"GY Timer: %.1f \\n Ressing: --\", time);\n        end\n    end\n    return \"GY Timer: -- \\n Ressing: --\";\nend",
			["yOffset"] = 168.2305297851563,
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["url"] = "https://wago.io/dLx_RdwSE/4",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "-- Config Vars\naura_env.startText = {\n    [\"The battle for Alterac Valley has begun!\"] = 0,\n    [\"Let the battle for Warsong Gulch begin!\"] = 5,\n}\n\naura_env.zones = {\n    [\"Alterac Valley\"] = false,\n    [\"Warsong Gulch\"] = true,\n}\n\naura_env.prefix = \"AuroBGRez\";\nC_ChatInfo.RegisterAddonMessagePrefix(aura_env.prefix)\n\n-- I've seen Rez's in between 31 - 32; 31.5 Seems most common\naura_env.rezInterval = 31.5;\naura_env.lastRezThrottle = 0.1;\naura_env.lastRezPlayerReq = 2;\n\n-- Reused Variables\naura_env.enabled = false;\naura_env.nextRez = nil;\naura_env.aliveLC = nil;\naura_env.lastRezCheck = nil;\naura_env.totalUnitsLC = nil;\naura_env.numHorde = 0;\naura_env.numAlliance = 0;\naura_env.numHordeOld = 0;\naura_env.numAllianceOld = 0;\naura_env.HordeRess = 0;\naura_env.AllyRess = 0;\n\n-- Functions\naura_env.resetState = function()\n    aura_env.enabled = false;\n    aura_env.nextRez = nil;\n    aura_env.aliveLC = nil;\n    aura_env.lastRezCheck = nil;    \n    aura_env.totalUnitsLC = nil;\n    aura_env.numHorde = 0;\n    aura_env.numAlliance = 0;\n    aura_env.numHordeOld = 0;\n    aura_env.numAllianceOld = 0;\n    aura_env.HordeRess = 0;\n    aura_env.AllyRess = 0;\nend\n\naura_env.getRaidInfo = function()\n    local c = 0;\n    local t = 0;\n    for unit in WA_IterateGroupMembers() do\n        t = t + 1;\n        local alive = not UnitIsDeadOrGhost(unit);\n        if (alive) then\n            c = c + 1; \n        end\n    end\n    return c, t;\nend\n\naura_env.shouldUpdateRezTimer = function(alive, aliveLC, totalUnits, totalUnitsLC)\n    if (aliveLC + aura_env.getRezThreshold() <= alive and totalUnits == totalUnitsLC) then\n        return true; \n    end\nend\n\naura_env.getRezThreshold = function()\n    local zone = GetZoneText();\n    if (zone == \"Alterac Valley\") then\n        return aura_env.config.avRezThreshold;\n    end\n    \n    if (zone == \"Warsong Gulch\") then\n        return aura_env.config.wsgRezThreshold\n    end\n    \n    return aura_env.lastRezPlayerReq;\nend",
					["do_custom"] = true,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["custom_type"] = "status",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["spellIds"] = {
						},
						["events"] = "CHAT_MSG_BG_SYSTEM_NEUTRAL, CHAT_MSG_BG_SYSTEM_ALLIANCE, BG_REZ_SYNC, CHAT_MSG_ADDON, ZONE_CHANGED_NEW_AREA, UPDATE_BATTLEFIELD_SCORE, PLAYER_UNGHOST",
						["check"] = "event",
						["custom"] = "function(e, ...)\n    if (e == \"CHAT_MSG_BG_SYSTEM_NEUTRAL\" or e == \"CHAT_MSG_BG_SYSTEM_ALLIANCE\") then\n        local message = select(1, ...);\n        local startOffset = aura_env.startText[message];\n        if (startOffset ~= nil) then\n            aura_env.nextRez = GetTime() + aura_env.rezInterval + startOffset;\n        end\n    end\n    \n    if (e == \"BG_REZ_SYNC\") then\n        local msg = select(1, ...);\n        local _, instanceType = IsInInstance();\n        if (instanceType == \"pvp\" and msg == \"SYNC\") then\n            C_ChatInfo.SendAddonMessage(aura_env.prefix, \"SYNC\", \"INSTANCE_CHAT\")\n        end\n    end\n    \n    if (e == \"CHAT_MSG_ADDON\") then\n        local prefix = select(1, ...);\n        local text = select(2, ...);\n        local channel = select(3, ...);\n        local sender = select(4, ...);\n        if (prefix == aura_env.prefix and aura_env.config.manual and text == \"SYNC\") then\n            aura_env.nextRez = GetTime() + (aura_env.rezInterval - 0.25) --It roughly takes 0.25 milisec before CHAT_MSG_ADDON triggers.\n            aura_env.numHordeOld = aura_env.numHorde;\n            aura_env.numAllianceOld = aura_env.numAlliance;\n            aura_env.HordeRess = 0;\n            aura_env.AllyRess = 0;\n        end\n    end\n    \n    if (e == \"ZONE_CHANGED_NEW_AREA\") then\n        aura_env.resetState();\n        local zone = GetZoneText();\n        if (aura_env.zones[zone] == true) then\n            aura_env.enabled = true;\n        else\n            aura_env.enabled = false;\n        end \n    end\n    \n    if (e == \"UPDATE_BATTLEFIELD_SCORE\") then\n        aura_env.numHorde = 0;\n        aura_env.numAlliance = 0;\n        RequestBattlefieldScoreData();\n        local numScores = GetNumBattlefieldScores()\n        for i=1, numScores do\n            local _, _, _, deaths, _, faction = GetBattlefieldScore(i);\n            if (faction) then\n                if (faction == 0) then\n                    aura_env.numHorde = aura_env.numHorde + deaths\n                    \n                else\n                    aura_env.numAlliance = aura_env.numAlliance + deaths\n                    \n                end\n            end\n        end\n    end\n    \n    if (e == \"PLAYER_UNGHOST\") then\n        local _, iType = IsInInstance();\n        if (iType == \"pvp\" and (UnitHealth(\"player\")/UnitHealthMax(\"player\"))*100 == 100) then\n            C_ChatInfo.SendAddonMessage(aura_env.prefix, \"SYNC\", \"INSTANCE_CHAT\")\n            if not aura_env.config.manual then\n                aura_env.nextRez = GetTime() + aura_env.rezInterval\n                aura_env.numHordeOld = aura_env.numHorde;\n                aura_env.numAllianceOld = aura_env.numAlliance;\n                aura_env.HordeRess = 0;\n                aura_env.AllyRess = 0;\n            end\n        end\n    end\n    \n    return aura_env.enabled;\nend",
						["unit"] = "player",
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
						["custom"] = "function()\n   return not aura_env.enabled; \nend",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["wordWrap"] = "WordWrap",
			["desc"] = "Edited by Swagkhalifa (Mograine EU)",
			["font"] = "Friz Quadrata TT",
			["version"] = 4,
			["subRegions"] = {
			},
			["load"] = {
				["use_zone"] = false,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 12,
			["shadowXOffset"] = 1,
			["regionType"] = "text",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["selfPoint"] = "BOTTOM",
			["conditions"] = {
			},
			["automaticWidth"] = "Auto",
			["shadowYOffset"] = -1,
			["semver"] = "1.0.3",
			["tocversion"] = 11401,
			["id"] = "BG Rez Timer + Dead Enemy Tracker",
			["xOffset"] = 601.767578125,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["config"] = {
				["manual"] = true,
				["option6"] = 0,
				["avRezThreshold"] = 2,
				["wsgRezThreshold"] = 2,
			},
			["uid"] = "YoDke2Q0s(v",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["justify"] = "CENTER",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["fixedWidth"] = 200,
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Frost Reflector"] = {
			["iconSource"] = 0,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["sound_path"] = "CustomSounds\\stoopid.mp3",
					["do_message"] = false,
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BananaPeelSlip.ogg",
					["do_sound"] = true,
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_destFlags2"] = false,
						["duration"] = "5",
						["names"] = {
						},
						["destUnit"] = "target",
						["sourceFlags3"] = "Player",
						["use_sourceFlags3"] = true,
						["use_cloneId"] = true,
						["spellName"] = "Frost Reflector",
						["type"] = "combatlog",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["unevent"] = "timed",
						["event"] = "Combat Log",
						["use_sourceFlags2"] = true,
						["sourceFlags2"] = "Hostile",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["debuffType"] = "HELPFUL",
						["unit"] = "target",
						["use_destUnit"] = false,
						["use_destName"] = false,
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["version"] = 6,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_1.sourceName_format"] = "none",
					["text_text"] = "%1.sourceName",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_TOP",
					["text_fontSize"] = 16,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [1]
			},
			["height"] = 64,
			["load"] = {
				["ingroup"] = {
				},
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
					},
				},
				["use_zone"] = false,
				["zoneIds"] = "",
				["use_level"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["level"] = "60",
				["level_operator"] = "==",
				["size"] = {
					["multi"] = {
					},
				},
			},
			["config"] = {
			},
			["selfPoint"] = "CENTER",
			["url"] = "https://wago.io/xaZ5SVcnJ/6",
			["regionType"] = "icon",
			["semver"] = "1.0.5",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["xOffset"] = 0,
			["anchorFrameType"] = "SCREEN",
			["icon"] = true,
			["cooldownTextDisabled"] = false,
			["auto"] = false,
			["tocversion"] = 11401,
			["id"] = "Frost Reflector",
			["alpha"] = 1,
			["frameStrata"] = 1,
			["width"] = 64,
			["zoom"] = 0,
			["uid"] = "v4zbpga)ZNL",
			["inverse"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayIcon"] = "135850",
			["cooldown"] = true,
			["parent"] = "PVP warnings",
		},
		["WSG Flag Carrier Names"] = {
			["outline"] = "OUTLINE",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayText"] = "",
			["customText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
					["sound"] = " custom",
					["do_sound"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "C_ChatInfo.RegisterAddonMessagePrefix(\"WSGFCNamesHP\")\nstr_alliance_flag_drop = \"The Alliance Flag was dropped by \"\nstr_horde_flag_drop = \"The Horde flag was dropped by \"\nstr_alliance_flag_cap = \"captured the Alliance flag\"\nstr_horde_flag_cap = \"captured the Horde flag\"\nstr_alliance_flag_pickup = \"The Alliance Flag was picked up by \"\nstr_horde_flag_pickup = \"The Horde flag was picked up by \"\n\n\n\nlocal name_player, realm_player = UnitFullName(\"player\")\nFULLNAME_PLAYER = name_player .. \"-\" .. realm_player\n\ntime_addonmsg = 0\ntime_announce = 0\nhp_tracker = -1\n\nstr_faction_player = UnitFactionGroup(\"player\")\nWSG_TABLE = {\n    [\"Alliance\"]={\n        txt_flag_holder=nil,\n        str_flag_holder=nil,\n        str_flag_holder_macro = nil,\n        time_announce=0,\n        hp_tracker=1,\n        hp_msg_send=\"\",\n        hp_received=nil,\n        hp_received_ts=0,\n    },\n    [\"Horde\"]={\n        txt_flag_holder=nil,\n        str_flag_holder=nil,\n        str_flag_holder_macro = nil,\n        time_announce=0,\n        hp_tracker=1,\n        hp_msg_send=\"\",\n        hp_received=nil,\n        hp_received_ts=0,\n    },\n}\n\nGET_FLAG_HOLDER_HP = function(faction_flag)\n    if str_faction_player ~= faction_flag then\n        local unitname = WSG_TABLE[faction_flag].str_flag_holder\n        local hp_cur = UnitHealth(unitname)\n        local hp_max = UnitHealthMax(unitname) \n        if hp_max > 0 then\n            return hp_cur/hp_max\n        end\n    else\n        for ii=1,10 do\n            local unit = \"raid\" .. ii .. \"target\"\n            if UnitExists(unit) then\n                local hp_cur = UnitHealth(unit) \n                local hp_max = UnitHealthMax(unit) \n                local unitname = GET_NAME_WITH_REALM(unit)\n                if unitname == WSG_TABLE[str_faction_player].str_flag_holder then\n                    if hp_max > 0 then\n                        return hp_cur/hp_max\n                    end\n                end\n            end\n        end\n    end\n    return nil\nend\n\nGET_NAME_WITH_REALM = function(unit)\n    if UnitExists(unit) then\n        local name,realm = UnitName(unit)\n        if realm and realm ~= \"\" then\n            return name .. \"-\" .. realm\n        else\n            return name\n        end\n    else\n        return nil\n    end\nend\n\nGET_COLORED_NAME_FROM_BG_SCORE = function (playername)\n    local function GetClassFromBGScore(name_target)\n        --local numScores = GetNumBattlefieldScores()\n        for i=1,20 do\n            local name, killingBlows, honorableKills, deaths, honorGained, faction, rank, race, class, CLASS = GetBattlefieldScore(i);\n            if name == name_target then\n                return CLASS\n            end\n        end\n        return nil\n    end\n    \n    local function DecimalToHex(r,g,b)\n        return string.format(\"|cff%02x%02x%02x\", r*255, g*255, b*255)\n    end\n    \n    local r,g,b,classcolor,PLAYERCLASS\n    \n    if UnitInRaid(playername) then\n        _,PLAYERCLASS = UnitClass(playername)\n    else\n        PLAYERCLASS = GetClassFromBGScore(playername)\n    end\n    \n    if PLAYERCLASS then\n        classcolor = RAID_CLASS_COLORS[PLAYERCLASS]\n        r,g,b = classcolor.r,classcolor.g,classcolor.b\n    else\n        r,g,b = 0.5,0.5,0.5\n    end\n    \n    local classcolorhex = DecimalToHex(r,g,b)\n    return classcolorhex..playername..\"|r\"\nend\n\nINITIALIZE_FC_TEXT = function ()\n    local p = {UIWidgetTopCenterContainerFrame:GetChildren()};\n    local f\n    for ii = 1,2 do\n        f = p[ii]\n        if f then\n            if f.tooltip == \"Horde flag captures\" or f.tooltip == \"Alliance flag captures\" then\n                if not f.TXT_FLAG_HOLDER and not InCombatLockdown() then\n                    local text_ = CreateFrame(\"Button\", nil, f, \"SecureUnitButtonTemplate\")\n                    text_:SetFrameStrata(\"MEDIUM\")\n                    text_:SetFrameLevel(15)\n                    text_:SetPoint(\"LEFT\",85,0)\n                    text_:SetAttribute(\"type\",\"macro\")\n                    text_:RegisterForClicks(\"AnyUp\")\n                    text_:SetAttribute('macrotext', '')\n                    \n                    text_.text = text_:CreateFontString(nil,\"ARTWORK\") \n                    text_.text:SetFont(\"Fonts\\\\FRIZQT__.TTF\", 14, \"OUTLINE\")\n                    text_.text:SetPoint(\"LEFT\",0,0)\n                    text_.text:SetText(\"\")\n                    \n                    text_:SetSize(text_.text:GetWidth(),text_.text:GetHeight())\n                    \n                    f.TXT_FLAG_HOLDER = text_\n                end\n            end\n            if f.TXT_FLAG_HOLDER then\n                if f.tooltip == \"Horde flag captures\" then\n                    WSG_TABLE[\"Alliance\"].txt_flag_holder = f.TXT_FLAG_HOLDER\n                elseif f.tooltip == \"Alliance flag captures\" then\n                    WSG_TABLE[\"Horde\"].txt_flag_holder = f.TXT_FLAG_HOLDER\n                end\n            end\n        end\n    end\nend\n\nINITIALIZE_FC_TEXT()",
					["do_custom"] = true,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["message_operator"] = "find('%s')",
						["names"] = {
						},
						["custom_hide"] = "timed",
						["type"] = "custom",
						["debuffType"] = "HELPFUL",
						["unevent"] = "timed",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["event"] = "Chat Message",
						["custom_type"] = "event",
						["message"] = "the sting of defeat at the conclusion of the Third War",
						["events"] = "CHAT_MSG_BG_SYSTEM_ALLIANCE, CHAT_MSG_BG_SYSTEM_HORDE, CHAT_MSG_ADDON",
						["spellIds"] = {
						},
						["custom"] = "function(event,msg)\n    if event == \"CHAT_MSG_BG_SYSTEM_ALLIANCE\" or event == \"CHAT_MSG_BG_SYSTEM_HORDE\" then\n        INITIALIZE_FC_TEXT()\n        if string.match(msg,str_horde_flag_pickup) then\n            local name = string.gsub(string.gsub(msg,str_horde_flag_pickup,\"\"),\"!\",\"\")\n            WSG_TABLE[\"Horde\"].str_flag_holder = name\n            WSG_TABLE[\"Horde\"].hp_tracker = 1\n            RequestBattlefieldScoreData()\n        elseif string.match(msg,str_alliance_flag_pickup) then\n            local name = string.gsub(string.gsub(msg,str_alliance_flag_pickup,\"\"),\"!\",\"\")\n            WSG_TABLE[\"Alliance\"].str_flag_holder = name\n            WSG_TABLE[\"Alliance\"].hp_tracker = 1\n            RequestBattlefieldScoreData()\n        elseif string.match(msg,str_horde_flag_drop) or string.match(msg,str_horde_flag_cap) then\n            WSG_TABLE[\"Horde\"].str_flag_holder = nil\n            WSG_TABLE[\"Horde\"].hp_tracker = 1\n        elseif string.match(msg,str_alliance_flag_drop) or string.match(msg,str_alliance_flag_cap) then\n            WSG_TABLE[\"Alliance\"].str_flag_holder = nil\n            WSG_TABLE[\"Alliance\"].hp_tracker = 1\n        end\n    end\n    \n    \nend\n\n\n",
						["use_message"] = false,
						["subeventSuffix"] = "_CAST_START",
						["use_messageType"] = false,
						["messageType"] = "CHAT_MSG_RAID_BOSS_EMOTE",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["subeventPrefix"] = "SPELL",
						["type"] = "custom",
						["custom"] = "function()\n    local f, hp, txt\n    local in_combat = InCombatLockdown()\n    local time_cur = GetTime()\n    \n    for _,faction in pairs({\"Alliance\",\"Horde\"}) do\n        f = WSG_TABLE[faction].txt_flag_holder\n        if f then\n            txt = \"\"\n            if WSG_TABLE[faction].str_flag_holder then\n                txt = txt .. GET_COLORED_NAME_FROM_BG_SCORE(WSG_TABLE[faction].str_flag_holder)\n                \n                hp = GET_FLAG_HOLDER_HP(faction)\n                if hp then\n                    txt = txt .. string.format(\" (%.1f%%) \",hp*100)\n                    if faction == str_faction_player then\n                        local msg_addon = string.format(\"%s@%.4f\",WSG_TABLE[faction].str_flag_holder,hp)\n                        if msg_addon ~= WSG_TABLE[faction].hp_msg_send or (time_cur - time_addonmsg) > 1 then\n                            time_addonmsg = time_cur\n                            WSG_TABLE[faction].hp_msg_send = msg_addon\n                            C_ChatInfo.SendAddonMessage(\"WSGFCNamesHP\",msg_addon,\"INSTANCE_CHAT\")\n                        end\n                    end\n                elseif faction == str_faction_player then\n                    if WSG_TABLE[faction].hp_received and (time_cur - WSG_TABLE[faction].hp_received_ts) < 5 then\n                        txt = txt .. string.format(\" |cff7f7f7f(%.1f%%)|r \",WSG_TABLE[faction].hp_received*100)\n                    else\n                        WSG_TABLE[faction].hp_received = nil\n                        WSG_TABLE[faction].hp_received_ts = 0\n                    end\n                end\n                \n                if hp and hp < 0.5 then\n                    if math.abs(hp-WSG_TABLE[faction].hp_tracker) >= 0.10 and (time_cur - WSG_TABLE[faction].time_announce) > 3 then\n                        WSG_TABLE[faction].hp_tracker = hp\n                        WSG_TABLE[faction].time_announce = time_cur\n                        if aura_env.config[\"AnnounceLowEFCHP\"] and faction == str_faction_player then\n                            local str = string.format(\">>> ENEMY FC: %.1f%% <<<\",hp*100)\n                            SendChatMessage(str,\"INSTANCE_CHAT\")\n                        else\n                            --local str = string.format(\"*** OUR FC: %.1f%% ***\",hp*100)\n                            --SendChatMessage(str,\"INSTANCE_CHAT\")\n                        end\n                    end\n                elseif hp then\n                    if math.abs(hp-WSG_TABLE[faction].hp_tracker) >= 0.10 then\n                        WSG_TABLE[faction].hp_tracker = hp\n                    end\n                else\n                    if (time_cur-WSG_TABLE[faction].time_announce) > 30 then\n                        WSG_TABLE[faction].hp_tracker = 1\n                    end\n                end\n                \n                if in_combat and WSG_TABLE[faction].str_flag_holder ~= WSG_TABLE[faction].str_flag_holder_macro then\n                    txt = txt .. \" (Unclickable)\"\n                end\n            end\n            f.text:SetText(txt)\n            \n            if not in_combat then\n                if WSG_TABLE[faction].str_flag_holder then\n                    f:SetAttribute('macrotext', '/targetexact ' .. WSG_TABLE[faction].str_flag_holder)\n                else\n                    f:SetAttribute('macrotext', '')\n                end\n                WSG_TABLE[faction].str_flag_holder_macro = WSG_TABLE[faction].str_flag_holder\n                f:SetSize(f.text:GetWidth(),f.text:GetHeight())\n            end\n        end\n    end\n    return true\nend",
						["subeventSuffix"] = "_CAST_START",
						["check"] = "update",
						["custom_type"] = "status",
						["event"] = "Health",
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
					},
				}, -- [2]
				{
					["trigger"] = {
						["subeventPrefix"] = "SPELL",
						["type"] = "custom",
						["custom"] = "function(event,prefix,msg,channel,sender)\n    \n    if event == \"CHAT_MSG_ADDON\" and prefix == \"WSGFCNamesHP\" and channel == \"INSTANCE_CHAT\" and sender ~= FULLNAME_PLAYER then\n        local name = string.match(msg,\"(.*)@\")\n        local hp = string.match(msg,\"@(.*)\")\n        if hp then hp = tonumber(hp) end\n        if name and name == WSG_TABLE[str_faction_player].str_flag_holder and hp then\n            WSG_TABLE[str_faction_player].hp_received = hp\n            WSG_TABLE[str_faction_player].hp_received_ts = GetTime()\n        end\n    end\n    \n    \nend",
						["subeventSuffix"] = "_CAST_START",
						["events"] = "CHAT_MSG_ADDON",
						["custom_type"] = "event",
						["event"] = "Health",
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
					},
				}, -- [3]
				["disjunctive"] = "any",
				["activeTriggerMode"] = 2,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = false,
			["wordWrap"] = "WordWrap",
			["desaturate"] = false,
			["icon"] = true,
			["font"] = "Friz Quadrata TT",
			["version"] = 5,
			["subRegions"] = {
			},
			["height"] = 64,
			["semver"] = "1.0.4",
			["load"] = {
				["zoneIds"] = "",
				["use_zone"] = true,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["zone"] = "Warsong Gulch",
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fixedWidth"] = 200,
			["fontSize"] = 14,
			["selfPoint"] = "CENTER",
			["conditions"] = {
			},
			["shadowXOffset"] = 1,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["shadowYOffset"] = -1,
			["cooldownEdge"] = false,
			["regionType"] = "text",
			["config"] = {
				["AnnounceLowEFCHP"] = true,
			},
			["authorOptions"] = {
				{
					["type"] = "toggle",
					["key"] = "AnnounceLowEFCHP",
					["width"] = 1,
					["name"] = "Announce Low EFC HP",
					["useDesc"] = true,
					["default"] = true,
					["desc"] = "Announce when EFC reaches low HP in BG Chat",
				}, -- [1]
			},
			["width"] = 64,
			["frameStrata"] = 1,
			["zoom"] = 0,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["justify"] = "LEFT",
			["tocversion"] = 11401,
			["id"] = "WSG Flag Carrier Names",
			["xOffset"] = 0,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["url"] = "https://wago.io/84b4-N5KZ/5",
			["uid"] = "6aWEt)Vqup8",
			["inverse"] = false,
			["desc"] = "Adds alliance/horde flag carrier names at the top of the screen. Click name to target flag carrier.",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["displayIcon"] = 136155,
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["BG Queue Notification"] = {
			["outline"] = "OUTLINE",
			["authorOptions"] = {
			},
			["displayText"] = "",
			["shadowYOffset"] = -1,
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
					["message"] = "Your BG is Ready",
					["message_type"] = "WHISPER",
					["do_message"] = false,
					["message_dest"] = "Maxstats",
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "function(onload)\n    for i=1, GetMaxBattlefieldID() do\n        queued, __, __ = GetBattlefieldStatus(i);\n        if ( queued == \"queued\" ) then\n            SendChatMessage(\"Your BG is Ready!\",\"WHISPER\",nil,UnitName(\"player\"))\n        end\n    end\nend\n\n\n",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["custom_hide"] = "timed",
						["type"] = "custom",
						["use_unit"] = true,
						["unevent"] = "timed",
						["names"] = {
						},
						["duration"] = "1",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["custom"] = "function()\n    for i=1, GetMaxBattlefieldID() do\n        status = GetBattlefieldStatus(i);\n        if ( status == \"confirm\" ) then\n            SendChatMessage(\"Your BG is Ready!\",\"WHISPER\",nil,UnitName(\"player\"))\n        end\n    end\nend\n\n\n",
						["spellIds"] = {
						},
						["events"] = "UPDATE_BATTLEFIELD_STATUS",
						["check"] = "event",
						["unit"] = "player",
						["custom_type"] = "status",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["customTriggerLogic"] = "function(onload)\n    for i=1, GetMaxBattlefieldID() do\n        queued, __, __ = GetBattlefieldStatus(i);\n        if ( queued == \"queued\" ) then\n            SendChatMessage(\"Your BG is Ready!\",\"WHISPER\",nil,UnitName(\"player\"))\n        end\n    end\nend\n\n\n",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["font"] = "Friz Quadrata TT",
			["version"] = 1,
			["subRegions"] = {
			},
			["load"] = {
				["zoneIds"] = "",
				["level_operator"] = ">=",
				["use_level"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["level"] = "1",
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 53,
			["shadowXOffset"] = 1,
			["regionType"] = "text",
			["url"] = "https://wago.io/WFI-OVL05/1",
			["selfPoint"] = "BOTTOM",
			["conditions"] = {
				{
					["check"] = {
					},
					["changes"] = {
						{
						}, -- [1]
					},
				}, -- [1]
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["wordWrap"] = "WordWrap",
			["justify"] = "LEFT",
			["tocversion"] = 11401,
			["id"] = "BG Queue Notification",
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["config"] = {
			},
			["uid"] = "dKI9byJbkzW",
			["yOffset"] = 0,
			["semver"] = "1.0.0",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["fixedWidth"] = 200,
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["preferToUpdate"] = false,
		},
		["Global Cooldown"] = {
			["sparkWidth"] = 10,
			["sparkOffsetX"] = 0,
			["wagoID"] = "bNtdbWZ-W",
			["authorOptions"] = {
				{
					["type"] = "toggle",
					["key"] = "gcd",
					["desc"] = "Toggle showing GCD",
					["default"] = false,
					["useDesc"] = true,
					["name"] = "GCD Bar",
					["width"] = 1,
				}, -- [1]
			},
			["preferToUpdate"] = false,
			["adjustedMin"] = "1",
			["yOffset"] = -9,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "https://wago.io/bNtdbWZ-W/36",
			["backgroundColor"] = {
				1, -- [1]
				0, -- [2]
				0.047058823529412, -- [3]
				1, -- [4]
			},
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 45,
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0.12941176470588, -- [1]
				0.14509803921569, -- [2]
				0.14509803921569, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["iconSource"] = 0,
			["borderBackdrop"] = "Solid",
			["version"] = 36,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
				{
					["type"] = "subborder",
					["border_anchor"] = "bar",
					["border_offset"] = 0,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["border_size"] = 1,
				}, -- [2]
			},
			["height"] = 4,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "HUNTER",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["sparkBlendMode"] = "ADD",
			["backdropColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["xOffset"] = 0,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["uid"] = "3xvxzX8oqGv",
			["useAdjustededMin"] = false,
			["anchorFrameType"] = "SCREEN",
			["smoothProgress"] = false,
			["anchorFrameFrame"] = "WeakAuras:Auto Border",
			["regionType"] = "aurabar",
			["frameStrata"] = 1,
			["useAdjustededMax"] = false,
			["icon_side"] = "RIGHT",
			["id"] = "Global Cooldown",
			["sparkHeight"] = 30,
			["texture"] = "Blizzard Raid Bar",
			["spark"] = false,
			["zoom"] = 0,
			["semver"] = "1.1.11",
			["tocversion"] = 20501,
			["sparkHidden"] = "NEVER",
			["icon"] = false,
			["alpha"] = 1,
			["width"] = 252,
			["sparkOffsetY"] = 0,
			["config"] = {
				["gcd"] = true,
			},
			["inverse"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "spell",
						["unevent"] = "auto",
						["event"] = "Global Cooldown",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["use_unit"] = true,
						["names"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "custom",
						["use_alwaystrue"] = true,
						["custom_type"] = "status",
						["event"] = "Conditions",
						["unit"] = "player",
						["events"] = "PLAYER_ENTERING_WORLD PLAYER_REGEN_ENABLED PLAYER_REGEN_DISABLED PLAYER_TARGET_CHANGED PLAYER_ALIVE PLAYER_DEAD PLAYER_UNGHOST",
						["check"] = "event",
						["use_unit"] = true,
						["custom"] = "function()\n    if aura_env.config[\"gcd\"] then\n        return true\n    end\nend",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				{
					["trigger"] = {
						["type"] = "unit",
						["use_alwaystrue"] = true,
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
						["event"] = "Conditions",
						["use_unit"] = true,
					},
					["untrigger"] = {
					},
				}, -- [3]
				["disjunctive"] = "any",
				["customTriggerLogic"] = "function(t) \n    return t[2]\nend",
				["activeTriggerMode"] = 1,
			},
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "OR",
						["checks"] = {
							{
								["trigger"] = -1,
								["variable"] = "incombat",
								["value"] = 0,
							}, -- [1]
							{
								["trigger"] = 2,
								["variable"] = "show",
								["value"] = 0,
							}, -- [2]
						},
					},
					["changes"] = {
						{
							["value"] = {
								0.10196078431373, -- [1]
								0.10196078431373, -- [2]
								0.10196078431373, -- [3]
								1, -- [4]
							},
							["property"] = "backgroundColor",
						}, -- [1]
						{
							["value"] = {
								0.10196078431373, -- [1]
								0.10196078431373, -- [2]
								0.10196078431373, -- [3]
								1, -- [4]
							},
							["property"] = "barColor",
						}, -- [2]
					},
				}, -- [1]
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["parent"] = "TBC Hunter Castbar",
		},
		["Eat & Run, Mana & Health Regen Tick"] = {
			["controlledChildren"] = {
				"Mana_Tick", -- [1]
				"Health_Tick", -- [2]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = -213.9605712890625,
			["preferToUpdate"] = false,
			["yOffset"] = -54.58831787109375,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "https://wago.io/DgEh8a3hj/1",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["unit"] = "player",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 45,
			["selfPoint"] = "BOTTOMLEFT",
			["desc"] = "물빵런용 ManaTick - 좌상탄열발이상무",
			["version"] = 1,
			["subRegions"] = {
			},
			["load"] = {
				["use_class"] = "false",
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["semver"] = "1.0.0",
			["tocversion"] = 11401,
			["id"] = "Eat & Run, Mana & Health Regen Tick",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["borderInset"] = 1,
			["uid"] = "5jU65os9pVv",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["config"] = {
			},
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
				["groupOffset"] = true,
			},
			["authorOptions"] = {
			},
		},
		["Flee"] = {
			["iconSource"] = 0,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["customText"] = "function()\n    if(aura_env.dmg < 100) then\n        return \"\"\n    end\n    \n    return aura_env.dmg\nend",
			["yOffset"] = -148.5181274414063,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["customTextUpdate"] = "update",
			["url"] = "https://wago.io/5CfpXpNIu/4",
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["use_amount"] = false,
						["use_destRaidFlags"] = false,
						["unit"] = "player",
						["destUnit"] = "player",
						["names"] = {
						},
						["use_unit"] = true,
						["use_destName"] = false,
						["custom_hide"] = "custom",
						["debuffType"] = "HELPFUL",
						["duration"] = "1",
						["type"] = "custom",
						["events"] = "COMBAT_LOG_EVENT_UNFILTERED ",
						["subeventSuffix"] = "_DAMAGE",
						["custom"] = "function(event, _, event2, _, _, src_unit, _, _, _, target_unit, _, _, _, aura_name, _, damage, _, missed)\n    \n    if(event ~= \"COMBAT_LOG_EVENT_UNFILTERED\") then\n        return false \n    end\n    \n    local player_name = select(1,UnitName(\"player\"))\n    if(src_unit ~= player_name or target_unit ~= player_name) then\n        return false\n    end\n    \n    if(select(10, AuraUtil.FindAuraByName(aura_name, \"player\")) ~= 5024) then\n        return false\n    end\n    \n    if(event2 == \"SPELL_AURA_APPLIED\") then\n        return true\n    end\n    \n    if(event2 ==\"SPELL_PERIODIC_DAMAGE\") then\n        aura_env.dmg = damage;\n        return false\n    end\n    \n    if(event2 == \"SPELL_PERIODIC_MISSED\") then\n        aura_env.dmg = missed;\n        return false\n    end\n    \nend",
						["spellName"] = "Flee",
						["event"] = "Combat Log",
						["unevent"] = "timed",
						["customDuration"] = "function()\n    local duration, expirationTime = select(5, WA_GetUnitBuff(\"player\", 5024))\n    return duration, expirationTime\nend",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_sourceUnit"] = true,
						["custom_type"] = "event",
						["use_destUnit"] = true,
						["sourceUnit"] = "player",
						["subeventPrefix"] = "SPELL_PERIODIC",
					},
					["untrigger"] = {
						["custom"] = "function(event, _, event2, _, _, src_unit, _, _, _, target_unit, _, _, _, aura_name, _, damage)\n    \n    if(event ~= \"COMBAT_LOG_EVENT_UNFILTERED\") then\n        return false\n    end\n    \n    if(event2 ~= \"SPELL_AURA_REMOVED\") then\n        return false\n    end\n    \n    local player_name = select(1,UnitName(\"player\"))\n    if(src_unit ~= player_name or target_unit ~= player_name) then\n        return false\n    end\n    \n    if(aura_name ~= select(1, GetSpellInfo(5024))) then\n        return false\n    end    \n    \n    aura_env.dmg = 0\n    return true\nend",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 4,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						0.98823529411765, -- [2]
						0.95294117647059, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_anchorYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "OUTER_BOTTOM",
					["text_fontType"] = "OUTLINE",
					["text_fontSize"] = 20,
					["anchorXOffset"] = 0,
					["text_shadowYOffset"] = 0,
				}, -- [1]
			},
			["height"] = 64,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["xOffset"] = -418.0267333984375,
			["zoom"] = 0,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["colorB"] = 0.89411764705882,
					["colorG"] = 0.97647058823529,
					["type"] = "custom",
					["easeType"] = "none",
					["scaley"] = 1,
					["alpha"] = 0,
					["colorA"] = 1,
					["y"] = 0,
					["colorType"] = "custom",
					["x"] = 0,
					["easeStrength"] = 3,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    \n    if(aura_env.dmg < 100) then\n        return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n    \n    progress =  (aura_env.dmg - 100) / 400\n    return WeakAuras.GetHSVTransition(progress, 0, 255, 0, 255, 255, 0, 0, 255)\nend",
					["rotate"] = 0,
					["scalex"] = 1,
					["use_color"] = true,
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["regionType"] = "icon",
			["actions"] = {
				["start"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.dmg = 0",
					["do_custom"] = true,
				},
			},
			["_table"] = "d",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["conditions"] = {
			},
			["uid"] = "JEc1raRC6LY",
			["anchorFrameType"] = "SCREEN",
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.3",
			["tocversion"] = 11401,
			["id"] = "Flee",
			["alpha"] = 1,
			["frameStrata"] = 1,
			["width"] = 64,
			["auto"] = false,
			["config"] = {
			},
			["inverse"] = false,
			["cooldownEdge"] = false,
			["displayIcon"] = 135996,
			["cooldown"] = true,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Hunter::Trueshot Aura"] = {
			["iconSource"] = -1,
			["authorOptions"] = {
			},
			["yOffset"] = -175,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_START",
						["matchesShowOn"] = "showAlways",
						["event"] = "Health",
						["unit"] = "player",
						["spellIds"] = {
						},
						["auranames"] = {
							"Trueshot Aura", -- [1]
						},
						["useName"] = true,
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["customTriggerLogic"] = "function(trigger)\n  return trigger[1]\nend",
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [1]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["glowXOffset"] = 0,
					["glowType"] = "Pixel",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useGlowColor"] = false,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [2]
			},
			["height"] = 24,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["regionType"] = "icon",
			["information"] = {
			},
			["xOffset"] = 0,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.2.glow",
						}, -- [1]
					},
				}, -- [1]
			},
			["icon"] = true,
			["zoom"] = 0.3,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["uid"] = "Mc7pKIzlpTy",
			["id"] = "Hunter::Trueshot Aura",
			["width"] = 48,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["config"] = {
			},
			["inverse"] = false,
			["cooldownTextDisabled"] = false,
			["displayIcon"] = 136076,
			["cooldown"] = true,
			["parent"] = "Hunter",
		},
		["Hunter"] = {
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["controlledChildren"] = {
				"New", -- [1]
				"Hunter::Ammo", -- [2]
				"Hunter::Aimed Shot", -- [3]
				"Hunter::Multi-Shot", -- [4]
				"Hunter::Serpent Sting", -- [5]
				"Hunter::Scatter Shot", -- [6]
				"Hunter::Aspect", -- [7]
				"Hunter::Hunter's Mark", -- [8]
				"Hunter::Trueshot Aura", -- [9]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["authorOptions"] = {
			},
			["yOffset"] = 0,
			["border"] = false,
			["groupIcon"] = 132212,
			["anchorPoint"] = "CENTER",
			["borderSize"] = 2,
			["selfPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["scale"] = 1,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["names"] = {
						},
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["regionType"] = "group",
			["internalVersion"] = 45,
			["xOffset"] = 0,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["id"] = "Hunter",
			["borderEdge"] = "Square Full White",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["borderOffset"] = 4,
			["uid"] = "yX7qrbCvaga",
			["config"] = {
			},
			["subRegions"] = {
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["borderInset"] = 1,
		},
		["Mana_Tick"] = {
			["sparkWidth"] = 7,
			["iconSource"] = -1,
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "https://wago.io/DgEh8a3hj/1",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["triggers"] = {
				{
					["trigger"] = {
						["custom_hide"] = "custom",
						["type"] = "custom",
						["unevent"] = "timed",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["duration"] = "2",
						["event"] = "Chat Message",
						["dynamicDuration"] = false,
						["customDuration"] = "",
						["names"] = {
						},
						["events"] = "UNIT_POWER_UPDATE, COMBAT_LOG_EVENT_UNFILTERED",
						["custom_type"] = "event",
						["spellIds"] = {
						},
						["custom"] = "function(event, ...)\n    if event == \"UNIT_POWER_UPDATE\" then\n        if (aura_env.currentPower < UnitPower(\"player\")) then\n            if aura_env.ignorePowerChange then\n                aura_env.ignorePowerChange = false\n            else\n                aura_env.startTimeTicks = GetTime()\n            end\n        end\n        aura_env.currentPower = UnitPower(\"player\")\n    elseif event == \"COMBAT_LOG_EVENT_UNFILTERED\" then\n        local clEvent = select(2, ...)\n        local unitID = select(8, ...)\n        if aura_env.ignoreEvents[clEvent] and unitID == UnitGUID(\"player\") then\n            aura_env.ignorePowerChange = true\n        end\n    end\n    return false\nend\n",
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "custom",
						["custom"] = "function(allstates)\n    if WeakAuras.IsOptionsOpen() then\n        aura_env.pause = true\n    else\n        if (aura_env.pause) then\n            aura_env.startTimeTicks = aura_env.startTimeTicks + (math.floor((GetTime() - aura_env.startTimeTicks) / 2) * 2)\n            aura_env.pause = false\n        end\n        \n        local time = GetTime()\n        local Position\n        local timeDiff = time - aura_env.startTimeTicks\n        \n        Position = (timeDiff / 2)\n        \n        if timeDiff > 2 then\n            aura_env.startTimeTicks = GetTime()\n        end\n        \n        allstates[1] = {\n            changed = true,\n            show = true,\n            progressType = \"static\",\n            value = Position,\n            total = 1\n        }\n    end\n    return true\nend\n\n\n",
						["subeventSuffix"] = "_CAST_START",
						["check"] = "update",
						["custom_type"] = "stateupdate",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 45,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["authorOptions"] = {
			},
			["barColor"] = {
				0.60392156862745, -- [1]
				0.8078431372549, -- [2]
				0.87450980392157, -- [3]
				0, -- [4]
			},
			["desaturate"] = false,
			["desc"] = "물빵런용 ManaTick - 좌상탄열발이상무",
			["version"] = 1,
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
			},
			["height"] = 20,
			["selfPoint"] = "CENTER",
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["level_operator"] = ">",
				["use_class"] = false,
				["zoneIds"] = "",
				["spec"] = {
					["multi"] = {
					},
				},
				["use_level"] = false,
				["level"] = "2",
				["class"] = {
					["single"] = "DRUID",
					["multi"] = {
						["HUNTER"] = true,
						["WARLOCK"] = true,
						["SHAMAN"] = true,
						["MAGE"] = true,
						["DRUID"] = true,
						["PALADIN"] = true,
						["PRIEST"] = true,
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["icon"] = false,
			["sparkColor"] = {
				0.60392156862745, -- [1]
				0.8078431372549, -- [2]
				0.87450980392157, -- [3]
				1, -- [4]
			},
			["color"] = {
			},
			["config"] = {
			},
			["spark"] = true,
			["anchorFrameType"] = "SELECTFRAME",
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["frameStrata"] = 5,
			["zoom"] = 0,
			["icon_side"] = "RIGHT",
			["id"] = "Mana_Tick",
			["sparkHeight"] = 20,
			["texture"] = "Details Flat",
			["auto"] = true,
			["sparkTexture"] = "honorsystem-bar-spark",
			["semver"] = "1.0.0",
			["tocversion"] = 11401,
			["sparkHidden"] = "NEVER",
			["anchorFrameFrame"] = "PlayerFrameManaBar",
			["alpha"] = 1,
			["width"] = 114,
			["sparkOffsetX"] = 0,
			["uid"] = "bVFd2ob1yWM",
			["inverse"] = false,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.startTimeTicks = aura_env.startTimeTicks or GetTime()\naura_env.ignorePowerChange = false\naura_env.pause = aura_env.pause or false\naura_env.currentPower = UnitPower(\"player\")\naura_env.ignoreEvents = {\n    [\"SPELL_ENERGIZE\"] = true,\n    [\"SPELL_DRAIN\"] = true,\n    [\"SPELL_LEECH\"] = true,\n    [\"SPELL_PERIODIC_ENERGIZE\"] = true,\n    [\"SPELL_PERIODIC_DRAIN\"] = true,\n    [\"SPELL_PERIODIC_LEECH\"] = true\n}",
					["do_custom"] = true,
				},
			},
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["parent"] = "Eat & Run, Mana & Health Regen Tick",
		},
		["Abolish"] = {
			["iconSource"] = -1,
			["xOffset"] = -161.64208984375,
			["preferToUpdate"] = false,
			["yOffset"] = -245.3334655761719,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["useName"] = true,
						["auranames"] = {
							"Abolish Poison", -- [1]
						},
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["unit"] = "player",
						["unitExists"] = false,
						["subeventSuffix"] = "_CAST_START",
						["spellIds"] = {
						},
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["ownOnly"] = true,
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 45,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [1]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [2]
			},
			["height"] = 40,
			["load"] = {
				["use_class"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "DRUID",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["information"] = {
			},
			["cooldownTextDisabled"] = false,
			["zoom"] = 0,
			["authorOptions"] = {
			},
			["tocversion"] = 11401,
			["id"] = "Abolish",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["uid"] = "mkvxeGPfwju",
			["config"] = {
			},
			["inverse"] = false,
			["width"] = 40,
			["conditions"] = {
			},
			["cooldown"] = true,
			["icon"] = true,
		},
	},
	["lastArchiveClear"] = 1637103670,
	["minimap"] = {
		["minimapPos"] = 215.5072470323842,
		["hide"] = false,
	},
	["lastUpgrade"] = 1637103779,
	["dbVersion"] = 45,
	["login_squelch_time"] = 10,
	["registered"] = {
	},
	["frame"] = {
		["xOffset"] = -110.177001953125,
		["yOffset"] = -262.950927734375,
		["height"] = 664.9999389648438,
		["width"] = 829.9999389648438,
	},
	["editor_theme"] = "Monokai",
}
