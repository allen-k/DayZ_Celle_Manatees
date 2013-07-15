_offroadArray = [
"BAF_Offroad_D",
"BAF_Offroad_W",
"datsun1_civil_1_open",
"datsun1_civil_2_covered",
"datsun1_civil_3_open",
"hilux1_civil_1_open",
"hilux1_civil_2_covered",
"hilux1_civil_3_open",
"LandRover_CZ_EP1",
"LandRover_TK_CIV_EP1",
"Offroad_DSHKM_TK_DZ",
"Pickup_PK_TK_DZ"
];

adminspawnoffroad = [];

adminspawnoffroad set [count adminspawnoffroad, player addAction [("<t color=""#FF7300"">" + ("Close Spawn Menu") +"</t>"), "manatee\admintools\vehicles\spawnClose.sqf"]];

for "_i" from 0 to (count _offroadArray)-1 do {
	adminspawnoffroad set [count adminspawnoffroad, player addAction [("<t color=""#FFC726"">" + (_offroadArray select _i) +"</t>"), "manatee\admintools\vehicles\spawnItem.sqf",(_offroadArray select _i), 0, false, true]];
};