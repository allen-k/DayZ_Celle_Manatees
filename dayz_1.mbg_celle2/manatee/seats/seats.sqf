// This script was written by [BSM]SilverShot (c) 2013. Don't steal my work.. Contact at www.britishsergeantsmess.com
_vehicle = _this select 0;
_args = _this select 3;
_args = _args select 0;
if( _args == 0 ) then {
	if( isNull driver _vehicle ) then {
		player action ["MoveToDriver", _vehicle];
	};
} else {
	_type = typeOf _vehicle;
	_entry = configFile >> "CfgVehicles" >> _type;
	_cargo_seats = [_entry, "transportSoldier"] call BIS_fnc_returnConfigEntry;
	_empty_cargo = _vehicle EmptyPositions "Cargo";
	if( _cargo_seats > 0 ) then {
		if( _empty_cargo > 0 ) then {
			_eng = isEngineOn _vehicle;
			player allowDamage false;
			moveOut player;
			waitUntil {!(player in _vehicle)};
			sleep 0.001;
			if( _eng ) then {
				_vehicle engineOn true;
			};
			if( vehicle player != _vehicle ) then {
				if( typeOf (vehicle player) == "ParachuteWest" ) then {
					deleteVehicle (vehicle player);
				};
				player moveInCargo _vehicle;
			};
			player allowDamage true;
			sleep 0.2;
			if( vehicle player != _vehicle ) then {
				_err = 1;
				player moveInCargo _vehicle;
			};
		} else {
			cutText ["Crew cargo is full!", "PLAIN DOWN"];
		};
	};
};