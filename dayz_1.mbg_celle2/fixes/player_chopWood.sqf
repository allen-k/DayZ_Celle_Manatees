private["_location","_isOk","_dir","_classname"];
private["_item"];
_item = _this;
call gear_ui_init;

if (["forest",dayz_surfaceType] call fnc_inString) then {
		
		_chance - floor(random	100);

		if (_chance < 7) exitWith {
			player removeWeapon "ItemHatchet";
			player playActionNow "Medic";
			sleep 3;
			cutText ["Swinging a hatchet with your eyes closed is dangerous. You broke it on a rock.", "PLAIN DOWN"];
		};
		
		if (_chance > 80) exitWith {
			player playActionNow "Medic";
			sleep 1;
			cutText ["You missed the log, swing again.", "PLAIN DOWN"];
		};
		
		player playActionNow "Medic";
		sleep 3;
		_result = [player,"PartWoodPile"] call BIS_fnc_invAdd;
		[player,"chopwood",0,false] call dayz_zombieSpeak;
		if (_result) then {
			cutText [localize "str_player_25", "PLAIN DOWN"];
		} else {
			cutText [localize "str_player_24", "PLAIN DOWN"];
		};
		sleep 1;
		[player,20,false,(getPosATL player)] spawn player_alertZombies;
} else {
	cutText [localize "str_player_23", "PLAIN DOWN"];
};