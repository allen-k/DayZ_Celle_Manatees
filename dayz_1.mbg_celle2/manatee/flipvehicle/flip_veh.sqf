private ["_veh"];
_veh = _this select 3;


_someoneAround = ({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 3]))-1;
if (_someoneAround == 0) exitWith {cutText [format["You're not Muscle Man! Get a friend to help!"] , "PLAIN DOWN"]};

// reset the vehicle at its current position. This will set flipped vehicles back upright.
_veh setpos [getpos _veh select 0, getpos _veh select 1, 0];
