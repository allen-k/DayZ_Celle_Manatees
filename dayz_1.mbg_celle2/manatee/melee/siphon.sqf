_targ = _this select 3;

_someoneAround = ({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 5]))-2;
if (_someoneAround != 0) exitWith {cutText [format["You cannot siphon blood with someone else around you."] , "PLAIN DOWN"]};

// check for knife
_hasEBottle = "ItemWaterbottleUnfilled" in magazines player;
_hasKnife = "ItemKnife" in items player;

if (_hasEBottle and _hasKnife) then {
	_victBlood = _targ getVariable["USEC_BloodQty",0];
	if (_victBlood >= 4000) then {
		player playActionNow "Medic";
		_targ setVariable ["USEC_injured",true,true];
		_targ setVariable ["USEC_BloodQty",_victBlood-4000,true];
		player removeMagazine "ItemWaterbottleUnfilled";
		player addMagazine "ItemBloodbag";
		cutText ["It was messy, but you managed to catch enough for a blood bag." , "PLAIN DOWN"];
	} else {
		cutText ["The player doesn't have enough blood to siphon a full bag." , "PLAIN DOWN"];
	};
} else {
	cutText ["You need an empty water bottle and knife to siphon blood." , "PLAIN DOWN"];
};
