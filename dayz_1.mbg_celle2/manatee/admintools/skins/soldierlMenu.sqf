_soldierlArray = [
"BAF_Soldier_L_DDPM",
"BAF_Soldier_L_MTP",
"BAF_Soldier_L_W",
"CDF_Soldier_Light",
"CDF_Soldier_Militia",
"Civ_Soldier_DZC",
"Clan_UN_Helmet_DZC",
"CZ_Soldier_Light_DES_EP1",
"Herrera_Light",
"Ins_Soldier_1",
"Ins_Soldier_Medic",
"RU_Soldier_Light",
"SBE_CZ_Soldier_Light_DES_EP1",
"SBE_CZ_Soldier_Light_WLD_EP1",
"Snow_Trooper1_DZC",
"Snow_Trooper2_DZC",
"Soldier1_GL_DZC",
"Soldier1_SF_DZC",
"Soldier2_GL_DZC",
"Soldier2_SF_DZC",
"Soldier3_GL_DZC",
"Soldier3_SF_DZC",
"US_Soldier_Light_EP1",
"USMC_Soldier_Light"
];

soldierlskins = [];

soldierlskins set [count soldierlskins, player addAction [("<t color=""#FF7300"">" + ("Close Skin Menu") +"</t>"), "manatee\admintools\skins\skinsClose.sqf"]];

for "_i" from 0 to (count _soldierlArray)-1 do {
	soldierlskins set [count soldierlskins, player addAction [("<t color=""#FFC726"">" + (_soldierlArray select _i) +"</t>"), "manatee\admintools\skins\changeSkin.sqf",(_soldierlArray select _i), 0, false, true]];
};