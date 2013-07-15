// parameter format, array of:
// output item, array of input items and how many of each item. Treat each input item as an array
// that includes the class name and the number required.


// PARAMETER STRUCTURE VERY IMPORTANT
// type = 0 for magazine, 1 for weapon/toolbelt
// [ [ type, "Finished Readable Item Name","FinishedItemClassName","FinishedQty" ] , [ [type, "RequiredClassName","RequiredQty"] , [type, "RequiredClassName2","RequiredQty"] ... ]]


sleep 1;

if (!show_survival) then {
	show_survival = true;
	_restriction = "count ((position player) nearObjects ['Land_fire', 10]) > 0";
	manatee_craft_menu_sur = [];
	manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("     Bandage") +"</t>"),"manatee\crafting\oven.sqf",[[0,"Bandage","ItemBandage",1],[[0,"ItemTrashToiletpaper",3]]],94,false,false,"",_restriction]];
	manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("     Splint (Morphine)") +"</t>"),"manatee\crafting\oven.sqf",[[0,"Splint (Morphine)","ItemMorphine",1],[[0,"ItemBandage",3],[0,"PartWoodPile",2]]],94,false,false,"",_restriction]];
	manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("     Hatchet") +"</t>"),"manatee\crafting\oven.sqf",[[1,"Hatchet","ItemHatchet",1],[[0,"ItemTrashRazor",3],[0,"PartWoodPile",2]]],94,false,false,"",_restriction]];
	manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("     Box of Matches") +"</t>"),"manatee\crafting\oven.sqf",[[1,"Box of Matches","ItemMatchbox",1],[[0,"ItemBandage",3],[0,"HandRoadFlare",1]]],94,false,false,"",_restriction]];
	manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("     Hunting Knife") +"</t>"),"manatee\crafting\oven.sqf",[[1,"Hunting Knife","ItemKnife",1],[[0,"ItemTrashRazor",3],[0,"PartWoodPile",1]]],94,false,false,"",_restriction]];
	manatee_craft_menu_sur set [count manatee_craft_menu_sur, player addaction [("<t color=""#FFC726"">" + ("     Old Camping Tent") +"</t>"),"manatee\crafting\oven.sqf",[[0,"Old Camping Tent","ItemTent",1],[[0,"ItemTankTrap",2],[0,"PartGeneric",1],[0,"Skin_Sniper3_DZC",2]]],94,false,false,"",_restriction]];
} else {
	show_survival = false;
	{player removeAction _x;} foreach manatee_craft_menu_sur; manatee_craft_menu_sur = [];
};