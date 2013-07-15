player removeAction s_siphon;
s_siphon = -1;

_vehicle = cursorTarget;
_canSize = getNumber(configFile >> "cfgMagazines" >> "ItemJerrycan" >> "fuelQuantity");
_configVeh = configFile >> "cfgVehicles" >> TypeOf(_vehicle);
_capacity = getNumber(_configVeh >> "fuelCapacity");
_nameType = getText(_configVeh >> "displayName");
_curFuel = ((fuel _vehicle) * _capacity);
_newFuel = (_curFuel - _canSize);
_hasCrowbar = "ItemCrowbar" in items player;

_someoneAround = ({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 8]))-1;
if (_someoneAround != 0) exitWith {
	cutText [format["You dont need to hold hands to refuel jerrycans!"] , "PLAIN DOWN"]
};

if (!_hasCrowbar) exitWith {
	titleText [format["You must have a Crowbar in your toolbelt to siphon."], "PLAIN DOWN"];
};

if (_newFuel < 0) exitWith {
	titleText [format["%1 does not have enough fuel to fill a Jerry Can",_nameType], "PLAIN DOWN"];
};
if (_newFuel > _capacity) then {
	_newFuel = _capacity};
	_newFuel = (_newFuel / _capacity);
	player removeMagazine "ItemJerrycanEmpty";
	player addMagazine "ItemJerrycan";
	player playActionNow "Medic";
	[player,"refuel",0,false] call dayz_zombieSpeak;
	_id = [player,20,true,(getPosATL player)] spawn player_alertZombies;
	sleep 6;
	dayzSetFuel = [_vehicle,_newFuel];
	dayzSetFuel spawn local_sefFuel;
	publicVariable "dayzSetFuel";
	titleText [format["Siphoned %1 for %2 litres of fuel",_nameType,_canSize], "PLAIN DOWN"];
};