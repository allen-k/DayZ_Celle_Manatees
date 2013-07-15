[] execVM "\z\addons\dayz_server\system\s_fps.sqf"; //server monitor FPS (writes each ~181s diag_fps+181s diag_fpsmin*)
dayz_versionNo = 		getText(configFile >> "CfgMods" >> "DayZ" >> "version");
dayz_hiveVersionNo = 	getNumber(configFile >> "CfgMods" >> "DayZ" >> "hiveVersion");
_script = getText(missionConfigFile >> "onPauseScript");
if ((count playableUnits == 0) and !isDedicated) then {
	isSinglePlayer = true;
};
waitUntil{initialized}; //means all the functions are now defined
call build_baseBuilding_arrays;
diag_log "HIVE: Starting";
if (_script != "") then
{
	diag_log "MISSION: File Updated";
} else {
	while {true} do
	{
		diag_log "MISSION: File Needs Updating";
		sleep 1;
	};
};
	//Stream in objects
	/* STREAM OBJECTS */
		//Send the key
		_key = format["CHILD:302:%1:",dayZ_instance];
		_result = _key call server_hiveReadWrite;
		diag_log "HIVE: Request sent";
		
		//Process result
		_status = _result select 0;
		
		_myArray = [];
		if (_status == "ObjectStreamStart") then {
			_val = _result select 1;
			//Stream Objects
			diag_log ("HIVE: Commence Object Streaming...");
			for "_i" from 1 to _val do {
				_result = _key call server_hiveReadWrite;
				_status = _result select 0;
				_myArray set [count _myArray,_result];
				//diag_log ("HIVE: Loop ");
			};
			//diag_log ("HIVE: Streamed " + str(_val) + " objects");
		};
	
		_countr = 0;		
		{
				
			//Parse Array
			_countr = _countr + 1;
		
			_idKey = 	_x select 1;
			_type =		_x select 2;
			_ownerID = 	_x select 3;
			_worldspace = _x select 4;
			_intentory=	_x select 5;
			_hitPoints=	_x select 6;
			_fuel =		_x select 7;
			_damage = 	_x select 8;
			_dir = 0;
			_pos = [0,0,0];
			_wsDone = false;
			if (count _worldspace >= 2) then
			{
				_dir = _worldspace select 0;
				if (count (_worldspace select 1) == 3) then {
					_pos = _worldspace select 1;
					_wsDone = true;
				}
			};			
			if (!_wsDone) then {
				if (count _worldspace >= 1) then { _dir = _worldspace select 0; };
				_pos = [getMarkerPos "center",0,4000,10,0,2000,0] call BIS_fnc_findSafePos;
				if (count _pos < 3) then { _pos = [_pos select 0,_pos select 1,0]; };
				diag_log ("MOVED OBJ: " + str(_idKey) + " of class " + _type + " to pos: " + str(_pos));
			};
			
			if (_damage < 1) then {
				diag_log format["OBJ: %1 - %2", _idKey,_type];
				
				//Create it
				_object = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
				_object setVariable ["lastUpdate",time];
				if (_ownerID == "0") then {_object setVariable ["ObjectID", str(_idKey), true];} else {_object setVariable ["ObjectUID", str(_idKey),true];}; //_object setVariable ["ObjectID", _idKey, true];
				_object setVariable ["CharacterID", _ownerID, true];
				
				clearWeaponCargoGlobal  _object;
				clearMagazineCargoGlobal  _object;
				
				if (_object isKindOf "TentStorage") then {
					_pos set [2,0];
					_object setpos _pos;
					_object addMPEventHandler ["MPKilled",{_this call vehicle_handleServerKilled;}];
				};
				_object setdir _dir;
				_object setDamage _damage;
				
				if ((_object isKindOf "Static") && !(_object isKindOf "TentStorage")) then {
					_object setpos [(getposATL _object select 0),(getposATL _object select 1), 0];
				};
				//Set Variable
				if (_object isKindOf "Infostand_2_EP1" && !(_object isKindOf "Infostand_1_EP1")) then {
					_object setVariable ["ObjectUID", _worldspace call dayz_objectUID2, true];
					_object enableSimulation false;
				};


						// Set whether or not buildable is destructable
				if (typeOf(_object) in allbuildables_class) then {
					diag_log ("SERVER: in allbuildables_class:" + typeOf(_object) + " !");
					for "_i" from 0 to ((count allbuildables) - 1) do
					{
						_classname = (allbuildables select _i) select _i - _i + 1;
						_result = [_classname,typeOf(_object)] call BIS_fnc_areEqual;
						if (_result) then {
							_requirements = (allbuildables select _i) select _i - _i + 2;
						};
					};
					_isDestructable = _requirements select 13;
					diag_log ("SERVER: " + typeOf(_object) + " _isDestructable = " + str(_isDestructable));
					if (!_isDestructable) then {
						diag_log("Spawned: " + typeOf(_object) + " Handle Damage False");
						_object addEventHandler ["HandleDamage", {false}];
					};
					//gateKeypad = _object addaction ["Defuse", "\z\addons\dayz_server\compile\enterCode.sqf"];
				};
				

				if (count _intentory > 0) then {
					//Add weapons
					_objWpnTypes = (_intentory select 0) select 0;
					_objWpnQty = (_intentory select 0) select 1;
					_countr = 0;					
					{
						//if (_x == "Crossbow") then { _x = "Crossbow_DZ" }; // Convert Crossbow to Crossbow_DZ
						_isOK = 	isClass(configFile >> "CfgWeapons" >> _x);
						if (_isOK) then {
							_block = 	getNumber(configFile >> "CfgWeapons" >> _x >> "stopThis") == 1;
							if (!_block) then {
								_object addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
							};
						};
						_countr = _countr + 1;
					} forEach _objWpnTypes; 
					
					//Add Magazines
					_objWpnTypes = (_intentory select 1) select 0;
					_objWpnQty = (_intentory select 1) select 1;
					_countr = 0;
					{
						//if (_x == "BoltSteel") then { _x = "WoodenArrow" }; // Convert BoltSteel to WoodenArrow
						_isOK = 	isClass(configFile >> "CfgMagazines" >> _x);
						if (_isOK) then {
							_block = 	getNumber(configFile >> "CfgMagazines" >> _x >> "stopThis") == 1;
							if (!_block) then {
								_object addMagazineCargoGlobal [_x,(_objWpnQty select _countr)];
							};
						};
						_countr = _countr + 1;
					} forEach _objWpnTypes;
					//Add Backpacks
					_objWpnTypes = (_intentory select 2) select 0;
					_objWpnQty = (_intentory select 2) select 1;
					_countr = 0;
					{
						_isOK = 	isClass(configFile >> "CfgVehicles" >> _x);
						if (_isOK) then {
							_block = 	getNumber(configFile >> "CfgVehicles" >> _x >> "stopThis") == 1;
							if (!_block) then {
								_object addBackpackCargoGlobal [_x,(_objWpnQty select _countr)];
							};
						};
						_countr = _countr + 1;
					} forEach _objWpnTypes;
				};	
				
				if (_object isKindOf "AllVehicles") then {
					{
						_selection = _x select 0;
						_dam = _x select 1;
						if (_selection in dayZ_explosiveParts and _dam > 0.8) then {_dam = 0.8};
						[_object,_selection,_dam] call object_setFixServer;
					} forEach _hitpoints;
					_object setvelocity [0,0,1];
					_object setFuel _fuel;
					_object call fnc_vehicleEventHandler;
				};
				//Monitor the object
				//_object enableSimulation false;
				dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];
			};
		} forEach _myArray;
		
	// # END OF STREAMING #
