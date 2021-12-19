local addon, ATTdbs = ...

ATTdbs.cooldownResetters = {
	[GetSpellInfo(11958)] = { -- Cold Snap
		[12472] = 1, 		
		[45438] = 1,  
		[31687] = 1, 		
	},
	[GetSpellInfo(14185)] = { -- 2
         [26669] = 1,
         [11305] = 1,
         [26889] = 1,
         [14177] = 1,
         [36554] = 1,		
	},
	[GetSpellInfo(23989)] = { -- 2
         ["ALL"] = 1,	
	},
}

ATTdbs.ShareCD = {
	[GetSpellInfo(27087)] = { [33043] = 1, },
	[GetSpellInfo(33043)] = { [27087] = 1, },
	[GetSpellInfo(25454)] = { [25464] = 1, [25457] = 1, },
	[GetSpellInfo(25464)] = { [25454] = 1, [25457] = 1,	},
	[GetSpellInfo(25457)] = { [25464] = 1, [25454] = 1, },
	[GetSpellInfo(1020)] = { [31884] = 1, }, -- 60
	[GetSpellInfo(31884)] = { [1020] = 1, }, -- 60
	[GetSpellInfo(6554)] = { [29704] = 1, }, --60
	[GetSpellInfo(29704)] = { [6554] = 1, }, -- 60
	[GetSpellInfo(14311)] = { [13809] = 1, [34600] = 1,[27025] = 1,},
	[GetSpellInfo(13809)] = { [14311] = 1, [34600] = 1, [27025] = 1,},
	[GetSpellInfo(34600)] = { [14311] = 1, [13809] = 1,[27025] = 1,},
	[GetSpellInfo(27025)] = { [14311] = 1, [13809] = 1, [34600] = 1,}
}

ATTdbs.dbModif = {
     [14311] = { ["mod"]= GetSpellInfo(34493), ["rank"] ={2, 4, 6,}, },
     [13809] = { ["mod"]= GetSpellInfo(34493), ["rank"] ={2, 4, 6,}, },
     [34600] = { ["mod"]= GetSpellInfo(34493), ["rank"] ={2, 4, 6,}, },
     [27025] = { ["mod"]= GetSpellInfo(34493), ["rank"] ={2, 4, 6,}, },
     [27023] = { ["mod"]= GetSpellInfo(34493), ["rank"] ={2, 4, 6,}, },
     [3045] = { ["mod"]= GetSpellInfo(34949), ["rank"] ={60, 120,}, },
     [45438] = { ["mod"]= GetSpellInfo(31672), ["rank"] ={30, 60,}, }, --% 10 20
     [27087] = { ["mod"]= GetSpellInfo(31672), ["rank"] ={1, 2,}, }, --%
     [11958] = { ["mod"]= GetSpellInfo(31672), ["rank"] ={48, 96,}, }, --%
     [33405] = { ["mod"]= GetSpellInfo(31672), ["rank"] ={3, 6,}, }, --%
     [27088] = { ["mod"]= GetSpellInfo(12475), ["rank"] ={2, 4,}, }, 
     [10308] = { ["mod"]= GetSpellInfo(20489), ["rank"] ={5, 10,15}, }, 
     [10278] = { ["mod"]= GetSpellInfo(20175), ["rank"] ={60, 120,}, }, 
     [1020] = { ["mod"]= GetSpellInfo(31849), ["rank"] ={30, 60,}, }, 
     [10890] = { ["mod"]= GetSpellInfo(15448), ["rank"] ={2, 4,}, },
     [26669] = { ["mod"]= GetSpellInfo(13872), ["rank"] ={45, 90,}, }, 
     [11305] = { ["mod"]= GetSpellInfo(13872), ["rank"] ={45, 90,}, }, 
     [26889] = { ["mod"]= GetSpellInfo(14066), ["rank"] ={45, 90,}, }, 
     [2094] = { ["mod"]= GetSpellInfo(14066), ["rank"] ={45, 90,}, }, 
     [8177] = { ["mod"]= GetSpellInfo(16293), ["rank"] ={1, 2,}, }, 
     [25454] = { ["mod"]= GetSpellInfo(16116), ["rank"] ={0.2, 0.4,0.6,0.8,1,}, }, 
     [25464] = { ["mod"]= GetSpellInfo(16116), ["rank"] ={0.2, 0.4,0.6,0.8,1,}, }, 
     [25457] = { ["mod"]= GetSpellInfo(16116), ["rank"] ={0.2, 0.4,0.6,0.8,1,}, }, 
     [871] = { ["mod"]= GetSpellInfo(29725), ["rank"] ={240, 420,600}, }, 
     [20230] = { ["mod"]= GetSpellInfo(29725), ["rank"] ={240, 420,600}, }, 
     [1719] = { ["mod"]= GetSpellInfo(29725), ["rank"] ={240, 420,600}, }, 
     [27154] = { ["mod"]= GetSpellInfo(20235), ["rank"] ={600, 1200,}, }, 
     [25429] = { ["mod"]= GetSpellInfo(15311), ["rank"] ={3, 6,}, }, 
     [25275] = { ["mod"]= GetSpellInfo(29889), ["rank"] ={5, 10,}, }, 
     [27019] = {["mod"] = GetSpellInfo(19458), ["rank"] = {0.2, 0.4, 0.6, 0.8, 1},},
     [27079] = {["mod"] = GetSpellInfo(12342), ["rank"] = {0.5, 1, 1.5,},},
     [20271] = {["mod"] = GetSpellInfo(25957), ["rank"] = {1, 2,},},
     [25375] = {["mod"] = GetSpellInfo(15316), ["rank"] = {0.5, 1, 1.5,2,2.5,},},
     [1787] = {["mod"] = GetSpellInfo(14065), ["rank"] = {1, 2, 3,4,5,},},
     [355] = {["mod"] = GetSpellInfo(12765), ["rank"] = {1, 2,},},
     [1680] = {["mod"] = GetSpellInfo(29776), ["rank"] = {1, 2,},},
     [30330] = {["mod"] = GetSpellInfo(35451), ["rank"] = {0.2, 0.4, 0.6, 0.8, 1},},
 }

ATTdbs.dbAuraRemoved = {
	[GetSpellInfo(14177)]   = true,
	[GetSpellInfo(17116)]   = true,
	[GetSpellInfo(20580)]   = true,
	[GetSpellInfo(16166)]   = true,
	[GetSpellInfo(18288)]   = true,
	[GetSpellInfo(15473)]   = true,
	[GetSpellInfo(14751)]   = true,
	[GetSpellInfo(20216)]   = true,
	[GetSpellInfo(12043)]   = true,
	[GetSpellInfo(11129)]   = true,
	[GetSpellInfo(1787)]   = true,
	[GetSpellInfo(9913)]   = true,
	--[GetSpellInfo(16188)]   = true,
}

ATTdbs.dbAuraApplied = {
   [GetSpellInfo(11129)]   = true,
}
