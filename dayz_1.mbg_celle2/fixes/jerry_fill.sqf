private["_hasFood","_item","_text","_qty"];

player removeAction s_player_fillfuel;
s_player_fillfuel = -1;

_someoneAround = ({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 8]))-1;
if (_someoneAround != 0) exitWith {cutText [format["You dont need to hold hands to refuel jerrycans!"] , "PLAIN DOWN"]};

_fuelAmount = 0;
_fuelBarrel = "Land_Fire_barrel";

_hasFuelAlready = count ((position player) nearObjects ['Land_Fire_barrel', 30]) > 0;
if (!_hasFuelAlready) then {
	_spawn = "Land_Fire_barrel";
	cutText [format["You set up some tubing and hope for the best."], "PLAIN DOWN"];
	_posplr = [((getPos player) select 0), ((getPos player) select 1),-20];
	_spwnveh = createVehicle [_spawn, _posplr, [], 0, "CAN_COLLIDE"];
	_spwnveh setVariable ["Sarge",1,true];
	_fuelAmount = round(random 2);
	_spwnveh setVariable ["fuelAmount",_fuelAmount,true];
} else {
	_fuelBarrel = (position player) nearObjects ['Land_Fire_barrel', 30];
	_fuelBarrel = _fuelBarrel select 0;
	_fuelAmount = _fuelBarrel getVariable["fuelAmount",0];
};


if ("ItemJerrycanEmpty" in magazines player) then {
	
	if (_fuelAmount == 0) exitWith {
		cutText [format["This fuel tank is empty."], "PLAIN DOWN"];
	};
	
	_fuelAmount = _fuelAmount - 1;
	_fuelBarrel setVariable ["fuelAmount",_fuelAmount,true];
	player removeMagazine "ItemJerrycanEmpty";
	player addMagazine "ItemJerrycan";
	player playActionNow "Medic";
	
	_dis=10;
	_sfx = "refuel";
	[player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
	[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

	cutText [format["There is barely any fuel left, but you filled a Jerrycan."], "PLAIN DOWN"];
} else {
	cutText [(localize "str_player_10") , "PLAIN DOWN"];
};