//Send the key
_key = format["CHILD:999:select b.class_name, ib.worldspace from instance_building ib join building b on ib.building_id = b.id where ib.instance_id = ?:[%1]:", dayZ_instance];
_data = "HiveEXT" callExtension _key;
diag_log("SERVER: Fetching buildings...");
//Process result
_result = call compile format ["%1", _data];
_status = _result select 0;
_bldList = [];
_bldCount = 0;
if (_status == "CustomStreamStart") then {
	_val = _result select 1;
	for "_i" from 1 to _val do {
		_data = "HiveEXT" callExtension _key;
		_result = call compile format ["%1",_data];
		_pos = call compile (_result select 1);
		_dir = _pos select 0;
		_pos = _pos select 1;
		_building = createVehicle [_result select 0, _pos, [], 0, "CAN_COLLIDE"];
		_building setDir _dir;
		_bldCount = _bldCount + 1;
	};
	diag_log ("SERVER: Spawned " + str(_bldCount) + " buildings!");
};
//Set the Time
	//Send request
	_key = "CHILD:307:";
	_result = _key call server_hiveReadWrite;
	_outcome = _result select 0;
	if(_outcome == "PASS") then {
		//_date = _result select 1; 
		_date = [2012,8,31,(_result select 1) select 3, (_result select 1) select 4]; 
		if(isDedicated) then {
			//["dayzSetDate",_date] call broadcastRpcCallAll;
			setDate _date;
			dayzSetDate = _date;
			publicVariable "dayzSetDate";
		};
		diag_log ("HIVE: Local Time set to " + str(_date));
	};
	
	createCenter civilian;
	if (isDedicated) then {
		endLoadingScreen;
	};	
	
if (isDedicated) then {
	_id = [] execFSM "\z\addons\dayz_server\system\server_cleanup.fsm";
};
allowConnection = true;
// [_guaranteedLoot, _randomizedLoot, _frequency, _variance, _spawnChance, _spawnMarker, _spawnRadius, _spawnFire, _fadeFire]
nul = [3, 4, (50 * 60), (15 * 60), 0.75, 'center', 4000, true, false] spawn server_spawnCrashSite;
for "_x" from 1 to 20 do {
	_id = [] spawn spawn_carePackages;
}; //Spawn care packages
for "_x" from 1 to 25 do {
	_id = [] spawn spawn_wrecks;
}; //Spawn wrecks
for "_x" from 1 to 20 do {
	_id = [] spawn spawn_carePackages;
}; //Spawn care packages
for "_x" from 1 to 25 do {
	_id = [] spawn spawn_wrecks;
}; //Spawn wrecks

// AIR RAIDDDDDD
nul = [] spawn server_AirRaid; 

nul =    [
                6,        //Number of the guaranteed Loot-Piles at the Crashside
                3,        //Number of the random Loot-Piles at the Crashside 3+(1,2,3 or 4)
                (25*60),    //Fixed-Time (in seconds) between each start of a new Chopper
                (15*60),      //Random time (in seconds) added between each start of a new Chopper
                1,        //Spawnchance of the Heli (1 will spawn all possible Choppers, 0.5 only 50% of them)
                'center', //'center' Center-Marker for the Random-Crashpoints, for Chernarus this is a point near Stary
                4000,    // [106,[960.577,3480.34,0.002]]Radius in Meters from the Center-Marker in which the Choppers can crash and get waypoints
                true,    //Should the spawned crashsite burn (at night) & have smoke?
                false,    //Should the flames & smoke fade after a while?
                3,    //RANDOM WP
                4,        //GUARANTEED WP
                1        //Amount of Damage the Heli has to get while in-air to explode before the POC. (0.0001 = Insta-Explode when any damage//bullethit, 1 = Only Explode when completly damaged)
            ] spawn server_spawnAN2;