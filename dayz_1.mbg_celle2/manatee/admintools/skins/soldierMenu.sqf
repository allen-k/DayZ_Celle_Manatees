_soldierArray = [
"BAF_Soldier_DDPM",
"BAF_Soldier_MTP",
"BAF_Soldier_W",
"Camo1_DZC",
"Camo2_DZC",
"Camo3_DZC",
"CDF_Soldier",
"CDF_Soldier_AR",
"CDF_Soldier_Medic",
"CZ_Soldier_DES_EP1",
"CZ_Soldier_medik_DES_EP1",
"FR_Corpsman",
"GER_Soldier_Medic_EP1",
"Herrera",
"RU_Soldier_Medic",
"SBE_CZ_Soldier_B_DES_EP1",
"SBE_CZ_Soldier_B_WLD_EP1",
"SBE_CZ_Soldier_DES_EP1",
"SBE_CZ_Soldier_WLD_EP1",
"Sniper1_DZC",
"Sniper2_DZC",
"Sniper3_DZC",
"Soldier1_AT_DZC",
"Soldier1_SL_DZC",
"Soldier1_STD_DZC",
"Soldier2_AT_DZC",
"Soldier2_SL_DZC",
"Soldier2_STD_DZC",
"Soldier3_AT_DZC",
"Soldier3_DZC",
"Soldier3_SL_DZC",
"Soldier3_STD_DZC",
"TK_Soldier_Medic_EP1",
"US_Soldier_EP1",
"US_Soldier_Medic_EP1",
"US_Soldier_Officer_EP1",
"USMC_Soldier_Crew",
"USMC_Soldier_Medic"
];

soldierskins = [];

soldierskins set [count soldierskins, player addAction [("<t color=""#FF7300"">" + ("Close Skin Menu") +"</t>"), "manatee\admintools\skins\skinsClose.sqf"]];

for "_i" from 0 to (count _soldierArray)-1 do {
	soldierskins set [count soldierskins, player addAction [("<t color=""#FFC726"">" + (_soldierArray select _i) +"</t>"), "manatee\admintools\skins\changeSkin.sqf",(_soldierArray select _i), 0, false, true]];
};