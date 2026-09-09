// Array of all groups that need IDs/Markers.
// FORMAT: [groupIDVariable,groupName,markerType,markerName,markerColor,createChannelGroup]
// * Markers are NEVER shared between sides.
// * You can edit the RGBA values to change the colours.
// * You can delete any groups you're not using (e.g. remove '_grpBLU = [ ... ];' if you're OPFOR).
// ====================================================================================
private ["_red", "_blue", "_green", "_yellow", "_orange", "_purple", "_black", "_white", "_blufor", "_opfor"];
_red = 		[1,   0,   0,   1	];
_blue = 	[0,   0,   1,   1	];
_green = 	[0,   0.5, 0,   1	];
_yellow = 	[1,   1,   0,   1	];
_orange = 	[1,   0.6, 0,   1	];
_purple	=	[0.5, 0,   0.5, 1 	];
_black =	[0,   0,   0,   1	];
_white =	[1,   1,   1,   1	];
_blufor = 	[0,   0.3, 0.6, 1	];
_opfor = 	[0.5, 0,   0,   1	];

_grpBLU = [
	["GrpBLU_CO","CO","b_hq","CO",_orange]
	,["GrpBLU_ASL","Bravo 1","b_inf","B1",_orange]
	,["GrpBLU_BSL","Bravo 2","b_inf","B2",_orange]
	,["GrpBLU_CSL","Bravo 3","b_inf","B3",_orange]
	,["GrpBLU_IFV1","IFV 1","b_mech_inf","IFV1",_orange]
	,["GrpBLU_IFV2","IFV 2","b_mech_inf","IFV2",_orange]
	,["GrpBLU_TNK1","Thunder 1","b_armor","THU1",_orange]
	,["GrpBLU_TNK2","Thunder 2","b_armor","THU2",_orange]
	,["GrpBLU_TH1","Air 1","b_air","AIR1",_orange]
	,["GrpBLU_TH2","Air 2","b_air","AIR2",_orange]
	,["GrpBLU_AH1","Eagle","b_air","EAGLE",_orange]
];

_grpOPF = [
	["GrpOPF_CO","CO","b_hq","CO",_orange]
	,["GrpOPF_ASL","Bravo 1","b_inf","B1",_orange]
	,["GrpOPF_BSL","Bravo 2","b_inf","B2",_orange]
	,["GrpOPF_CSL","Bravo 3","b_inf","B3",_orange]
	,["GrpOPF_IFV1","IFV 1","b_mech_inf","IFV1",_orange]
	,["GrpOPF_IFV2","IFV 2","b_mech_inf","IFV2",_orange]
	,["GrpOPF_TNK1","Thunder 1","b_armor","THU1",_orange]
	,["GrpOPF_TNK2","Thunder 2","b_armor","THU2",_orange]
	,["GrpOPF_TH1","Air 1","b_air","AIR1",_orange]
	,["GrpOPF_TH2","Air 2","b_air","AIR2",_orange]
	,["GrpOPF_AH1","Eagle","b_air","EAGLE",_orange]
];

_grpIND = [
	["GrpIND_CO","CO","b_hq","CO",_orange]
	,["GrpIND_ASL","Bravo 1","b_inf","B1",_orange]
	,["GrpIND_BSL","Bravo 2","b_inf","B2",_orange]
	,["GrpIND_CSL","Bravo 3","b_inf","B3",_orange]
	,["GrpIND_IFV1","IFV","b_mech_inf","IFV",_orange]
	,["GrpIND_TNK1","Thunder","b_armor","THU",_orange]
	,["GrpIND_TH1","Air 1","b_air","AIR1",_orange]
	,["GrpIND_TH2","Air 2","b_air","AIR2",_orange]
	,["GrpIND_AH1","Eagle","b_air","EAGLE",_orange]
];