private["_endTime","_startTime","_safetyPoint","_heliStart","_deadBody","_exploRange","_heliModel","_lootPos","_list","_craters","_dummy","_wp2","_wp3","_landingzone","_aigroup","_wp","_helipilot","_crash","_crashwreck","_smokerand","_staticcoords","_pos","_dir","_position","_num","_config","_itemType","_itemChance","_weights","_index","_iArray","_crashModel","_lootTable","_guaranteedLoot","_randomizedLoot","_frequency","_variance","_spawnChance","_spawnMarker","_spawnRadius","_spawnFire","_permanentFire","_crashName"];

//_crashModel	= _this select 0;
//_lootTable	= _this select 1;
_guaranteedLoot = _this select 0;
_randomizedLoot = _this select 1;
_frequency	= _this select 2;
_variance	= _this select 3;
_spawnChance	= _this select 4;
_spawnMarker	= _this select 5;
_spawnRadius	= _this select 6;
_spawnFire	= _this select 7;
_fadeFire	= _this select 8;

diag_log("CRASHSPAWNER: Starting spawn logic for Crash Spawner");

while {true} do {
	private["_timeAdjust","_timeToSpawn","_spawnRoll","_crash","_hasAdjustment","_newHeight","_adjustedPos"];
	// Allows the variance to act as +/- from the spawn frequency timer
	_timeAdjust = round(random(_variance * 2) - _variance);
	_timeToSpawn = time + _frequency + _timeAdjust;

	//Random Heli-Type
	_heliModel = ["UH1H_DZ","Mi17_DZ"] call BIS_fnc_selectRandom;

	//Random-Startpositions, Adjust this for other Maps then Chernarus
	_heliStart = [[-1504.2787, -411.60645,300],[14422.987, -302.72754,300]] call BIS_fnc_selectRandom;

	//A Backup Waypoint, if not Chernarus, set some Coordinates far up in the north (behind all possible Crashsites)
	_safetyPoint = [1230.6281, 12727.349];

	//Settings for the Standard UH1H_DZ
	_crashModel = "UH1Wreck_DZ";
	_exploRange = 195;

	//Adjust Wreck and Range of Explosion if its a Mi17_DZ
	if(_heliModel == "Mi17_DZ") then {
		_crashModel = "Mi8Wreck";
		_exploRange = 285;
	};

//Crash loot just uncomment the one you wish to use by default with 50cals is enabled.
    //Table including 50 cals
    _lootTable = ["Military"] call BIS_fnc_selectRandom;
    //Table without 50 cals
    //_lootTable = ["Military","HeliCrash_No50s","MilitarySpecial"] call BIS_fnc_selectRandom;

	_crashName	= getText (configFile >> "CfgVehicles" >> _heliModel >> "displayName");

	diag_log(format["CRASHSPAWNER: %1%2 chance to spawn '%3' with loot table '%4' at %5", round(_spawnChance * 100), '%', _crashName, _lootTable, _timeToSpawn]);

	// Apprehensive about using one giant long sleep here given server time variances over the life of the server daemon
	while {time < _timeToSpawn} do {
		sleep 5;
	};

	_spawnRoll = random 1;

	// Percentage roll
	if (_spawnRoll <= _spawnChance) then {

/*
==================================================================================================
		_staticcoords give you the possibility to organize your crashsites a bit!
		
		Crashsites close to cherno or electro would be possible with that.
		Use the editor for your map, create some vehicles or triggers at points where you
		want your crashside (aprox), save it and extract all coordinates and put them in this
		2D-Array. If you dont know how to do this, just leave it as it is.
		
		I would advise you to create at least 100 positions, otherwise its too easy for your players
		to find the crash-locations after some time of playing on your server.
==================================================================================================
*/

		_staticcoords = [[437.68378, 744.55005], [401.40137, 1703.0698], [1396.2803, 760.46924], [1412.9716, 1680.0784], [1412.9716, 2676.3215], [416.72852, 2699.3123], [401.40173, 3695.5547], [1397.645, 3680.228], [1405.3079, 4684.1348], [416.72852, 5680.3779], [1412.9718, 5703.3682], [401.40173, 4576.8477], [2409.2144, 5688.041], [2409.2144, 4707.126], [2401.5508, 3557.614], [2401.5508, 2722.3022], [2409.2144, 1687.7417], [2423.1772, 699.16333], [3410.0283, 5682.917], [3397.644, 4679.7607], [3410.0283, 3899.5276], [3385.2593, 2685.8328], [3410.0283, 1707.4475], [3436.3765, 691.90649], [4428.1333, 685.7937], [5392.6006, 676.05103], [6435.0059, 676.05103], [7448.1841, 676.05103], [8451.6211, 705.27832], [9474.542, 724.76221], [10429.268, 734.50342], [11442.444, 695.53491], [11418.74, 1689.23], [11428.48, 2712.1509], [11428.48, 3705.8438], [11418.74, 4670.3135], [11418.74, 5673.75], [11418.74, 6725.8975], [11389.514, 7680.6221], [11408.998, 8645.0908], [10415.305, 8693.8018], [9382.6396, 8693.8018], [8427.915, 8684.0615], [7385.5098, 8684.0615], [6450.2695, 8645.0908], [5466.3169, 8664.5752], [4443.3965, 8674.3174], [3362.0229, 8713.2861], [3352.2813, 7709.8486], [3439.96, 6647.96], [2358.5864, 6628.4766], [2407.2974, 7690.3643], [2397.5552, 8664.5752], [4414.1704, 7700.1064], [5456.5742, 7700.1064], [6411.3008, 7690.3643], [7375.7686, 7670.8799], [8388.9473, 7670.8799], [9382.6396, 7661.1387], [10444.529, 7661.1387], [10434.788, 6647.96], [9392.3838, 6657.7021], [8369.4629, 6686.9277], [7395.2529, 6647.96], [6440.5269, 6677.1865], [5417.606, 6667.4443], [4355.7173, 6608.9912], [4433.6543, 5683.4912], [4453.1387, 4670.3135], [4453.1387, 3666.8752], [4394.6855, 2663.4404], [4394.6855, 1621.0349], [5427.3486, 1708.7139], [6343.106, 1698.9727], [7366.0264, 1698.9719], [8408.4307, 1679.488], [9421.6094, 1679.488], [10454.271, 1650.2615], [10425.046, 2663.4404], [10395.819, 3696.1018], [10415.305, 4709.2822], [10405.561, 5693.2334], [9402.125, 5712.7178], [9411.8672, 4709.2822], [9392.3838, 3686.3599], [9402.125, 2731.6348], [8418.1729, 2721.8928], [8447.4004, 3657.1333], [8437.6582, 4699.54], [8398.6895, 5683.4912], [7375.7686, 5654.2646], [6401.5581, 5664.0068], [5407.8643, 5712.7178], [5407.8643, 4709.2822], [6440.5269, 4670.3135], [7443.9629, 4641.0869], [7395.2529, 3676.6179], [6430.7852, 3696.1018], [6391.8164, 2653.6985], [7385.5098, 2585.5034], [5427.3486, 2604.988], [5427.3486, 3598.6809], [439.97363, 6676.9551], [1362.6448, 6676.9551], [407.02051, 7709.4678], [1428.5504, 7698.4844], [1384.6138, 8741.9834], [1384.6138, 9697.6064], [1439.5344, 10686.185], [1395.5977, 11685.745], [428.98944, 11707.714], [396.03687, 10708.153], [407.02051, 9686.624], [407.02051, 8676.0791], [2450.0796, 9719.5752], [2362.2065, 10653.231], [2395.1582, 11685.745], [3383.7354, 11707.714], [3427.6719, 10653.231], [3438.6563, 9653.6709], [4438.2173, 9664.6553], [4405.2651, 10719.138], [4427.2334, 11718.698], [5415.8096, 11685.745], [5382.8564, 10686.185], [5382.8564, 9664.6553], [6394.2744, 10699.817], [6394.2744, 11677.271], [6394.2744, 9722.3623], [7441.5479, 9708.3975], [7427.584, 10685.853], [7413.6196, 11705.198], [8419.0029, 11705.198], [8446.9297, 10616.034], [8405.0391, 9638.5791], [9424.3838, 9624.6162], [9410.4199, 10699.817], [9396.457, 11649.343], [10471.656, 11691.233], [11407.221, 11677.271], [11379.296, 10657.925], [10429.766, 10657.925], [10429.766, 9680.4717], [11393.257, 9722.3623], [918.48633, 1225.9976], [1930.0566, 1203.0054], [1930.0566, 2199.2485], [933.81348, 2222.2397], [918.48682, 3218.4819], [1914.73, 3203.1558], [1922.3928, 4207.0596], [933.81348, 5203.3037], [1930.0566, 5226.2939], [918.48682, 4099.7725], [2926.2993, 5210.9658], [2926.2993, 4230.0518], [2918.6357, 3080.5415], [2918.6357, 2245.23], [2926.2993, 1210.6694], [3927.1133, 5205.8428], [3914.729, 4202.6865], [3927.1133, 3422.4551], [3902.3442, 2208.7603], [3927.1133, 1230.3745], [11935.825, 1212.1577], [11945.566, 2235.0776], [11945.566, 3228.771], [11935.825, 4193.2393], [11935.825, 5196.6748], [11935.825, 6248.8213], [11906.599, 7203.5498], [11926.083, 8168.0146], [10932.39, 8216.7256], [9899.7246, 8216.7256], [8945, 8206.9873, 24.], [7902.5947, 8206.9873], [6967.3545, 8168.0146], [5983.4019, 8187.499], [4960.4814, 8197.2412], [3879.1079, 8236.21], [3869.3662, 7232.7764], [3957.0449, 6170.8838], [2875.6714, 6151.3994], [2924.3823, 7213.292], [2914.6401, 8187.499], [4931.2554, 7223.0342], [5973.6592, 7223.0342], [6928.3857, 7213.292], [7892.8535, 7193.8076], [8906.0322, 7193.8076], [9899.7246, 7184.0654], [10961.613, 7184.0654], [10951.873, 6170.8838], [9909.4688, 6180.626], [8886.5479, 6209.8525], [7912.3379, 6170.8838], [6957.6118, 6200.1104], [5934.6909, 6190.3682], [4872.8022, 6131.915], [4950.7393, 5206.417], [4970.2236, 4193.2393], [4970.2236, 3189.8022], [4911.7705, 2186.3677], [4911.7705, 1143.9624], [5944.4336, 1231.6411], [6860.1909, 1221.8999], [7883.1113, 1221.8989], [8925.5156, 1202.4155], [9938.6943, 1202.4155], [10971.356, 1173.189], [10942.132, 2186.3677], [10912.904, 3219.0288], [10932.39, 4232.208], [10922.645, 5216.1592], [9919.21, 5235.6436], [9928.9521, 4232.208], [9909.4688, 3209.2866], [9919.21, 2254.562, 1], [8935.2578, 2244.8198], [8964.4854, 3180.0601], [8954.7432, 4222.4658], [8915.7744, 5206.417], [7892.8535, 5177.1904], [6918.6431, 5186.9326], [5924.9492, 5235.6436], [5924.9492, 4232.208], [6957.6118, 4193.2393], [7961.0479, 4164.0127], [7912.3379, 3199.5454], [6947.8701, 3219.0288], [6908.9014, 2176.6255], [7902.5947, 2108.4312], [5944.4336, 2127.9155], [5944.4336, 3121.6079], [957.05859, 6199.8799], [1879.7297, 6199.8799], [924.10547, 7232.3936], [1945.6353, 7221.4092], [1901.6987, 8264.9092], [1901.6987, 9220.5303], [1956.6194, 10209.108], [1912.6826, 11208.671], [946.07422, 11230.64], [913.12207, 10231.077], [924.10547, 9209.5498], [924.10547, 8199.0029], [2967.1646, 9242.499], [2879.2915, 10176.155], [2912.2432, 11208.671], [3900.8203, 11230.64], [3944.7568, 10176.155], [3955.7412, 9176.5967], [4955.3022, 9187.5811], [4922.3501, 10242.062], [4944.3184, 11241.624], [5932.8945, 11208.671], [5899.9414, 10209.108], [5899.9414, 9187.5811], [6911.3594, 10222.741], [6911.3594, 11200.194], [6911.3594, 9245.2881], [7958.6328, 9231.3232], [7944.6689, 10208.776], [7930.7046, 11228.124], [8936.0879, 11228.124], [8964.0146, 10138.96], [8922.124, 9161.5029], [9941.4688, 9147.542], [9927.5039, 10222.741], [9913.542, 11172.269], [10988.742, 11214.159], [11924.307, 11200.194], [11896.379, 10180.851], [10946.851, 10180.851], [10946.851, 9203.3975], [11910.342, 9245.2881], [4934.4858, 7708.5132], [4416.5967, 8182.1602], [5540.8589, 8171.751], [5465.3872, 7172.4067], [4895.4497, 6680.5415], [4390.5723, 7167.2012], [3929.9375, 6761.2178], [3898.708, 7744.9473], [3401.6377, 7193.2256], [2873.3386, 7716.3208], [3419.855, 8244.6191], [3903.9126, 8728.6768], [4986.5352, 8705.2539], [5467.9902, 9181.5039], [4450.4287, 9184.1074], [2891.1699, 8762.291], [3474.4346, 9184.3271], [2383.7771, 9193.8125], [2971.7837, 9715.4307], [3958.1172, 9677.4941], [2431.197, 8216.9619], [1876.3843, 8767.0332], [1895.3521, 7785.4409], [2445.4231, 7150.0146], [2895.9119, 6699.5259], [3416.7795, 10182.101], [3936.1941, 10757.757], [4445.6836, 11247.396], [4895.623, 10757.757], [4412.6001, 10195.334], [4912.1641, 9722.2363], [5441.5039, 10192.025], [5467.9712, 11191.154], [4951.8647, 11803.203], [5891.4434, 10698.207], [5904.6763, 9679.2285], [5977.4609, 8683.4092]];

		//USE THIS WHEN USING _STATICCORDS
		_position = _staticcoords select (floor random (count _staticcoords));

		//DEFAULT: GET COORDS FROM BIS_fnc_findSafePos, COMMENT OUT IF YOU USE _STATICCOORDS
		//_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;

		diag_log(format["CRASHSPAWNER: Spawning '%1' with loot table '%2' NOW! (%3) at: %4", _crashName, _lootTable, time, str(_position)]);

		//Spawn the AI-Heli flying in the air
		_startTime = time;
		_crashwreck = createVehicle [_heliModel,_heliStart, [], 0, "FLY"];
		_crashwreck engineOn true;
		_crashwreck flyInHeight 120;
		_crashwreck forceSpeed 140;
		_crashwreck setspeedmode "LIMITED";

		//Create an Invisibile Landingpad at the Crashside-Coordinates
		_landingzone = createVehicle ["HeliHEmpty", [_position select 0, _position select 1,0], [], 0, "CAN_COLLIDE"];

		//Only a Woman could crash a Heli this way...
		_aigroup = creategroup civilian;
		_helipilot = _aigroup createUnit ["SurvivorW2_DZ",getPos _crashwreck,[],0,"FORM"];
		_helipilot moveindriver _crashwreck;
		_helipilot assignAsDriver _crashwreck;

		sleep 1;

		_wp2 = _aigroup addWaypoint [position _landingzone, 0];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointBehaviour "CARELESS";

		//Even when the Heli flys to high, it will burn when reaching its Waypoint
		_wp2 setWaypointStatements ["true", "_crashwreck setdamage 1;"];

		//Adding a last Waypoint up in the North, so the Heli doesnt Hover at WP1 (OR2)
		//and would also come back to WP1 if somehow it doesnt explode.
		_wp3 = _aigroup addWaypoint [_safetyPoint, 0];
		_wp3 setWaypointType "CYCLE";
		_wp3 setWaypointBehaviour "CARELESS";

		//Get some more Speed when close to the Crashpoint
		waituntil {(_crashwreck distance _position) <= 1200 || not alive _crashwreck};
			_crashwreck flyInHeight 95;
			_crashwreck forceSpeed 160;
			_crashwreck setspeedmode "NORMAL";

		//BOOOOOOM!
		waituntil {(_crashwreck distance _position) <= _exploRange || not alive _crashwreck};
			_crashwreck setdamage 1;
			_crashwreck setfuel 0;
			//_crashwreck setHit ["mala vrtule", 1];

			//She cant survive this :(
			_helipilot setdamage 1;

		//Wait till the crashed Heli is near the Ground
		waituntil {(getPosATL _crashwreck select 2) < 10};
			//Giving the crashed Heli some time to find its "Parkingposition"
			sleep 9;

		//Get position of the helis wreck, but overwrite the height to Zero;
		_pos = [getpos _crashwreck select 0, getpos _crashwreck select 1,0];

		//saving the direction of the wreck(not used right now)
		_dir = getdir _crashwreck; 

		//Send Public Variable so every client can delete the craters around the new Wreck (musst be added in init.sqf)
		heliCrash = _pos;
		publicVariable "heliCrash";
		
		//Clean Up the Crashsite
		deletevehicle _crashwreck;
		deletevehicle _helipilot;
		deletevehicle _landingzone;

		//Animation is done, lets create the actual Crashside
		_crash = createVehicle [_crashModel, _pos, [], 0, "CAN_COLLIDE"];

		//If you want all Grass around the crashsite to be cutted: Uncomment the next Line (Noobmode)
		//_crashcleaner = createVehicle ["ClutterCutter_EP1", _pos, [], 0, "CAN_COLLIDE"];

		//Setting the Direction would add realism, but it sucks because of the bugged model when not on plane ground.
		//_crash setDir _dir;

		// I don't think this is needed (you can't get "in" a crash), but it was in the original DayZ Crash logic
		dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_crash];

		_crash setVariable ["ObjectID",1,true];

		//Make it burn (or not)
		if (_spawnFire) then {
			//["dayzFire",[_crash,2,time,false,_fadeFire]] call broadcastRpcCallAll;
			dayzFire = [_crash,2,time,false,_fadeFire];
			publicVariable "dayzFire";
			_crash setvariable ["fadeFire",_fadeFire,true];
		};

		_num        = round(random 1) + 1;
     
        _config = missionConfigFile >> "CfgBuildingLoot" >> _lootTable;
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
		["Skin_BAF_Pilot3_DZC","object"],
		["Skin_BAF_Pilot1_DZC","object"],
		["Skin_BAF_Pilot2_DZC","object"],
		["Skin_CZ_Pilot2_DZC","object"],
		["Skin_CZ_Pilot1_DZC","object"],
		["Skin_CZ_Pilot3_DZC","object"],
		["Skin_US_Pilot1_DZC","object"],
		["Skin_US_Heavy2_DZC","object"],
		["Skin_US_Heavy1_DZC","object"],
		["Skin_BAF_Heavy1_DZC","object"],
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
 
		_itemChance = []; // fuck you arrays! make my life easier!
		{
			_chance = 0.02;
			_itemChance set [count _itemChance,_chance];
		} forEach _itemTypes;
		
		_weights = [];
        _weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
        _cntWeights = count _weights;
        _index = _weights call BIS_fnc_selectRandom;

		//Creating the Lootpiles outside of the _crashModel
		for "_x" from 1 to _num do {
			//Create loot
			_index = floor(random _cntWeights);
			_index = _weights select _index;
			_itemType = _itemTypes select _index;

			//Let the Loot spawn in a non-perfect circle around _crashModel
			_lootPos = [_pos, ((random 2) + (sizeOf(_crashModel)/2.3)), random 360] call BIS_fnc_relPos;
			[_itemType select 0, _itemType select 1, _lootPos, 0] call spawn_loot;

			diag_log(format["CRASHSPAWNER: Loot spawn at '%1' with loot table '%2'", _lootPos, sizeOf(_crashModel)]); 

			// ReammoBox is preferred parent class here, as WeaponHolder wouldn't match MedBox0 and other such items.
			_nearby = _pos nearObjects ["ReammoBox", (sizeOf(_crashModel)+10)];
			{
				_x setVariable ["permaLoot",true];
			} forEach _nearBy;
		};

		//Adding 5 dead soldiers around the wreck, poor guys
		for "_x" from 1 to 5 do {
			_lootPos = [_pos, ((random 4)+2), random 360] call BIS_fnc_relPos;
			_deadBody = createVehicle[["Body1","Body2"] call BIS_fnc_selectRandom,_lootPos,[], 0, "CAN_COLLIDE"];
			_deadBody setDir (random 360);
		};
		_endTime = time - _startTime;
		diag_log(format["CRASHSPAWNER: Flight complete! Runtime: %1 Sec", _endTime]); 
	};
};