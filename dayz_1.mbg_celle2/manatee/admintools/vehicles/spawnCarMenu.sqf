_carArray = [
"car_hatchback",
"car_sedan",
"Lada1",
"Lada1_GDR",
"Lada1_TK_CIV_EP1",
"Lada2",
"Lada2_GDR",
"Lada2_TK_CIV_EP1",
"Lada3_GDR",
"Lada4_GDR",
"Lada5_GDR",
"LadaLM",
"kpfs_golf_bl",
"kpfs_golf_g",
"kpfs_golf_p",
"kpfs_golf_post",
"kpfs_golf_tk",
"kpfs_golf_y",
"policecar",
"S1203_TK_CIV_EP1",
"SUV_PMC",
"Skoda",
"SkodaBlue",
"SkodaGreen",
"SkodaRed",
"Volha_1_TK_CIV_EP1",
"Volha_2_TK_CIV_EP1",
"VolhaLimo_TK_CIV_EP1"
];

adminspawncar = [];

adminspawncar set [count adminspawncar, player addAction [("<t color=""#FF7300"">" + ("Close Spawn Menu") +"</t>"), "manatee\admintools\vehicles\spawnClose.sqf"]];

for "_i" from 0 to (count _carArray)-1 do {
	adminspawncar set [count adminspawncar, player addAction [("<t color=""#FFC726"">" + (_carArray select _i) +"</t>"), "manatee\admintools\vehicles\spawnItem.sqf",(_carArray select _i), 0, false, true]];
};