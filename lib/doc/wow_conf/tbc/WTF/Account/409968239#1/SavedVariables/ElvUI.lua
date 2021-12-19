
ElvDB = {
	["profileKeys"] = {
		["Machiavellia - Firemaw"] = "Ultrawide",
		["Ges - Firemaw"] = "Ges - Firemaw",
		["Slamwarrior - Firemaw"] = "Slamwarrior - Firemaw",
		["Algorithm - Firemaw"] = "Algorithm - Firemaw",
		["Gæs - Firemaw"] = "Default",
		["Baldhumanman - Firemaw"] = "Baldhumanman - Firemaw",
		["Gehs - Firemaw"] = "Ultrawide",
		["Hasteshill - Earthshaker"] = "Hasteshill - Earthshaker",
		["Coomerchamp - Firemaw"] = "Coomerchamp - Firemaw",
		["Bottomline - Firemaw"] = "Bottomline - Firemaw",
		["Gesbank - Firemaw"] = "Gesbank - Firemaw",
		["Benfinegold - Firemaw"] = "Benfinegold - Firemaw",
		["Hgyoibhiluhn - Firemaw"] = "Hgyoibhiluhn - Firemaw",
	},
	["DisabledAddOns"] = {
	},
	["serverID"] = {
		[4467] = {
			["Firemaw"] = true,
		},
	},
	["class"] = {
		["Firemaw"] = {
			["Ges"] = "WARRIOR",
			["Machiavellia"] = "PALADIN",
			["Baldhumanman"] = "WARRIOR",
			["Algorithm"] = "SHAMAN",
			["Slamwarrior"] = "WARRIOR",
			["Gæs"] = "ROGUE",
			["Gesbank"] = "WARLOCK",
			["Benfinegold"] = "MAGE",
			["Gehs"] = "DRUID",
			["Coomerchamp"] = "WARRIOR",
			["Bottomline"] = "WARRIOR",
			["Hgyoibhiluhn"] = "WARRIOR",
		},
		["Earthshaker"] = {
			["Hasteshill"] = "WARRIOR",
		},
	},
	["profiles"] = {
		["Warrior"] = {
			["v11NamePlateReset"] = true,
		},
		["Default"] = {
			["databars"] = {
				["reputation"] = {
					["enable"] = true,
					["orientation"] = "HORIZONTAL",
				},
				["experience"] = {
					["orientation"] = "HORIZONTAL",
					["width"] = 350,
				},
				["petExperience"] = {
					["orientation"] = "HORIZONTAL",
					["textSize"] = 12,
					["width"] = 350,
				},
			},
			["currentTutorial"] = 5,
			["general"] = {
				["totems"] = {
					["spacing"] = 8,
					["growthDirection"] = "HORIZONTAL",
					["size"] = 51,
				},
				["bottomPanel"] = false,
				["bonusObjectivePosition"] = "AUTO",
				["valuecolor"] = {
					["r"] = 1,
					["g"] = 0.96,
					["b"] = 0.41,
				},
				["autoAcceptInvite"] = true,
				["objectiveFrameHeight"] = 400,
				["talkingHeadFrameScale"] = 1,
				["minimap"] = {
					["size"] = 221,
				},
			},
			["movers"] = {
				["ThreatBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,285,286",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-285,302",
				["ElvUF_RaidMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,5",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,4",
				["GMMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-760,41",
				["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-959,-4",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "TOP,ElvUIParent,TOP,0,-139",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["ElvUF_FocusMover"] = "TOP,ElvUIParent,TOP,-438,-125",
				["ElvUF_AssistMover"] = "BOTTOM,ElvUIParent,BOTTOM,-450,247",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,503,243",
				["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-285,286",
				["DurabilityFrameMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,511,346",
				["ElvUF_PetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-500,394",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,-69,-4",
				["ExperienceBarMover"] = "TOP,ElvUIParent,TOP,0,-4",
				["ElvUF_PartyMover"] = "TOP,ElvUIParent,TOP,-441,-274",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,285,233",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,840,191",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-503,351",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,0,-67",
				["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,-627,4",
				["ElvAB_1"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,30,157",
				["ElvAB_2"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,20,233",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-763,-260",
				["ElvAB_4"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-202,42",
				["QuestTimerFrameMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-792,339",
				["ElvAB_6"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-202,80",
				["PetExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,53",
				["ElvAB_3"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,21,195",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-717,-249",
				["VehicleLeaveButton"] = "TOP,ElvUIParent,TOP,-356,-510",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,285,302",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,769",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-735,437",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
				["ElvUF_Raid40Mover"] = "BOTTOM,ElvUIParent,BOTTOM,0,5",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ArenaHeaderMover"] = "TOP,ElvUIParent,TOP,663,-269",
				["ElvAB_5"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-202,4",
				["ElvUF_TankMover"] = "TOP,ElvUIParent,TOP,-441,-298",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-285,233",
				["QuestWatchFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-599,-399",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
				["TimeManagerFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-4",
				["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-959,-174",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-716,-4",
			},
			["convertPages"] = true,
			["v11NamePlateReset"] = true,
			["chat"] = {
				["tabSelector"] = "ARROW",
				["keywordSound"] = "Punch",
				["timeStampFormat"] = "%H:%M ",
				["keywords"] = "",
				["panelSnapLeftID"] = 1,
				["panelSnapRightID"] = 3,
				["panelColorConverted"] = true,
				["panelHeight"] = 296,
				["copyChatLines"] = true,
				["font"] = "Expressway",
				["tapFontSize"] = 10,
				["panelWidth"] = 472,
			},
			["tooltip"] = {
				["healthBar"] = {
					["height"] = 12,
					["fontOutline"] = "MONOCHROMEOUTLINE",
				},
				["fontSize"] = 10,
			},
			["dbConverted"] = 2.29,
			["bags"] = {
				["bagSize"] = 42,
				["bankWidth"] = 474,
				["scrapIcon"] = true,
				["bankSize"] = 42,
				["shownBags"] = {
					["bag-2"] = false,
				},
				["bagWidth"] = 474,
			},
			["actionbar"] = {
				["bar3"] = {
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["buttonSize"] = 40,
					["buttons"] = 12,
				},
				["bar6"] = {
					["buttonSpacing"] = 1,
					["buttonSize"] = 40,
				},
				["bar2"] = {
					["buttonSize"] = 40,
				},
				["bar1"] = {
					["enabled"] = false,
					["buttonSpacing"] = 1,
					["buttonSize"] = 40,
				},
				["bar8"] = {
					["buttonSize"] = 40,
				},
				["bar5"] = {
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["buttonSize"] = 40,
					["buttons"] = 12,
				},
				["lockActionBars"] = false,
				["backdropSpacingConverted"] = true,
				["bar10"] = {
					["buttonSize"] = 40,
				},
				["bar7"] = {
					["buttonSize"] = 40,
				},
				["keyDown"] = false,
				["bar9"] = {
					["buttonSize"] = 40,
				},
				["stanceBar"] = {
					["enabled"] = false,
				},
				["microbar"] = {
					["buttons"] = 8,
				},
				["bar4"] = {
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["backdrop"] = false,
					["buttonSize"] = 40,
				},
			},
			["nameplates"] = {
				["units"] = {
					["TARGET"] = {
						["classpower"] = {
							["enable"] = true,
						},
					},
					["ENEMY_NPC"] = {
						["debuffs"] = {
							["enable"] = false,
						},
					},
				},
			},
			["unitframe"] = {
				["fontSize"] = 18,
				["colors"] = {
					["colorhealthbyvalue"] = false,
					["auraBarBuff"] = {
						["r"] = 0.78,
						["g"] = 0.61,
						["b"] = 0.43,
					},
					["castClassColor"] = true,
					["healthclass"] = true,
				},
				["smoothbars"] = true,
				["statusbar"] = "Minimalist",
				["units"] = {
					["player"] = {
						["debuffs"] = {
							["enable"] = false,
							["attachTo"] = "BUFFS",
						},
						["castbar"] = {
							["height"] = 32,
							["insideInfoPanel"] = false,
							["icon"] = false,
							["width"] = 200,
						},
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["width"] = 200,
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["enable"] = false,
							["height"] = 22,
						},
						["colorOverride"] = "FORCE_ON",
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[health:current]",
							["bgUseBarTexture"] = false,
						},
						["height"] = 50,
						["orientation"] = "MIDDLE",
						["buffs"] = {
							["attachTo"] = "FRAME",
						},
						["classbar"] = {
							["detachFromFrame"] = true,
							["detachedWidth"] = 200,
							["height"] = 12,
						},
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["raid40"] = {
						["height"] = 24,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["name"] = {
							["text_format"] = "",
						},
						["health"] = {
							["text_format"] = "",
						},
					},
					["party"] = {
						["horizontalSpacing"] = 17,
						["debuffs"] = {
							["xOffset"] = -25,
							["sizeOverride"] = 20,
							["perrow"] = 1,
						},
						["castbar"] = {
							["enable"] = true,
							["width"] = 170,
						},
						["healPrediction"] = {
							["enable"] = true,
						},
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["growthDirection"] = "DOWN_RIGHT",
						["width"] = 170,
						["name"] = {
							["text_format"] = "",
						},
						["health"] = {
							["text_format"] = "",
						},
						["height"] = 80,
						["orientation"] = "MIDDLE",
						["buffIndicator"] = {
							["countFontSize"] = 20,
							["size"] = 16,
						},
						["petsGroup"] = {
							["name"] = {
								["text_format"] = "",
							},
							["healPrediction"] = {
								["enable"] = true,
							},
							["enable"] = true,
							["buffIndicator"] = {
								["size"] = 16,
							},
							["height"] = 80,
							["width"] = 80,
						},
						["power"] = {
							["height"] = 22,
							["powerPrediction"] = true,
							["text_format"] = "",
							["position"] = "BOTTOMRIGHT",
						},
					},
					["target"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["powerPrediction"] = true,
							["xOffset"] = 3,
							["yOffset"] = 5,
							["strataAndLevel"] = {
								["frameLevel"] = 2,
							},
							["autoHide"] = true,
							["height"] = 9,
							["width"] = "inset",
							["detachedWidth"] = 22,
						},
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["width"] = 200,
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
							["yOffset"] = 5,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 0,
							["text_format"] = "[health:current]",
							["yOffset"] = 5,
						},
						["castbar"] = {
							["height"] = 32,
							["insideInfoPanel"] = false,
							["width"] = 200,
						},
						["orientation"] = "MIDDLE",
						["buffs"] = {
							["anchorPoint"] = "BOTTOMRIGHT",
						},
						["height"] = 50,
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["xOffset"] = 0,
							["size"] = 12,
						},
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 2,
							["text_format"] = "",
							["position"] = "BOTTOMLEFT",
						},
						["health"] = {
							["frequentUpdates"] = true,
							["text_format"] = "",
						},
						["height"] = 40,
						["rdebuffs"] = {
							["xOffset"] = 30,
							["font"] = "PT Sans Narrow",
							["yOffset"] = 25,
							["size"] = 30,
						},
						["numGroups"] = 8,
						["growthDirection"] = "RIGHT_UP",
					},
					["pet"] = {
						["infoPanel"] = {
							["height"] = 14,
						},
						["debuffs"] = {
							["enable"] = true,
							["anchorPoint"] = "TOPRIGHT",
						},
						["disableTargetGlow"] = false,
						["castbar"] = {
							["iconSize"] = 32,
						},
						["width"] = 270,
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
							["anchorPoint"] = "TOPRIGHT",
						},
						["threatStyle"] = "GLOW",
						["power"] = {
							["enable"] = false,
						},
						["height"] = 32,
						["width"] = 150,
						["disableMouseoverGlow"] = true,
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["xOffset"] = 2,
							["enable"] = false,
							["yOffset"] = 0,
						},
					},
				},
			},
			["layoutSet"] = "tank",
			["auras"] = {
				["buffs"] = {
					["size"] = 40,
					["seperateOwn"] = 0,
					["sortMethod"] = "INDEX",
				},
				["debuffs"] = {
					["size"] = 40,
				},
			},
		},
		["Minimalistic"] = {
			["currentTutorial"] = 2,
			["general"] = {
				["font"] = "Expressway",
				["bottomPanel"] = false,
				["backdropfadecolor"] = {
					["a"] = 0.80000001192093,
					["r"] = 0.058823529411765,
					["g"] = 0.058823529411765,
					["b"] = 0.058823529411765,
				},
				["reputation"] = {
					["orientation"] = "HORIZONTAL",
					["textFormat"] = "PERCENT",
					["height"] = 16,
					["width"] = 200,
				},
				["bordercolor"] = {
					["r"] = 0.30588235294118,
					["g"] = 0.30588235294118,
					["b"] = 0.30588235294118,
				},
				["valuecolor"] = {
					["a"] = 1,
					["r"] = 1,
					["g"] = 1,
					["b"] = 1,
				},
				["fontSize"] = 11,
			},
			["movers"] = {
				["PetAB"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-428",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,51,120",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,50,50",
				["GMMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,250,-50",
				["BossButton"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-117,-298",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,249,-216",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,827",
				["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-52",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,51,-87",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,143",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,392,1073",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,50",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,90",
				["ElvAB_4"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-394",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,0,-186",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,305,50",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-305,50",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-50",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,230,140",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-122,-393",
				["BNETMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,50,232",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,1150",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,133",
				["ElvUF_PartyMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,184,773",
				["ElvAB_6"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-488,330",
				["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-50,50",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,995",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,463,50",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,200",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-230,140",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-50,50",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,0,-50",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-228",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,51,937",
			},
			["bags"] = {
				["itemLevelFontSize"] = 9,
				["countFontSize"] = 9,
			},
			["hideTutorial"] = true,
			["auras"] = {
				["font"] = "Expressway",
				["buffs"] = {
					["countFontSize"] = 11,
					["maxWraps"] = 2,
					["durationFontSize"] = 11,
				},
				["debuffs"] = {
					["countFontSize"] = 11,
					["durationFontSize"] = 11,
				},
			},
			["unitframe"] = {
				["statusbar"] = "ElvUI Blank",
				["fontOutline"] = "THICKOUTLINE",
				["smoothbars"] = true,
				["font"] = "Expressway",
				["fontSize"] = 9,
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["targettarget"] = {
						["infoPanel"] = {
							["enable"] = true,
						},
						["debuffs"] = {
							["enable"] = false,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["yOffset"] = -2,
							["position"] = "TOP",
						},
						["height"] = 50,
						["width"] = 122,
					},
					["pet"] = {
						["infoPanel"] = {
							["enable"] = true,
							["height"] = 14,
						},
						["debuffs"] = {
							["enable"] = true,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["width"] = 122,
						},
						["height"] = 50,
						["portrait"] = {
							["camDistanceScale"] = 2,
						},
						["width"] = 122,
					},
					["party"] = {
						["horizontalSpacing"] = 3,
						["debuffs"] = {
							["numrows"] = 4,
							["anchorPoint"] = "BOTTOM",
							["perrow"] = 1,
						},
						["power"] = {
							["text_format"] = "",
							["height"] = 5,
						},
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "Expressway",
						},
						["growthDirection"] = "RIGHT_DOWN",
						["infoPanel"] = {
							["enable"] = true,
						},
						["roleIcon"] = {
							["position"] = "TOPRIGHT",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["orientation"] = "VERTICAL",
							["text_format"] = "[healthcolor][health:current]",
							["position"] = "RIGHT",
						},
						["healPrediction"] = true,
						["height"] = 59,
						["verticalSpacing"] = 0,
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name:short]",
							["position"] = "LEFT",
						},
						["width"] = 110,
					},
					["player"] = {
						["infoPanel"] = {
							["enable"] = true,
						},
						["debuffs"] = {
							["perrow"] = 7,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current-max]",
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[powercolor][power:current-max]",
							["height"] = 15,
						},
						["height"] = 80,
						["castbar"] = {
							["iconAttached"] = false,
							["iconSize"] = 54,
							["height"] = 35,
							["width"] = 478,
						},
						["classbar"] = {
							["height"] = 15,
							["autoHide"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
					},
					["raid40"] = {
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "Expressway",
						},
					},
					["focus"] = {
						["infoPanel"] = {
							["height"] = 17,
							["enable"] = true,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["iconSize"] = 26,
							["width"] = 122,
						},
						["height"] = 56,
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["position"] = "LEFT",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current]",
						},
						["width"] = 189,
					},
					["target"] = {
						["debuffs"] = {
							["perrow"] = 7,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["hideonnpc"] = false,
							["text_format"] = "[powercolor][power:current-max]",
							["height"] = 15,
						},
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
						["castbar"] = {
							["iconSize"] = 54,
							["iconAttached"] = false,
						},
						["height"] = 80,
						["buffs"] = {
							["perrow"] = 7,
						},
						["smartAuraPosition"] = "DEBUFFS_ON_BUFFS",
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current-max]",
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["position"] = "RIGHT",
						},
						["debuffs"] = {
							["enable"] = true,
							["sizeOverride"] = 27,
							["perrow"] = 4,
						},
						["rdebuffs"] = {
							["enable"] = false,
							["font"] = "Expressway",
						},
						["growthDirection"] = "UP_RIGHT",
						["health"] = {
							["yOffset"] = -6,
						},
						["width"] = 140,
						["height"] = 28,
						["name"] = {
							["position"] = "LEFT",
						},
						["visibility"] = "[nogroup] hide;show",
						["groupsPerRowCol"] = 5,
					},
					["arena"] = {
						["castbar"] = {
							["width"] = 246,
						},
						["spacing"] = 26,
					},
					["assist"] = {
						["enable"] = false,
					},
				},
			},
			["datatexts"] = {
				["minimapPanels"] = false,
				["fontSize"] = 11,
				["leftChatPanel"] = false,
				["goldFormat"] = "SHORT",
				["panelTransparency"] = true,
				["font"] = "Expressway",
				["panels"] = {
					["BottomMiniPanel"] = "Time",
					["RightMiniPanel"] = "",
					["RightChatDataPanel"] = {
						["right"] = "",
						["left"] = "",
						["middle"] = "",
					},
					["LeftMiniPanel"] = "",
					["LeftChatDataPanel"] = {
						["right"] = "",
						["left"] = "",
						["middle"] = "",
					},
				},
				["rightChatPanel"] = false,
			},
			["actionbar"] = {
				["bar3"] = {
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
					["buttonsPerRow"] = 3,
				},
				["fontSize"] = 9,
				["bar2"] = {
					["enabled"] = true,
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
				},
				["bar1"] = {
					["heightMult"] = 2,
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
				},
				["bar5"] = {
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
					["buttonsPerRow"] = 3,
				},
				["globalFadeAlpha"] = 0.87,
				["stanceBar"] = {
					["inheritGlobalFade"] = true,
				},
				["bar6"] = {
					["buttonsize"] = 38,
				},
				["bar4"] = {
					["enabled"] = false,
					["backdrop"] = false,
					["buttonsize"] = 38,
				},
			},
			["layoutSet"] = "dpsMelee",
			["chat"] = {
				["chatHistory"] = false,
				["fontSize"] = 11,
				["tabFont"] = "Expressway",
				["tabFontSize"] = 11,
				["fadeUndockedTabs"] = false,
				["editBoxPosition"] = "ABOVE_CHAT",
				["fadeTabsNoBackdrop"] = false,
				["font"] = "Expressway",
				["panelBackdrop"] = "HIDEBOTH",
			},
			["tooltip"] = {
				["textFontSize"] = 11,
				["font"] = "Expressway",
				["healthBar"] = {
					["font"] = "Expressway",
				},
				["smallTextFontSize"] = 11,
				["fontSize"] = 11,
				["headerFontSize"] = 11,
			},
			["nameplates"] = {
				["filters"] = {
				},
			},
		},
		["Hasteshill - Earthshaker"] = {
			["databars"] = {
				["reputation"] = {
					["enable"] = true,
					["orientation"] = "HORIZONTAL",
					["height"] = 10,
					["width"] = 222,
				},
				["experience"] = {
					["height"] = 10,
					["orientation"] = "HORIZONTAL",
					["textSize"] = 12,
					["width"] = 348,
				},
			},
			["currentTutorial"] = 2,
			["general"] = {
				["valuecolor"] = {
					["r"] = 0.78,
					["g"] = 0.61,
					["b"] = 0.43,
				},
				["bordercolor"] = {
					["r"] = 0,
					["g"] = 0,
					["b"] = 0,
				},
				["minimap"] = {
					["size"] = 220,
				},
			},
			["movers"] = {
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-248",
				["ElvAB_8"] = "BOTTOM,ElvUI_Bar1,TOP,0,122",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,95",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,-1,-18",
				["PetAB"] = "RIGHT,ElvUI_Bar4,LEFT,-4,0",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,4",
				["GMMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,250,-5",
				["BuffsMover"] = "TOPRIGHT,MMHolder,TOPLEFT,-6,-1",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,139",
				["MirrorTimer3Mover"] = "TOP,MirrorTimer2,BOTTOM,0,0",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,418,-186",
				["QuestWatchFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-135,-300",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,490,4",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-48",
				["ElvAB_10"] = "BOTTOM,ElvUI_Bar1,TOP,0,202",
				["ElvUF_FocusMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,59",
				["ElvAB_6"] = "BOTTOM,ElvUI_Bar2,TOP,0,2",
				["ElvNP_PlayerMover"] = "TOP,UIParent,CENTER,0,-150",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,100",
				["DurabilityFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-135,-300",
				["ElvUF_PetCastbarMover"] = "TOPLEFT,ElvUF_Pet,BOTTOMLEFT,0,-1",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,769",
				["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,43",
				["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["ElvUIBankMover"] = "BOTTOMLEFT,LeftChatPanel,BOTTOMLEFT,0,25",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,507",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,482",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96",
				["ElvAB_4"] = "RIGHT,ElvUIParent,RIGHT,-4,0",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,-1,191",
				["ElvAB_9"] = "BOTTOM,ElvUI_Bar1,TOP,0,162",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["AzeriteBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-245",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-92,57",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,-1,139",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-264",
				["VehicleLeaveButton"] = "BOTTOM,ElvUIParent,BOTTOM,0,300",
				["QuestTimerFrameMover"] = "TOPRIGHT,MinimapCluster,BOTTOMRIGHT,0,0",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,4",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["MirrorTimer2Mover"] = "TOP,MirrorTimer1,BOTTOM,0,0",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,139",
				["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-255",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,243",
				["TooltipMover"] = "BOTTOMRIGHT,RightChatToggleButton,BOTTOMRIGHT,0,0",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-186",
				["ElvUIBagMover"] = "BOTTOMRIGHT,RightChatPanel,BOTTOMRIGHT,0,25",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,100",
				["ElvAB_7"] = "BOTTOM,ElvUI_Bar1,TOP,0,82",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
				["TimeManagerFrameMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-10,-190",
				["DebuffsMover"] = "BOTTOMRIGHT,MMHolder,BOTTOMLEFT,-6,1",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-3",
			},
			["v11NamePlateReset"] = true,
			["chat"] = {
				["panelHeight"] = 236,
				["tabFontSize"] = 10,
				["panelWidth"] = 472,
			},
			["unitframe"] = {
				["thinBorders"] = true,
				["smoothbars"] = true,
				["colors"] = {
					["auraBarBuff"] = {
						["r"] = 0.78,
						["g"] = 0.61,
						["b"] = 0.43,
					},
					["castClassColor"] = true,
					["castColor"] = {
						["r"] = 0.1,
						["g"] = 0.1,
						["b"] = 0.1,
					},
					["health"] = {
						["r"] = 0.1,
						["g"] = 0.1,
						["b"] = 0.1,
					},
					["healthclass"] = true,
				},
				["units"] = {
					["player"] = {
						["debuffs"] = {
							["perrow"] = 7,
						},
						["castbar"] = {
							["height"] = 40,
							["width"] = 405,
							["insideInfoPanel"] = false,
						},
						["healPrediction"] = {
							["showOverAbsorbs"] = false,
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
						},
						["height"] = 82,
						["buffs"] = {
							["perrow"] = 7,
						},
						["classbar"] = {
							["height"] = 14,
						},
						["aurabar"] = {
							["height"] = 26,
						},
					},
					["raid40"] = {
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
					},
					["pet"] = {
						["infoPanel"] = {
							["height"] = 14,
						},
						["debuffs"] = {
							["enable"] = true,
							["anchorPoint"] = "TOPRIGHT",
						},
						["disableTargetGlow"] = false,
						["castbar"] = {
							["iconSize"] = 32,
						},
						["width"] = 270,
					},
					["target"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["enable"] = false,
							["attachTo"] = "FRAME",
							["maxDuration"] = 0,
							["perrow"] = 7,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
						},
						["healPrediction"] = {
							["showOverAbsorbs"] = false,
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
						["orientation"] = "LEFT",
						["height"] = 82,
						["buffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["perrow"] = 7,
						},
						["castbar"] = {
							["height"] = 40,
							["width"] = 405,
							["insideInfoPanel"] = false,
						},
						["aurabar"] = {
							["height"] = 26,
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["xOffset"] = 0,
							["size"] = 12,
						},
						["rdebuffs"] = {
							["xOffset"] = 30,
							["font"] = "PT Sans Narrow",
							["size"] = 30,
							["yOffset"] = 25,
						},
						["numGroups"] = 8,
						["growthDirection"] = "RIGHT_UP",
						["infoPanel"] = {
							["enable"] = true,
						},
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 2,
							["position"] = "BOTTOMLEFT",
						},
						["visibility"] = "[@raid6,noexists] hide;show",
						["width"] = 92,
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
							["anchorPoint"] = "TOPRIGHT",
						},
						["threatStyle"] = "GLOW",
						["power"] = {
							["enable"] = false,
						},
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["xOffset"] = 2,
							["enable"] = false,
							["yOffset"] = 0,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 270,
					},
					["party"] = {
						["height"] = 74,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["width"] = 231,
						["power"] = {
							["height"] = 13,
						},
					},
				},
			},
			["auras"] = {
				["buffs"] = {
					["countFontSize"] = 10,
					["size"] = 40,
				},
				["debuffs"] = {
					["countFontSize"] = 10,
					["size"] = 40,
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonspacing"] = 1,
					["buttonsPerRow"] = 10,
					["buttonsize"] = 50,
					["buttons"] = 8,
				},
				["bar4"] = {
					["enabled"] = false,
				},
				["bar2"] = {
					["buttonspacing"] = 1,
					["enabled"] = true,
					["buttonsize"] = 38,
					["buttons"] = 9,
				},
				["bar1"] = {
					["buttonspacing"] = 1,
					["buttonsize"] = 50,
					["buttons"] = 8,
				},
				["lockActionBars"] = false,
				["bar5"] = {
					["enabled"] = false,
				},
				["keyDown"] = false,
			},
			["layoutSet"] = "tank",
			["layoutSetting"] = "tank",
			["bags"] = {
				["bagSize"] = 42,
				["bankWidth"] = 474,
				["scrapIcon"] = true,
				["itemLevelCustomColorEnable"] = true,
				["bagWidth"] = 474,
				["bankSize"] = 42,
			},
			["tooltip"] = {
				["healthBar"] = {
					["height"] = 12,
					["fontOutline"] = "MONOCHROMEOUTLINE",
				},
				["textFontSize"] = 10,
			},
		},
		["Bottomline - Firemaw"] = {
			["chat"] = {
				["panelColorConverted"] = true,
			},
			["v11NamePlateReset"] = true,
			["currentTutorial"] = 13,
			["movers"] = {
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,432",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,1093",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,195",
				["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,427",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,735",
			},
		},
		["Slamwarrior - Firemaw"] = {
			["databars"] = {
				["experience"] = {
					["orientation"] = "HORIZONTAL",
				},
				["reputation"] = {
					["enable"] = true,
					["orientation"] = "HORIZONTAL",
				},
			},
			["currentTutorial"] = 8,
			["general"] = {
				["valuecolor"] = {
					["b"] = 0.43,
					["g"] = 0.61,
					["r"] = 0.78,
				},
				["bordercolor"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
				["minimap"] = {
					["size"] = 220,
				},
			},
			["movers"] = {
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-3",
				["ElvAB_8"] = "BOTTOM,ElvUI_Bar1,TOP,0,122",
				["PetAB"] = "RIGHT,ElvUI_Bar4,LEFT,-4,0",
				["TimeManagerFrameMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-10,-190",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,95",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,4",
				["GMMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,250,-5",
				["BuffsMover"] = "TOPRIGHT,MMHolder,TOPLEFT,-6,-1",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,139",
				["MirrorTimer3Mover"] = "TOP,MirrorTimer2,BOTTOM,0,0",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,418,-186",
				["QuestWatchFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-135,-300",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,490,4",
				["ElvUIBagMover"] = "BOTTOMRIGHT,RightChatPanel,BOTTOMRIGHT,0,25",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["DurabilityFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-135,-300",
				["TooltipMover"] = "BOTTOMRIGHT,RightChatToggleButton,BOTTOMRIGHT,0,0",
				["ElvUF_FocusMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,59",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,243",
				["ElvNP_PlayerMover"] = "TOP,UIParent,CENTER,0,-150",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,100",
				["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-48",
				["ElvUF_PetCastbarMover"] = "TOPLEFT,ElvUF_Pet,BOTTOMLEFT,0,-1",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,769",
				["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,43",
				["MirrorTimer2Mover"] = "TOP,MirrorTimer1,BOTTOM,0,0",
				["ElvUIBankMover"] = "BOTTOMLEFT,LeftChatPanel,BOTTOMLEFT,0,25",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,482",
				["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,507",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96",
				["ElvAB_9"] = "BOTTOM,ElvUI_Bar1,TOP,0,162",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,-1,191",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,4",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["ElvAB_4"] = "RIGHT,ElvUIParent,RIGHT,-4,0",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-264",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,-92,57",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,4",
				["VehicleLeaveButton"] = "BOTTOM,ElvUIParent,BOTTOM,0,300",
				["AzeriteBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-245",
				["QuestTimerFrameMover"] = "TOPRIGHT,MinimapCluster,BOTTOMRIGHT,0,0",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,139",
				["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-255",
				["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,-1,139",
				["ElvAB_10"] = "BOTTOM,ElvUI_Bar1,TOP,0,202",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-186",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,100",
				["ElvAB_7"] = "BOTTOM,ElvUI_Bar1,TOP,0,82",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,-1,-18",
				["DebuffsMover"] = "BOTTOMRIGHT,MMHolder,BOTTOMLEFT,-6,1",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-248",
			},
			["convertPages"] = true,
			["v11NamePlateReset"] = true,
			["chat"] = {
				["panelWidth"] = 472,
				["tabFontSize"] = 10,
				["panelHeight"] = 236,
			},
			["unitframe"] = {
				["colors"] = {
					["auraBarBuff"] = {
						["b"] = 0.43,
						["g"] = 0.61,
						["r"] = 0.78,
					},
					["castClassColor"] = true,
					["healthclass"] = true,
				},
				["smoothbars"] = true,
				["thinBorders"] = true,
				["units"] = {
					["player"] = {
						["debuffs"] = {
							["perrow"] = 7,
						},
						["castbar"] = {
							["height"] = 40,
							["insideInfoPanel"] = false,
							["width"] = 405,
						},
						["healPrediction"] = {
							["showOverAbsorbs"] = false,
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
						},
						["height"] = 82,
						["buffs"] = {
							["perrow"] = 7,
						},
						["classbar"] = {
							["height"] = 14,
						},
						["aurabar"] = {
							["height"] = 26,
						},
					},
					["raid40"] = {
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
					},
					["party"] = {
						["height"] = 74,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["power"] = {
							["height"] = 13,
						},
						["width"] = 231,
					},
					["target"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["enable"] = false,
							["attachTo"] = "FRAME",
							["maxDuration"] = 0,
							["perrow"] = 7,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
						},
						["healPrediction"] = {
							["showOverAbsorbs"] = false,
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["castbar"] = {
							["height"] = 40,
							["insideInfoPanel"] = false,
							["width"] = 405,
						},
						["orientation"] = "LEFT",
						["buffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["perrow"] = 7,
						},
						["height"] = 82,
						["aurabar"] = {
							["height"] = 26,
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["xOffset"] = 0,
							["size"] = 12,
						},
						["rdebuffs"] = {
							["xOffset"] = 30,
							["font"] = "PT Sans Narrow",
							["yOffset"] = 25,
							["size"] = 30,
						},
						["numGroups"] = 8,
						["growthDirection"] = "RIGHT_UP",
						["infoPanel"] = {
							["enable"] = true,
						},
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 2,
							["position"] = "BOTTOMLEFT",
						},
						["visibility"] = "[@raid6,noexists] hide;show",
						["width"] = 92,
					},
					["pet"] = {
						["infoPanel"] = {
							["height"] = 14,
						},
						["debuffs"] = {
							["enable"] = true,
							["anchorPoint"] = "TOPRIGHT",
						},
						["disableTargetGlow"] = false,
						["castbar"] = {
							["iconSize"] = 32,
						},
						["width"] = 270,
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
							["anchorPoint"] = "TOPRIGHT",
						},
						["threatStyle"] = "GLOW",
						["power"] = {
							["enable"] = false,
						},
						["width"] = 270,
						["disableMouseoverGlow"] = true,
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["xOffset"] = 2,
							["enable"] = false,
							["yOffset"] = 0,
						},
					},
				},
			},
			["tooltip"] = {
				["healthBar"] = {
					["height"] = 12,
					["fontOutline"] = "MONOCHROMEOUTLINE",
				},
				["textFontSize"] = 10,
			},
			["actionbar"] = {
				["keyDown"] = false,
				["bar6"] = {
					["enabled"] = true,
					["buttons"] = 8,
					["buttonsPerRow"] = 10,
					["buttonSpacing"] = 1,
					["buttonSize"] = 50,
				},
				["desaturateOnCooldown"] = true,
				["bar2"] = {
					["enabled"] = true,
				},
				["bar1"] = {
					["buttonSize"] = 50,
					["buttonSpacing"] = 1,
					["buttons"] = 8,
				},
				["microbar"] = {
					["buttons"] = 8,
				},
				["bar5"] = {
					["buttons"] = 9,
					["buttonsPerRow"] = 12,
					["buttonSpacing"] = 1,
					["buttonSize"] = 38,
				},
				["lockActionBars"] = false,
			},
			["layoutSet"] = "tank",
			["bags"] = {
				["bagSize"] = 42,
				["bankWidth"] = 474,
				["bankSize"] = 42,
				["itemLevelCustomColorEnable"] = true,
				["bagWidth"] = 474,
				["scrapIcon"] = true,
			},
			["layoutSetting"] = "tank",
			["auras"] = {
				["debuffs"] = {
					["size"] = 40,
				},
				["buffs"] = {
					["size"] = 40,
				},
			},
		},
		["Gesbank - Firemaw"] = {
			["databars"] = {
				["reputation"] = {
					["enable"] = true,
					["orientation"] = "HORIZONTAL",
				},
				["experience"] = {
					["orientation"] = "HORIZONTAL",
					["width"] = 350,
				},
				["petExperience"] = {
					["orientation"] = "HORIZONTAL",
					["textSize"] = 12,
					["width"] = 350,
				},
			},
			["currentTutorial"] = 4,
			["general"] = {
				["totems"] = {
					["growthDirection"] = "HORIZONTAL",
					["size"] = 50,
					["spacing"] = 8,
				},
				["bonusObjectivePosition"] = "AUTO",
				["valuecolor"] = {
					["b"] = 0.93,
					["g"] = 0.53,
					["r"] = 0.53,
				},
				["talkingHeadFrameScale"] = 1,
				["objectiveFrameHeight"] = 400,
				["minimap"] = {
					["size"] = 220,
				},
			},
			["movers"] = {
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,243",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,418,-186",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,43",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,139",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,-1,191",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["PetExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,53",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,-92,57",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,4",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,769",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,482",
				["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,-1,139",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-246",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,100",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,490,4",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,139",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,-1,-18",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,97",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,100",
			},
			["convertPages"] = true,
			["v11NamePlateReset"] = true,
			["auras"] = {
				["debuffs"] = {
					["size"] = 40,
				},
				["buffs"] = {
					["size"] = 40,
				},
			},
			["dbConverted"] = 2.29,
			["chat"] = {
				["panelSnapRightID"] = 3,
				["panelColorConverted"] = true,
				["panelHeight"] = 236,
				["timeStampFormat"] = "%H:%M:%S ",
				["tapFontSize"] = 10,
				["panelSnapLeftID"] = 1,
				["panelWidth"] = 472,
			},
			["actionbar"] = {
				["bar3"] = {
					["enabled"] = false,
				},
				["bar6"] = {
					["enabled"] = true,
					["buttons"] = 8,
					["buttonsPerRow"] = 10,
					["buttonSpacing"] = 1,
					["buttonSize"] = 50,
				},
				["bar4"] = {
					["enabled"] = false,
				},
				["bar1"] = {
					["buttons"] = 8,
					["buttonSpacing"] = 1,
					["buttonSize"] = 50,
				},
				["bar5"] = {
					["buttons"] = 9,
					["buttonsPerRow"] = 12,
					["buttonSpacing"] = 1,
					["buttonSize"] = 38,
				},
				["microbar"] = {
					["buttons"] = 7,
				},
				["backdropSpacingConverted"] = true,
			},
			["layoutSet"] = "dpsCaster",
			["unitframe"] = {
				["smoothbars"] = true,
				["colors"] = {
					["auraBarBuff"] = {
						["b"] = 0.93,
						["g"] = 0.53,
						["r"] = 0.53,
					},
					["castClassColor"] = true,
					["castColor"] = {
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
					["health"] = {
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
					["healthclass"] = true,
				},
				["units"] = {
					["player"] = {
						["debuffs"] = {
							["attachTo"] = "BUFFS",
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
						},
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["castbar"] = {
							["height"] = 40,
							["width"] = 405,
							["insideInfoPanel"] = false,
						},
						["height"] = 82,
						["buffs"] = {
							["enable"] = true,
							["attachTo"] = "FRAME",
						},
						["classbar"] = {
							["height"] = 14,
						},
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["raid40"] = {
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
							["anchorPoint"] = "TOPRIGHT",
						},
						["threatStyle"] = "GLOW",
						["power"] = {
							["enable"] = false,
						},
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["enable"] = false,
							["xOffset"] = 2,
							["yOffset"] = 0,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 270,
					},
					["target"] = {
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
						},
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["height"] = 82,
						["orientation"] = "LEFT",
						["castbar"] = {
							["height"] = 40,
							["width"] = 405,
							["insideInfoPanel"] = false,
						},
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["xOffset"] = 0,
							["size"] = 12,
						},
						["rdebuffs"] = {
							["xOffset"] = 30,
							["font"] = "PT Sans Narrow",
							["size"] = 30,
							["yOffset"] = 25,
						},
						["numGroups"] = 8,
						["growthDirection"] = "RIGHT_UP",
						["infoPanel"] = {
							["enable"] = true,
						},
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 2,
							["position"] = "BOTTOMLEFT",
						},
						["health"] = {
							["frequentUpdates"] = true,
						},
						["width"] = 92,
					},
					["pet"] = {
						["infoPanel"] = {
							["height"] = 14,
						},
						["debuffs"] = {
							["enable"] = true,
							["anchorPoint"] = "TOPRIGHT",
						},
						["disableTargetGlow"] = false,
						["castbar"] = {
							["iconSize"] = 32,
						},
						["width"] = 270,
					},
					["party"] = {
						["height"] = 74,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["width"] = 231,
						["power"] = {
							["height"] = 13,
						},
					},
				},
			},
			["bags"] = {
				["bagSize"] = 42,
				["bankWidth"] = 474,
				["bagWidth"] = 474,
				["bankSize"] = 42,
				["shownBags"] = {
					["bag-2"] = false,
				},
				["scrapIcon"] = true,
			},
			["tooltip"] = {
				["healthBar"] = {
					["height"] = 12,
					["fontOutline"] = "MONOCHROMEOUTLINE",
				},
				["fontSize"] = 10,
			},
		},
		["Ultrawide"] = {
			["databars"] = {
				["reputation"] = {
					["enable"] = true,
					["orientation"] = "HORIZONTAL",
				},
				["petExperience"] = {
					["textSize"] = 12,
					["width"] = 350,
					["orientation"] = "HORIZONTAL",
				},
				["experience"] = {
					["width"] = 350,
					["orientation"] = "HORIZONTAL",
				},
			},
			["currentTutorial"] = 5,
			["general"] = {
				["totems"] = {
					["spacing"] = 8,
					["size"] = 51,
					["growthDirection"] = "HORIZONTAL",
				},
				["valuecolor"] = {
					["b"] = 0.04,
					["g"] = 0.49,
					["r"] = 1,
				},
				["autoAcceptInvite"] = true,
				["minimap"] = {
					["size"] = 221,
				},
				["bottomPanel"] = false,
				["objectiveFrameHeight"] = 400,
				["talkingHeadFrameScale"] = 1,
				["bonusObjectivePosition"] = "AUTO",
			},
			["bags"] = {
				["bagSize"] = 42,
				["bagWidth"] = 474,
				["bankSize"] = 42,
				["shownBags"] = {
					["bag-2"] = false,
				},
				["scrapIcon"] = true,
				["bankWidth"] = 474,
			},
			["auras"] = {
				["debuffs"] = {
					["size"] = 40,
				},
				["buffs"] = {
					["size"] = 40,
					["seperateOwn"] = 0,
					["sortMethod"] = "INDEX",
				},
			},
			["dbConverted"] = 2.29,
			["layoutSet"] = "tank",
			["convertPages"] = true,
			["tooltip"] = {
				["healthBar"] = {
					["fontOutline"] = "MONOCHROMEOUTLINE",
					["height"] = 12,
				},
				["fontSize"] = 10,
			},
			["v11NamePlateReset"] = true,
			["unitframe"] = {
				["fontSize"] = 18,
				["statusbar"] = "Minimalist",
				["units"] = {
					["pet"] = {
						["debuffs"] = {
							["enable"] = true,
							["anchorPoint"] = "TOPRIGHT",
						},
						["castbar"] = {
							["iconSize"] = 32,
						},
						["width"] = 270,
						["infoPanel"] = {
							["height"] = 14,
						},
						["disableTargetGlow"] = false,
					},
					["player"] = {
						["debuffs"] = {
							["enable"] = false,
							["attachTo"] = "BUFFS",
						},
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["height"] = 50,
						["buffs"] = {
							["attachTo"] = "FRAME",
						},
						["castbar"] = {
							["icon"] = false,
							["insideInfoPanel"] = false,
							["width"] = 200,
							["height"] = 32,
						},
						["aurabar"] = {
							["enable"] = false,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["enable"] = false,
							["height"] = 22,
						},
						["width"] = 200,
						["colorOverride"] = "FORCE_ON",
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["bgUseBarTexture"] = false,
							["text_format"] = "[health:current]",
						},
						["orientation"] = "MIDDLE",
						["classbar"] = {
							["detachFromFrame"] = true,
							["height"] = 12,
							["detachedWidth"] = 200,
						},
					},
					["raid40"] = {
						["name"] = {
							["text_format"] = "",
						},
						["height"] = 24,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["health"] = {
							["text_format"] = "",
						},
					},
					["target"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["orientation"] = "MIDDLE",
						["aurabar"] = {
							["enable"] = false,
						},
						["power"] = {
							["yOffset"] = 5,
							["autoHide"] = true,
							["powerPrediction"] = true,
							["width"] = "inset",
							["attachTextTo"] = "InfoPanel",
							["strataAndLevel"] = {
								["frameLevel"] = 2,
							},
							["height"] = 9,
							["xOffset"] = 3,
							["detachedWidth"] = 22,
						},
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["width"] = 200,
						["castbar"] = {
							["insideInfoPanel"] = false,
							["width"] = 200,
							["height"] = 32,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
							["yOffset"] = 5,
						},
						["height"] = 50,
						["buffs"] = {
							["anchorPoint"] = "BOTTOMRIGHT",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 0,
							["text_format"] = "[health:current]",
							["yOffset"] = 5,
						},
					},
					["raid"] = {
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["position"] = "BOTTOMLEFT",
							["xOffset"] = 2,
							["text_format"] = "",
						},
						["height"] = 40,
						["rdebuffs"] = {
							["xOffset"] = 30,
							["yOffset"] = 25,
							["font"] = "PT Sans Narrow",
							["size"] = 30,
						},
						["numGroups"] = 8,
						["growthDirection"] = "RIGHT_UP",
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["health"] = {
							["frequentUpdates"] = true,
							["text_format"] = "",
						},
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["xOffset"] = 0,
							["size"] = 12,
						},
					},
					["party"] = {
						["castbar"] = {
							["enable"] = true,
							["width"] = 170,
						},
						["debuffs"] = {
							["sizeOverride"] = 20,
							["perrow"] = 1,
							["xOffset"] = -25,
						},
						["healPrediction"] = {
							["enable"] = true,
						},
						["name"] = {
							["text_format"] = "",
						},
						["height"] = 80,
						["horizontalSpacing"] = 17,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["growthDirection"] = "DOWN_RIGHT",
						["buffIndicator"] = {
							["countFontSize"] = 20,
							["size"] = 16,
						},
						["power"] = {
							["text_format"] = "",
							["powerPrediction"] = true,
							["position"] = "BOTTOMRIGHT",
							["height"] = 22,
						},
						["width"] = 170,
						["health"] = {
							["text_format"] = "",
						},
						["orientation"] = "MIDDLE",
						["petsGroup"] = {
							["enable"] = true,
							["healPrediction"] = {
								["enable"] = true,
							},
							["width"] = 80,
							["name"] = {
								["text_format"] = "",
							},
							["height"] = 80,
							["buffIndicator"] = {
								["size"] = 16,
							},
						},
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
							["anchorPoint"] = "TOPRIGHT",
						},
						["threatStyle"] = "GLOW",
						["power"] = {
							["enable"] = false,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 150,
						["height"] = 32,
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["xOffset"] = 2,
							["enable"] = false,
							["yOffset"] = 0,
						},
					},
				},
				["smoothbars"] = true,
				["colors"] = {
					["healthclass"] = true,
					["colorhealthbyvalue"] = false,
					["castClassColor"] = true,
					["auraBarBuff"] = {
						["b"] = 0.43,
						["g"] = 0.61,
						["r"] = 0.78,
					},
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["enabled"] = false,
					["buttons"] = 12,
					["buttonSize"] = 40,
					["buttonsPerRow"] = 12,
				},
				["bar8"] = {
					["buttonSize"] = 40,
				},
				["bar9"] = {
					["buttonSize"] = 40,
				},
				["bar1"] = {
					["enabled"] = false,
					["buttonSize"] = 40,
					["buttonSpacing"] = 1,
				},
				["bar7"] = {
					["buttonSize"] = 40,
				},
				["backdropSpacingConverted"] = true,
				["bar6"] = {
					["buttonSize"] = 40,
					["buttonSpacing"] = 1,
				},
				["bar10"] = {
					["buttonSize"] = 40,
				},
				["microbar"] = {
					["buttons"] = 8,
				},
				["bar2"] = {
					["buttonSize"] = 40,
				},
				["bar5"] = {
					["enabled"] = false,
					["buttons"] = 12,
					["buttonSize"] = 40,
					["buttonsPerRow"] = 12,
				},
				["lockActionBars"] = false,
				["keyDown"] = false,
				["stanceBar"] = {
					["enabled"] = false,
				},
				["bar4"] = {
					["enabled"] = false,
					["backdrop"] = false,
					["buttonsPerRow"] = 12,
					["buttonSize"] = 40,
				},
			},
			["nameplates"] = {
				["units"] = {
					["TARGET"] = {
						["classpower"] = {
							["enable"] = true,
						},
					},
					["ENEMY_NPC"] = {
						["debuffs"] = {
							["enable"] = false,
						},
					},
				},
			},
			["movers"] = {
				["ThreatBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,285,286",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-285,302",
				["ElvUF_RaidMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,5",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,4",
				["GMMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-760,41",
				["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-959,-4",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "TOP,ElvUIParent,TOP,0,-139",
				["QuestWatchFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-599,-399",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["ElvUF_FocusMover"] = "TOP,ElvUIParent,TOP,-438,-125",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-716,-4",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,285,233",
				["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-285,286",
				["DurabilityFrameMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,511,346",
				["ElvUF_PetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-500,394",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["TimeManagerFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-4",
				["ExperienceBarMover"] = "TOP,ElvUIParent,TOP,0,-4",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,503,243",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-285,233",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,0,-67",
				["QuestTimerFrameMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-792,339",
				["ElvAB_1"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,30,157",
				["ElvAB_2"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,20,233",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-763,-260",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["ElvAB_4"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-202,42",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-717,-249",
				["PetExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,53",
				["ElvAB_3"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,21,195",
				["ElvAB_5"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-202,4",
				["VehicleLeaveButton"] = "TOP,ElvUIParent,TOP,-356,-510",
				["ArenaHeaderMover"] = "TOP,ElvUIParent,TOP,663,-269",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-735,437",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
				["ElvUF_Raid40Mover"] = "BOTTOM,ElvUIParent,BOTTOM,0,5",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,769",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,285,302",
				["ElvAB_6"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-202,80",
				["ElvUF_TankMover"] = "TOP,ElvUIParent,TOP,-441,-298",
				["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,-627,4",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-503,351",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,840,191",
				["ElvUF_PartyMover"] = "TOP,ElvUIParent,TOP,-441,-274",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,-69,-4",
				["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-959,-174",
				["ElvUF_AssistMover"] = "BOTTOM,ElvUIParent,BOTTOM,-450,247",
			},
			["chat"] = {
				["panelSnapRightID"] = 3,
				["panelWidth"] = 472,
				["panelHeight"] = 296,
				["keywordSound"] = "Punch",
				["timeStampFormat"] = "%H:%M ",
				["panelSnapLeftID"] = 1,
				["tapFontSize"] = 10,
				["panelColorConverted"] = true,
				["font"] = "Expressway",
				["keywords"] = "",
				["tabSelector"] = "ARROW",
				["copyChatLines"] = true,
			},
		},
		["Baldhumanman - Firemaw"] = {
			["databars"] = {
				["reputation"] = {
					["enable"] = true,
					["orientation"] = "HORIZONTAL",
					["height"] = 10,
					["width"] = 222,
				},
				["experience"] = {
					["height"] = 10,
					["orientation"] = "HORIZONTAL",
					["textSize"] = 12,
					["width"] = 350,
				},
				["petExperience"] = {
					["height"] = 10,
					["orientation"] = "HORIZONTAL",
					["textSize"] = 12,
					["width"] = 350,
				},
			},
			["currentTutorial"] = 5,
			["general"] = {
				["totems"] = {
					["spacing"] = 8,
					["size"] = 50,
					["growthDirection"] = "HORIZONTAL",
				},
				["autoAcceptInvite"] = true,
				["bordercolor"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
				["minimap"] = {
					["icons"] = {
						["tracking"] = {
							["position"] = "BOTTOMRIGHT",
						},
					},
					["size"] = 218,
				},
				["bottomPanel"] = false,
				["valuecolor"] = {
					["b"] = 0.43,
					["g"] = 0.61,
					["r"] = 0.78,
				},
				["objectiveFrameHeight"] = 400,
				["talkingHeadFrameScale"] = 1,
				["bonusObjectivePosition"] = "AUTO",
			},
			["movers"] = {
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,23",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,303",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,4",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,418,-186",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,364",
				["DurabilityFrameMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,434,318",
				["ElvUF_PetCastbarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-499,43",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["ExperienceBarMover"] = "TOP,ElvUIParent,TOP,0,-4",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,232",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,586",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,0,-67",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,161",
				["ElvAB_1"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-42,433",
				["ElvAB_2"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-93,377",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["PetExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,53",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["TimeManagerFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-4",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ElvAB_3"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-55,472",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-248,31",
				["VehicleLeaveButton"] = "TOP,ElvUIParent,TOP,-258,-524",
				["QuestTimerFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-256,-268",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-180,-377",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,266",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,128",
				["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,-318,4",
				["ElvUF_PetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-502,4",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,911",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-246",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,490,4",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,769",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,304",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,-69,-4",
				["QuestWatchFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-256,-342",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,849",
			},
			["bags"] = {
				["bagSize"] = 42,
				["bankWidth"] = 474,
				["bankSize"] = 42,
				["bagWidth"] = 474,
				["scrapIcon"] = true,
			},
			["hideTutorial"] = true,
			["auras"] = {
				["debuffs"] = {
					["countFontSize"] = 10,
					["size"] = 40,
				},
				["buffs"] = {
					["countFontSize"] = 10,
					["seperateOwn"] = 0,
					["sortMethod"] = "INDEX",
					["size"] = 40,
				},
			},
			["unitframe"] = {
				["fontSize"] = 18,
				["colors"] = {
					["colorhealthbyvalue"] = false,
					["auraBarBuff"] = {
						["b"] = 0.43,
						["g"] = 0.61,
						["r"] = 0.78,
					},
					["castClassColor"] = true,
					["healthclass"] = true,
				},
				["statusbar"] = "Minimalist",
				["smoothbars"] = true,
				["thinBorders"] = true,
				["units"] = {
					["player"] = {
						["debuffs"] = {
							["enable"] = false,
							["attachTo"] = "BUFFS",
						},
						["castbar"] = {
							["enable"] = false,
							["insideInfoPanel"] = false,
							["height"] = 41,
							["width"] = 368,
						},
						["healPrediction"] = {
							["showOverAbsorbs"] = false,
						},
						["colorOverride"] = "FORCE_ON",
						["width"] = 368,
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["enable"] = false,
							["height"] = 22,
						},
						["disableMouseoverGlow"] = true,
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[health:current]",
							["bgUseBarTexture"] = false,
						},
						["orientation"] = "MIDDLE",
						["height"] = 32,
						["buffs"] = {
							["attachTo"] = "FRAME",
						},
						["classbar"] = {
							["detachFromFrame"] = true,
							["height"] = 8,
							["detachedWidth"] = 366,
						},
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["raid40"] = {
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["name"] = {
							["text_format"] = "",
						},
						["health"] = {
							["text_format"] = "",
						},
					},
					["party"] = {
						["growthDirection"] = "RIGHT_UP",
						["debuffs"] = {
							["xOffset"] = -25,
							["sizeOverride"] = 20,
							["perrow"] = 1,
						},
						["health"] = {
							["text_format"] = "",
						},
						["power"] = {
							["text_format"] = "",
							["position"] = "BOTTOMRIGHT",
						},
						["height"] = 40,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["name"] = {
							["text_format"] = "",
						},
						["width"] = 80,
					},
					["target"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["castbar"] = {
							["height"] = 32,
							["insideInfoPanel"] = false,
							["width"] = 368,
						},
						["healPrediction"] = {
							["showOverAbsorbs"] = false,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 368,
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 0,
							["text_format"] = "[health:current]",
							["yOffset"] = 5,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
							["yOffset"] = 5,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["powerPrediction"] = true,
							["xOffset"] = 3,
							["yOffset"] = 5,
							["strataAndLevel"] = {
								["frameLevel"] = 2,
							},
							["autoHide"] = true,
							["height"] = 9,
							["width"] = "inset",
							["detachedWidth"] = 22,
						},
						["height"] = 32,
						["buffs"] = {
							["anchorPoint"] = "BOTTOMRIGHT",
						},
						["orientation"] = "MIDDLE",
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["xOffset"] = 0,
							["size"] = 12,
						},
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 2,
							["text_format"] = "",
							["position"] = "BOTTOMLEFT",
						},
						["health"] = {
							["frequentUpdates"] = true,
							["text_format"] = "",
						},
						["height"] = 40,
						["rdebuffs"] = {
							["xOffset"] = 30,
							["font"] = "PT Sans Narrow",
							["yOffset"] = 25,
							["size"] = 30,
						},
						["numGroups"] = 8,
						["growthDirection"] = "RIGHT_UP",
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
							["anchorPoint"] = "TOPRIGHT",
						},
						["threatStyle"] = "GLOW",
						["power"] = {
							["enable"] = false,
						},
						["height"] = 32,
						["width"] = 150,
						["disableMouseoverGlow"] = true,
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["xOffset"] = 2,
							["enable"] = false,
							["yOffset"] = 0,
						},
					},
					["pet"] = {
						["infoPanel"] = {
							["height"] = 14,
						},
						["debuffs"] = {
							["enable"] = true,
							["anchorPoint"] = "TOPRIGHT",
						},
						["disableTargetGlow"] = false,
						["castbar"] = {
							["iconSize"] = 32,
						},
						["width"] = 270,
					},
				},
			},
			["tooltip"] = {
				["healthBar"] = {
					["height"] = 12,
					["fontOutline"] = "MONOCHROMEOUTLINE",
				},
				["fontSize"] = 10,
			},
			["actionbar"] = {
				["bar3"] = {
					["enabled"] = false,
					["buttons"] = 12,
					["buttonspacing"] = 1,
					["buttonsPerRow"] = 10,
					["buttonsize"] = 40,
				},
				["keyDown"] = false,
				["backdropSpacingConverted"] = true,
				["lockActionBars"] = false,
				["bar1"] = {
					["buttonspacing"] = 1,
					["buttonsize"] = 40,
					["enabled"] = false,
				},
				["stanceBar"] = {
					["enabled"] = false,
				},
				["bar5"] = {
					["enabled"] = false,
					["buttons"] = 12,
				},
				["bar4"] = {
					["enabled"] = false,
					["backdrop"] = false,
				},
			},
			["layoutSet"] = "tank",
			["nameplates"] = {
				["units"] = {
					["TARGET"] = {
						["classpower"] = {
							["enable"] = true,
						},
					},
					["ENEMY_NPC"] = {
						["debuffs"] = {
							["enable"] = false,
						},
					},
				},
			},
			["v11NamePlateReset"] = true,
			["chat"] = {
				["panelColorConverted"] = true,
				["keywordSound"] = "Punch",
				["panelHeight"] = 296,
				["timeStampFormat"] = "%H:%M ",
				["keywords"] = "",
				["tapFontSize"] = 10,
				["panelWidth"] = 472,
			},
		},
		["Gehs - Firemaw"] = {
			["databars"] = {
				["petExperience"] = {
					["orientation"] = "HORIZONTAL",
					["textSize"] = 12,
					["width"] = 350,
				},
				["experience"] = {
					["orientation"] = "HORIZONTAL",
					["textSize"] = 12,
					["width"] = 350,
				},
				["reputation"] = {
					["enable"] = true,
					["orientation"] = "HORIZONTAL",
				},
			},
			["currentTutorial"] = 9,
			["general"] = {
				["totems"] = {
					["growthDirection"] = "HORIZONTAL",
					["size"] = 50,
					["spacing"] = 8,
				},
				["bottomPanel"] = false,
				["bonusObjectivePosition"] = "AUTO",
				["taintLog"] = true,
				["valuecolor"] = {
					["b"] = 0.73,
					["g"] = 0.55,
					["r"] = 0.96,
				},
				["talkingHeadFrameScale"] = 1,
				["objectiveFrameHeight"] = 400,
				["minimap"] = {
					["size"] = 220,
				},
			},
			["movers"] = {
				["ElvUF_PlayerCastbarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-52,402",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,242",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,250,-104",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,43",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,139",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96",
				["ElvAB_1"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-29,239",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,-270,338",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["PetExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,53",
				["ElvAB_3"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-10,426",
				["ElvAB_5"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,318",
				["PetAB"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-296,-248",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,100",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,250,-82",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,482",
				["ElvUF_TargetCastbarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-52,357",
				["ElvAB_6"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-29,278",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-246",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,139",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,100",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,490,4",
				["ElvUF_PartyMover"] = "TOP,ElvUIParent,TOP,-592,-298",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,0,-185",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,501,368",
				["TaxiButtonMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,286",
			},
			["convertPages"] = true,
			["bags"] = {
				["bagSize"] = 42,
				["bankWidth"] = 474,
				["scrapIcon"] = true,
				["bagWidth"] = 474,
				["bankSize"] = 42,
			},
			["auras"] = {
				["debuffs"] = {
					["size"] = 40,
				},
				["buffs"] = {
					["size"] = 40,
				},
			},
			["chat"] = {
				["panelColorConverted"] = true,
				["panelHeight"] = 236,
				["timeStampFormat"] = "%H:%M ",
				["tapFontSize"] = 10,
				["panelWidth"] = 472,
			},
			["dbConverted"] = 2.18,
			["datatexts"] = {
				["panelTransparency"] = true,
			},
			["actionbar"] = {
				["bar3"] = {
					["enabled"] = false,
					["buttonsPerRow"] = 4,
					["buttons"] = 12,
				},
				["bar6"] = {
					["buttonSize"] = 40,
					["buttonsPerRow"] = 10,
					["buttonSpacing"] = 1,
					["buttons"] = 10,
				},
				["bar1"] = {
					["enabled"] = false,
					["buttonSize"] = 40,
					["buttonSpacing"] = 1,
					["buttons"] = 10,
				},
				["bar5"] = {
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["buttonSpacing"] = 1,
					["buttons"] = 12,
				},
				["lockActionBars"] = false,
				["bar4"] = {
					["enabled"] = false,
				},
				["keyDown"] = false,
				["macrotext"] = true,
				["stanceBar"] = {
					["enabled"] = false,
				},
				["microbar"] = {
					["buttons"] = 8,
				},
				["backdropSpacingConverted"] = true,
			},
			["layoutSet"] = "healer",
			["unitframe"] = {
				["smoothbars"] = true,
				["colors"] = {
					["castClassColor"] = true,
					["auraBarBuff"] = {
						["b"] = 0.04,
						["g"] = 0.49,
						["r"] = 1,
					},
					["colorhealthbyvalue"] = false,
					["healthclass"] = true,
				},
				["units"] = {
					["player"] = {
						["debuffs"] = {
							["attachTo"] = "BUFFS",
						},
						["castbar"] = {
							["height"] = 40,
							["width"] = 405,
							["insideInfoPanel"] = false,
						},
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
						},
						["height"] = 82,
						["buffs"] = {
							["enable"] = true,
							["attachTo"] = "FRAME",
						},
						["classbar"] = {
							["height"] = 14,
						},
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["raid40"] = {
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["name"] = {
							["text_format"] = "",
						},
						["health"] = {
							["frequentUpdates"] = true,
							["text_format"] = "",
						},
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
							["anchorPoint"] = "TOPRIGHT",
						},
						["threatStyle"] = "GLOW",
						["power"] = {
							["enable"] = false,
						},
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["xOffset"] = 2,
							["enable"] = false,
							["yOffset"] = 0,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 270,
					},
					["target"] = {
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
						},
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["height"] = 82,
						["orientation"] = "LEFT",
						["castbar"] = {
							["height"] = 40,
							["width"] = 405,
							["insideInfoPanel"] = false,
						},
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["position"] = "BOTTOMRIGHT",
							["xOffset"] = 0,
							["size"] = 12,
						},
						["rdebuffs"] = {
							["xOffset"] = 30,
							["font"] = "PT Sans Narrow",
							["size"] = 30,
							["yOffset"] = 25,
						},
						["numGroups"] = 8,
						["growthDirection"] = "RIGHT_UP",
						["infoPanel"] = {
							["enable"] = true,
						},
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 2,
							["text_format"] = "",
							["position"] = "BOTTOMLEFT",
						},
						["health"] = {
							["frequentUpdates"] = true,
						},
						["visibility"] = "[@raid26,exists] hide;show",
						["width"] = 92,
					},
					["pet"] = {
						["infoPanel"] = {
							["height"] = 14,
						},
						["debuffs"] = {
							["enable"] = true,
							["anchorPoint"] = "TOPRIGHT",
						},
						["disableTargetGlow"] = false,
						["castbar"] = {
							["iconSize"] = 32,
						},
						["width"] = 270,
					},
					["party"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
						["power"] = {
							["height"] = 13,
						},
						["height"] = 74,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["width"] = 231,
					},
				},
			},
			["v11NamePlateReset"] = true,
			["tooltip"] = {
				["healthBar"] = {
					["height"] = 12,
					["fontOutline"] = "MONOCHROMEOUTLINE",
				},
				["fontSize"] = 10,
			},
		},
		["Gæs - Firemaw"] = {
			["databars"] = {
				["experience"] = {
					["textSize"] = 12,
					["orientation"] = "HORIZONTAL",
				},
				["reputation"] = {
					["enable"] = true,
					["orientation"] = "HORIZONTAL",
				},
			},
			["currentTutorial"] = 3,
			["general"] = {
				["backdropfadecolor"] = {
					["b"] = 0.054,
					["g"] = 0.054,
					["r"] = 0.054,
				},
				["minimap"] = {
					["size"] = 220,
				},
			},
			["movers"] = {
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,95",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,4",
				["GMMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,250,-5",
				["BuffsMover"] = "TOPRIGHT,MMHolder,TOPLEFT,-7,-1",
				["MirrorTimer3Mover"] = "TOP,MirrorTimer2,BOTTOM,0,0",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,418,-186",
				["QuestWatchFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-135,-300",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-3",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["PetAB"] = "RIGHT,ElvUI_Bar4,LEFT,-4,0",
				["TimeManagerFrameMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-10,-190",
				["ElvUF_FocusMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,59",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,490,4",
				["DurabilityFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-135,-300",
				["ElvUF_PetCastbarMover"] = "TOPLEFT,ElvUF_Pet,BOTTOMLEFT,0,-1",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["ElvUIBagMover"] = "BOTTOMRIGHT,RightChatPanel,BOTTOMRIGHT,0,26",
				["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,43",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,100",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,139",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,507",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,482",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96",
				["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,-1,139",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,-1,191",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["AzeriteBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-245",
				["QuestTimerFrameMover"] = "TOPRIGHT,MinimapCluster,BOTTOMRIGHT,0,0",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,-92,57",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-264",
				["VehicleLeaveButton"] = "BOTTOM,ElvUIParent,BOTTOM,0,300",
				["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,4",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["MirrorTimer2Mover"] = "TOP,MirrorTimer1,BOTTOM,0,0",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,769",
				["ElvNP_PlayerMover"] = "TOP,UIParent,CENTER,0,-150",
				["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-255",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,243",
				["TooltipMover"] = "BOTTOMRIGHT,RightChatToggleButton,BOTTOMRIGHT,0,0",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-186",
				["ElvUIBankMover"] = "BOTTOMLEFT,LeftChatPanel,BOTTOMLEFT,0,26",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,139",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,100",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,-1,-18",
				["DebuffsMover"] = "BOTTOMRIGHT,MMHolder,BOTTOMLEFT,-7,1",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-248",
			},
			["convertPages"] = true,
			["v11NamePlateReset"] = true,
			["chat"] = {
				["panelWidth"] = 472,
				["tabFontSize"] = 10,
				["panelHeight"] = 236,
			},
			["dbConverted"] = 2.09,
			["tooltip"] = {
				["healthBar"] = {
					["height"] = 12,
					["fontOutline"] = "MONOCHROMEOUTLINE",
				},
				["textFontSize"] = 10,
			},
			["actionbar"] = {
				["bar3"] = {
					["enabled"] = false,
				},
				["bar6"] = {
					["enabled"] = true,
					["buttons"] = 8,
					["buttonsPerRow"] = 10,
					["buttonSpacing"] = 1,
					["buttonSize"] = 50,
				},
				["bar1"] = {
					["buttonSize"] = 50,
					["buttonSpacing"] = 1,
					["buttons"] = 8,
				},
				["microbar"] = {
					["buttons"] = 8,
				},
				["bar5"] = {
					["buttons"] = 9,
					["buttonsPerRow"] = 12,
					["buttonSpacing"] = 1,
					["buttonSize"] = 38,
				},
				["bar4"] = {
					["enabled"] = false,
				},
			},
			["layoutSet"] = "tank",
			["bags"] = {
				["bagSize"] = 42,
				["bankWidth"] = 474,
				["bankSize"] = 42,
				["itemLevelCustomColorEnable"] = true,
				["scrapIcon"] = true,
				["bagWidth"] = 474,
			},
			["unitframe"] = {
				["smoothbars"] = true,
				["colors"] = {
					["castColor"] = {
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
					["auraBarBuff"] = {
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
					["health"] = {
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
				},
				["units"] = {
					["player"] = {
						["infoPanel"] = {
							["enable"] = true,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["castbar"] = {
							["height"] = 40,
							["insideInfoPanel"] = false,
							["width"] = 405,
						},
						["height"] = 82,
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["classbar"] = {
							["height"] = 14,
						},
					},
					["raid40"] = {
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
					},
					["party"] = {
						["height"] = 74,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["power"] = {
							["height"] = 13,
						},
						["width"] = 231,
					},
					["target"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["enable"] = false,
							["attachTo"] = "FRAME",
							["maxDuration"] = 0,
							["perrow"] = 7,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
						},
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["castbar"] = {
							["height"] = 40,
							["insideInfoPanel"] = false,
							["width"] = 405,
						},
						["orientation"] = "LEFT",
						["buffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["perrow"] = 7,
						},
						["height"] = 82,
						["aurabar"] = {
							["height"] = 26,
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["xOffset"] = 0,
							["size"] = 12,
						},
						["rdebuffs"] = {
							["xOffset"] = 30,
							["font"] = "PT Sans Narrow",
							["yOffset"] = 25,
							["size"] = 30,
						},
						["numGroups"] = 8,
						["width"] = 92,
						["infoPanel"] = {
							["enable"] = true,
						},
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 2,
							["position"] = "BOTTOMLEFT",
						},
						["visibility"] = "[@raid6,noexists] hide;show",
						["growthDirection"] = "RIGHT_UP",
					},
					["pet"] = {
						["infoPanel"] = {
							["height"] = 14,
						},
						["debuffs"] = {
							["enable"] = true,
							["anchorPoint"] = "TOPRIGHT",
						},
						["disableTargetGlow"] = false,
						["castbar"] = {
							["iconSize"] = 32,
						},
						["customTexts"] = {
							["happiness"] = {
								["attachTextTo"] = "Frame",
								["xOffset"] = 0,
								["text_format"] = "[happiness:icon]",
								["yOffset"] = 0,
								["font"] = "PT Sans Narrow",
								["justifyH"] = "LEFT",
								["fontOutline"] = "OUTLINE",
								["enable"] = true,
								["size"] = 10,
							},
						},
						["customText"] = {
						},
						["width"] = 270,
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
							["anchorPoint"] = "TOPRIGHT",
						},
						["threatStyle"] = "GLOW",
						["power"] = {
							["enable"] = false,
						},
						["width"] = 270,
						["disableMouseoverGlow"] = true,
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["xOffset"] = 2,
							["enable"] = false,
							["yOffset"] = 0,
						},
					},
				},
			},
			["auras"] = {
				["buffs"] = {
					["size"] = 40,
				},
				["debuffs"] = {
					["size"] = 40,
				},
			},
		},
		["Coomerchamp - Firemaw"] = {
			["currentTutorial"] = 3,
			["v11NamePlateReset"] = true,
		},
		["Ges - Firemaw"] = {
			["databars"] = {
				["reputation"] = {
					["enable"] = true,
					["orientation"] = "HORIZONTAL",
				},
				["experience"] = {
					["orientation"] = "HORIZONTAL",
					["width"] = 350,
				},
				["petExperience"] = {
					["orientation"] = "HORIZONTAL",
					["textSize"] = 12,
					["width"] = 350,
				},
			},
			["currentTutorial"] = 5,
			["general"] = {
				["totems"] = {
					["spacing"] = 8,
					["growthDirection"] = "HORIZONTAL",
					["size"] = 51,
				},
				["bottomPanel"] = false,
				["bonusObjectivePosition"] = "AUTO",
				["autoAcceptInvite"] = true,
				["talkingHeadFrameScale"] = 1,
				["objectiveFrameHeight"] = 400,
				["valuecolor"] = {
					["r"] = 0.78,
					["g"] = 0.61,
					["b"] = 0.43,
				},
				["minimap"] = {
					["size"] = 221,
				},
			},
			["movers"] = {
				["ThreatBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,150,394",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,233",
				["ElvUF_RaidMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,18",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,4",
				["GMMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-760,41",
				["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-959,-4",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "TOP,ElvUIParent,TOP,0,-139",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["ElvUF_FocusMover"] = "BOTTOM,ElvUIParent,BOTTOM,-285,418",
				["ElvUF_AssistMover"] = "BOTTOM,ElvUIParent,BOTTOM,-450,247",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,662,382",
				["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,47,491",
				["DurabilityFrameMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,511,346",
				["ElvUF_PetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-500,394",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,-69,-4",
				["ExperienceBarMover"] = "TOP,ElvUIParent,TOP,0,-4",
				["ElvUF_PartyMover"] = "TOP,ElvUIParent,TOP,-441,-274",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,425,382",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,840,191",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-503,351",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,0,-67",
				["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,-627,4",
				["ElvAB_1"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,30,157",
				["ElvAB_2"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,20,233",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-763,-260",
				["ElvAB_4"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-202,42",
				["QuestTimerFrameMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-792,339",
				["ElvAB_6"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-202,80",
				["PetExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,53",
				["ElvAB_3"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,21,195",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-717,-249",
				["VehicleLeaveButton"] = "TOP,ElvUIParent,TOP,-356,-510",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,426,351",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,769",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-735,437",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
				["ElvUF_Raid40Mover"] = "BOTTOM,ElvUIParent,BOTTOM,0,19",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ArenaHeaderMover"] = "TOP,ElvUIParent,TOP,663,-269",
				["ElvAB_5"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-202,4",
				["ElvUF_TankMover"] = "TOP,ElvUIParent,TOP,-441,-298",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,274",
				["QuestWatchFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-599,-399",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
				["TimeManagerFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-4",
				["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-959,-174",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-716,-4",
			},
			["convertPages"] = true,
			["bags"] = {
				["bagSize"] = 42,
				["bankWidth"] = 474,
				["bagWidth"] = 474,
				["bankSize"] = 42,
				["shownBags"] = {
					["bag-2"] = false,
				},
				["scrapIcon"] = true,
			},
			["chat"] = {
				["tabSelector"] = "ARROW",
				["keywordSound"] = "Punch",
				["timeStampFormat"] = "%H:%M ",
				["keywords"] = "",
				["panelSnapLeftID"] = 1,
				["panelSnapRightID"] = 3,
				["panelColorConverted"] = true,
				["panelHeight"] = 296,
				["copyChatLines"] = true,
				["font"] = "Expressway",
				["tapFontSize"] = 10,
				["panelWidth"] = 472,
			},
			["tooltip"] = {
				["healthBar"] = {
					["height"] = 12,
					["fontOutline"] = "MONOCHROMEOUTLINE",
				},
				["fontSize"] = 10,
			},
			["dbConverted"] = 2.29,
			["v11NamePlateReset"] = true,
			["actionbar"] = {
				["bar3"] = {
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["buttonSize"] = 40,
					["buttons"] = 12,
				},
				["bar6"] = {
					["buttonSpacing"] = 1,
					["buttonSize"] = 40,
				},
				["bar2"] = {
					["buttonSize"] = 40,
				},
				["bar1"] = {
					["enabled"] = false,
					["buttonSpacing"] = 1,
					["buttonSize"] = 40,
				},
				["bar8"] = {
					["buttonSize"] = 40,
				},
				["bar5"] = {
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["buttonSize"] = 40,
					["buttons"] = 12,
				},
				["lockActionBars"] = false,
				["backdropSpacingConverted"] = true,
				["bar10"] = {
					["buttonSize"] = 40,
				},
				["bar7"] = {
					["buttonSize"] = 40,
				},
				["keyDown"] = false,
				["bar9"] = {
					["buttonSize"] = 40,
				},
				["stanceBar"] = {
					["enabled"] = false,
				},
				["microbar"] = {
					["buttons"] = 8,
				},
				["bar4"] = {
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["backdrop"] = false,
					["buttonSize"] = 40,
				},
			},
			["nameplates"] = {
				["units"] = {
					["TARGET"] = {
						["classpower"] = {
							["enable"] = true,
						},
					},
					["ENEMY_NPC"] = {
						["debuffs"] = {
							["enable"] = false,
						},
					},
				},
			},
			["unitframe"] = {
				["fontSize"] = 18,
				["colors"] = {
					["colorhealthbyvalue"] = false,
					["auraBarBuff"] = {
						["r"] = 0.78,
						["g"] = 0.61,
						["b"] = 0.43,
					},
					["castClassColor"] = true,
					["healthclass"] = true,
				},
				["smoothbars"] = true,
				["statusbar"] = "Minimalist",
				["units"] = {
					["player"] = {
						["debuffs"] = {
							["enable"] = false,
							["attachTo"] = "BUFFS",
						},
						["castbar"] = {
							["height"] = 41,
							["insideInfoPanel"] = false,
							["width"] = 450,
						},
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["width"] = 450,
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["enable"] = false,
							["height"] = 22,
						},
						["colorOverride"] = "FORCE_ON",
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[health:current]",
							["bgUseBarTexture"] = false,
						},
						["height"] = 32,
						["orientation"] = "MIDDLE",
						["buffs"] = {
							["attachTo"] = "FRAME",
						},
						["classbar"] = {
							["detachFromFrame"] = true,
							["height"] = 12,
							["detachedWidth"] = 366,
						},
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["raid40"] = {
						["height"] = 24,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["name"] = {
							["text_format"] = "",
						},
						["health"] = {
							["text_format"] = "",
						},
					},
					["party"] = {
						["horizontalSpacing"] = 17,
						["debuffs"] = {
							["xOffset"] = -25,
							["sizeOverride"] = 20,
							["perrow"] = 1,
						},
						["power"] = {
							["height"] = 22,
							["powerPrediction"] = true,
							["text_format"] = "",
							["position"] = "BOTTOMRIGHT",
						},
						["healPrediction"] = {
							["enable"] = true,
						},
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["growthDirection"] = "DOWN_RIGHT",
						["width"] = 170,
						["name"] = {
							["text_format"] = "",
						},
						["health"] = {
							["text_format"] = "",
						},
						["height"] = 80,
						["orientation"] = "MIDDLE",
						["buffIndicator"] = {
							["countFontSize"] = 20,
							["size"] = 16,
						},
						["petsGroup"] = {
							["name"] = {
								["text_format"] = "",
							},
							["healPrediction"] = {
								["enable"] = true,
							},
							["enable"] = true,
							["buffIndicator"] = {
								["size"] = 16,
							},
							["height"] = 80,
							["width"] = 80,
						},
						["castbar"] = {
							["enable"] = true,
							["width"] = 170,
						},
					},
					["target"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["powerPrediction"] = true,
							["xOffset"] = 3,
							["yOffset"] = 5,
							["strataAndLevel"] = {
								["frameLevel"] = 2,
							},
							["autoHide"] = true,
							["height"] = 9,
							["width"] = "inset",
							["detachedWidth"] = 22,
						},
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["width"] = 275,
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
							["yOffset"] = 5,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 0,
							["text_format"] = "[health:current]",
							["yOffset"] = 5,
						},
						["castbar"] = {
							["height"] = 32,
							["insideInfoPanel"] = false,
							["width"] = 275,
						},
						["orientation"] = "MIDDLE",
						["buffs"] = {
							["anchorPoint"] = "BOTTOMRIGHT",
						},
						["height"] = 32,
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["xOffset"] = 0,
							["size"] = 12,
						},
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 2,
							["text_format"] = "",
							["position"] = "BOTTOMLEFT",
						},
						["health"] = {
							["frequentUpdates"] = true,
							["text_format"] = "",
						},
						["height"] = 40,
						["rdebuffs"] = {
							["xOffset"] = 30,
							["font"] = "PT Sans Narrow",
							["yOffset"] = 25,
							["size"] = 30,
						},
						["numGroups"] = 8,
						["growthDirection"] = "RIGHT_UP",
					},
					["pet"] = {
						["infoPanel"] = {
							["height"] = 14,
						},
						["debuffs"] = {
							["enable"] = true,
							["anchorPoint"] = "TOPRIGHT",
						},
						["disableTargetGlow"] = false,
						["castbar"] = {
							["iconSize"] = 32,
						},
						["width"] = 270,
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
							["anchorPoint"] = "TOPRIGHT",
						},
						["threatStyle"] = "GLOW",
						["power"] = {
							["enable"] = false,
						},
						["height"] = 32,
						["width"] = 150,
						["disableMouseoverGlow"] = true,
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["xOffset"] = 2,
							["enable"] = false,
							["yOffset"] = 0,
						},
					},
				},
			},
			["layoutSet"] = "tank",
			["auras"] = {
				["buffs"] = {
					["size"] = 40,
					["seperateOwn"] = 0,
					["sortMethod"] = "INDEX",
				},
				["debuffs"] = {
					["size"] = 40,
				},
			},
		},
		["Algorithm - Firemaw"] = {
			["databars"] = {
				["petExperience"] = {
					["orientation"] = "HORIZONTAL",
					["textSize"] = 12,
					["width"] = 350,
				},
				["experience"] = {
					["orientation"] = "HORIZONTAL",
					["textSize"] = 12,
					["width"] = 350,
				},
				["reputation"] = {
					["enable"] = true,
					["orientation"] = "HORIZONTAL",
				},
			},
			["currentTutorial"] = 8,
			["general"] = {
				["totems"] = {
					["growthDirection"] = "HORIZONTAL",
					["size"] = 50,
					["spacing"] = 8,
				},
				["bonusObjectivePosition"] = "AUTO",
				["backdropfadecolor"] = {
					["b"] = 0.054,
					["g"] = 0.054,
					["r"] = 0.054,
				},
				["talkingHeadFrameScale"] = 1,
				["objectiveFrameHeight"] = 400,
				["minimap"] = {
					["size"] = 220,
				},
			},
			["movers"] = {
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,95",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,418,-186",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,43",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,139",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,-1,191",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["PetExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,53",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,-92,57",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,4",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,769",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,482",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,243",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-246",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,490,4",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,139",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-342,100",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,248",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,-1,-18",
				["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,-1,139",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,342,100",
			},
			["convertPages"] = true,
			["bags"] = {
				["bankSize"] = 42,
				["bankWidth"] = 474,
				["scrapIcon"] = true,
				["bagSize"] = 42,
				["bagWidth"] = 474,
			},
			["auras"] = {
				["debuffs"] = {
					["size"] = 40,
				},
				["buffs"] = {
					["size"] = 40,
				},
			},
			["dbConverted"] = 1,
			["chat"] = {
				["panelHeight"] = 236,
				["panelColorConverted"] = true,
				["tapFontSize"] = 10,
				["panelWidth"] = 472,
			},
			["actionbar"] = {
				["bar3"] = {
					["enabled"] = false,
				},
				["bar6"] = {
					["enabled"] = true,
					["buttons"] = 8,
					["buttonsPerRow"] = 10,
					["buttonSpacing"] = 1,
					["buttonSize"] = 50,
				},
				["bar4"] = {
					["enabled"] = false,
				},
				["bar1"] = {
					["buttons"] = 8,
					["buttonSpacing"] = 1,
					["buttonSize"] = 50,
				},
				["bar5"] = {
					["buttonSize"] = 38,
					["buttonsPerRow"] = 12,
					["buttonSpacing"] = 1,
					["buttons"] = 9,
				},
				["microbar"] = {
					["buttons"] = 8,
				},
				["backdropSpacingConverted"] = true,
			},
			["layoutSet"] = "tank",
			["unitframe"] = {
				["smoothbars"] = true,
				["colors"] = {
					["castColor"] = {
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
					["auraBarBuff"] = {
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
					["health"] = {
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
				},
				["units"] = {
					["player"] = {
						["debuffs"] = {
							["attachTo"] = "BUFFS",
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
						},
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["castbar"] = {
							["height"] = 40,
							["width"] = 405,
							["insideInfoPanel"] = false,
						},
						["height"] = 82,
						["buffs"] = {
							["enable"] = true,
							["attachTo"] = "FRAME",
						},
						["classbar"] = {
							["height"] = 14,
						},
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["raid40"] = {
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
					},
					["pet"] = {
						["infoPanel"] = {
							["height"] = 14,
						},
						["debuffs"] = {
							["enable"] = true,
							["anchorPoint"] = "TOPRIGHT",
						},
						["disableTargetGlow"] = false,
						["castbar"] = {
							["iconSize"] = 32,
						},
						["width"] = 270,
					},
					["target"] = {
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
						},
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
						["height"] = 82,
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["orientation"] = "LEFT",
						["castbar"] = {
							["height"] = 40,
							["width"] = 405,
							["insideInfoPanel"] = false,
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["xOffset"] = 0,
							["size"] = 12,
						},
						["rdebuffs"] = {
							["xOffset"] = 30,
							["font"] = "PT Sans Narrow",
							["size"] = 30,
							["yOffset"] = 25,
						},
						["numGroups"] = 8,
						["width"] = 92,
						["infoPanel"] = {
							["enable"] = true,
						},
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 2,
							["position"] = "BOTTOMLEFT",
						},
						["health"] = {
							["frequentUpdates"] = true,
						},
						["growthDirection"] = "RIGHT_UP",
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
							["anchorPoint"] = "TOPRIGHT",
						},
						["threatStyle"] = "GLOW",
						["power"] = {
							["enable"] = false,
						},
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["xOffset"] = 2,
							["enable"] = false,
							["yOffset"] = 0,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 270,
					},
					["party"] = {
						["height"] = 74,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["width"] = 231,
						["power"] = {
							["height"] = 13,
						},
					},
				},
			},
			["v11NamePlateReset"] = true,
			["tooltip"] = {
				["healthBar"] = {
					["height"] = 12,
					["fontOutline"] = "MONOCHROMEOUTLINE",
				},
				["fontSize"] = 10,
			},
		},
		["Benfinegold - Firemaw"] = {
			["databars"] = {
				["reputation"] = {
					["enable"] = true,
					["orientation"] = "HORIZONTAL",
				},
				["experience"] = {
					["orientation"] = "HORIZONTAL",
					["width"] = 350,
				},
				["petExperience"] = {
					["orientation"] = "HORIZONTAL",
					["textSize"] = 12,
					["width"] = 350,
				},
			},
			["currentTutorial"] = 5,
			["general"] = {
				["totems"] = {
					["size"] = 51,
					["growthDirection"] = "HORIZONTAL",
					["spacing"] = 8,
				},
				["bonusObjectivePosition"] = "AUTO",
				["bottomPanel"] = false,
				["valuecolor"] = {
					["b"] = 0.92,
					["g"] = 0.78,
					["r"] = 0.25,
				},
				["autoAcceptInvite"] = true,
				["objectiveFrameHeight"] = 400,
				["talkingHeadFrameScale"] = 1,
				["minimap"] = {
					["size"] = 221,
				},
			},
			["movers"] = {
				["ThreatBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,285,286",
				["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,-627,4",
				["ElvUF_RaidMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,5",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,4",
				["GMMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-760,41",
				["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-959,-4",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "TOP,ElvUIParent,TOP,0,-139",
				["QuestWatchFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-599,-399",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["ElvUF_FocusMover"] = "TOP,ElvUIParent,TOP,-438,-125",
				["ElvUF_AssistMover"] = "BOTTOM,ElvUIParent,BOTTOM,-450,247",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,503,243",
				["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-285,286",
				["DurabilityFrameMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,511,346",
				["ElvUF_PetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-500,394",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,-69,-4",
				["ExperienceBarMover"] = "TOP,ElvUIParent,TOP,0,-4",
				["ElvUF_PartyMover"] = "TOP,ElvUIParent,TOP,-441,-274",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,285,233",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,840,191",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-503,351",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,0,-67",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-285,302",
				["ElvAB_1"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,30,157",
				["ElvAB_2"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,20,233",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-763,-260",
				["ElvAB_4"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-202,42",
				["QuestTimerFrameMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-792,339",
				["ElvAB_6"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-202,80",
				["PetExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,53",
				["ElvAB_3"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,21,195",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-717,-249",
				["VehicleLeaveButton"] = "TOP,ElvUIParent,TOP,-356,-510",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,285,302",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,769",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-735,437",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
				["ElvUF_Raid40Mover"] = "BOTTOM,ElvUIParent,BOTTOM,0,5",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ArenaHeaderMover"] = "TOP,ElvUIParent,TOP,663,-269",
				["ElvAB_5"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-202,4",
				["ElvUF_TankMover"] = "TOP,ElvUIParent,TOP,-441,-298",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-285,233",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
				["TimeManagerFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-4",
				["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-959,-174",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-716,-4",
			},
			["convertPages"] = true,
			["bags"] = {
				["bagSize"] = 42,
				["bankWidth"] = 474,
				["bagWidth"] = 474,
				["bankSize"] = 42,
				["scrapIcon"] = true,
			},
			["chat"] = {
				["tabSelector"] = "ARROW",
				["keywordSound"] = "Punch",
				["timeStampFormat"] = "%H:%M ",
				["keywords"] = "",
				["panelSnapLeftID"] = 1,
				["panelSnapRightID"] = 3,
				["panelColorConverted"] = true,
				["panelHeight"] = 296,
				["font"] = "Expressway",
				["copyChatLines"] = true,
				["tapFontSize"] = 10,
				["panelWidth"] = 472,
			},
			["auras"] = {
				["buffs"] = {
					["sortMethod"] = "INDEX",
					["seperateOwn"] = 0,
					["size"] = 40,
				},
				["debuffs"] = {
					["size"] = 40,
				},
			},
			["dbConverted"] = 2.29,
			["nameplates"] = {
				["units"] = {
					["TARGET"] = {
						["classpower"] = {
							["enable"] = true,
						},
					},
					["ENEMY_NPC"] = {
						["debuffs"] = {
							["enable"] = false,
						},
					},
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["buttons"] = 12,
					["buttonSize"] = 40,
				},
				["bar6"] = {
					["buttonSpacing"] = 1,
					["buttonSize"] = 40,
				},
				["bar2"] = {
					["buttonSize"] = 40,
				},
				["bar1"] = {
					["enabled"] = false,
					["buttonSpacing"] = 1,
					["buttonSize"] = 40,
				},
				["bar8"] = {
					["buttonSize"] = 40,
				},
				["bar5"] = {
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["buttons"] = 12,
					["buttonSize"] = 40,
				},
				["lockActionBars"] = false,
				["bar4"] = {
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["backdrop"] = false,
					["buttonSize"] = 40,
				},
				["bar10"] = {
					["buttonSize"] = 40,
				},
				["bar7"] = {
					["buttonSize"] = 40,
				},
				["keyDown"] = false,
				["bar9"] = {
					["buttonSize"] = 40,
				},
				["stanceBar"] = {
					["enabled"] = false,
				},
				["microbar"] = {
					["buttons"] = 8,
				},
				["backdropSpacingConverted"] = true,
			},
			["layoutSet"] = "tank",
			["unitframe"] = {
				["fontSize"] = 18,
				["colors"] = {
					["castClassColor"] = true,
					["auraBarBuff"] = {
						["b"] = 0.43,
						["g"] = 0.61,
						["r"] = 0.78,
					},
					["colorhealthbyvalue"] = false,
					["healthclass"] = true,
				},
				["smoothbars"] = true,
				["statusbar"] = "Minimalist",
				["units"] = {
					["party"] = {
						["horizontalSpacing"] = 17,
						["debuffs"] = {
							["xOffset"] = -25,
							["sizeOverride"] = 20,
							["perrow"] = 1,
						},
						["power"] = {
							["height"] = 22,
							["powerPrediction"] = true,
							["text_format"] = "",
							["position"] = "BOTTOMRIGHT",
						},
						["healPrediction"] = {
							["enable"] = true,
						},
						["castbar"] = {
							["enable"] = true,
							["width"] = 170,
						},
						["growthDirection"] = "DOWN_RIGHT",
						["width"] = 170,
						["health"] = {
							["text_format"] = "",
						},
						["name"] = {
							["text_format"] = "",
						},
						["orientation"] = "MIDDLE",
						["height"] = 80,
						["buffIndicator"] = {
							["countFontSize"] = 20,
							["size"] = 16,
						},
						["petsGroup"] = {
							["name"] = {
								["text_format"] = "",
							},
							["buffIndicator"] = {
								["size"] = 16,
							},
							["enable"] = true,
							["healPrediction"] = {
								["enable"] = true,
							},
							["height"] = 80,
							["width"] = 80,
						},
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
					},
					["raid40"] = {
						["height"] = 24,
						["rdebuffs"] = {
							["font"] = "PT Sans Narrow",
						},
						["name"] = {
							["text_format"] = "",
						},
						["health"] = {
							["text_format"] = "",
						},
					},
					["pet"] = {
						["infoPanel"] = {
							["height"] = 14,
						},
						["debuffs"] = {
							["enable"] = true,
							["anchorPoint"] = "TOPRIGHT",
						},
						["disableTargetGlow"] = false,
						["castbar"] = {
							["iconSize"] = 32,
						},
						["width"] = 270,
					},
					["target"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["castbar"] = {
							["height"] = 32,
							["width"] = 200,
							["insideInfoPanel"] = false,
						},
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["width"] = 200,
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 0,
							["text_format"] = "[health:current]",
							["yOffset"] = 5,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
							["yOffset"] = 5,
						},
						["height"] = 50,
						["orientation"] = "MIDDLE",
						["buffs"] = {
							["anchorPoint"] = "BOTTOMRIGHT",
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["powerPrediction"] = true,
							["xOffset"] = 3,
							["yOffset"] = 5,
							["strataAndLevel"] = {
								["frameLevel"] = 2,
							},
							["autoHide"] = true,
							["detachedWidth"] = 22,
							["height"] = 9,
							["width"] = "inset",
						},
						["aurabar"] = {
							["enable"] = false,
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["xOffset"] = 0,
							["size"] = 12,
						},
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 2,
							["text_format"] = "",
							["position"] = "BOTTOMLEFT",
						},
						["health"] = {
							["frequentUpdates"] = true,
							["text_format"] = "",
						},
						["height"] = 40,
						["rdebuffs"] = {
							["xOffset"] = 30,
							["font"] = "PT Sans Narrow",
							["size"] = 30,
							["yOffset"] = 25,
						},
						["numGroups"] = 8,
						["growthDirection"] = "RIGHT_UP",
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
							["anchorPoint"] = "TOPRIGHT",
						},
						["threatStyle"] = "GLOW",
						["power"] = {
							["enable"] = false,
						},
						["height"] = 32,
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["xOffset"] = 2,
							["enable"] = false,
							["yOffset"] = 0,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 150,
					},
					["player"] = {
						["debuffs"] = {
							["enable"] = false,
							["attachTo"] = "BUFFS",
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 22,
							["enable"] = false,
						},
						["healPrediction"] = {
							["absorbStyle"] = "NORMAL",
						},
						["disableMouseoverGlow"] = true,
						["width"] = 200,
						["castbar"] = {
							["height"] = 32,
							["width"] = 200,
							["icon"] = false,
							["insideInfoPanel"] = false,
						},
						["colorOverride"] = "FORCE_ON",
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[health:current]",
							["bgUseBarTexture"] = false,
						},
						["orientation"] = "MIDDLE",
						["height"] = 50,
						["buffs"] = {
							["attachTo"] = "FRAME",
						},
						["classbar"] = {
							["detachFromFrame"] = true,
							["detachedWidth"] = 200,
							["height"] = 12,
						},
						["aurabar"] = {
							["enable"] = false,
						},
					},
				},
			},
			["v11NamePlateReset"] = true,
			["tooltip"] = {
				["healthBar"] = {
					["height"] = 12,
					["fontOutline"] = "MONOCHROMEOUTLINE",
				},
				["fontSize"] = 10,
			},
		},
		["Hgyoibhiluhn - Firemaw"] = {
			["currentTutorial"] = 1,
			["v11NamePlateReset"] = true,
		},
	},
	["LuaErrorDisabledAddOns"] = {
	},
	["faction"] = {
		["Firemaw"] = {
			["Ges"] = "Horde",
			["Machiavellia"] = "Horde",
			["Baldhumanman"] = "Horde",
			["Algorithm"] = "Horde",
			["Slamwarrior"] = "Horde",
			["Gæs"] = "Horde",
			["Gesbank"] = "Horde",
			["Bottomline"] = "Horde",
			["Gehs"] = "Horde",
			["Coomerchamp"] = "Horde",
			["Benfinegold"] = "Horde",
			["Hgyoibhiluhn"] = "Horde",
		},
		["Earthshaker"] = {
			["Hasteshill"] = "Alliance",
		},
	},
	["gold"] = {
		["Firemaw"] = {
			["Ges"] = 101721,
			["Machiavellia"] = 369570,
			["Baldhumanman"] = 0,
			["Algorithm"] = 2873,
			["Slamwarrior"] = 86348,
			["Gæs"] = 89058,
			["Gesbank"] = 105132,
			["Benfinegold"] = 255681,
			["Gehs"] = 794756,
			["Coomerchamp"] = 1197,
			["Bottomline"] = 0,
			["Hgyoibhiluhn"] = 0,
		},
		["Earthshaker"] = {
			["Hasteshill"] = 5,
		},
	},
	["global"] = {
		["nameplate"] = {
			["filters"] = {
				["ElvUI_TankNonTarget"] = {
				},
				["ElvUI_TankTarget"] = {
				},
			},
		},
		["general"] = {
			["showMissingTalentAlert"] = true,
			["allowDistributor"] = true,
			["UIScale"] = 0.7000000000000001,
		},
		["unitframe"] = {
			["aurawatch"] = {
				["DRUID"] = {
					[26980] = {
						["style"] = "texturedIcon",
					},
					[26981] = {
						["style"] = "texturedIcon",
					},
					[9839] = {
						["style"] = "texturedIcon",
					},
					[9840] = {
						["style"] = "texturedIcon",
					},
					[2091] = {
						["style"] = "texturedIcon",
					},
					[9841] = {
						["style"] = "texturedIcon",
					},
					[3627] = {
						["style"] = "texturedIcon",
					},
					[26990] = {
						["style"] = "texturedIcon",
					},
					[26992] = {
						["style"] = "texturedIcon",
					},
					[9750] = {
						["style"] = "texturedIcon",
					},
					[33763] = {
						["style"] = "texturedIcon",
					},
					[9910] = {
						["style"] = "texturedIcon",
					},
					[25299] = {
						["style"] = "texturedIcon",
					},
					[8936] = {
						["style"] = "texturedIcon",
					},
					[9756] = {
						["style"] = "texturedIcon",
					},
					[8938] = {
						["style"] = "texturedIcon",
					},
					[8907] = {
						["style"] = "texturedIcon",
					},
					[1126] = {
						["style"] = "texturedIcon",
					},
					[9885] = {
						["style"] = "texturedIcon",
					},
					[1075] = {
						["style"] = "texturedIcon",
					},
					[8941] = {
						["style"] = "texturedIcon",
					},
					[8910] = {
						["style"] = "texturedIcon",
					},
					[21849] = {
						["style"] = "texturedIcon",
					},
					[6756] = {
						["style"] = "texturedIcon",
					},
					[9857] = {
						["style"] = "texturedIcon",
					},
					[782] = {
						["style"] = "texturedIcon",
					},
					[8914] = {
						["style"] = "texturedIcon",
					},
					[29166] = {
						["style"] = "texturedIcon",
					},
					[9884] = {
						["style"] = "texturedIcon",
					},
					[467] = {
						["style"] = "texturedIcon",
					},
					[9856] = {
						["style"] = "texturedIcon",
					},
					[5232] = {
						["style"] = "texturedIcon",
					},
					[8940] = {
						["style"] = "texturedIcon",
					},
					[774] = {
						["style"] = "texturedIcon",
					},
					[1058] = {
						["style"] = "texturedIcon",
					},
					[1430] = {
						["style"] = "texturedIcon",
					},
					[21850] = {
						["style"] = "texturedIcon",
					},
					[26982] = {
						["style"] = "texturedIcon",
					},
					[8939] = {
						["style"] = "texturedIcon",
					},
					[5234] = {
						["style"] = "texturedIcon",
					},
					[2090] = {
						["style"] = "texturedIcon",
					},
					[9858] = {
						["style"] = "texturedIcon",
					},
				},
			},
		},
	},
}
ElvPrivateDB = {
	["profileKeys"] = {
		["Machiavellia - Firemaw"] = "Machiavellia - Firemaw",
		["Ges - Firemaw"] = "Ges - Firemaw",
		["Slamwarrior - Firemaw"] = "Slamwarrior - Firemaw",
		["Algorithm - Firemaw"] = "Algorithm - Firemaw",
		["Gæs - Firemaw"] = "Gæs - Firemaw",
		["Baldhumanman - Firemaw"] = "Baldhumanman - Firemaw",
		["Gehs - Firemaw"] = "Gehs - Firemaw",
		["Hasteshill - Earthshaker"] = "Hasteshill - Earthshaker",
		["Coomerchamp - Firemaw"] = "Coomerchamp - Firemaw",
		["Bottomline - Firemaw"] = "Bottomline - Firemaw",
		["Gesbank - Firemaw"] = "Gesbank - Firemaw",
		["Benfinegold - Firemaw"] = "Benfinegold - Firemaw",
		["Hgyoibhiluhn - Firemaw"] = "Hgyoibhiluhn - Firemaw",
	},
	["profiles"] = {
		["Machiavellia - Firemaw"] = {
			["nameplates"] = {
				["enable"] = false,
			},
			["theme"] = "default",
			["install_complete"] = 2.09,
		},
		["Ges - Firemaw"] = {
			["nameplates"] = {
				["enable"] = false,
			},
			["general"] = {
				["chatBubbleName"] = true,
			},
			["theme"] = "class",
			["install_complete"] = 2.09,
		},
		["Slamwarrior - Firemaw"] = {
			["theme"] = "class",
			["install_complete"] = "1.22",
		},
		["Algorithm - Firemaw"] = {
			["theme"] = "default",
			["install_complete"] = "1.15",
		},
		["Gæs - Firemaw"] = {
			["nameplates"] = {
				["enable"] = false,
			},
			["theme"] = "default",
			["install_complete"] = 2.09,
		},
		["Baldhumanman - Firemaw"] = {
			["theme"] = "class",
			["install_complete"] = "1.22",
		},
		["Gehs - Firemaw"] = {
			["nameplates"] = {
				["enable"] = false,
			},
			["skins"] = {
				["parchmentRemoverEnable"] = true,
			},
			["theme"] = "class",
			["install_complete"] = "1.15",
		},
		["Hasteshill - Earthshaker"] = {
			["theme"] = "class",
			["install_complete"] = "1.22",
		},
		["Coomerchamp - Firemaw"] = {
			["install_complete"] = "1.22",
		},
		["Bottomline - Firemaw"] = {
			["install_complete"] = "1.15",
		},
		["Gesbank - Firemaw"] = {
			["nameplates"] = {
				["enable"] = false,
			},
			["theme"] = "class",
			["install_complete"] = "1.15",
		},
		["Benfinegold - Firemaw"] = {
			["nameplates"] = {
				["enable"] = false,
			},
			["theme"] = "default",
			["install_complete"] = "1.15",
		},
		["Hgyoibhiluhn - Firemaw"] = {
			["install_complete"] = "1.22",
		},
	},
}
