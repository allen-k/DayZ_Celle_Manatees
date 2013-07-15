_truckArray = [
"BW_Ikarus1",
"BW_Ikarus2",
"Ikarus",
"Ikarus_TK_CIV_EP1",
"Towingtractor",
"Tractor",
"tractorOld",
"MTVR",
"Ural_CDF",
"Ural_INS",
"Ural_TK_CIV_EP1",
"UralCivil",
"UralCivil2",
"UralOpen_INS",
"V3S_Civ"
];

adminspawntruck = [];

adminspawntruck set [count adminspawntruck, player addAction [("<t color=""#FF7300"">" + ("Close Spawn Menu") +"</t>"), "manatee\admintools\vehicles\spawnClose.sqf"]];

for "_i" from 0 to (count _truckArray)-1 do {
	adminspawntruck set [count adminspawntruck, player addAction [("<t color=""#FFC726"">" + (_truckArray select _i) +"</t>"), "manatee\admintools\vehicles\spawnItem.sqf",(_truckArray select _i), 0, false, true]];
};