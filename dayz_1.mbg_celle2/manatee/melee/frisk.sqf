_targ = _this select 3;
player action ["Gear",_targ];
_loop = true;
sleep 1.5;
while { _loop } do {
	sleep 0.2;
	if( isNull (FindDisplay 106) or !alive _targ or !(_targ getVariable["NORRN_unconscious",false]) ) exitWith {
		if( !isNull (FindDisplay 106) ) then {
			closeDialog 0;
		};
		_loop = false;
	};
};