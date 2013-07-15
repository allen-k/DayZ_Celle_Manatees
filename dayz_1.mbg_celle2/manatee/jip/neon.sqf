// This script was written by [BSM]SilverShot (c) 2013. Don't steal my work.. Contact at www.britishsergeantsmess.com
_args = _this select 3;
_vehicle = _args select 0;
_hasNeon = _vehicle getVariable["SilverNeon", false];
if( !_hasNeon ) then {
	_vehicle setVariable["SilverNeon", true, true];
	_colour = _vehicle getVariable["SilverNeonCol", 0];
	_colour = _colour + 1;
	if( _colour > 4 ) then {
		_colour = 1;
	};
	_vehicle setVariable["SilverNeonCol", _colour, true];
	silver_neon_tog = 1;
	silversSpawnLight = [_vehicle, _colour];
	publicVariable "silversSpawnLight";
	[_vehicle, _colour] spawn silver_spawnLight;
	while{ (alive _vehicle) and (silver_neon_tog != 0) and (_vehicle getVariable["SilverNeon", false]) } do {
		sleep 0.2;
	}; 
	
	if( silver_neon_tog != 0 ) then {
		silver_neon_tog = 0;
		deleteVehicle silver_neon_light;
	};
} else {
	_vehicle setVariable["SilverNeon", false, true];
	if( silver_neon_tog != 0 ) then {
		silver_neon_tog = 0;
		deleteVehicle silver_neon_light;
	};
};