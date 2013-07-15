_targ = _this select 3;

// check for knife
_hasKnife = "ItemKnife" in items player;

if (_hasKnife) then {
	player playActionNow "PutDown";
	_targ setDamage 1;
	cutText ["You wipe the blood off your knife like nothing happened." , "PLAIN DOWN"];
} else {
	cutText ["You need a knife in order to perform a silent kill." , "PLAIN DOWN"];
};