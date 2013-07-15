_armoredArray = [
"AAV",
"BAF_FV510_D",
"BMP3",
"BTR60_TK_EP1",
"BTR90_HQ",
"GAZ_Vodnik_HMG",
"LAV25",
"LAV25_HQ",
"M1128_MGS_EP1",
"M1135_ATGMV_EP1",
"M1A1",
"M1A2_TUSK_MG",
"M2A2_EP1",
"M2A3_EP1",
"MLRS"
];

adminspawnarmored = [];

adminspawnarmored set [count adminspawnarmored, player addAction [("<t color=""#FF7300"">" + ("Close Spawn Menu") +"</t>"), "manatee\admintools\vehicles\spawnClose.sqf"]];

for "_i" from 0 to (count _armoredArray)-1 do {
	adminspawnarmored set [count adminspawnarmored, player addAction [("<t color=""#FFC726"">" + (_armoredArray select _i) +"</t>"), "manatee\admintools\vehicles\spawnItem.sqf",(_armoredArray select _i), 0, false, true]];
};