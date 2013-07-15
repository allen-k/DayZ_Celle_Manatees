_soldierhArray = [
"BAF_Heavy1_DZC",
"BAF_Heavy2_DZC",
"BAF_Heavy3_DZC",
"Clan_Delta1",
"Clan_Delta2",
"Clan_Delta3_DZC",
"CZ_Heavy1_DZC",
"CZ_Heavy2_DZC",
"CZ_Heavy3_DZC",
"US_Heavy1_DZC",
"US_Heavy2_DZC"
];

soldierskins = [];

soldierskins set [count soldierskins, player addAction [("<t color=""#FF7300"">" + ("Close Skin Menu") +"</t>"), "manatee\admintools\skins\skinsClose.sqf"]];

for "_i" from 0 to (count _soldierhArray)-1 do {
	soldierskins set [count soldierskins, player addAction [("<t color=""#FFC726"">" + (_soldierhArray select _i) +"</t>"), "manatee\admintools\skins\changeSkin.sqf",(_soldierhArray select _i), 0, false, true]];
};