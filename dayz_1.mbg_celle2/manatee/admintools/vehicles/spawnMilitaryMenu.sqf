_militaryArray = [
"HMMWV_DZ",
"HMMWV_M2_DZ",
"HMMWV_M998_crows_M2_DES_EP1",
"HMMWV_TOW",
"HMMWV_TOW_DZ",
"LandRover_MG_TK_EP1_DZ",
"LandRover_MG_TK_INS_EP1_DZ",
"LandRover_SPG9_TK_INS_EP1_DZ",
"LandRover_Special_CZ_EP1_DZ",
"UAZ_CDF",
"UAZ_MG_CDF_DZ",
"UAZ_MG_INS_DZ",
"UAZ_Unarmed_TK_EP1",
"UAZ_Unarmed_TK_CIV_EP1",
"UAZ_Unarmed_UN_EP1"
];

adminspawnmilitary = [];

adminspawnmilitary set [count adminspawnmilitary, player addAction [("<t color=""#FF7300"">" + ("Close Spawn Menu") +"</t>"), "manatee\admintools\vehicles\spawnClose.sqf"]];

for "_i" from 0 to (count _militaryArray)-1 do {
	adminspawnmilitary set [count adminspawnmilitary, player addAction [("<t color=""#FFC726"">" + (_militaryArray select _i) +"</t>"), "manatee\admintools\vehicles\spawnItem.sqf",(_militaryArray select _i), 0, false, true]];
};