private["_position","_veh","_num","_config","_itemType","_itemChance","_weights","_index","_iArray"];

waitUntil{!isNil "BIS_fnc_selectRandom"};
if (isDedicated) then {
	_position = [getMarkerPos "center",0,4000,10,0,4000,0] call BIS_fnc_findSafePos;

	_randomvehicle = ["Misc_cargo_cont_net1","Misc_cargo_cont_net2","Misc_cargo_cont_net3"] call BIS_fnc_selectRandom;
	_vehicleloottype = ["Residential","Industrial","Military","Farm","Supermarket","Hospital"] call BIS_fnc_selectRandom;

	_veh = createVehicle [_randomvehicle,_position, [], 0, "CAN_COLLIDE"];
	dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_veh];
	_veh setVariable ["ObjectID",1,true];

	if (_randomvehicle == "Misc_cargo_cont_net1") then { _num = round(random 2) + 2; };
	if (_randomvehicle == "Misc_cargo_cont_net2") then { _num = round(random 3) + 3; };
	if (_randomvehicle == "Misc_cargo_cont_net3") then { _num = round(random 4) + 4; };

   switch (_vehicleloottype) do {
       case "Military": {
           _itemType = [
		   ["RH_HK53aim", "weapon"],
		   ["RH_HK53eot", "weapon"],
		   ["RH_HK53RFX", "weapon"],
		   ["RH_mp5a4aim", "weapon"],
		   ["RH_mp5a4eot", "weapon"],
		   ["RH_mp5a4rfx", "weapon"],
		   ["RH_mp5a5aim", "weapon"],
		   ["RH_mp5a5eot", "weapon"],
		   ["RH_mp5a5rfx", "weapon"],
		   ["RH_mp5a5risaim", "weapon"],
		   ["RH_mp5a5riseot", "weapon"],
		   ["RH_mp5a5risRFX", "weapon"],
		   ["RH_mp5a5eodaim", "weapon"],
		   ["RH_mp5a5eodeot", "weapon"],
		   ["RH_mp5a5eodRFX", "weapon"],
		   ["RH_mp5kpdwaim", "weapon"],
		   ["RH_mp5kpdweot", "weapon"],
		   ["RH_mp5kpdwRFX", "weapon"],
		   ["RH_p90", "weapon"],
		   ["RH_p90i", "weapon"],
		   ["RH_p90aim", "weapon"],
		   ["RH_P90eot", "weapon"],
		   ["RH_umpaim", "weapon"],
		   ["RH_umpeot", "weapon"],
		   ["RH_umpRFX", "weapon"],
		   ["RH_krissaim", "weapon"],
		   ["RH_krisseot", "weapon"],
		   ["RH_krissRFX", "weapon"],
		   ["RH_uzi", "weapon"],
		   ["RH_uzim", "weapon"],
		   ["RH_uzig", "weapon"],
		   ["RH_mac10", "weapon"],
		   ["RH_tmpaim", "weapon"],
		   ["RH_tmpeot", "weapon"],
		   ["RH_pp2000", "weapon"],
		   ["RH_pp2000aim", "weapon"],
		   ["RH_pp2000eot", "weapon"],
		   ["RH_mp7aim", "weapon"],
		   ["RH_mp7eot", "weapon"],
		   ["Binocular_Vector", "weapon"],
		   ["PipeBomb", "magazine"],
		   ["M40A3","weapon"],
		   ["M24","weapon"],
		   ["M24_des_EP1","weapon"],
		   ["ItemFlashlightRed", "weapon"],
		   ["ItemGPS", "weapon"],
		   ["RH_mk22sd", "weapon"],
		   ["RH_mk22vsd", "weapon"],
		   ["RH_uspsd", "weapon"],
		   ["RH_m1911sd", "weapon"],
		   ["RH_m9sd", "weapon"],
		   ["RH_m9csd", "weapon"],
		   ["RH_g17sd", "weapon"],
		   ["DZ_TK_Assault_Pack_EP1","object"],
		   ["DZ_British_ACU","object"],
		   ["DZ_CivilBackpack_EP1","object"],
		   ["Skin_Soldier3_AT_DZC", "magazine"],
		   ["Skin_Soldier1_SL_DZC", "magazine"],
		   ["Skin_Soldier2_AT_DZC", "magazine"],
		   ["Skin_Soldier2_SL_DZC", "magazine"],
		   ["Skin_Soldier1_GL_DZC", "magazine"],
		   ["Skin_Soldier2_STD_DZC", "magazine"],
		   ["Skin_Soldier3_GL_DZC", "magazine"],
		   ["Skin_Soldier1_STD_DZC", "magazine"],
		   ["Skin_Soldier2_GL_DZC", "magazine"],
		   ["Skin_Soldier3_STD_DZC", "magazine"],
		   ["Skin_Soldier3_SL_DZC", "magazine"],
		   ["Skin_Soldier1_AT_DZC", "magazine"]
			];
			
			_itemChance = []; // fuck you arrays! make my life easier!
			{
				_chance = 0.02;
				_itemChance set [count _itemChance,_chance];
			} forEach _itemType;
	   };
       case "Residential": {
           _itemType = [
		   ["ItemWaterbottle", "magazine"],
		   ["Huntingrifle", "weapon"],
		   ["ItemCompass", "weapon"],
		   ["ItemMap", "weapon"],
		   ["ItemKnife", "weapon"],
		   ["ItemMatchbox", "weapon"],
		   ["Saiga12K", "weapon"],
		   ["DZ_CivilBackpack_EP1", "object"],
		   ["Binocular", "weapon"],
		   ["WeaponHolder_ItemTent", "object"],
		   ["ItemGPS", "weapon"],
		   ["RH_mk22", "weapon"],
		   ["RH_mk22v", "weapon"],
		   ["RH_usp", "weapon"],
		   ["RH_uspm", "weapon"],
		   ["RH_m1911", "weapon"],
		   ["RH_m1911old", "weapon"],
		   ["RH_m93r", "weapon"],
		   ["RH_m9", "weapon"],
		   ["RH_g17", "weapon"],
		   ["RH_g18", "weapon"],
		   ["RH_mk2", "weapon"],
		   ["RH_tt33", "weapon"],
		   ["RH_vz61", "weapon"],
		   ["RH_tec9", "weapon"],
		   ["RH_muzi", "weapon"],
		   ["RH_ppk", "weapon"],
		   ["RH_p38", "weapon"],
		   ["RH_p226", "weapon"],
		   ["RH_p226s", "weapon"],
		   ["DZ_Patrol_Pack_EP1","object"],
		   ["DZ_Assault_Pack_EP1","object"],
		   ["DZ_ALICE_Pack_EP1","object"],
		   ["Skin_Storm_Trooper2_DZC", "magazine"],
		   ["Skin_Storm_Trooper3_DZC", "magazine"],
		   ["Skin_Storm_Trooper4_DZC", "magazine"],
		   ["Skin_Storm_Trooper1_DZC", "magazine"],
		   ["Skin_EuroMan01_DZC", "magazine"],
		   ["Skin_Cameraman_DZC", "magazine"],
		   ["Skin_EuroMan02_DZC", "magazine"],
		   ["Skin_CIV_Pilot1_DZC", "magazine"]
		   ];

		   // I like big butts and I cannot lie! These mothafuckas cant deny!
			_itemChance = [];
			{
				_chance = 0.02;
				_itemChance set [count _itemChance, _chance];
			} forEach _itemType;
	   
	   };
       case "Industrial": {
           _itemType = [
		   ["WeaponHolder_PartWheel", "object"],
		   ["WeaponHolder_PartFueltank", "object"],
		   ["WeaponHolder_PartEngine", "object"],
		   ["WeaponHolder_PartGlass", "object"],
		   ["WeaponHolder_PartVRotor", "object"],
		   ["WeaponHolder_ItemJerrycan", "object"],
		   ["ItemToolbox", "weapon"],
		   ["ItemWire", "magazine"],
		   ["ItemTankTrap", "magazine"],
		   ["ItemSandbag", "magazine"],
		   ["ItemEtool", "weapon"],
		   ["WeaponHolder_ItemHatchet", "object"],
		   ["DZ_Assault_Pack_EP1", "object"],
		   ["", "trash"]];

		   _itemChance = []; // STOP PICKING YOUR ASS AT THIS POINT!
			{
				_chance = 0.02;
				_itemChance set [count _itemChance, _chance];
			} forEach _itemType;
	   };
       case "HeliCrash": {
			_itemTypes = [
			["RH_mp7sd", "weapon"],
			["RH_mp7sdaim","weapon"],
			["RH_mp7sdeot","weapon"],
			["RH_tmpsd","weapon"],
			["RH_tmpsdaim","weapon"],
			["RH_tmpsdeot","weapon"],
			["RH_uzisd","weapon"],
			["RH_krisssd","weapon"],
			["RH_krisssdaim","weapon"],
			["RH_krisssdeot","weapon"],
			["RH_krisssdRFX", "weapon"],
			["RH_umpsd","weapon"],
			["RH_umpsdaim","weapon"],
			["RH_umpsdeot","weapon"],
			["RH_umpsdRFX", "weapon"],
			["RH_P90sd", "weapon"],
			["RH_P90isd", "weapon"],
			["RH_p90sdaim", "weapon"],
			["RH_p90sdeot", "weapon"],
			["RH_mp5sd6", "weapon"],
			["RH_mp5sd6aim", "weapon"],
			["RH_mp5sd6eot", "weapon"],
			["RH_mp5sd6RFX","weapon"],
			["RH_mp5sd6g","weapon"],
			["Skin_BAF_Pilot3_DZC","magazine"],
			["Skin_BAF_Pilot1_DZC","magazine"],
			["Skin_BAF_Pilot2_DZC","magazine"],
			["Skin_CZ_Pilot2_DZC","magazine"],
			["Skin_CZ_Pilot1_DZC","magazine"],
			["Skin_CZ_Pilot3_DZC","magazine"],
			["Skin_US_Pilot1_DZC","magazine"],
			["Skin_US_Heavy2_DZC","magazine"],
			["Skin_US_Heavy1_DZC","magazine"],
			["Skin_BAF_Heavy1_DZC","magazine"],
			["Binocular_Vector","weapon"],
			["Pipebomb","magazine"],
			["MedBox0","object"],
			["ItemGPS","weapon"],
			["DZ_Backpack_EP1","object"],
			["M40A3","weapon"],
			["M24","weapon"],
			["M24_des_EP1","weapon"],
			["RH_M4CTSDGLEOTECH_F","weapon"],
			["RH_M4CTSDGLAIM_F","weapon"],
			["RH_M4CTSDGLACOG_F","weapon"],
			["RH_SCARLB_SD_GL_AIM","weapon"],
			["RH_SCARL_SD_GL_ACOG","weapon"],
			["RH_SCARL_SD_GL_EOTECH","weapon"],
			["RH_SCARL_SD_DOC","weapon"]
			];

			_itemChance = []; // HIHO!
			{
				_chance = 0.02;
				_itemChance set [count _itemChance, _chance];
			} forEach _itemType;
	   };
       case "Farm": {
		   _itemType = [
		   ["ItemToolbox", "weapon"],
		   ["huntingrifle", "weapon"],
		   ["Saiga12K", "weapon"],
		   ["CZ_VestPouch_EP1","object"],
		   ["DZ_Patrol_Pack_EP1","object"],
		   ["DZ_Assault_Pack_EP1","object"],
		   ["DZ_ALICE_Pack_EP1","object"],
		   ["WeaponHolder_ItemHatchet", "object"],
		   ["TrapBear", "magazine"],
		   ["ItemSandbag", "magazine"],
		   ["ItemWire", "magazine"],
		   ["WeaponHolder_ItemTent", "object"],
		   ["WeaponHolder_PartGeneric", "object"],
		   ["WeaponHolder_PartWheel", "object"],
		   ["WeaponHolder_PartFueltank", "object"],
		   ["WeaponHolder_PartEngine", "object"],
		   ["WeaponHolder_PartGlass", "object"],
		   ["WeaponHolder_ItemJerrycan", "object"],
		   ["ItemCompass", "weapon"],
		   ["ItemMap", "weapon"],
		   ["Binocular", "weapon"],
		   ["ItemKnife", "weapon"],
		   ["ItemMatchbox", "weapon"],
		   ["ItemEtool", "weapon"],
		   ["Skin_Soldier3_DZC", "magazine"],
		   ["Skin_Camo3_DZC", "magazine"],
		   ["Skin_Camo2_DZC", "magazine"],
		   ["Skin_Camo1_DZC", "magazine"],
		   ["Skin_Sniper1_DZC", "magazine"],
		   ["Skin_Snow_Trooper2_DZC", "magazine"],
		   ["Skin_CZ_Officer2_DZC", "magazine"],
		   ["Skin_CZ_Officer3_DZC", "magazine"],
		   ["Skin_CZ_Officer1_DZC", "magazine"]
		   ];

		   _itemChance = []; // DayZ devs need some programming lessons i think.
			{
				_chance = 0.02;
				_itemChance set [count _itemChance, _chance];
			} forEach _itemType;
	   };
       case "Supermarket": {    
       
           _itemType = [
		   ["ItemMap", "weapon"],
		   ["ItemCompass", "weapon"],
		   ["ItemKnife", "weapon"],
		   ["ItemMatchbox", "weapon"],
		   ["Binocular", "weapon"],
		   ["WeaponHolder_ItemTent", "object"],
		   ["CZ_VestPouch_EP1","object"],
		   ["DZ_Patrol_Pack_EP1","object"],
		   ["DZ_Assault_Pack_EP1","object"],
		   ["DZ_ALICE_Pack_EP1","object"],
		   ["Skin_Storm_Trooper2_DZC", "magazine"],
		   ["Skin_Storm_Trooper3_DZC", "magazine"],
		   ["Skin_Storm_Trooper4_DZC", "magazine"],
		   ["Skin_Storm_Trooper1_DZC", "magazine"],
		   ["Skin_EuroMan01_DZC", "magazine"],
		   ["Skin_Cameraman_DZC", "magazine"],
		   ["Skin_EuroMan02_DZC", "magazine"],
		   ["Skin_CIV_Pilot1_DZC", "magazine"],
		   ["ItemWaterbottleUnfilled", "magazine"]
		   ];

		   _itemChance = []; // DayZ devs need some programming lessons i think.
			{
				_chance = 0.02;
				_itemChance set [count _itemChance, _chance];
			} forEach _itemType;
	   };
       case "Hospital": {
           _itemType = [
		   ["", "hospital"],
		   ["MedBox0", "object"],
		   ["","medical"],
		   ["Skin_Hazmat_Black_DZC", "magazine"],
		   ["Skin_Hazmat_Olive_DZC", "magazine"],
		   ["Skin_HazmatVest_Olive_DZC", "magazine"],
		   ["Skin_Hazmat_Red_DZC", "magazine"],
		   ["Skin_Doctor_DZC", "magazine"],
		   ["Skin_HazmatVest_Red_DZC", "magazine"],
		   ["Skin_HazmatVest_Black_DZC", "magazine"],
		   ["Skin_HazmatVest_Yellow_DZC", "magazine"],
		   ["Skin_Hazmat_Yellow_DZC", "magazine"],
		   ["DZ_TK_Assault_Pack_EP1","object"],
		   ["DZ_British_ACU","object"],
		   ["DZ_CivilBackpack_EP1","object"]];

		   _itemChance = []; // DayZ devs need some programming lessons i think.
			{
				_chance = 0.02;
				_itemChance set [count _itemChance, _chance];
			} forEach _itemType;
	   };
   };

	diag_log("DEBUG: Spawning a " + str (_randomvehicle) + " at " + str(_position) + " with loot type " + str(_vehicleloottype) + " With total loot drops = " + str(_num));

	waituntil {!isnil "fnc_buildWeightedArray"};

	_weights = [];
	_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
	for "_x" from 1 to _num do {
		_index = _weights call BIS_fnc_selectRandom;
		sleep 1;
		if (count _itemType > _index) then {
			_iArray = _itemType select _index;
			_iArray set [2,_position];
			_iArray set [3,10];
			_iArray call spawn_loot;
			_nearby = _position nearObjects ["WeaponHolder",20];
			{
				_x setVariable ["permaLoot",true];
			} forEach _nearBy;
		};
	};
};