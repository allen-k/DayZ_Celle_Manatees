// This script was written by [BSM]SilverShot (c) 2013. Don't steal my work.. Contact at www.britishsergeantsmess.com
_args = _this select 3;
_args = _args select 0;
_vehicle = vehicle player;
if( _vehicle == player ) then {
	_args = 1;
};
if( _args == 1 ) exitWith {
	_vehicle = player getVariable["SilversCurrentPlane", player];
	if( _vehicle != player ) then {
		_entities = _vehicle getVariable["SilversSmokeEntities", []];
		{ deleteVehicle _x; } forEach _entities;
		_vehicle setVariable["SilverSmoke", false, true];
	};
};
_silversmoke = _vehicle getVariable["SilverSmokeCol", 0];
player setVariable["SilversCurrentPlane", _vehicle];
_silversmoke = _silversmoke + 1;
if( _silversmoke == 19 ) then {
	_silversmoke = 1;
};

_vehicle setVariable["SilverSmokeCol", _silversmoke];
_entities = _vehicle getVariable["SilversSmokeEntities", []];

{ deleteVehicle _x; } forEach _entities;

_vehicle setVariable["SilverSmoke", false, true];
_smoke_action = _vehicle getVariable["SilversSmokeAction", -1];
_vehicle removeAction _smoke_action;
_smoke_action = -1;
sleep 0.01;
_smokeOff = [("<t color=""#FFFFFF"">" + ("Smoke Off") + "</t>"),"manatee\jip\smoke.sqf",[0],6,false,true,"","driver _target == _this"];
_smoke = ("<t color=""#FFFFFF"">" + ("Smoke ") + "</t>");
switch (_silversmoke) do {
	case 1: {
		_smoke_action = _vehicle addAction _smokeOff;
	};
	case 2: {
		_smoke_action = _vehicle addAction [_smoke + ("<t color=""#0000FF"">" + ("Blue") + "</t>"),"manatee\jip\smoke.sqf",[0],6,false,true,"","driver _target == _this"];
	};
	case 3: {
		_smoke_action = _vehicle addAction _smokeOff;
	};
	case 4: {
		_smoke_action = _vehicle addAction [_smoke + ("<t color=""#00FF00"">" + ("Green") + "</t>"),"manatee\jip\smoke.sqf",[0],6,false,true,"","driver _target == _this"];
	};
	case 5: {
		_smoke_action = _vehicle addAction _smokeOff;
	};
	case 6: {
		_smoke_action = _vehicle addAction [_smoke + ("<t color=""#FF0000"">" + ("Red") + "</t>") + ("<t color=""#FFFFFF"">" + (" + ") + "</t>") + ("<t color=""#0000FF"">" + ("Blue") + "</t>"),"manatee\jip\smoke.sqf",[0],6,false,true,"","driver _target == _this"];
	};
	case 7: {
		_smoke_action = _vehicle addAction _smokeOff;
	};
	case 8: {
		_smoke_action = _vehicle addAction [_smoke + ("<t color=""#FF0000"">" + ("Red") + "</t>") + ("<t color=""#FFFFFF"">" + (" + ") + "</t>") + ("<t color=""#00FF00"">" + ("Green") + "</t>"),"manatee\jip\smoke.sqf",[0],6,false,true,"","driver _target == _this"];
	};
	case 9: {
		_smoke_action = _vehicle addAction _smokeOff;
	};
	case 10: {
		_smoke_action = _vehicle addAction [_smoke + ("<t color=""#800080"">" + ("Purple") + "</t>"),"manatee\jip\smoke.sqf",[0],6,false,true,"","driver _target == _this"];
	};
	case 11: {
		_smoke_action = _vehicle addAction _smokeOff;
	};
	case 12: {
		_smoke_action = _vehicle addAction [_smoke + ("<t color=""#FFFF00"">" + ("Yellow") + "</t>"),"manatee\jip\smoke.sqf",[0],6,false,true,"","driver _target == _this"];
	};
	case 13: {
		_smoke_action = _vehicle addAction _smokeOff;
	};
	case 14: {
		_smoke_action = _vehicle addAction [_smoke + ("<t color=""#FFA500"">" + ("Orange") + "</t>"),"manatee\jip\smoke.sqf",[0],6,false,true,"","driver _target == _this"];
	};
	case 15: {
		_smoke_action = _vehicle addAction _smokeOff;
	};
	case 16: {
		_smoke_action = _vehicle addAction [("<t color=""#FFFFFF"">" + ("Smoke White") + "</t>"),"manatee\jip\smoke.sqf",[0],6,false,true,"","driver _target == _this"];
	};
	case 17: {
		_smoke_action = _vehicle addAction _smokeOff;
	};
	case 18: {
		_smoke_action = _vehicle addAction [_smoke + ("<t color=""#FF0000"">" + ("Red") + "</t>"),"manatee\jip\smoke.sqf",[0],6,false,true,"","driver _target == _this"];
	};
};

_vehicle setVariable["SilversSmokeAction", _smoke_action];
if( _silversmoke == 1 or _silversmoke == 3 or _silversmoke == 5 or _silversmoke == 7 or _silversmoke == 9 or _silversmoke == 11 or _silversmoke == 13 or _silversmoke == 15 or _silversmoke == 17 ) then {
	_vehicle setVariable["SilverSmoke", true, true];
	silversSpawnSmoke = [_vehicle, _silversmoke]; publicVariable "silversSpawnSmoke";
	[_vehicle, _silversmoke] spawn silver_spawnSmoke;
};

_sleepout = 0;
while{ (alive _vehicle) and (driver _vehicle == player) and (_vehicle getVariable["SilverSmoke", false]) } do {
	sleep 0.2;
};
_vehicle setVariable["SilverSmoke", false, true];
_entities = _vehicle getVariable["SilversSmokeEntities", []];
{ deleteVehicle _x; } forEach _entities;