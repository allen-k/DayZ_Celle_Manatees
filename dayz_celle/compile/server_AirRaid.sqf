	

    /////     /////     /////     /////     /////     /////     /////     /////     /////
    /////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////mmmyum's animated air raid dayz///////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
    //                                                v0.6 RC5 may 5 2013 7pmEST RANDOM AND STATIC
    //              decided to get you guys some kind of update with some of the requested features.
    //              non-animated version will not be updated at this time, maybe later if there is demand.  
    //      to do following the code
    //       don't forget to read the readme! (below)
    //thanks to: opendayz.net! arma scripters Maxjoiner and DarkXess.  Sarge and Kind-Sir for all their help with this, and Grafzhal for his animated heli crashes code which helped me learn
    //
    //-------------------------------------------------------------------------------------------------------------
    // README
    //      README
    //    README
    // change SETUP sections
    // change SETUP section later in code if you want custom bomber spawn in and spawn out locations
    // change SET UP AI CODE section if you want AI spawns
    // read further comments if you'd like to customize further
    //      note: if you fuck up formatting, especially for _loc
    //                                                                                                      it will not work
    //
    //!!!!!!!!!!!!!!!!!!!!!!   IMPORTANT SETUP VALUES: MUST SET THESE FOR CODE TO WORK PROPERLY FOR YOU
    //_rmodyn ----- _useRandChoice ---------- _useRandBomb ------------ _spawnynAI -------------_spawnnumAI----_spawnMarker
    //locations list - change if you want less/different locations - if you change me, random(##) must represent number of cases.
    // start and end points
    //---------------------------------------------------------------------------------------------------------------
    //////////////////////////////BEGIN FILE
     
    private ["_preWaypointPos","_spawnMarker","_spawnRadius","_wp","_espl","_sound","_duration","_aispawncoords","_aispawn","_rndSel","_loc","_city","_z","_xx","_y","_coords","_target","_posdebug","_heliModel","_heliStart","_safetyPoint","_bomberName","_positionLand","_bomber","_landingzone2","_aigroup2","_helipilot2","_wp2","_pos","_siren","_pos1","_wp3","_repeat","_break","_choice","_rmodyn","_preWaypoints","_sounddist","_ray","_pos2","_targetpos","_poswhistl","_sirenB","_citySwing","_wpT","_citySwing2","_wpT2","_wpLand","_rndSlp","_esp2","_useRandChoice","_useRandBomb","_aiSpawnX","_aiSpawnY","_spawnynAI","_spawnnumAI","_wpLandSpawn","_numbeofBombs","_esp3","_posEsp3","_debugPosEs1","_bomberDisT","_sirenPlayCnt","_randomLyn","_bomberPos","_debugYn","_yumEndCounter","_safetyEndPos","_safetyEnd"];
     
    sleep 5;
     
    ////////////////////////////////////////////////////SETUP SETUP SETUP//SETUP SETUP SETUP//SETUP SETUP SETUP//SETUP SETUP SETUP//SETUP SETUP SETUP
    _repeat = 40;                                                   //times to repeat//number of times to cycle complete code (pick new place to bomb)
    _break = 1200;                                                   //time to break between attacks, in seconds (time between cycles)
    _choice = 3;                                                    //type of bombing 1 light, 2 medium, 3 heavy
    _randomLyn = true;                                                                      //true if you want random locations (be sure to set static location otherwise!)
    _loc = ["Celle",1.5,8769.3633, 2077.6267];     //Set to static location format ["name",z,x,y]  //SKIP if using random locations
    _city = "Celle";                                                     //Set to string name of static location//allows for custom name in rpt no spaces
    _useRandChoice = false;                                                          //true if you want random choice of type of bomb per bomb
    _useRandBomb = true;                                                            //true if you want an extra random bomb
    _numbeofBombs = 40;                                             //how many bombs are dropped assuming 1 per cycle
    _rmodyn = true;                                                 //true if you have rMod, false if you don't (choice of heli bomber) //mmmyum - it may work even without rmod as reported by users!
    _preWaypoints = 1;                                              //add waypoints before arriving at location. //mmmyum testing now
	_spawnMarker = 'north';                                                 //change to 'center' if you don't want to add your own marker
	_spawnRadius = 4000;                                                    //radius to choose for prewaypoint (choose within x of _spawnMarker)
    _sounddist = 5000;                                              //distance sounds are audible at
    _ray = 300;                                                     //ray of bombing
    _spawnynAI = false;                                                                      //true if you want AIs to spawn (sometimes) //MUST SET UP AI CODE for your particular method of spawning AI
    _spawnnumAI = 1;                                                                //number of times you want AIs to spawn MUST SET UP AI CODE
    _debugYn = false;                                                                        //additional debug messages
    ////////////////////////////////////////////////////END SETUP//END SETUP//END SETUP//END SETUP//END SETUP//END SETUP//END SETUP//END SETUP
     
    //Initialize
     
	_xx = 8769.9868;
	_y = 2450.3633;
	_z = 1.5;
    //Set
    _z = _loc select 1;
    _xx = _loc select 2;
    _y = _loc select 3;
    _coords = [_xx,_y,_z];
    diag_log format ["RANDOM WORLDSPACE: Initializing defaults... %1 | %2 %3 %4| RANDOM ON: %5",_city,_xx,_y,_z,_randomLyn];
     
     
    //BEGIN LOOP!          //change to While {true} do... for infinite loops                    
    While {_repeat > 0} do {
    _duration = _numbeofBombs;
     
    //if option for random/static
    if (_randomLyn) then {
    _rndSel=floor(random 85); //select random number 0-49, then set loc based on the case number//change locations if you'd like, format ["name",z,x,y]//change random number to number of last case
    _loc=
    switch (_rndSel) do {
	case 0: {["Celle",10905.521, 850.98193]};
	case 1: {["Celle",11939.355, 2327.2383]};
	case 2: {["Celle",11780.819, 5750.624]};
	case 3: {["Celle",8557.5566, 2153.4426]};
	case 4: {["Celle",9139.8164, 1853.603]};
	case 5: {["Celle",8851.8154, 2045.6221]};
	case 6: {["Celle",9302.3848, 2986.0313]};
	case 7: {["Celle",8950.0039, 3846.9434]};
	case 8: {["Celle",8531.9697, 3231.7507]};
	case 9: {["Celle",8345.8564, 2683.4985]};
	case 10: {["Celle",8849.2949, 2528.5876]};
	case 11: {["Celle",9069.791, 2568.2791]};
	case 12: {["Celle",7486.2026, 1393.7542]};
	case 13: {["Celle",7083.9507, 2601.7698]};
	case 14: {["Celle",6141.2314, 2613.9185]};
	case 15: {["Celle",4650.5688, 3023.4426]};
	case 16: {["Celle",5659.1152, 3722.6528]};
	case 17: {["Celle",5844.3975, 4021.4319]};
	case 18: {["Celle",5607.5669, 3984.2249]};
	case 19: {["Celle",5514.3628, 4182.8716]};
	case 20: {["Celle",7063.5688, 4649.3052]};
	case 21: {["Celle",8389.918, 6170.7095]};
	case 22: {["Celle",6973.3291, 6647.7764]};
	case 23: {["Celle",6724.9126, 8077.6978]};
	case 24: {["Celle",8530.0791, 8211.5254]};
	case 25: {["Celle",9039.3447, 8953.6055]};
	case 26: {["Celle",8309.2412, 9608.9775]};
	case 27: {["Celle",9558.8047, 10099.235]};
	case 28: {["Celle",10427.415, 10775.754]};
	case 29: {["Celle",10484.518, 11526.172]};
	case 30: {["Celle",10803.39, 10904.378]};
	case 31: {["Celle",11054.497, 11063.812]};
	case 32: {["Celle",6959.9673, 11201.37]};
	case 33: {["Celle",2917.7986, 10771.07]};
	case 34: {["Celle",2904.283, 10962.815]};
	case 35: {["Celle",748.29486, 11059.786]};
	case 36: {["Celle",594.49316, 8714.541]};
	case 37: {["Celle",1669.9788, 9451.2588]};
	case 38: {["Celle",601.1217, 5038.3789]};
	case 39: {["Celle",365.29175, 3961.6296]};
	case 40: {["Celle",403.37683, 3978.1458]};
	case 41: {["Celle",2662.4041, 4040.5393]};
	case 42: {["Celle",4638.6001, 476.31738]};
	case 43: {["Celle",2370.092, 1155.698]};
	case 44: {["Celle",1692.2306, 2073.9514]};
	case 45: {["Celle",6038.3052, 5724.771]};
	case 46: {["Celle",4571.3613, 5536.3281]};
	case 47: {["Celle",4521.8687, 7894.3926]};
	case 48: {["Celle",4670.25, 8099.5234]};
	case 49: {["Celle",4420.1909, 8116.0806]};
	case 50: {["Celle",8600.8555, 2550.7969]};
	case 51: {["Celle",8824.4336, 2656.4063]};
	case 52: {["Celle",9050.2588, 2744.0398]};
	case 53: {["Celle",9109.3076, 2073.5537]};
	case 54: {["Celle",8799.8223, 2178.8027]};
	case 55: {["Celle",9008.1572, 2164.166]};
	case 56: {["Celle",9229.5771, 2014.7146]};
	case 57: {["Celle",9022.5078, 1991.77]};
	case 58: {["Celle",9357.1074, 3160.9453]};
	case 59: {["Celle",8443.0215, 3386.6104]};
	case 60: {["Celle",9205.7129, 4073.6038]};
	case 61: {["Celle",8292.3359, 2519.0186]};
	case 62: {["Celle",5721.4131, 3877.4487]};
	case 63: {["Celle",340.89142, 3793.4385]};
	case 64: {["Celle",5643.1484, 4323.6699]};
	case 65: {["Celle",5740.4775, 4168.6382]};
	case 66: {["Celle",4378.0771, 7953.9854]};
	case 67: {["Celle",4547.353, 8262.2334]};
	case 68: {["Celle",4686.375, 7920.6885]};
	case 69: {["Celle",4542.375, 8039.624]};
	case 70: {["Celle",6583.1455, 7922.5581]};
	case 71: {["Celle",6711.7578, 7822.4482]};
	case 72: {["Celle",6848.7144, 7914.9111]};
	case 73: {["Celle",6810.5654, 8017.7773]};
	case 74: {["Celle",6612.292, 7878.9248]};
	case 75: {["Celle",8502.999, 8102.8125]};
	case 76: {["Celle",9124.5889, 8751.8369]};
	case 77: {["Celle",10511.988, 10681.353]};
	case 78: {["Celle",7148.2568, 11358.883]};
	case 79: {["Celle",6954.709, 11373.023]};
	case 80: {["Celle",3023.4558, 11027.908]};
	case 81: {["Celle",3040.7207, 10825.665]};
	case 82: {["Celle",2961.0313, 10896.984]};
	case 83: {["Celle",8971.1045, 2121.3787]};
	case 84: {["Celle",343.00903, 3810.7627]};
	};
    _city = _loc select 0;
    //_z = _loc select 1;
    _z = 1.5;
	_xx = _loc select 1;
    _y = _loc select 2;
    _coords = [_xx,_y,_z];
    if (_debugYn) then {
    diag_log format ["RANDOM WORLDSPACE: %1 | %2",_city,_coords];
    };
    sleep 1;
    diag_log format ["RANDOM WORLDSPACE SELECTED: %1 | City: %2 | Coords: %3 , %4 | Try %5",_rndSel,_city,_xx,_y,_repeat];
    }; //end if random locations //otherwise static
     
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //above  ---- the worldpace is selected, coordinates stored in _coords = [_xx,_y,_z]/////////////////////////////////////////////////////////
    //below  ---- chopper is created, flies to waypoint _coords while sirens play, hangs around till bombs are done flies off and is deleted/////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
     
    //CREATE TARGET///////////////
    _loc = createVehicle ["HeliHEmpty", _coords,[], 0, "NONE"];
    _target = createVehicle ["HeliHEmpty",position _loc,[], 0, "NONE"];  
    _posdebug = position _target;
    diag_log format ["AIRRAID: SEL: %1 | TARGET: %2 | CITY: %3",_posdebug,_coords,_city];
    sleep 2;
    //Random Heli-Type
    if (_rmodyn) then {
            _heliModel = ["AN2_DZ"] call BIS_fnc_selectRandom;
    } else {
            _heliModel = ["AN2_DZ"] call BIS_fnc_selectRandom;
    };
     
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////SETUP//SETUP//SETUP
    //Random-Startposition - change to where you want the bomber to come from
    _heliStart = [[-1504.2787, -411.60645,300]] call BIS_fnc_selectRandom;
    //A Backup Waypoint, change to whatever you like - goes here after bombing
    _safetyPoint = [1230.6281, 12727.349];
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////SETUP//SETUP//SETUP
     
    _bomberName     = getText (configFile >> "CfgVehicles" >> _heliModel >> "displayName");
    diag_log(format["AIRRAID: BOMBER: %1 | TYPE: %4 Start at %2 | End at %3",_bomberName,str(_heliStart),str(_safetyPoint),_heliModel]);   
    _positionLand = [position _target,0,200,5,0,2000,0] call BIS_fnc_findSafePos; //set chopper destination
    diag_log(format["AIRRAID: BOMBER: %1 moving from %2 to %3 NOW!( TIME: %4 )", _bomberName,  str(_heliStart), str(_positionLand), round(time)]);
    //Build bomber
    _bomber = createVehicle [_heliModel,_heliStart, [], 0, "FLY"];
    _bomber setVariable["Sarge",1,true];
    _bomber engineOn true;
    _bomber flyInHeight 350;
    _bomber forceSpeed 180;
    //Create an Invisibile Landingpad near place to be bombed
    _landingzone2 = createVehicle ["HeliHEmpty", [_positionLand select 0, _positionLand select 1,0], [], 0, "CAN_COLLIDE"]; //_targets x,y
    if (_debugYn) then {
    diag_log(format["AIRRAID: BOMBER: DEBUG: %1 | BOMBER POS: %2 | POS LAND: %3 | TARGET: %4",str(getPosATL _landingzone2),str(getPosATL _bomber),str(_positionLand),str(getPosATL _target)]);
    };
     
    //Bandit woman pilot
    _aigroup2 = creategroup civilian;
    _helipilot2 = _aigroup2 createUnit ["SurvivorW2_DZ",getPos _bomber,[],0,"FORM"];
    _helipilot2 moveindriver _bomber;
    _helipilot2 assignAsDriver _bomber;
    sleep 0.5;
    //prewaypoints
    if(_preWaypoints > 0) then {
            for "_x" from 1 to _preWaypoints do {
                    _preWaypointPos = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;
                    diag_log(format["AIRRAID: BOMBER: Adding Pre-target Waypoint #%1 on %2", _x,str(_preWaypointPos)]);
                    _wp = _aigroup2 addWaypoint [_preWaypointPos, 0];
                    _wp setWaypointType "MOVE";
                    _bomber flyInHeight 400;
                    _bomber forceSpeed 400;
                    _bomber setspeedmode "NORMAL";
                    sleep 45;
                    waituntil {(_bomber distance _preWaypointPos) <= 2000 || not alive _bomber};
                    _bomberPos = getPosATL _bomber;
                    _wp setWPPos _bomberPos;
                    sleep 15;
                    deleteWaypoint _wp; //deletes waypoint
                    diag_log(format["AIRRAID: BOMBER: %1  POS: %2 end moving to Pre-target Waypoint at %3 ( TIME: %4 )", _bomberName, str(getPosATL _bomber), str(_preWaypointPos), round(time)]);
            };
    };
    //Tell bomber to move to target
    _wp2 = _aigroup2 addWaypoint [position _target, 0];
    _wp2 setWaypointType "MOVE";
    _wp2 setWaypointBehaviour "CARELESS";
                   
    waituntil {(_bomber distance _positionLand) <= 10000 || not alive _bomber};
    _bomber flyInHeight 300;
    _bomber forceSpeed 260;
    _bomber setspeedmode "NORMAL";
     
    ///////////////////////////////////////////////////////////////////START SIRENS/////////////////////////////////////////////////////
     
    _pos = position _target;
    if (not alive _bomber) then {diag_log format ["AIRRAID: BOMBER DESTROYED: %1",_bomberName];};
    diag_log format ["AIRRAID: INCOMING ATTACK: Sounding Siren at: %1 %2",_pos,_wp2];
    //Create sirens
    _siren = createVehicle ["HeliHEmpty",position _target,[], 0, "NONE"];
    _sirenB = createVehicle ["HeliHEmpty",position _target,[], 0, "NONE"];
    _pos1 = position _siren;
    if (_debugYn) then {
    diag_log format ["AIRRAID: DEBUG: SIREN: %1 | TARGET: %2 | POS_TARGET %3",_pos1,_coords,_pos];
    };
    diag_log(format["AIRRAID: BOMBER: %1 is at %2!", _bomberName, str(getPosATL _bomber)]);
    [nil,_siren,rSAY,['eve', _sounddist]] call RE;
    sleep 2;
    [nil,_sirenB,rSAY,['puk', _sounddist]] call RE;
    _bomberDisT = _bomber distance _target;
    diag_log(format["AIRRAID: BOMBER: DISTANCE: %1 | POSITION: %2",_bomberDisT,str(getPosATL _bomber)]);
    _sirenPlayCnt = 0;
    //begin siren loop
    while {(_bomberDisT < 10000) and (_bomberDisT > 1000) and (_sirenPlayCnt < 20)} do {
                    if (not alive _bomber) exitWith{diag_log format ["AIRRAID: BOMBER DESTROYED: %1",_bomberName]};
             if (_debugYn) then {
                    diag_log(format["AIRRAID: Playing Siren at %1 | Siren Nam %2 | Loop Num: %3",str(getPosATL _siren),_sounddist,_sirenPlayCnt]);
             };
                    [nil,_siren,rSAY,['nam', _sounddist]] call RE;
                    sleep 8;
                    _rndSlp = floor(random 3);
                    sleep _rndSlp;
                    _bomberDisT = _bomber distance _pos;
                    sleep 1;
                    diag_log(format["AIRRAID: BOMBER: SIRENLOOP: DISTANCE: %1 | POSITION: %2",_bomberDisT,str(getPosATL _bomber)]);
                    _sirenPlayCnt = _sirenPlayCnt + 1;
                    sleep 1;
            };
    if (_sirenPlayCnt < 3) then {
            [nil,_siren,rSAY,['nam', _sounddist]] call RE;
            sleep 7;
            [nil,_sirenB,rSAY,['nam', _sounddist]] call RE;
            sleep 8;
            [nil,_siren,rSAY,['nam', _sounddist]] call RE;
            sleep 7;
        if (_debugYn) then {
            diag_log(format["AIRRAID: BOMBER: SIRENIF: PLAYCOUNT: %1 + 3| POSITION: %2",_sirenPlayCnt,str(getPosATL _bomber)]);
        };
    };
    [nil,_siren,rSAY,['eve', _sounddist]] call RE;
    sleep 10;
    [nil,_sirenB,rSAY,['puk', _sounddist]] call RE;
    sleep 10;
     
    _bomber flyInHeight 350;
    _bomber forceSpeed 180;
    _bomber setspeedmode "NORMAL";
    _bomberDisT = _bomber distance _pos;
    diag_log(format["AIRRAID: BOMBER: DISTANCE: %1 | POSITION: %2",_bomberDisT,str(getPosATL _bomber)]);
    [nil,_siren,rSAY,['eve', _sounddist]] call RE;
    sleep 12;
    [nil,_sirenB,rSAY,['puk', _sounddist]] call RE;
                           
    waituntil {(_bomber distance _target) <= 1200 || not alive _bomber};
    sleep 8;
    _bomberPos = getPosATL _bomber;
    _wp2 setWPPos _bomberPos;
    sleep 8;
    deleteWaypoint _wp2; //deletes waypoint
    _bomber flyInHeight 360;
    _bomber forceSpeed 90;
    _bomber setspeedmode "NORMAL";
    [nil,_siren,rSAY,['nam', _sounddist]] call RE;
    _citySwing = [position _target,0,20,1,0,2000,0] call BIS_fnc_findSafePos; //set chopper cycle move back and forth over city
    _wpT = _aigroup2 addWaypoint [_citySwing, 0];
    _wpT setWaypointType "MOVE";
    sleep 15;
    _citySwing2 = [position _target,20,45,1,0,2000,0] call BIS_fnc_findSafePos; //set chopper cycle move back and forth over city
    _wpT2 = _aigroup2 addWaypoint [_citySwing2, 0];
    _wpT2 setWaypointType "MOVE";
    diag_log(format["AIRRAID: BOMBER: %1 Bombing Initialize: arrived at %2!, ", _bomberName, str(getPosATL _bomber)]);
    [nil,_siren,rSAY,['nam', _sounddist]] call RE;
                           
    ///////////////////////////////////////////////////START BOMBING////////////////////////////////////////////////////////////////////
     
    _debugPosEs1 = getPosATL _bomber;
    _debugPosEs1 set [2, 0.1];
    sleep 1;
    _esp3 = createVehicle ["SH_105_HE",_debugPosEs1,[], 0, "NONE"];
    _posEsp3 = position _esp3;
    if (_debugYn) then {
    diag_log format ["AIRRAID: DEBUG ESP3: %1 | debugPosEs1: %2",_posEsp3,_debugPosEs1];
    };
    ///////////////////////////debug above
    sleep 3;
    //play long siren during bombing, one short siren
    [nil,_sirenB,rSAY,['puk', _sounddist]] call RE;
    sleep 1;
    [nil,_siren,rSAY,['nam', _sounddist]] call RE;
     
    //start bombs loop
    While {_duration > 0} do {
    if (not alive _bomber) exitWith{diag_log format ["AIRRAID: BOMBER DESTROYED: %1",_bomberName]};
            if (_useRandChoice) then {
                    _choice = floor(random 3);
            };
            _sound = createVehicle ["HeliHEmpty",position _target,[], _ray, "NONE"];
            [nil,_sound,rSAY,['mortar1', _sounddist]] call RE;
            sleep 2;
            If (_choice == 0) then {
                    _espl = createVehicle ["M_Ch29_AT",position _sound,[], 0, "NONE"];
            };
            If (_choice == 1) then {
                    _espl = createVehicle ["M_Ch29_AT",position _sound,[], 0, "NONE"];
            };
            If (_choice == 2) then {
                    _espl = createVehicle ["M_Ch29_AT",position _sound,[], 0, "NONE"];
            };
            If (_choice == 3) then {
                    _espl = createVehicle ["M_Ch29_AT",position _sound,[], 0, "NONE"];
            };
            if (_duration > 59 || _duration < 2) then {
                    [nil,_siren,rSAY,['puk', _sounddist]] call RE;
                    _pos2 = getPosATL _espl;
                    _poswhistl = getPosATL _sound;
                    _targetpos = getPosATL _target;
                    diag_log format ["AIRRAID: BOMB: %1 | TARGET: %2 | NUMBER: %3 | SOUND %4 | CHOICE %5",str(_pos2),_targetpos,_duration,_poswhistl,_choice];
            };
            _duration = _duration - 1;
            sleep (random 2);
            if (_useRandBomb) then {
                    [nil,_sound,rSAY,['mortar1', _sounddist]] call RE;
                    sleep 1;
                    _esp2 = createVehicle ["M_Maverick_AT",position _sound,[], 0, "NONE"];
            };
            deletevehicle _sound;
           
    }; // Close while loop. loop while _duration >1
    ///////////////////////////////////////////////////END SIRENS AND BOMBING, HELI LOWER TO GROUND, (SPAWN AIs), FLY AWAY//////////////////////////////////////////////////////////////
                           
    sleep 2;
    _bomberPos = getPosATL _bomber;
    _wpT setWPPos _bomberPos;
    sleep 20;
    deleteWaypoint _wpT; //deletes waypoint
    _bomberPos = getPosATL _bomber;
    _wpT2 setWPPos _bomberPos;
    sleep 20;
    deleteWaypoint _wpT2; //deletes waypoint
    _wpLandSpawn = [position _landingzone2,5,120,4,0,2000,0] call BIS_fnc_findSafePos;
    _wpLand = _aigroup2 addWaypoint [_wpLandSpawn, 0];
    _wpLand setWaypointType "MOVE";
    _bomber flyInHeight 100;
    _bomber forceSpeed 90;
    _bomber setspeedmode "NORMAL";
    sleep 15;
    if (_heliModel == "MV22") then { _bomber flyInHeight 35; } else {
    _bomber flyInHeight 15;
    };
    _bomber forceSpeed 0;
    _bomber setspeedmode "NORMAL";
    sleep 10;
    diag_log(format["AIRRAID: BOMBER: %1 has Completed Bombing at %2!", _bomberName, str(getPosATL _bomber)]);
    if (_spawnynAI) then {
            if (_spawnnumAI > 0) then {
                    _aispawncoords = position _bomber;
                    diag_log(format["AIRRAID: BOMBER: AISPAWN: %1 | NUMBER %2",_aispawncoords,_spawnnumAI]);
                   
                    _aiSpawnX = _aispawncoords select 0;
                    _aiSpawnY = _aispawncoords select 1;
                    _spawnnumAI = _spawnnumAI - 1;
                           
    ///////////////////////////////////////////////////////////////////                     //SET UP AI CODE//SET UP AI CODE//SETUP SETUP SETUP//SETUP SETUP SETUP
                    _aispawn = [[_aiSpawnX,_aiSpawnY,0],5000,20,5] execVM "units\add_unit_server_band.sqf"; //whole map waypoints//SETUP AI CODE HERE SETUP AI CODE HERE SETUP AI CODE HERE
                                    //THIS is how I call AI spawns on my server, you will need to set it up for your own code
                                    //use _aiSpawnX for x coords and _aiSpawnY for y coords - copy how you call AI spawn coords
                                    //SARGE's AI setup example coming soon - when I got time to install it
    ///////////////////////////////////////////////////////////////                 //SET UP AI CODE//SET UP AI CODE//SETUP SETUP SETUP//SETUP SETUP SETUP END SETUP
                           
                    };
            };
     
    if (not alive _bomber) then {diag_log format ["AIRRAID: BOMBER DESTROYED: %1",_bomberName];};
    _bomberPos = getPosATL _bomber;
    _wpLand setWPPos _bomberPos;
    _bomber forceSpeed 25;
    _bomber flyInHeight 400;
    sleep 30;
    deleteWaypoint _wpLand; //deletes waypoint
    //create landing pad near end point
    _safetyEndPos = [[_safetyPoint select 0,_safetyPoint select 1,0],0,1000,4,1,2000,0] call BIS_fnc_findSafePos;
    _safetyEnd = createVehicle ["HeliHEmpty", _safetyEndPos,[], 0, "NONE"];
    //Adding a last Waypoint up in the North, to send bomber away after completion. Change this location (_safetyPoint) to where you want the AI to seem to originate from
    _wp3 = _aigroup2 addWaypoint [_safetyEndPos, 0];
    _wp3 setWaypointType "MOVE"; //maybe change to land?
    _wp3 setWaypointBehaviour "CARELESS";
     
     
    //Get position of the helis
    //_posBomb = [getpos _bomber select 0, getpos _bomber select 1,0];
    sleep 3;
    _bomber forceSpeed 400;
    _bomber flyInHeight 400;
    _bomber setspeedmode "NORMAL";
    diag_log(format["AIRRAID: BOMBER: %1 Leaving Area %2", _bomberName, str(getPosATL _bomber)]);
    //bomber position loop
     
    _bomberDisT = _bomber distance _safetyEnd;
    _yumEndCounter = 0;
    while {(_bomberDisT < 20000) and (_bomberDisT > 2000) and (_yumEndCounter < 45)} do {
                    if (not alive _bomber) exitWith{diag_log format ["AIRRAID: BOMBER DESTROYED: %1",_bomberName]};
                    _bomberDisT = _bomber distance _safetyEnd;
                    diag_log(format["AIRRAID: BOMBER: DISTANCE SAFETYPOINT: %1 | POSITION: %2",_bomberDisT,str(getPosATL _bomber)]);
                    sleep 30;
                    _yumEndCounter = _yumEndCounter + 1;
            };
     
    //////////////////////////////////////////////////////////CLEAN UP//CLEAN UP//CLEAN UP//
    sleep 60;
    _bomberDisT = _bomber distance _safetyEnd;
    diag_log(format["AIRRAID: BOMBER: DISTANCE SAFETYPOINT: %1 | POSITION: %2",_bomberDisT,str(getPosATL _bomber)]);
    _bomber forceSpeed 200;
    _bomber flyInHeight 100;
    _bomber setspeedmode "NORMAL";
    sleep 60;
    deletevehicle _helipilot2;
    deletevehicle _bomber;
    if (_debugYn) then {
    diag_log format ["AIRRAID: DEBUG: Bomber deleted %1",_bomberName];
    };
    sleep 0.1;
    deletevehicle _landingzone2;
    sleep 0.1;
    _repeat = _repeat - 1;
    sleep 0.1;
    deletevehicle _siren;
    sleep 0.1;
    deletevehicle _loc;
    sleep 0.1;
    deletevehicle _target;
    diag_log format ["AIRRAID: END CYCLE: Going down for sleep: Repeat:%1 | Sleep:%2",_repeat,_break];
    sleep _break;    
    }; //close while loop. loop -  while _repeat > 1
    exit
     
    ///////////////////////////////////////////TO DO
    //
    //bombs start to drop from chopper pos as it hits city borders
    ///////////////////-- UP NEXT! see your rpt debug and report if it matches the bomber position message in the forum.
    //////////////////////////////also report if the heli seems to be relatively overtop of the town that should be bombed, but maybe still moving a bit.
    //crash site spawn if bomber destroyed
    //AI parachutes?
    //
    //nuke options (this is still a ways off)

