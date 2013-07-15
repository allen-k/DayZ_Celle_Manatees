 sleep 0.01;
 if (typename _this == typename objnull) then {
	_unit = _this;
	_dir = ([[0,0,0],velocity _unit] call bis_fnc_dirto);
	_unit setdir _dir; _unit switchmove "HaloFreeFall_non";
	if (_unit == player) then { 
		bis_fnc_halo_soundLoop = time; playsound "BIS_HALO_Flapping";
		bis_fnc_halo_action = _unit addaction [("<t color=""#0D82DF"">" + ("Open Parachute") +"</t>"),"manatee\halo\halo_fnc.sqf",[],1,true,true,"Eject"];
		bis_fnc_halo_keydown = {
			_key = _this select 1;
			if (_key in (actionkeys 'MoveForward')) then {
				if (bis_fnc_halo_vel < +bis_fnc_halo_velLimit) then {
					bis_fnc_halo_vel = bis_fnc_halo_vel + bis_fnc_halo_velAdd
				};
			};
			
			if (_key in (actionkeys 'MoveBack')) then {
				if (bis_fnc_halo_vel > -bis_fnc_halo_velLimit) then {
					bis_fnc_halo_vel = bis_fnc_halo_vel - bis_fnc_halo_velAdd
				};
			};
			
			if (_key in (actionkeys 'TurnLeft')) then {
				if (bis_fnc_halo_dir > -bis_fnc_halo_dirLimit) then {
					bis_fnc_halo_dir = bis_fnc_halo_dir - bis_fnc_halo_dirAdd
				};
			};
			
			if (_key in (actionkeys 'TurnRight')) then {
				if (bis_fnc_halo_dir < +bis_fnc_halo_dirLimit) then {
					bis_fnc_halo_dir = bis_fnc_halo_dir + bis_fnc_halo_dirAdd
				};
			};
		};
		bis_fnc_halo_keydown_eh = (finddisplay 46) displayaddeventhandler ["keydown","_this call bis_fnc_halo_keydown;"];
		bis_fnc_halo_vel = 0;
		bis_fnc_halo_velLimit = 0.2;
		bis_fnc_halo_velAdd = 0.03;
		bis_fnc_halo_dir = 0;
		bis_fnc_halo_dirLimit = 1;
		bis_fnc_halo_dirAdd = 0.06;
		[] spawn { _prevAnim = "";
		_time = time - 0.1;
		_enableDebug = silverDebug;
		silverDebug = 0;
		while {
			alive player && vehicle player == player && isnil {player getvariable "bis_fnc_halo_terminate"}} do {
				_fpsCoef = ((time - _time) * 60) / acctime;
				_time = time;
				bis_fnc_halo_velLimit = 0.2 * _fpsCoef;
				bis_fnc_halo_velAdd = 0.03 * _fpsCoef;
				bis_fnc_halo_dirLimit = 1 * _fpsCoef;
				bis_fnc_halo_dirAdd = 0.06 * _fpsCoef;
				bis_fnc_halo_dir = bis_fnc_halo_dir * 0.98;
				_dir = direction player + bis_fnc_halo_dir;
				player setdir _dir; _vel = velocity player;
				bis_fnc_halo_vel = bis_fnc_halo_vel * 0.96;
				player setvelocity [ (_vel select 0) + (sin _dir * bis_fnc_halo_vel), (_vel select 1) + (cos _dir * bis_fnc_halo_vel), (_vel select 2) ];
				_anim = "HaloFreeFall_non";
				_v = bis_fnc_halo_vel;
				_h = bis_fnc_halo_dir;
				_vLimit = 0.1;
				_hLimit = 0.3;
				
				if ((abs _v) > _vLimit || (abs _h) > _hLimit) then {
					_vAnim = "";
					if (_v > +_vLimit) then {
						_vAnim = "F"
					};
					if (_v < -_vLimit) then {
						_vAnim = "B"
					};
					_hAnim = "";
					if (_h > +_hLimit) then {
						_hAnim = "R"
					};
					if (_h < -_hLimit) then {
						_hAnim = "L"
					};
					
					_anim = "HaloFreeFall_" + _vAnim + _hAnim;
				};
				
				player playmovenow _anim;
				
				if( _prevAnim != _anim ) then {
					_prevAnim = _anim;
					silversHalo = [player, _anim];
					publicVariable "silversHalo";
				};
				
				if ((time - bis_fnc_halo_soundLoop) > 4.5) then {
					playsound "BIS_HALO_Flapping";
					bis_fnc_halo_soundLoop = time;
				};
				
				sleep 0.01;
				_altHeight = round (getPosATL player select 2);
				_altDir = floor (getDir player);
				_altHeading = "N";
				
				if(_altDir >= 337 && _altDir < 22) then {
					_altHeading = "N";
				};
				if(_altDir >= 22 && _altDir < 67) then {
					_altHeading = "NE";
				};
				if(_altDir >= 67 && _altDir < 112) then {
					_altHeading = "E";
				};
				if(_altDir >= 112 && _altDir < 157) then {
					_altHeading = "SE";
				};
				if(_altDir >= 157 && _altDir < 202) then {
					_altHeading = "S";
				};
				if(_altDir >= 202 && _altDir < 247) then {
					_altHeading = "SW";
				};
				if(_altDir >= 247 && _altDir < 292) then {
					_altHeading = "W";
				};
				if(_altDir >= 292 && _altDir < 337) then {
					_altHeading = "NW";
				};
				
				
				if (_altHeight > 250) then {
				hintsilent parseText format ["
					<t size='1.15' font='Bitstream' align='center' color='#4AC925'>Altimeter: %1</t><br/>
					<t size='0.90' font='Bitstream' align='center' color='#FFFFFF'>[Compass Heading: %2]</t></br>", _altHeight,_altHeading];
				};
				if (_altHeight <= 250 && _altHeight > 150) then {
				hintsilent parseText format ["
					<t size='1.15' font='Bitstream' align='center' color='#FF7300'>Altimeter: %1</t><br/>
					<t size='0.90' font='Bitstream' align='center' color='#FFFFFF'>[Compass Heading: %2]</t></br>", _altHeight,_altHeading];
				};
				if (_altHeight <= 150) then {
				hintsilent parseText format ["
					<t size='1.15' font='Bitstream' align='center' color='#E00707'>Altimeter: %1</t><br/>
					<t size='0.90' font='Bitstream' align='center' color='#FFFFFF'>[Compass Heading: %2]</t></br>", _altHeight,_altHeading];
				};
			};
			
			hintsilent "";
			silverDebug = _enableDebug;
			player removeaction bis_fnc_halo_action;
			
			(finddisplay 46) displayremoveeventhandler ["keydown",bis_fnc_halo_keydown_eh];
			bis_fnc_halo_vel = nil;
			bis_fnc_halo_velLimit = nil;
			bis_fnc_halo_velAdd = nil;
			bis_fnc_halo_dir = nil;
			bis_fnc_halo_dirLimit = nil;
			bis_fnc_halo_dirAdd = nil;
			bis_fnc_halo_action = nil;
			bis_fnc_halo_keydown = nil;
			bis_fnc_halo_keydown_eh = nil;
			if (!alive player) then {
				player switchmove "adthppnemstpsraswrfldnon_1";
				player setvelocity [0,0,0];
			};
		};
	};
};

if (typename _this == typename []) then {
	_unit = _this select 0;
	if (!local _unit) exitwith {};
	if (count _this == 2) exitwith {
		_alt = _this select 1;
		_unit setpos [position _unit select 0,position _unit select 1,_alt];
		_unit setvariable ["bis_fnc_halo_now",true];
		_unit spawn bis_fnc_halo;
	};
	
	_para = "ParachuteC" createVehicle position _unit;
	_para setpos position _unit;
	_para setdir direction _unit;
	_vel = velocity _unit;
	_unit moveindriver _para;
	_para lock true;
	bis_fnc_halo_para_dirAbs = direction _para;
	if (_unit == player) then {
		_para setvelocity [(_vel select 0),(_vel select 1),(_vel select 2)*1];
		bis_fnc_halo_para_vel = 0;
		bis_fnc_halo_para_velLimit = 0.5;
		bis_fnc_halo_para_velAdd = 0.01;
		bis_fnc_halo_para_dir = 0;
		bis_fnc_halo_para_dirLimit = 1.5;
		bis_fnc_halo_para_dirAdd = 0.03;
		bis_fnc_halo_para_keydown = {
			_key = _this select 1;
			if (_key in (actionkeys 'MoveForward')) then {
				if (bis_fnc_halo_para_vel < +bis_fnc_halo_para_velLimit) then {
					bis_fnc_halo_para_vel = bis_fnc_halo_para_vel + bis_fnc_halo_para_velAdd
				};
			};
			
			if (_key in (actionkeys 'MoveBack')) then {
				if (bis_fnc_halo_para_vel > -bis_fnc_halo_para_velLimit*0) then {
					bis_fnc_halo_para_vel = bis_fnc_halo_para_vel - bis_fnc_halo_para_velAdd
				};
			};
				
			if (_key in (actionkeys 'TurnLeft')) then {
				if (bis_fnc_halo_para_dir > -bis_fnc_halo_para_dirLimit) then {
					bis_fnc_halo_para_dir = bis_fnc_halo_para_dir - bis_fnc_halo_para_dirAdd
				};
			};
					
			if (_key in (actionkeys 'TurnRight')) then {
				if (bis_fnc_halo_para_dir < +bis_fnc_halo_para_dirLimit) then {
					bis_fnc_halo_para_dir = bis_fnc_halo_para_dir + bis_fnc_halo_para_dirAdd
				};
			};
		};
		
		bis_fnc_halo_para_loop_time = time - 0.001;
		bis_fnc_halo_para_velZ = velocity _para select 2;
		bis_fnc_halo_para_loop = {
			if (!isnil {player getvariable "bis_fnc_halo_terminate"}) exitwith {};
			_para = vehicle player;
			bis_fnc_halo_para_loop_time = time;
			_fpsCoef = 0.8;
			bis_fnc_halo_para_velLimit = 0.3 * _fpsCoef;
			bis_fnc_halo_para_velAdd = 0.002 * _fpsCoef;
			bis_fnc_halo_para_dirLimit = 1.5 * _fpsCoef;
			bis_fnc_halo_para_dirAdd = 0.03 * _fpsCoef;
			bis_fnc_halo_para_dir = bis_fnc_halo_para_dir * 0.98;
			bis_fnc_halo_para_dirAbs = bis_fnc_halo_para_dirAbs + bis_fnc_halo_para_dir;
			_para setdir bis_fnc_halo_para_dirAbs;
			_dir = direction _para;
			bis_fnc_halo_para_velZ = _velZ;
			_para setposasl [ (getposasl _para select 0) + (sin _dir * (0.1 + bis_fnc_halo_para_vel)), (getposasl _para select 1) + (cos _dir * (0.1 + bis_fnc_halo_para_vel)), (getposasl _para select 2) - 0.01 - 0.1 * abs bis_fnc_halo_para_vel ];
			[ _para, (-bis_fnc_halo_para_vel * 75) + 0.5*(sin (time * 180)), (+bis_fnc_halo_para_dir * 25) + 0.5*(cos (time * 180)) ] call bis_fnc_setpitchbank;
		};
		bis_fnc_halo_para_mousemoving_eh = (finddisplay 46) displayaddeventhandler ["mousemoving","_this call bis_fnc_halo_para_loop;"];
		bis_fnc_halo_para_mouseholding_eh = (finddisplay 46) displayaddeventhandler ["mouseholding","_this call bis_fnc_halo_para_loop;"];
		sleep 4;
		bis_fnc_halo_para_keydown_eh = (finddisplay 46) displayaddeventhandler ["keydown","_this call bis_fnc_halo_para_keydown;"];
		player setvariable ["bis_fnc_halo_terminate",nil];
		waituntil {(position vehicle player select 2) < 2 || !isnil {player getvariable "bis_fnc_halo_terminate"}};
		(finddisplay 46) displayremoveeventhandler ["keydown",bis_fnc_halo_para_keydown_eh];
		(finddisplay 46) displayremoveeventhandler ["mousemoving",bis_fnc_halo_para_mousemoving_eh];
		(finddisplay 46) displayremoveeventhandler ["mouseholding",bis_fnc_halo_para_mouseholding_eh];
		bis_fnc_halo_para_vel = nil;
		bis_fnc_halo_para_velLimit = nil;
		bis_fnc_halo_para_velAdd = nil;
		bis_fnc_halo_para_dir = nil;
		bis_fnc_halo_para_dirLimit = nil;
		bis_fnc_halo_para_dirAdd = nil;
		bis_fnc_halo_para_keydown = nil;
		bis_fnc_halo_para_loop = nil;
		bis_fnc_halo_para_keydown_eh = nil;
		bis_fnc_halo_para_mousemoving_eh = nil;
		bis_fnc_halo_para_mouseholding_eh = nil;
	};
};