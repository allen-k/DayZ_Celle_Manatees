scriptName "Functions\misc\fn_selfActions.sqf";
/***********************************************************
	ADD ACTIONS FOR SELF
	- Function
	- [] call fnc_usec_selfActions;
************************************************************/
private["_dikCode", "_handled","_menClose","_hasBandage","_hasEpi","_hasMorphine","_hasBlood","_vehicle","_inVehicle","_color","_part"];

_vehicle = vehicle player;
_inVehicle = (_vehicle != player);
_bag = unitBackpack player;
_classbag = typeOf _bag;
_isWater = 		(surfaceIsWater (position player)) or dayz_isSwimming;
_hasAntiB = 	"ItemAntibiotic" in magazines player;
_hasFuelE = 	"ItemJerrycanEmpty" in magazines player;
_cursorDistance = player distance cursorTarget;
//boiled Water
_hasbottleitem = "ItemWaterbottle" in magazines player;
_hastinitem = false;
{
    if (_x in magazines player) then {
        _hastinitem = true;
    };

} forEach boil_tin_cans;

_hasKnife = 	"ItemKnife" in items player;
_hasToolbox = 	"ItemToolbox" in items player;
_hasCrowbar =	"ItemCrowbar" in items player;
//_hasTent = 		"ItemTent" in items player;
_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_nearLight = 	nearestObject [player,"LitObject"];
_canPickLight = false;

if (!isNull _nearLight) then {
	if (_nearLight distance player < 4) then {
		_canPickLight = isNull (_nearLight getVariable ["owner",objNull]);
	};
};
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);

// self bb
PlayerHumanity = (player getVariable "humanity");
if ((getPlayerUID player) in ["17855046", "111736326"] or (PlayerHumanity < -10000 or PlayerHumanity > 10000)) then {
	
	hasBagItem = false;
	_mags = magazines player;
	if ("ItemBloodbag" in _mags) then {
		hasBagItem = true;
	};
	if((speed player <= 1) && hasBagItem && _canDo) then {
		if (s_player_selfBloodbag < 0) then {
			s_player_selfBloodbag = player addaction[("<t color=""#0D82DF"">" + ("Self Bloodbag") +"</t>"),"manatee\selfbb\bloodbag.sqf","",0,false,true,"", ""];
		};
	} else {
		player removeAction s_player_selfBloodbag;
		s_player_selfBloodbag = -1;
	};
};

//##### BASE BUILDING 1.2 Custom Actions (CROSSHAIR IS TARGETING NOTHING) #####
// #### START1 ####
_currentSkin = typeOf(player);
			// Get closest camonet since we cannot target with crosshair Base Building Script, got lazy here, didnt fix with array
			camoNetB_East = nearestObject [player, "Land_CamoNetB_EAST"];
			camoNetVar_East = nearestObject [player, "Land_CamoNetVar_EAST"];
			camoNet_East = nearestObject [player, "Land_CamoNet_EAST"];
			camoNetB_Nato = nearestObject [player, "Land_CamoNetB_NATO"];
			camoNetVar_Nato = nearestObject [player, "Land_CamoNetVar_NATO"];
			camoNet_Nato = nearestObject [player, "Land_CamoNet_NATO"];
	// Check mags in player inventory to show build recipe menu	
	_mags = magazines player;
	if ("ItemTankTrap" in _mags || "ItemSandbag" in _mags || "ItemWire" in _mags || "PartWoodPile" in _mags || "PartGeneric" in _mags) then {
		hasBuildItem = true;
	} else { hasBuildItem = false;};
	//Build Recipe Menu Action
	if((speed player <= 1) && hasBuildItem && _canDo) then {
		if (s_player_recipeMenu < 0) then {
			s_player_recipeMenu = player addaction [("<t color=""#FF7300"">" + ("Base Building Menu") +"</t>"),"buildRecipeBook\build_recipe_dialog.sqf","",1,false,true,"",""];
		};
	} else {
		player removeAction s_player_recipeMenu;
		s_player_recipeMenu = -1;
	};

	//Add in custom eventhandlers or whatever on skin change
	if (_currentSkin != globalSkin) then {
		globalSkin = _currentSkin;
		player removeEventHandler ["AnimChanged",0];
		player removeMPEventHandler ["MPHit", 0]; 
		player removeEventHandler ["AnimChanged", 0];
		haloAction = player addEventHandler ["AnimChanged", {_this spawn ss_halo;}];
		ehWall = player addEventHandler ["AnimChanged", { player call antiWall; } ];
		empHit = player addMPEventHandler ["MPHit", {_this spawn fnc_plyrHit;}];
	};
	// Remove CamoNets, (Not effecient but works)
	if((isNull cursorTarget) && _hasToolbox && _canDo && !remProc && !procBuild && 
		(camoNetB_East distance player < 10 or 
		camoNetVar_East distance player < 10 or 
		camoNet_East distance player < 10 or 
		camoNetB_Nato distance player < 10 or 
		camoNetVar_Nato distance player < 10 or 
		camoNet_Nato distance player < 10)) then {
		if (s_player_deleteCamoNet < 0) then {
			s_player_deleteCamoNet = player addaction [("<t color=""#E00707"">" + ("Remove Netting") +"</t>"),"dayz_code\actions\player_remove.sqf","",0,true,true,"",""];
		};
	} else {
		player removeAction s_player_deleteCamoNet;
		s_player_deleteCamoNet = -1;
	};
