_boxArray = [
"BAF_BasicAmmunitionBox",
"BAF_BasicWeapons",
"BAF_Launchers",
"BAF_IEDBox",
"CZBasicWeapons_EP1",
"GERBasicWeapons_EP1",
"GuerillaCacheBox",
"Ammobox_PMC",
"RHmgswpammobox",
"RHpistammobox",
"RHsmgbox",
"RUBasicAmmunitionBox",
"RUBasicWeaponsBox",
"RULaunchersBox",
"RUSpecialWeaponsBox",
"SpecialWeaponsBox",
"TKBasicAmmunitionBox_EP1",
"TKBasicWeapons_EP1",
"TKLaunchers_EP1",
"TKSpecialWeapons_EP1",
"UNBasicAmmunitionBox_EP1",
"UNBasicWeapons_EP1",
"USBasicAmmunitionBox_EP1",
"USBasicWeapons_EP1",
"USLaunchers_EP1",
"USOrdnanceBox_EP1",
"USSpecialWeapons_EP1",
"USBasicAmmunitionBox",
"USBasicWeaponsBox",
"USLaunchersBox",
"USSpecialWeaponsBox"
];

adminspawnbox = [];

adminspawnbox set [count adminspawnbox, player addAction [("<t color=""#FF7300"">" + ("Close Spawn Menu") +"</t>"), "manatee\admintools\vehicles\spawnClose.sqf"]];
adminspawnbox set [count adminspawnbox, player addAction [("<t color=""#FFC726"">" + ("AdminHackerBox") +"</t>"), "manatee\admintools\vehicles\AdminBox.sqf"]];
adminspawnbox set [count adminspawnbox, player addAction [("<t color=""#FFC726"">" + ("MedBox0") +"</t>"), "manatee\admintools\vehicles\MedBox0.sqf"]];
adminspawnbox set [count adminspawnbox, player addAction [("<t color=""#FFC726"">" + ("FoodBox1") +"</t>"), "manatee\admintools\vehicles\FoodBox1.sqf"]];
adminspawnbox set [count adminspawnbox, player addAction [("<t color=""#FFC726"">" + ("Skin_Box") +"</t>"), "manatee\admintools\vehicles\SkinBox.sqf"]];

for "_i" from 0 to (count _boxArray)-1 do {
	adminspawnbox set [count adminspawnbox, player addAction [("<t color=""#FFC726"">" + (_boxArray select _i) +"</t>"), "manatee\admintools\vehicles\spawnItem.sqf",(_boxArray select _i), 0, false, true]];
};