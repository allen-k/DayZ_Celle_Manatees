_airArray = [
"A10",
"AH1Z",
"AH64D_EP1",
"AN2_DZ",
"AV8B2",
"AW159_Lynx_BAF",
"BAF_Apache_AH1_D",
"BAF_Merlin_DZC",
"Gazelle2",
"GazelleDPM",
"GazelleUN",
"Ka52",
"MH6J_DZ",
"MH60S",
"Mi17_rockets_RU",
"Mi171Sh_CZ_EP1",
"Mi24_D",
"Mi24_P",
"Mi24_V",
"MV22",
"Su34",
"Su39",
"UH1H_DZ",
"UH1Y"
];

adminspawnair = [];

adminspawnair set [count adminspawnair, player addAction [("<t color=""#FF7300"">" + ("Close Spawn Menu") +"</t>"), "manatee\admintools\vehicles\spawnClose.sqf"]];

for "_i" from 0 to (count _airArray)-1 do {
	adminspawnair set [count adminspawnair, player addAction [("<t color=""#FFC726"">" + (_airArray select _i) +"</t>"), "manatee\admintools\vehicles\spawnItem.sqf",(_airArray select _i), 0, false, true]];
};