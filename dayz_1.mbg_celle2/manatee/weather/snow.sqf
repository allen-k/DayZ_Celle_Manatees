// This script was written by [BSM]SilverShot (c) 2013. Don't steal my work.. Contact at www.britishsergeantsmess.com
while { true } do {
	_inBuilding = [player] call fnc_isInsideBuilding;
	if(overcast >= 0.65 && !_inBuilding) then {
			_snow = "#particlesource" createVehicleLocal (position vehicle player);
			_snow setParticleCircle [0, [0, 0, 0]];
			_snow setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal",16,12,8,1],"", "Billboard", 1, 8, [0,0,0], [0,0,0], 1, 0.0000001,0,1.4, [0.05], [[1,1,1,1]], [0,1], 0.02, 0.9, "", "", vehicle player];
			_snow setParticleRandom [0, [20,20,10], [0,0,0], 0, 0.01, [0,0,0,1], 0.06, 0.02, 0];
			_snow setDropInterval 0.001;
			
			if( vehicle player == player ) then {
				_temp = 0.02;
				if( (daytime > 20 || daytime < 4) ) then {
					_temp = 0.012;
				};
				
				dayz_temperatur = (((dayz_temperatur - _temp) max dayz_temperaturmin) min dayz_temperaturmax);
			};
			
			sleep 2;
			deleteVehicle _snow;
	} else {
		sleep 10;
	};
};