private["_location","_isOk","_dir","_classname"];
_location = player modeltoworld [0,0.3,0];
if ((_location select 2) < 0) then {
    _location set [2,0];
};
//_location set [2,0];
_isOk = true; //count (_location isFlatEmpty [0.3,0,0,4,0,false,player]) > 0;
_hasWood =        "PartWoodPile" in magazines player;
 
disableUserInput true;

if (_hasWood) then {
    //if (_isOk) then {
	
	_dir = getDir player;
	_classname = "Land_Fire_DZ";
	_chance = floor(random 100);
	
	if (_chance < 7) exitWith { // remove matchbox, failed creating fire
		player removeWeapon "ItemMatchbox";
		player playActionNow "Medic";
		cutText ["Your matches were consumed when attempting to build a fire." , "PLAIN DOWN"];
		sleep 3;
		disableUserInput false;
	};
	player removeMagazine "PartWoodPile";
	player playActionNow "Medic";
	sleep 5;
	dayz_hasFire = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
	dayz_hasFire setDir _dir;
	player reveal dayz_hasFire;
	cutText ["You have built a fire without destroying your matches!", "PLAIN DOWN"];
	_id = _fire spawn player_fireMonitor;
} else {
	// need wood to make fire
    cutText [localize "str_player_22", "PLAIN DOWN"];
};

disableUserInput false;