// This script was written by [BSM]SilverShot (c) 2013. Don't steal my work.. Contact at www.britishsergeantsmess.com
 private["_vehicle","_part","_hitpoint","_type","_selection","_array"];
 
_someoneAround = ({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 12]))-1;
if (_someoneAround != 0) exitWith {cutText [format["You cannot salvage parts with someone else around you."] , "PLAIN DOWN"]};
 
 disableUserInput true;
 
 _id = _this select 2;
 _array = _this select 3;
 _vehicle = _array select 0;
 _part = _array select 1;
 _hitpoint = _array select 2;
 _type = typeOf _vehicle;
 _hasToolbox = "ItemToolbox" in items player;
 _hasCrowbar = "ItemCrowbar" in items player;
 _nameType = getText(configFile >> "cfgVehicles" >> _type >> "displayName");
 _namePart = getText(configFile >> "cfgMagazines" >> _part >> "displayName");
 
if (_hasToolbox && _hasCrowbar) then {
	if (getDammage _vehicle < 0.95) then {
		_damage = [_vehicle,_hitpoint] call object_getHit;
		if( _damage < 0.10 ) then {
			_chance = floor(random 100);
	
			if (_chance < 5) exitWith { // remove crowbar
				player removeWeapon "ItemCrowbar";
				player playActionNow "Medic";
				[player,"repair",0,false] call dayz_zombieSpeak;
				_null = [player,50,true,(getPosATL player)] spawn player_alertZombies;
				cutText ["Your crowbar slips from your hands and falls down a stormdrain, Oops." , "PLAIN DOWN"];
				sleep 8;
				disableUserInput false;
			};
			
			_result = [player,_part] call BIS_fnc_invAdd;
			if (_result) then {
				{dayz_myCursorTarget removeAction _x} forEach s_player_removeActions; s_player_removeActions = [];
				dayz_myCursorTarget = objNull;
				_selection = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _hitpoint >> "name");
				if( _hitpoint == "HitEngine" or _hitpoint == "HitFuel" ) then {
					dayzSetFix = [_vehicle,_selection,0.89];
				} else {
					dayzSetFix = [_vehicle,_selection,1];
				};
				
				publicVariable "dayzSetFix";
				
				if (local _vehicle) then {
					dayzSetFix call object_setFixServer;
				};
				
				player playActionNow "Medic";
				sleep 1;
				[player,"repair",0,false] call dayz_zombieSpeak;
				
				_null = [player,50,true,(getPosATL player)] spawn player_alertZombies;
				sleep 5;
				_vehicle setvelocity [0,0,1];
				cutText [format["You have successfully taken %1 from the %2",_namePart,_nameType], "PLAIN DOWN"];
			} else {
				cutText [localize "str_player_24", "PLAIN DOWN"];
			};
		} else {
			cutText [format["Cannot remove %1 from %2, the part has been damaged.",_namePart,_nameType], "PLAIN DOWN"];
		};
	} else {
		{dayz_myCursorTarget removeAction _x} forEach s_player_removeActions; s_player_removeActions = [];
		dayz_myCursorTarget = objNull;
	};
};
	
if( dayz_myCursorTarget != objNull ) then {
	{dayz_myCursorTarget removeAction _x} forEach s_player_removeActions; s_player_removeActions = [];
	dayz_myCursorTarget = objNull;
};

disableUserInput false;