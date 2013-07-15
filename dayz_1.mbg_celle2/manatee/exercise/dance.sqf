// This script was written by [BSM]SilverShot (c) 2013. Don't steal my work.. Contact at www.britishsergeantsmess.com

_anim = "";

switch (silvers_dance) do {
	case 0: { _anim = "actspercmstpsnonwnondnon_dancingduoivan"; };
	case 1: { _anim = "actspercmstpsnonwnondnon_dancingduostefan"; };
	case 2: { _anim = "actspercmstpsnonwnondnon_dancingstefan"; };
};

player playMoveNow _anim;
silvers_dance = silvers_dance + 1;
if( silvers_dance == 3 ) then {
	silvers_dance = 0;
};

titleText ["To stop dancing press V (default key) to vault/jump", "PLAIN DOWN", 1];
sleep 5;
titleFadeOut 1;
_work = true;

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