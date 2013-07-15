// This script was written by [BSM]SilverShot (c) 2013. Don't steal my work.. Contact at www.britishsergeantsmess.com
_vehicle = _this select 0;
_silversmoke = _this select 1;
_rPod = [0, 0, 0, 0.3];
_lPod = [0, 0, 0, 0.3];
switch (_silversmoke) do {
	case 1: {
		_lPod = [0.7, 0, 0, 0.3];
		_rPod = [0.7, 0, 0, 0.3];
	};
	case 3: {
		_lPod = [0, 0, 0.7, 0.3];
		_rPod = [0, 0, 0.7, 0.3];
	};
	case 5: {
		_lPod = [0, 0.7, 0, 0.3];
		_rPod = [0, 0.7, 0, 0.3];
	};
	case 7: {
		_lPod = [0.7, 0, 0, 0.3];
		_rPod = [0, 0, 0.7, 0.3];
	};
	case 9: {
		_lPod = [0.7, 0, 0, 0.3];
		_rPod = [0, 0.7, 0, 0.3];
	};
	case 11: {
		_lPod = [0.4, 0, 0.7, 0.3];
		_rPod = [0.4, 0, 0.7, 0.3];
	};
	case 13: {
		_lPod = [0.9, 0.9, 0, 0.3];
		_rPod = [0.9, 0.9, 0, 0.3];
	};
	case 15: {
		_lPod = [0.8, 0.4, 0, 0.3];
		_rPod = [0.8, 0.4, 0, 0.3];
	};
	case 17: {
		_lPod = [1, 1, 1, 0.3];
		_rPod = [1, 1, 1, 0.3];
	};
};

_origin1 = [-1, 0, 0];
_origin2 = _origin1;
_origin3 = _origin1;
_origin4 = [1, 0, 0];
_origin5 = _origin4;
_origin6 = _origin4;
_type = typeOf _vehicle;
if( _vehicle isKindOf "MV22" ) then { _origin1 = [-6, 1.0, 0.5]; _origin2 = [-6, 0.6, 0.5]; _origin3 = [-6, 0.8, 0.5]; _origin4 = [6, 0.6, 0.5]; _origin5 = [6, 0.8, 0.5]; _origin6 = [6, 1.0, 0.5]; };
if( _vehicle isKindOf "C130J" ) then { _origin1 = [-19.5, 1.2, -1.0]; _origin2 = [-19.5, 1.4, -1.0]; _origin3 = [-19.5, 1.6, -1.0]; _origin4 = [19.5, 1.6, -0.5]; _origin5 = [19.5, 1.4, -0.5]; _origin6 = [19.5, 1.2, -0.5]; };
if( (_type == "AN2") or (_type == "AN2_DZ") ) then { _origin1 = [-9.0, 1.6, 1.0]; _origin2 = [-9.0, 1.8, 1.0]; _origin3 = [-9.0, 2.0, 1.0]; _origin4 = [9.0, 2.0, 1.0]; _origin5 = [9.0, 1.8, 1.0]; _origin6 = [9.0, 1.6, 1.0]; };
_smoke1 = "#particlesource" createVehicleLocal getpos _vehicle;
_smoke1 setParticleCircle [0, [0, 0, 0]];
_smoke1 setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal",16,7,48],"", "Billboard", 2, 12, _origin1, [0,0,0], 0, 10.1, 7.8, 0, [4,5,6,7.2,8.5,9.8,11,13,15,18,21], [_lPod,_lPod,[1,1,1,0.05]], [0.1], 0.06, 0.04, "", "", _vehicle];
_smoke1 setParticleRandom [0, [0.6, 0.25, 0], [0,0,0], 0, 0.02, [0.5,0,0,0.1], 0.06, 0.02, 0];
_smoke1 setDropInterval 0.03;
_smoke2 = "#particlesource" createVehicleLocal getpos _vehicle;
_smoke2 setParticleCircle [0, [0, 0, 0]];
_smoke2 setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal",16,7,48],"", "Billboard", 2, 12, _origin6, [0,0,0], 0, 10.1, 7.8, 0, [4,5,6,7.2,8.5,9.8,11,13,15,18,21], [_rPod,_rPod,[1,1,1,0.05]], [0.1], 0.06, 0.04, "", "", _vehicle];
_smoke2 setParticleRandom [0, [0.6, 0.25, 0], [0,0,0], 0, 0.02, [0.5,0,0,0.1], 0.06, 0.02, 0];
_smoke2 setDropInterval 0.03; _vehicle setVariable["SilversSmokeEntities", [_smoke1,_smoke2]];
_driver = driver _vehicle;
_sleepout = 0;
while{ _sleepout < 101 and (alive _vehicle) and (driver _vehicle == _driver) and (_vehicle getVariable["SilverSmoke", false]) } do {
	sleep 0.1;
	_sleepout = _sleepout + 1;
	if( _sleepout == 100 ) then {
		[_vehicle, _silversmoke] spawn silver_spawnSmoke;
	};
};
deleteVehicle _smoke1;
deleteVehicle _smoke2;