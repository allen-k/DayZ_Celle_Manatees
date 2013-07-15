_pilotArray = [
"Asano_DZC",
"BAF_Pilot1_DZC",
"BAF_Pilot2_DZC",
"BAF_Pilot3_DZC",
"CIV_Pilot1_DZC",
"CZ_Pilot1_DZC",
"CZ_Pilot2_DZC",
"CZ_Pilot3_DZC",
"INS_Soldier_Pilot"
];

pilotskins = [];

pilotskins set [count pilotskins, player addAction [("<t color=""#FF7300"">" + ("Close Skin Menu") +"</t>"), "manatee\admintools\skins\skinsClose.sqf"]];

for "_i" from 0 to (count _pilotArray)-1 do {
	pilotskins set [count pilotskins, player addAction [("<t color=""#FFC726"">" + (_pilotArray select _i) +"</t>"), "manatee\admintools\skins\changeSkin.sqf",(_pilotArray select _i), 0, false, true]];
};