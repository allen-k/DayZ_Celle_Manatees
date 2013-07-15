private["_position","_veh","_num","_config","_itemType","_itemChance","_weights","_index","_iArray"];

waitUntil{!isNil "BIS_fnc_selectRandom"};
if (isDedicated) then {
_position = [getMarkerPos "center",0,4000,10,0,4000,0] call BIS_fnc_findSafePos;

_randomvehicle = ["MV22Wreck","LADAWreck","BMP2Wreck","MH60Wreck","C130JWreck","Mi24Wreck","UralWreck","HMMWVWreck","T72Wreck"] call BIS_fnc_selectRandom;
_vehicleloottype = "wreckLoot";

_veh = createVehicle [_randomvehicle,_position, [], 0, "CAN_COLLIDE"];
dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_veh];
_veh setVariable ["ObjectID",1,true];

_num = round(random 2) + 2;
if (_randomvehicle == "UralWreck") then { _num = round(random 3) + 3; };
if (_randomvehicle == "C130JWreck") then { _num = round(random 3) + 3; };

   switch (_vehicleloottype) do {
       case "wreckLoot": {
			_itemType = [
			["DZ_Patrol_Pack_EP1","object"], //8 (Civi)
			["DZ_Assault_Pack_EP1","object"], //12 (Civi)
			["DZ_ALICE_Pack_EP1","object"], //16 (Civi)
			["DZ_TK_Assault_Pack_EP1","object"], //16 (Hospital)
			["DZ_British_ACU","object"], //18 (Military)
			["DZ_Backpack_EP1","object"], //24 (Heli Crash)
			["DZ_CivilBackpack_EP1","object"], //24 (Barracks)
			["WeaponHolder_PartGeneric","object"],
			["WeaponHolder_PartWheel","object"],
			["WeaponHolder_PartFueltank","object"],
			["WeaponHolder_PartEngine","object"],
			["WeaponHolder_PartGlass","object"],
			["WeaponHolder_PartVRotor","object"],
			["WeaponHolder_ItemJerrycan","object"],	
			["RH_m9", "weapon"],
			["RH_m9c", "weapon"],
			["RH_browninghp", "weapon"],
			["RH_m93r", "weapon"],
			["RH_anac", "weapon"],
			["RH_anacg", "weapon"],
			["RH_python", "weapon"],
			["RH_g17", "weapon"],
			["RH_g18", "weapon"],
			["RH_g19", "weapon"],
			["RH_g19t", "weapon"],
			["RH_m1911old", "weapon"],
			["RH_m1911", "weapon"],
			["RH_tec9", "weapon"],
			["RH_muzi", "weapon"],
			["RH_mk2", "weapon"],
			["RH_p226", "weapon"],
			["RH_p226s", "weapon"],
			["RH_bull", "weapon"],
			["RH_tt33", "weapon"],
			["RH_usp", "weapon"],
			["RH_uspm", "weapon"],
			["Winchester1866", "weapon"],
			["M1014", "weapon"],
			["Remington870_lamp", "weapon"],
			["LeeEnfield", "weapon"],	   
			["ItemWatch","weapon"],
			["ItemCompass","weapon"],
			["ItemMap","weapon"],
			["WeaponHolder_ItemHatchet","object"],
			["WeaponHolder_ItemTent","object"],
			["ItemToolbox","weapon"],
			["ItemFlashlight","weapon"],
			["ItemKnife","weapon"],
			["ItemMatchbox","weapon"],
			["Binocular","weapon"],
			["ItemFlashlightRed","weapon"],
			["ItemGPS","weapon"],
			["ItemEtool","weapon"],
			["Binocular_Vector","weapon"],
			["MedBox0", "object"],
			["Skin_Hazmat_Red_DZC", "magazine"],			
		    ["Skin_Hazmat_Yellow_DZC", "magazine"],			
			["Skin_Hazmat_Black_DZC", "magazine"],
		    ["Skin_Hazmat_Olive_DZC", "magazine"],
			["Skin_Doctor_DZC","magazine"],
			["RH_mac10p", "weapon"],
			["RH_mp7p", "weapon"],
			["RH_mp5kp", "weapon"],
			["RH_vz61", "weapon"],
			["RH_tec9", "weapon"],
			["RH_muzi", "weapon"],
			["RH_P90", "weapon"],
			["RH_mp5a5", "weapon"],	
			["RH_mp5a4", "weapon"],
			["RH_pp2000", "weapon"],
			["RH_tmp", "weapon"],
			["RH_UMP", "weapon"],
			["RH_mp7", "weapon"],
			["RH_mac10", "weapon"],
			["RH_kriss", "weapon"],
			["RH_fmg9", "weapon"],
			["RH_uzi", "weapon"],
			["Skin_Storm_Trooper2_DZC", "magazine"],
			["Skin_Storm_Trooper3_DZC", "magazine"],
			["Skin_Storm_Trooper4_DZC", "magazine"],
			["Skin_Storm_Trooper1_DZC", "magazine"],
			["Skin_EuroMan01_DZC", "magazine"],
			["Skin_Cameraman_DZC", "magazine"],
			["Skin_EuroMan02_DZC", "magazine"],
			["Skin_CIV_Pilot1_DZC", "magazine"],
			["Skin_Soldier3_DZC", "magazine"],
			["Skin_Camo3_DZC", "magazine"],
			["Skin_Camo2_DZC", "magazine"],
			["Skin_Camo1_DZC", "magazine"],
			["Skin_Sniper1_DZC", "magazine"],
			["Skin_Snow_Trooper2_DZC", "magazine"],
			["Skin_CZ_Officer2_DZC", "magazine"],
			["Skin_CZ_Officer3_DZC", "magazine"],
			["Skin_CZ_Officer1_DZC", "magazine"]];

			_itemChance = [
			// BACKPACK
			0.01,//["DZ_Patrol_Pack_EP1","object"], //8 (Civi)
			0.01,//["DZ_Assault_Pack_EP1","object"], //12 (Civi)
			0.01,//["DZ_ALICE_Pack_EP1","object"], //16 (Civi)
			0.01,//["DZ_TK_Assault_Pack_EP1","object"], //16 (Hospital)
			0.01,//["DZ_British_ACU","object"], //18 (Military)
			0.01,//["DZ_Backpack_EP1","object"], //24 (Heli Crash)
			0.01,//["DZ_CivilBackpack_EP1","object"], //24 (Barracks)
			0.02,//["WeaponHolder_PartGeneric","object"],
			0.02,//["WeaponHolder_PartWheel","object"],
			0.02,//["WeaponHolder_PartFueltank","object"],
			0.02,//["WeaponHolder_PartEngine","object"],
			0.01,//["WeaponHolder_PartGlass","object"],
			0.02,//["WeaponHolder_PartVRotor","object"],
			0.01,//["WeaponHolder_ItemJerrycan","object"],	
			0.01,//["RH_m9", "weapon"],
			0.01,//["RH_m9c", "weapon"],
			0.01,//["RH_browninghp", "weapon"],
			0.01,//["RH_m93r", "weapon"],
			0.01,//["RH_anac", "weapon"],
			0.01,//["RH_anacg", "weapon"],
			0.01,//["RH_python", "weapon"],
			0.01,//["RH_g17", "weapon"],
			0.01,//["RH_g18", "weapon"],
			0.01,//["RH_g19", "weapon"],
			0.01,//["RH_g19t", "weapon"],
			0.01,//["RH_m1911old", "weapon"],
			0.01,//["RH_m1911", "weapon"],
			0.01,//["RH_tec9", "weapon"],
			0.01,//["RH_muzi", "weapon"],
			0.01,//["RH_mk2", "weapon"],
			0.01,//["RH_p226", "weapon"],
			0.01,//["RH_p226s", "weapon"],
			0.01,//["RH_bull", "weapon"],
			0.01,//["RH_tt33", "weapon"],
			0.01,//["RH_usp", "weapon"],
			0.01,//["RH_uspm", "weapon"],
			0.01,//["Winchester1866", "weapon"],
			0.01,//["M1014", "weapon"],
			0.01,//["Remington870_lamp", "weapon"],
			0.01,//["LeeEnfield", "weapon"],	   
			0.01,//["ItemWatch","Residential"],
			0.01,//["ItemCompass","Residential"],
			0.01,//["ItemMap","Residential"],
			0.01,//["WeaponHolder_ItemHatchet","object"],
			0.01,//["WeaponHolder_ItemTent","object"],
			0.01,//["ItemToolbox","Residential"],
			0.01,//["ItemFlashlight","Residential"],
			0.01,//["ItemKnife","Residential"],
			0.01,//["ItemMatchbox","Residential"],
			0.01,//["Binocular","Residential"],
			0.01,//["ItemFlashlightRed","Police"],
			0.01,//["ItemGPS","Police"],
			0.01,//["ItemEtool","Residential"],
			0.01,//["Binocular_Vector","Estate"],
			0.01,//["MedBox0", "object"],
			0.01,//["Skin_Hazmat_Red_DZC", "Medical"],			
		    0.01,//["Skin_Hazmat_Yellow_DZC", "Medical"],			
			0.01,//["Skin_Hazmat_Black_DZC", "Medical"],
		    0.01,//["Skin_Hazmat_Olive_DZC", "Medical"],
			0.01,//["Skin_Doctor_DZC","Medical"],
			0.01,//["RH_mac10p", "weapon"],
			0.01,//["RH_mp7p", "weapon"],
			0.01,//["RH_mp5kp", "weapon"],
			0.01,//["RH_vz61", "weapon"],
			0.01,//["RH_tec9", "weapon"],
			0.01,//["RH_muzi", "weapon"],
			0.01,//["RH_P90", "weapon"],
			0.01,//["RH_mp5a5", "weapon"],	
			0.01,//["RH_mp5a4", "weapon"],
			0.01,//["RH_pp2000", "weapon"],
			0.01,//["RH_tmp", "weapon"],
			0.01,//["RH_UMP", "weapon"],
			0.01,//["RH_mp7", "weapon"],
			0.01,//["RH_mac10", "weapon"],
			0.01,//["RH_kriss", "weapon"],
			0.01,//["RH_fmg9", "weapon"],
			0.01,//["RH_uzi", "weapon"],
			0.01,//["Skin_Storm_Trooper2_DZC", "magazine"],
			0.01,//["Skin_Storm_Trooper3_DZC", "magazine"],
			0.01,//["Skin_Storm_Trooper4_DZC", "magazine"],
			0.01,//["Skin_Storm_Trooper1_DZC", "magazine"],
			0.01,//["Skin_EuroMan01_DZC", "magazine"],
			0.01,//["Skin_Cameraman_DZC", "magazine"],
			0.01,//["Skin_EuroMan02_DZC", "magazine"],
			0.01,//["Skin_CIV_Pilot1_DZC", "magazine"],
			0.01,//["Skin_Soldier3_DZC", "magazine"],
			0.01,//["Skin_Camo3_DZC", "magazine"],
			0.01,//["Skin_Camo2_DZC", "magazine"],
			0.01,//["Skin_Camo1_DZC", "magazine"],
			0.01,//["Skin_Sniper1_DZC", "magazine"],
			0.01,//["Skin_Snow_Trooper2_DZC", "magazine"],
			0.01,//["Skin_CZ_Officer2_DZC", "magazine"],
			0.01,//["Skin_CZ_Officer3_DZC", "magazine"],
			0.01//["Skin_CZ_Officer1_DZC", "magazine"]		
			];
		   
	   };
   };

diag_log("DEBUG: Spawning a " + str (_randomvehicle) + " at " + str(_position) + " with loot type " + str(_vehicleloottype) + " With total loot drops = " + str(_num));

waituntil {!isnil "fnc_buildWeightedArray"};

_weights = [];
_weights = 		[_itemType,_itemChance] call fnc_buildWeightedArray;	
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
