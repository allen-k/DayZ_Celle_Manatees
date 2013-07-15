private["_location","_isOk","_dir","_classname"];
_location = player modeltoworld [0,1,0];
_location set [2,0];
//_isOk = count (_location isFlatEmpty [0.5,0,0,4,0,false,player]) > 0;
_hasMatches = "ItemMatchbox" in magazines player;
_chance = floor(random 100);

disableUserInput true;

if (_hasMatches) then {	
	_dir = getDir player;
	_classname = "Land_Fire";
	if (_chance < 15) then { // remove matchbox, failed lighting fire
		player removeWeapon "ItemMatchbox";
		player playActionNow "Medic";
		sleep 6;
		cutText ["Your matches were consumed when attempting to light a fire." , "PLAIN DOWN"];
	} else {
		player playActionNow "Medic";
		sleep 6;
		dayz_hasFire = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
		dayz_hasFire setDir _dir;
		player reveal dayz_hasFire;
		cutText ["You have light a fire without destroying your matches!", "PLAIN DOWN"];
	};
} else {
	cutText ["You need to have matches in order to light a fire.", "PLAIN DOWN"];
};

disableUserInput false;