// This script was written by [BSM]SilverShot (c) 2013. Don't steal my work.. Contact at www.britishsergeantsmess.com
private["_obj","_bag","_pos"];
_arr = _this select 3;
_vehicle = _arr select 0;
_argument = _arr select 1;
_hasToolbox = "ItemToolbox" in items player;

if( _argument == 0 ) then {
	player removeAction s_silver_rig_veh;
	s_silver_rig_veh = -1;
	player removeAction s_silver_defuse;
	s_silver_defuse = -1;
	silver_riggin = true;
	_playerPos = getPos player;
	_nearBomb = (_playerPos) nearObjects["BAF_ied_v1", 15];
	if( count _nearBomb > 0 ) exitWith {
		silver_riggin = false; cutText ["You cannot rig a vehicle within 15 meters of another IED.", "PLAIN DOWN"];
	};
	player removeMagazine "PipeBomb";
	_dir = getDir player; _position = [(_playerPos select 0) + (0.70 * sin(_dir)), (_playerPos select 1) + (0.70 * cos(_dir)), _playerPos select 2];
	_bomb = "BAF_ied_v1" createVehicle _position;
	_dir = round(_dir + 200);
	_bomb setDir _dir;
	player playActionNow "Medic";
	[player,"repair",0,false] call dayz_zombieSpeak;
	_bomb setVariable ["characterID",dayz_characterID,true];
	dayzPublishObj = [dayz_characterID,_bomb,[_dir,_position],"BAF_ied_v1"];
	publicVariableServer "dayzPublishObj";
	if (isServer) then {
		dayzPublishObj call server_publishObj;
	};
	sleep 6;
	cutText ["You have rigged the vehicles engine to blow on ignition.", "PLAIN DOWN"];
	silver_riggin = false;
};

if( _argument == 1 ) then {
	player removeAction s_silver_defuse; 
	s_silver_defuse = -1;
	player removeAction s_silver_rig_veh;
	s_silver_rig_veh = -1;
	silver_riggin = true;
	player playActionNow "Medic";
	[player,"repair",0,false] call dayz_zombieSpeak;
	_nearBomb = (getPos _vehicle) nearObjects["BAF_ied_v1", 1.5];
	if( count _nearBomb > 0 ) then {
		_bomb = _nearBomb select 0;
		_bombPos = position _bomb;
		_bomb call silver_deleteRig;
		sleep 0.1;
		deleteVehicle _bomb;
		_random = random 100;
		if( _random < 60 ) then {
			sleep 6; cutText ["Defuse failed!", "PLAIN DOWN"];
			_null = "HelicopterExploSmall" createVehicle _bombPos;
		} else {
			sleep 6;
			player addMagazine "PipeBomb";
			cutText ["You defused the bomb!", "PLAIN DOWN"];
		};
	};
	silver_riggin = false;
};

if( _argument == 2 ) then {
	_vehicle = _this select 0;
	if( !(isEngineOn _vehicle) ) exitWith {};
	sleep 0.8;
	_nearBomb = (getPos _vehicle) nearObjects["BAF_ied_v1", 10];
	if( count _nearBomb > 0 ) then {
		_bomb = _nearBomb select 0;
		_vehCrew = crew _vehicle;
		{ _x action ["eject", _vehicle]; } forEach _vehCrew;
		_null = "HelicopterExploSmall" createVehicle (position _bomb);
		_bomb call silver_deleteRig;
		sleep 0.1;
		deleteVehicle _bomb;
	};
};