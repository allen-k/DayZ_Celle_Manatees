// parameter format, array of:
// output item, array of input items and how many of each item. Treat each input item as an array
// that includes the class name and the number required.


// PARAMETER STRUCTURE VERY IMPORTANT
// type = 0 for magazine, 1 for weapon/toolbelt
// [ [ type, "Finished Readable Item Name","FinishedItemClassName","FinishedQty" ] , [ [type, "RequiredClassName","RequiredQty"] , [type, "RequiredClassName2","RequiredQty"] ... ]]

sleep 1;

if (!show_weapons) then {
	show_weapons = true;
	_restriction = "count ((position player) nearObjects ['Land_fire', 10]) > 0";

	manatee_craft_menu_wea = [];
	manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("     Satchel Charge") +"</t>"),"manatee\crafting\oven.sqf",[[0,"Satchel Charge","PipeBomb",1],[[0,"1Rnd_HE_M203",3],[0,"HandGrenade_West",4]]],92,false,false,"",_restriction]];
	manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("     DE Ammo Clip") +"</t>"),"manatee\crafting\oven.sqf",[[0,"Desert Eagle Ammo","RH_7Rnd_50_AE",1],[[0,"Item_DEagle_empty_DZC",7]]],92,false,false,"",_restriction]];
	manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("     M24 Ammo Clip") +"</t>"),"manatee\crafting\oven.sqf",[[0,"M24 Sniper Ammo","5Rnd_762x51_M24",1],[[0,"5x_22_LR_17_HMR",4]]],92,false,false,"",_restriction]];
	manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("     M24 Sniper Rifle") +"</t>"),"manatee\crafting\oven.sqf",[[1,"M24 Sniper Rifle","M24",1],[[1,"huntingrifle",1],[0,"PartGeneric",4]]],92,false,false,"",_restriction]];
	manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("     M24 Desert Camo") +"</t>"),"manatee\crafting\oven.sqf",[[1,"M24 Desert Camo Rifle","M24_des_EP1",1],[[1,"M24",1],[0,"Skin_Sniper1_DZC",1]]],92,false,false,"",_restriction]];
	manatee_craft_menu_wea set [count manatee_craft_menu_wea, player addaction [("<t color=""#FFC726"">" + ("     M40A3 Sniper Rifle") +"</t>"),"manatee\crafting\oven.sqf",[[1,"M40A3 Sniper Rifle","M40A3",1],[[1,"M24",1],[0,"Skin_Sniper3_DZC",1]]],92,false,false,"",_restriction]];
} else {
	show_weapons = false;
	{player removeAction _x;} foreach manatee_craft_menu_wea; manatee_craft_menu_wea = [];
};