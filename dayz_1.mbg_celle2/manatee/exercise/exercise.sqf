// This script was written by [BSM]SilverShot (c) 2013. Don't steal my work.. Contact at www.britishsergeantsmess.com

silvers_exer = silvers_exer + 1;

if( silvers_exer == 11 ) then {
	silvers_exer = 1;
};

_ep = silvers_exer + 1;

if( _ep == 2 or _ep == 4 or _ep == 6 or _ep == 8 or _ep == 10 ) then {
	titleText [format["Exercise %1/5 (select again to stop)",_ep/2], "PLAIN DOWN"];
};

switch (silvers_exer) do {
	case 2: {
		if( animationState player != "AmovPercMstpSnonWnonDnon_idle71kliky" ) then {
			silvers_exer = 3;
		};
	};
	case 4: {
		if( animationState player != "AmovPercMstpSnonWnonDnon_idle72lehSedy" ) then {
			silvers_exer = 5;
		};
	}; case 6: {
		if( animationState player != "AmovPercMstpSnonWnonDnon_idle69drepy" ) then {
			silvers_exer = 7;
		};
	};
	
	case 8: {
		if( animationState player != "AmovPercMstpSnonWnonDnon_idle68boxing" ) then {
			silvers_exer = 9;
		};
	};
	case 10: {
		if( animationState player != "AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou" ) then {
			silvers_exer = 1;
		};
	};
};

silversExercise = [player, silvers_exer];
publicVariable "silversExercise";
[player, silvers_exer] spawn silver_Exercise;
_work = false;
sleep 2;
_anims = ["amovpercmstpsnonwnondnon_idle71kliky","amovpercmstpsnonwnondnon_idle72lehsedy","amovpercmstpsnonwnondnon_idle69drepy", "amovpercmstpsnonwnondnon_idle68boxing","amovpercmstpsnonwnondnon_idle70chozeniporukou"];
_anim = animationState player;
if( _anim in _anims ) then {
	_work = true;
};
	
while { _work } do {
	sleep 1;
	_last = dayz_temperatur;
	_anims = animationState player;
	if( _anim == _anims ) then {
		dayz_temperatur = (((dayz_temperatur + 0.02) max dayz_temperaturmin) min dayz_temperaturmax);
	} else {
		_work = false;
	};
};