_civArray = [
"Cameraman_DZC",
"Clan_nobackpack_INS1_DZC",
"Clan_nobackpack_INS2_DZC",
"Clan_nobackpack_INS3_DZC",
"Clan_nobackpack_suit_DZC",
"Doctor_DZC",
"Euroman01_DZC",
"Euroman02_DZC",
"FRG_Doctor",
"FRG_SchoolTeacher",
"FRG_Worker1",
"FRG_Worker2",
"FRG_Worker3",
"FRG_Worker4",
"GDR_Doctor",
"GDR_SchoolTeacher",
"Ins_Bardak",
"Ins_Commander",
"Ins_Lopotev",
"Ins_Villager3",
"Ins_Villager4",
"Ins_Woodlander1",
"Ins_Woodlander2",
"Ins_Woodlander3",
"Ins_Worker2",
"KPFS_Functionary_CDU",
"KPFS_Functionary_FDP",
"KPFS_Functionary_SED",
"KPFS_Functionary_SPD",
"KPFS_Sportswoman_FRG",
"KPFS_Sportswoman_GDR",
"Villager1"
];

civilianskins = [];

civilianskins set [count civilianskins, player addAction [("<t color=""#FF7300"">" + ("Close Skin Menu") +"</t>"), "manatee\admintools\skins\skinsClose.sqf"]];

for "_i" from 0 to (count _civArray)-1 do {
	civilianskins set [count civilianskins, player addAction [("<t color=""#FFC726"">" + (_civArray select _i) +"</t>"), "manatee\admintools\skins\changeSkin.sqf",(_civArray select _i), 0, false, true]];
};