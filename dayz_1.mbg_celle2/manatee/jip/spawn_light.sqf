// This script was written by [BSM]SilverShot (c) 2013. Don't steal my work.. Contact at www.britishsergeantsmess.com
private["_vehicle","_colour","_colours","_brightness","_ambient","_light","_color"];

_vehicle = _this select 0;
_colour = _this select 1;
_colours = [0.25, 0.0, 0.4];
if( _colour == 1 ) then {
	_colours = [0.3, 0.0, 0.0];
};
if( _colour == 2 ) then {
	_colours = [0.2, 0.0, 0.3];
};
if( _colour == 3 ) then {
	_colours = [0.0, 0.0, 0.3];
}; if( _colour == 4 ) then {
	_colours = [0.0, 0.3, 0.0];
};
_brightness = 0.02;
if( _colour == 1 ) then {
	_brightness = 0.02;
};

_ambient = [0.0, 0.0, 0.0];
_light = "#lightpoint" createVehicleLocal (getPosATL _vehicle);
_light setLightColor _colours;
_light setLightAmbient _colours;
_light setLightBrightness _brightness;
_light lightAttachObject [_vehicle, [0,-0.5,-1.5]];
silver_neon_light = _light;
while{ (alive _vehicle) and (daytime > 20 || daytime < 4) and (_vehicle getVariable["SilverNeon", false]) } do {
	sleep 0.5;
};
silver_neon_tog = 0;
deleteVehicle _light;