_banditArray = [
"BanditW1_DZ",
"Clan_GER_DZC",
"Clan_GER_Hvy_DZC",
"Clan_Terror_DZC",
"Clan_Terror2_DZC",
"GUE_Soldier_Medic",
"TK_INS_Soldier_EP1"
];

banditskins = [];

banditskins set [count banditskins, player addAction [("<t color=""#FF7300"">" + ("Close Skin Menu") +"</t>"), "manatee\admintools\skins\skinsClose.sqf"]];

for "_i" from 0 to (count _banditArray)-1 do {
	banditskins set [count banditskins, player addAction [("<t color=""#FFC726"">" + (_banditArray select _i) +"</t>"), "manatee\admintools\skins\changeSkin.sqf",(_banditArray select _i), 0, false, true]];
};