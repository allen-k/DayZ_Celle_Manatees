// MANATEES CUSTOM BUILD SCRIPT
// http://manatees.enjin.com

disableUserInput true;

// close the menu
_nil = execVM "manatee\crafting\closemenu.sqf";

// get all the parameters
_parameters = _this select 3;
_makeItem = _parameters select 0;
_neededItems = _parameters select 1;
_makeItemType = _makeItem select 0;
_makeItemName = _makeItem select 1;
_makeItemClass = _makeItem select 2;
_makeItemQty = _makeItem select 3;


player playActionNow "Medic";
[player,"repair",0,false] call dayz_zombieSpeak;
cutText [ format ["Attempting to craft %1, Qty: %2",_makeItemName, _makeItemQty],"PLAIN DOWN"];
sleep 5;

// get players inventory and story them as arrays
_mags = magazines player;
_weps = weapons player;

_correctInventory = true; // assume true until otherwise proven false

// loop through the array of needed items for the build
{
	_itemType = _x select 0;
	_itemClass = _x select 1;
	_itemQty = _x select 2;
	
	if (_itemType == 0) then {
		if (_itemClass in _mags) then {
			_inUserInv = {_x == _itemClass} count magazines player;
			if (_inUserInv < _itemQty) then {
				_correctInventory = false;
			};
		} else {
			_correctInventory = false;
		};
	} else {
		if (_itemClass in _weps) then {
			_inUserInv = 1;
		} else {
			_correctInventory = false;
		};
	};
} forEach _neededItems;

if (_correctInventory) then { // appears the player has everything needed
	// remove the items now
	{
		_itemType2 = _x select 0;
		_itemClass2 = _x select 1;
		_itemQty2 = _x select 2;
		for "_i" from 0 to _itemQty2-1 do {
			if (_itemType2 == 0) then {
				player removeMagazine _itemClass2;
			} else {
				player removeWeapon _itemClass2;
			};
		};
	} forEach _neededItems;
	
	sleep 2;
	player playActionNow "Medic";
	[player,"repair",0,false] call dayz_zombieSpeak;
	cutText [ format ["Crafting a %1",_makeItemName],"PLAIN DOWN"];
	sleep 6;
	
	if (alive player) then { // see if they weren't killed in the process
		_error = false;
		for "_i" from 0 to _makeItemQty-1 do {
			if (_makeItemClass == "PipeBomb") then {
				_result = player addMagazine "PipeBomb";
			} else {
				_result = [player,_makeItemClass] call BIS_fnc_invAdd;
			};
			if (!_result) then {
				_error = true;
			};
		};
		if(_error) then {
			cutText ["One or more items were lost in the crafting process.", "PLAIN DOWN"];
		} else {
			cutText [ format ["You have successfully created: %1",_makeItemName],"PLAIN DOWN"];
		};
	};
} else {
	// the players gear does not match
	_neededString = [];
	{
		_itemClass3 = _x select 1;
		_itemQty3 = _x select 2;
		_inUserInv3 = {_x == _itemClass3} count magazines player;
		
		if (_itemClass3 == "PartGeneric") then {
			_itemClass3 = "ScrapMetal";
		};
		
		_neededString set [count _neededString, format["%1/%2 %3",_inUserInv3,_itemQty3,_itemClass3]];
		
	} forEach _neededItems;
	
	cutText [format ["%1 Requirements: %2",_makeItemName, _neededString], "PLAIN DOWN",1];
};

disableUserInput false;