//##### BASE BUILDING 1.2 Custom Actions (CROSSHAIR IS TARGETING NOTHING) #####
// #### END1 ####


//Grab Flare
if (_canPickLight and !dayz_hasLight) then {
	if (s_player_grabflare < 0) then {
		_text = getText (configFile >> "CfgAmmo" >> (typeOf _nearLight) >> "displayName");
		s_player_grabflare = player addAction [("<t color=""#E00707"">" + format[localize "str_actions_medical_15",_text] + "</t>"), "\z\addons\dayz_code\actions\flare_pickup.sqf",_nearLight, 1, false, true, "", ""];
		s_player_removeflare = player addAction [("<t color=""#E00707"">" + format[localize "str_actions_medical_17",_text] + "</t>"), "\z\addons\dayz_code\actions\flare_remove.sqf",_nearLight, 1, false, true, "", ""];
	};
} else {
	player removeAction s_player_grabflare;
	player removeAction s_player_removeflare;
	s_player_grabflare = -1;
	s_player_removeflare = -1;
};

if (!isNull cursorTarget and !_inVehicle and (player distance cursorTarget < 4)) then {	//Has some kind of target
	_isHarvested = cursorTarget getVariable["meatHarvested",false];
	_isVehicle = cursorTarget isKindOf "AllVehicles";
	_isVehicletype = typeOf cursorTarget in ["ATV_US_EP1","ATV_CZ_EP1"];
	_isMan = cursorTarget isKindOf "Man";
	_ownerID = cursorTarget getVariable ["characterID","0"];
	_isAnimal = cursorTarget isKindOf "Animal";
	_isDog =  (cursorTarget isKindOf "DZ_Pastor" || cursorTarget isKindOf "DZ_Fin");
	_isZombie = cursorTarget isKindOf "zZombie_base";
	_isDestructable = cursorTarget isKindOf "BuiltItems";
	_isTent = cursorTarget isKindOf "TentStorage";
	_isFuel = false;
	_isAlive = alive cursorTarget;
	_canmove = canmove cursorTarget;
	_text = getText (configFile >> "CfgVehicles" >> typeOf cursorTarget >> "displayName");
	
	
	_rawmeat = meatraw;
	_hasRawMeat = false;
		{
			if (_x in magazines player) then {
				_hasRawMeat = true;
			};
		} forEach _rawmeat; 
	
	
	if (_hasFuelE) then {
		_isFuel = (cursorTarget isKindOf "Land_Ind_TankSmall") or 
				(cursorTarget isKindOf "Land_fuel_tank_big") or 
				(cursorTarget isKindOf "Land_fuel_tank_stairs") or 
				(cursorTarget isKindOf "Land_wagon_tanker");
	};
	//diag_log ("OWNERID = " + _ownerID + " CHARID = " + dayz_characterID + " " + str(_ownerID == dayz_characterID));


// ##### START #####
	// Operate Gates
	if ((dayz_myCursorTarget != cursorTarget) && (cursorTarget isKindOf "Infostand_2_EP1") && keyValid) then {
		_lever = cursorTarget;
		{dayz_myCursorTarget removeAction _x} forEach s_player_gateActions;s_player_gateActions = [];
		dayz_myCursorTarget = _lever;
		_gates = nearestObjects [_lever, ["Concrete_Wall_EP1"], 100];
		if (count _gates > 0) then {
			_handle = dayz_myCursorTarget addAction [("<t color=""#4AC925"">" + ("Operate Gate") +"</t>"), "dayz_code\external\keypad\fnc_keyPad\operate_gates.sqf", _lever, 10, false, true, "", ""];
			s_player_gateActions set [count s_player_gateActions,_handle];
		};
	};

	// Remove Object Custom removal test
	if((typeOf(cursortarget) in allremovables) && _hasToolbox && _canDo && !remProc && !procBuild && !removeObject) then {
		if (s_player_deleteBuild < 0) then {
			s_player_deleteBuild = player addAction [("<t color=""#E00707"">" + ("Remove Object") +"</t>"), "dayz_code\actions\player_remove.sqf",cursorTarget, 0, true, true, "", ""];
		};
	} else {
		player removeAction s_player_deleteBuild;
		s_player_deleteBuild = -1;
	};
	
	// Enter Code to Operate Gates Action
	if((speed player <= 1) && !keyValid && (typeOf(cursortarget) == "Infostand_2_EP1") && cursorTarget distance player < 5 && _canDo) then {
		if (s_player_enterCode < 0) then {
			s_player_enterCode = player addaction [("<t color=""#4AC925"">" + ("Enter Key Code to Operate Gate") +"</t>"),"dayz_code\external\keypad\fnc_keyPad\enterCode.sqf","",10,false,true,"",""];
		};
	} else {
		player removeAction s_player_enterCode;
		s_player_enterCode = -1;
	};
	
	// Enter Code to remove object
	if((speed player <= 1) && !removeObject && (typeOf(cursortarget) in allbuildables_class) && cursorTarget distance player < 5 && _canDo) then {
			if (s_player_codeObject < 0) then {
				s_player_codeObject = player addaction [("<t color=""#FFC726"">" + ("Enter Code of Object to remove") +"</t>"),"dayz_code\external\keypad\fnc_keyPad\enterCode.sqf","",5,false,true,"",""];
			};
	} else {
		player removeAction s_player_codeObject;
		s_player_codeObject = -1;
	};
	
	// Remove Object from code
	if((typeOf(cursortarget) in allbuildables_class) && _canDo && removeObject && !procBuild && !remProc) then {
		_validObject = cursortarget getVariable ["validObject",false];
		if (_validObject) then {
			if (s_player_codeRemove < 0) then {
				s_player_codeRemove = player addaction [("<t color=""#E00707"">" + ("Base Owners Remove Object") +"</t>"),"dayz_code\actions\player_remove.sqf","",5,false,true,"",""];
			};
		} else {
			player removeAction s_player_codeRemove;
			s_player_codeRemove = -1;
		};
	} else {
		player removeAction s_player_codeRemove;
		s_player_codeRemove = -1;
	};
	
	// custom crafting menu system
	if ((inflamed cursorTarget && cursorTarget distance player < 10) && _canDo && !crafting_menu_open) then {
		if (s_player_smeltItems < 0) then {
			s_player_smeltItems = player addaction[("<t color=""#FFC726"">" + ("Crafting Menu") +"</t>"),"manatee\crafting\craftmenu.sqf","",10,true,true,"", ""];
		};
	} else {
		player removeAction s_player_smeltItems;
		s_player_smeltItems = -1;
	};
	
	// dance and exercise menu
	if( inflamed cursorTarget ) then {
		s_silver_near_camp = true;
	};
	
	if (s_silver_near_camp) then {
		if (s_silver_menu_dance < 0 && s_silver_menu_exercise < 0) then {
			s_silver_menu_dance = player addAction [("<t color=""#FF00FF"">" + ("Dance") + "</t>"),"manatee\exercise\dance.sqf",[],0,false,true,"","(getPosATL player select 2) < 1 && count ((position player) nearObjects ['Land_fire', 15]) > 0"];
			s_silver_menu_exercise = player addAction [("<t color=""#33CCFF"">" + ("Exercise") + "</t>"),"manatee\exercise\exercise.sqf",[],0,false,true,"","(getPosATL player select 2) < 1 && count ((position player) nearObjects ['Land_fire', 15]) > 0"];
		};
	} else {
		s_silver_near_camp = false;
		player removeAction s_silver_menu_dance;
		s_silver_menu_dance = -1;
		player removeAction s_silver_menu_exercise;
		s_silver_menu_exercise = -1;
	};
	
	// Disarm Booby Trap Action
	if(_hasToolbox && _canDo && !remProc && !procBuild && (cursortarget iskindof "Grave" && cursortarget distance player < 2.5 && !(cursortarget iskindof "Body" || cursortarget iskindof "GraveCross1" || cursortarget iskindof "GraveCross2" || cursortarget iskindof "GraveCrossHelmet" || cursortarget iskindof "Land_Church_tomb_1" || cursortarget iskindof "Land_Church_tomb_2" || cursortarget iskindof "Land_Church_tomb_3" || cursortarget iskindof "Mass_grave"))) then {
		if (s_player_disarmBomb < 0) then {
			s_player_disarmBomb = player addaction [("<t color=""#FF7300"">" + ("Disarm Bomb") +"</t>"),"dayz_code\actions\player_disarmBomb.sqf","",10,true,true,"", ""];
		};
	} else {
		player removeAction s_player_disarmBomb;
		s_player_disarmBomb = -1;
	};
	
	//Allow player to fill jerrycan
	if(_hasFuelE and _isFuel and _canDo) then {
		if (s_player_fillfuel < 0) then {
			s_player_fillfuel = player addAction [("<t color=""#4AC925"">" + ("Siphon Fuel") + "</t>"), "fixes\jerry_fill.sqf",cursorTarget, 10, false, true, "", ""];
		};
	} else {
		player removeAction s_player_fillfuel;
		s_player_fillfuel = -1;
	};
	
	// siphone fuel
	if( _canDo and _hasFuelE and _hasCrowbar and (_cursorDistance < 4) and cursorTarget isKindOf "LandVehicle" ) then {
		if ((s_siphon < 0) ) then {
			s_siphon = player addAction [("<t color=""#4AC925"">" + ("Siphon Fuel") + "</t>"), "manatee\siphon\siphon.sqf", cursorTarget, 5, false, true, "",""];
		};
	} else {
		player removeAction s_siphon;
		s_siphon = -1;
	};
	
	if (!alive cursorTarget and _isAnimal and _hasKnife and !_isHarvested and _canDo) then {
		if (s_player_butcher < 0) then {
			s_player_butcher = player addAction [("<t color=""#4AC925"">" + ("Gut Animal") + "</t>"), "fixes\gather_meat.sqf",cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_butcher;
		s_player_butcher = -1;
	};
	
	//Fireplace Actions check
	if (inflamed cursorTarget and _hasRawMeat and _canDo) then {
		if (s_player_cook < 0) then {
			s_player_cook = player addAction [("<t color=""#0D82DF"">" + ("Cook Meat") + "</t>"), "\z\addons\dayz_code\actions\cook.sqf",cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_cook;
		s_player_cook = -1;
	};
	if (inflamed cursorTarget and (_hasbottleitem and _hastinitem) and _canDo) then {
		if (s_player_boil < 0) then {
			s_player_boil = player addAction [("<t color=""#0D82DF"">" + ("Boil Water") + "</t>"), "\z\addons\dayz_code\actions\boil.sqf",cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_boil;
		s_player_boil = -1;
	};
	
	if(cursorTarget == dayz_hasFire and _canDo) then {
		if ((s_player_fireout < 0) and !(inflamed cursorTarget) and (player distance cursorTarget < 3)) then {
			s_player_fireout = player addAction [("<t color=""#E00707"">" + localize "str_actions_self_06" + "</t>"), "\z\addons\dayz_code\actions\fire_pack.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_fireout;
		s_player_fireout = -1;
	};
	
	//check storage space tents
	if(cursorTarget isKindOf "TentStorage" and _canDo) then {
		if ((s_player_checkGear < 0) and (player distance cursorTarget < 3)) then {
			s_player_checkGear = player addAction [("<t color=""#0D82DF"">" + ("Check Storage") +"</t>"), "manatee\storage\storage.sqf",cursorTarget, 5, false, true, "",""];
		};
	} else {
		player removeAction s_player_checkGear;
		s_player_checkGear = -1;
	};
	
	//Packing my tent
	if(cursorTarget isKindOf "TentStorage" and _canDo) then {
		if ((s_player_packtent < 0) and (player distance cursorTarget < 3)) then {
			s_player_packtent = player addAction [("<t color=""#E00707"">" + ("Pack Tent") +"</t>"), "manatee\playerpacktent\tent_pack.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_packtent;
		s_player_packtent = -1;
	};
	
	//Sleep
	if(cursorTarget isKindOf "TentStorage" and _canDo and _ownerID == dayz_characterID and (PlayerHumanity < -5000 or PlayerHumanity > 5000)) then {
		if ((s_player_sleep < 0) and (player distance cursorTarget < 3)) then {
			s_player_sleep = player addAction [("<t color=""#FFC726"">" + ("Sleep in Tent") +"</t>"), "manatee\sleep\sleep.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_sleep;
		s_player_sleep = -1;
	};
	
	if (_isMan and !_isAlive and !_isZombie and !_isAnimal) then {
		if (s_player_studybody < 0) then {
			s_player_studybody = player addAction [("<t color=""#FFC726"">" + ("Study Body") + "</t>"), "manatee\studybody\study_body.sqf",cursorTarget, 10, false, true, "",""];
		};
	} else {
		player removeAction s_player_studybody;
		s_player_studybody = -1;
	};
	
	
	_allowedTakeSkin = ["Sniper1_DZC","Sniper2_DZC","Sniper3_DZC","Snow_Trooper1_DZC","Snow_Trooper2_DZC","Soldier1_DZC","Soldier2_DZC","Soldier3_DZC","Soldier1_SF_DZC","Soldier2_SF_DZC","Soldier3_SF_DZC","BAF_Officer1_DZC","BAF_Officer2_DZC","BAF_Officer3_DZC","CZ_Officer1_DZC","CZ_Officer2_DZC","CZ_Officer3_DZC","GER_Officer1_DZC","CZ_Heavy1_DZC",
						"CZ_Heavy2_DZC","CZ_Heavy3_DZC","BAF_Heavy1_DZC","BAF_Heavy2_DZC","BAF_Heavy3_DZC","US_Heavy1_DZC","US_Heavy2_DZC","CIV_Pilot1_DZC","US_Pilot1_DZC","CZ_Pilot1_DZC","CZ_Pilot2_DZC","CZ_Pilot3_DZC","BAF_Pilot1_DZC","BAF_Pilot2_DZC","BAF_Pilot3_DZC","Hazmat_Black_DZC","HazmatVest_Black_DZC","Hazmat_Red_DZC","HazmatVest_Red_DZC",
						"Hazmat_Yellow_DZC","HazmatVest_Yellow_DZC","Hazmat_Olive_DZC","HazmatVest_Olive_DZC","Doctor_DZC","Civ_Soldier_DZC","Cameraman_DZC","EuroMan01_DZC","EuroMan02_DZC","Storm_Trooper1_DZC","Storm_Trooper2_DZC","Storm_Trooper3_DZC","Storm_Trooper4_DZC","Camo1_DZC","Camo2_DZC","Camo3_DZC","Soldier1_STD_DZC","Soldier2_STD_DZC","Soldier3_STD_DZC",
						"Soldier1_GL_DZC","Soldier2_GL_DZC","Soldier3_GL_DZC","Soldier1_AT_DZC","Soldier2_AT_DZC","Soldier3_AT_DZC","Soldier1_SL_DZC","Soldier2_SL_DZC","Soldier3_SL_DZC"];
	
	
	//CLOTHES
    if (_isMan and !_isAlive and !_isZombie and (typeOf cursorTarget in _allowedTakeSkin)) then {
		if (s_clothes < 0) then {
			s_clothes = player addAction [("<t color=""#E00707"">" + ("Take Clothes") + "</t>"), "manatee\takeclothes\clothes.sqf",cursorTarget, 0, false, true, "",""];
		};
    } else {
        player removeAction s_clothes;
        s_clothes = -1;
    };
	
	if( !isNull cursorTarget and !_inVehicle and (_cursorDistance < 15) and (getDammage cursorTarget < 0.95) and (cursorTarget isKindOf "Air" or _vehicle isKindOf "MV22") ) then {
	_vehicle = cursorTarget;
	_SilverMenu_ActionAdded = _vehicle getVariable["SilverMenu_ActionAdded",false];
	if( !_SilverMenu_ActionAdded ) then {
		_vehicle setVariable ["SilverMenu_ActionAdded", true];
		s_halo_action = _vehicle addAction [("<t color=""#E00707"">" + ("HALO Jump") + "</t>"),"manatee\halo\jump.sqf",[],-1,false,true,"","(_this in _target) && (getPosATL player select 2) > 100"];
		s_silver_seats = _vehicle addAction [("<t color=""#FFC726"">" + ("Pilot Seat") + "</t>"), "manatee\seats\seats.sqf", [0], 0, false, false, "", "(_this in _target) && (isNull driver _target) and getDammage _target < 0.95"];
		s_silver_seats2 = _vehicle addAction [("<t color=""#FFC726"">" + ("Switch Seat") + "</t>"), "manatee\seats\seats.sqf", [1], 0, false, false, "", "driver _target == _this and getDammage _target < 0.95"];
		
		//if( (cursorTarget isKindOf "MV22") or (cursorTarget isKindOf "AN2") or (cursorTarget isKindOf "AN2_DZ") ) then {
		if( _vehicle isKindOf "A10" or _vehicle isKindOf "AV8B2" or _vehicle isKindOf "AN2_DZ" or _vehicle isKindOf "MV22" or _vehicle isKindOf "su34" or _vehicle isKindOf "su39" ) then {
			silversevent = _vehicle addEventHandler ["GetOut", {_nul = [0,0,0,[1, _vehicle]] execVM "manatee\jip\smoke.sqf"} ];
			_smoke_action = _vehicle addAction [("<t color=""#FFFFFF"">" + ("Smoke ") + "</t>") + ("<t color=""#E00707"">" + ("Red") + "</t>"),"manatee\jip\smoke.sqf",[0],0,false,true,"","driver _target == _this and (getPosATL player select 2) > 10"];
			_vehicle setVariable["SilversSmokeAction", _smoke_action];
		};
	
	};
	};
	
	//if((cursorTarget isKindOf "SUV_TK_CIV_EP1") or (cursorTarget isKindOf "SUV_PMC") and !_inVehicle) then {
	if(cursorTarget isKindOf "LandVehicle" and !_inVehicle and getDammage cursorTarget < 0.25) then {
		_vehicle = cursorTarget;
		_neonMenu = _vehicle getVariable["SilverNeonMenu", false];
		if( !_neonMenu ) then {
			_vehicle setVariable["SilverNeonMenu", true, false];
			silver_neon = _vehicle addAction [("<t color=""#39E8EC"">" + ("Neon Lights") + "</t>"),"manatee\jip\neon.sqf",[_vehicle],0,false,true,"","driver _target == _this && (daytime > 20 || daytime < 4)"];
		};
	};

	//Repairing Vehicles
	if (_isVehicle and !_isMan and _hasToolbox and (cursorTarget isKindOf "LandVehicle" or cursorTarget isKindOf "Air") and (getDammage cursorTarget < 1)) then {
		if (my_repair_menu < 0) then {
			my_repair_menu = player addAction [("<t color=""#FFC726"">" + ("Repair Menu") + "</t>"), "manatee\repair\repairmenu.sqf",cursorTarget, 3, false, false, "",""];
		};
	} else {
		player removeAction my_repair_menu;
		my_repair_menu = -1;
	};
	
	// salvage vehicle
	if (_isVehicle and !_isMan and _hasToolbox and _hasCrowbar and (cursorTarget isKindOf "LandVehicle" or cursorTarget isKindOf "Air") and (getDammage cursorTarget < 1) ) then {
		_vehicle = cursorTarget;
		//_invalidVehicle = (_vehicle isKindOf "Motorcycle") or (_vehicle isKindOf "Tractor");
		//if( !_invalidVehicle and my_salvage_menu < 0 ) then {
		if(my_salvage_menu < 0 ) then {
			my_salvage_menu = player addAction [("<t color=""#0096ff"">" + ("Salvage Menu") + "</t>"), "manatee\repair\salvagemenu.sqf",cursorTarget, 3, false, false, "",""];
		};
	} else {
		player removeAction my_salvage_menu;
		my_salvage_menu = -1;
	};
	
	//#### KNOCKOUT ####
    _unconscious = cursorTarget getVariable ["NORRN_unconscious", false];
   
    if (_isMan and _isAlive and !_isZombie and _canDo and !_unconscious and !_isAnimal) then {
        if (s_player_knockout < 0) then {
            s_player_knockout = player addAction [("<t color=""#E00707"">" + ("Knockout") + "</t>"), "manatee\melee\knockout.sqf",cursorTarget, 0, false, true, "",""];
        };
    } else {
        player removeAction s_player_knockout;
        s_player_knockout = -1;
    };
    //##############################
	// search player
	if( _canDo and _isAlive and _isMan and (cursorTarget getVariable["NORRN_unconscious", false]) ) then {
		if( s_player_frisk < 0 ) then {
			s_player_frisk = player addAction [("<t color=""#E00707"">" + ("Search Player") + "</t>"),"manatee\melee\frisk.sqf",cursorTarget,5,false,true,"",""];
		};
	} else {
		player removeAction s_player_frisk;
		s_player_frisk = -1;
	};
	
	/*
	// steal blood from player
	if( _canDo and _isAlive and _isMan and (cursorTarget getVariable["NORRN_unconscious", false]) ) then {
		if( s_player_frisk2 < 0 ) then {
			s_player_frisk2 = player addAction [("<t color=""#FF7300"">" + ("Siphon Blood") + "</t>"),"manatee\melee\siphon.sqf",cursorTarget,4,false,true,"",""];
		};
	} else {
		player removeAction s_player_frisk2;
		s_player_frisk2 = -1;
	};
	*/
	
	// kill player
	if( _canDo and _isAlive and _isMan and (cursorTarget getVariable["NORRN_unconscious", false]) ) then {
		if( s_player_frisk3 < 0 ) then {
			s_player_frisk3 = player addAction [("<t color=""#E00707"">" + ("Silent Kill") + "</t>"),"manatee\melee\kill.sqf",cursorTarget,3,false,true,"",""];
		};
	} else {
		player removeAction s_player_frisk3;
		s_player_frisk3 = -1;
	};
	
	// dissarm car bomb
	if( !_inVehicle and _canDo and _hasToolbox and !silver_riggin ) then {
		_nearPipe = (position player) nearObjects ["BAF_ied_v1", 1];
		if( count _nearPipe > 0 ) then {
			if( s_silver_defuse < 0 ) then {
				_pipe = _nearPipe select 0;
				s_silver_defuse = player addAction [("<t color=""#FF7300"">" + ("Defuse Car Bomb") + "</t>"), "manatee\jip\rig.sqf", [_pipe, 1], 6, false, true, "",""];
			};
		} else {
			player removeAction s_silver_defuse;
			s_silver_defuse = -1;
		}; 
	} else {
		player removeAction s_silver_defuse;
		s_silver_defuse = -1;
	};
	
	// attach car bomb
	if( !silver_riggin and _canDo and _hasToolbox and _hasCrowbar and "PipeBomb" in magazines player and cursorTarget isKindOf "LandVehicle" and getDammage cursorTarget < 0.95 and !(cursorTarget isKindOf "Bicycle")) then {
		if( (s_silver_rig_veh < 0) ) then {
			s_silver_rig_veh = player addAction [("<t color=""#E00707"">" + ("Rig Engine with Explosives") + "</t>"), "manatee\jip\rig.sqf", [cursorTarget, 0], 5, false, true, "","getDammage _target < 0.95"];
		};
	} else {
		player removeAction s_silver_rig_veh;
		s_silver_rig_veh = -1;
	};
	
	
} else {
	//Engineering
	{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
	{dayz_myCursorTarget2 removeAction _x} forEach s_player_removeActions;s_player_removeActions = [];
	dayz_myCursorTarget = objNull;
	dayz_myCursorTarget2 = objNull;
	{dayz_myCursorTarget removeAction _x} forEach s_player_gateActions;s_player_gateActions = [];
	dayz_myCursorTarget = objNull;	
	player removeAction s_player_forceSave;
	s_player_forceSave = -1;
	player removeAction s_player_flipveh;
	s_player_flipveh = -1;
	player removeAction s_player_sleep;
	s_player_sleep = -1;
	player removeAction s_player_deleteBuild; //replaced with bb 1.2 removal
	s_player_deleteBuild = -1;
	player removeAction s_player_codeRemove;
	s_player_codeRemove = -1;
	player removeAction s_player_forceSave;
	s_player_forceSave = -1;
	player removeAction s_player_disarmBomb;
	s_player_disarmBomb = -1;
	player removeAction s_player_codeObject;
	s_player_codeObject = -1;
	player removeAction s_player_enterCode;
	s_player_enterCode = -1;
	player removeAction s_player_smeltRecipes;
	s_player_smeltRecipes = -1;
	player removeAction s_player_smeltItems;
	s_player_smeltItems = -1;
	player removeAction s_siphon;
	s_siphon = -1;
	player removeAction s_silver_defuse;
	s_silver_defuse = -1;
	player removeAction s_silver_rig_veh;
	s_silver_rig_veh = -1;
	player removeAction my_repair_menu;
	my_repair_menu = -1;
	player removeAction my_salvage_menu;
	my_salvage_menu = -1;
	player removeAction s_player_butcher;
	s_player_butcher = -1;
	player removeAction s_player_cook;
	s_player_cook = -1;
	player removeAction s_player_boil;
	s_player_boil = -1;
	player removeAction s_player_fireout;
	s_player_fireout = -1;
	player removeAction s_player_packtent;
	s_player_packtent = -1;
	player removeAction s_player_fillfuel;
	s_player_fillfuel = -1;
	player removeAction s_player_studybody;
	s_player_studybody = -1;
	player removeAction s_player_knockout;
	s_player_knockout = -1;
	player removeAction s_player_frisk;
	s_player_frisk = -1;
	player removeAction s_player_frisk2;
	s_player_frisk = -1;
	player removeAction s_player_frisk3;
	s_player_frisk = -1;
	player removeAction s_clothes;
    s_clothes = -1;
	player removeAction s_player_checkGear;
	s_player_checkGear = -1;
};