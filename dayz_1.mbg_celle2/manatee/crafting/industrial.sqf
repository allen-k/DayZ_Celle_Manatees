// parameter format, array of:
// output item, array of input items and how many of each item. Treat each input item as an array
// that includes the class name and the number required.


// PARAMETER STRUCTURE VERY IMPORTANT
// type = 0 for magazine, 1 for weapon/toolbelt
// [ [ type, "Finished Readable Item Name","FinishedItemClassName","FinishedQty" ] , [ [type, "RequiredClassName","RequiredQty"] , [type, "RequiredClassName2","RequiredQty"] ... ]]


sleep 1;

if (!show_industrial) then {
	show_industrial = true;
	_restriction = "count ((position player) nearObjects ['Land_fire', 10]) > 0";

	manatee_craft_menu_ind = [];
	manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("     Scrap Metal") +"</t>"),"manatee\crafting\oven.sqf",[[0,"Scrap Metal","PartGeneric",1],[[0,"TrashTinCan",4]]],96,false,false,"",_restriction]];
	manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("     Tank Trap") +"</t>"),"manatee\crafting\oven.sqf",[[0,"Tank Trap","ItemTankTrap",1],[[0,"PartGeneric",2]]],96,false,false,"",_restriction]];
	manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("     Wire Kit") +"</t>"),"manatee\crafting\oven.sqf",[[0,"Wire Kit","ItemWire",1],[[0,"ItemTrashRazor",4],[0,"ItemTankTrap",2]]],96,false,false,"",_restriction]];
	manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("     Windscreen") +"</t>"),"manatee\crafting\oven.sqf",[[0,"Windscreen","PartGlass",1],[[0,"TrashJackDaniels",4],[0,"PartGeneric",1]]],96,false,false,"",_restriction]];
	manatee_craft_menu_ind set [count manatee_craft_menu_ind, player addaction [("<t color=""#FFC726"">" + ("     Empty Jerrycan") +"</t>"),"manatee\crafting\oven.sqf",[[0,"Empty Jerrycan","ItemJerrycanEmpty",1],[[0,"ItemWaterbottleUnfilled",3],[0,"PartGeneric",1]]],96,false,false,"",_restriction]];
} else {
	show_industrial = false;
	{player removeAction _x;} foreach manatee_craft_menu_ind; manatee_craft_menu_ind = [];
};