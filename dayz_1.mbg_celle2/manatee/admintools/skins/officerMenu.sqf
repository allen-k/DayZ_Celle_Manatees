_officerArray = [
"BAF_Officer1_DZC",
"BAF_Officer2_DZC",
"BAF_Officer3_DZC",
"BAF_Soldier_Officer_DDPM",
"BAF_Soldier_Officer_MTP",
"BAF_Soldier_Officer_W",
"CDF_Commander",
"Clan_Officer1_DZC",
"Clan_Officer2_DZC",
"Clan_Officer3_DZC",
"Clan_UN_Cap_DZC",
"CZ_Officer1_DZC",
"CZ_Officer2_DZC",
"CZ_Officer3_DZC",
"CZ_Soldier_Office_DES_EP1",
"GER_Officer1_DZC",
"RU_Commander",
"SBE_CZ_Soldier_Office_DES_EP1",
"SBE_CZ_Soldier_Office_WLD_EP1",
"USMC_Soldier_Officer"
];

officerskins = [];

officerskins set [count officerskins, player addAction [("<t color=""#FF7300"">" + ("Close Skin Menu") +"</t>"), "manatee\admintools\skins\skinsClose.sqf"]];

for "_i" from 0 to (count _officerArray)-1 do {
	officerskins set [count officerskins, player addAction [("<t color=""#FFC726"">" + (_officerArray select _i) +"</t>"), "manatee\admintools\skins\changeSkin.sqf",(_officerArray select _i), 0, false, true]];
};