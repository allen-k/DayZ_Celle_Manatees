/*
[_obj] spawn player_packTent;
*/
private["_objectID","_objectUID","_obj","_ownerID","_dir","_pos","_bag","_holder","_weapons","_magazines","_backpacks","_objWpnTypes","_objWpnQty","_countr"];
_obj = _this;
_ownerID 	= _obj getVariable["CharacterID","0"];
_objectID 	= _obj getVariable["ObjectID","0"];
_objectUID	= _obj getVariable["ObjectUID","0"];

player removeAction s_player_packtent;
s_player_packtent = -1;

_someoneAround = ({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 10]))-1;
if (_someoneAround != 0) exitWith {cutText [format["You cannot pack a tent with someone else around you."] , "PLAIN DOWN"]};
_alreadyPacking = _obj getVariable["packing",0];
if (_alreadyPacking == 1) exitWith {cutText [format[(localize "str_player_beingpacked")] , "PLAIN DOWN"]};

disableUserInput true;
_chance = floor(random 100);

if (_chance > 10) then {
_obj setVariable["packing",1];
_dir = direction _obj;
_pos = getposATL _obj;

_dis=20;
_sfx = "tentpack";
[player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

dayzDeleteObj = [_objectID,_objectUID];
publicVariable "dayzDeleteObj";
if (isServer) then {
	dayzDeleteObj call server_deleteObj;
};
deleteVehicle _obj;

sleep 2;
//place tent (local)
_bag = createVehicle ["WeaponHolder_ItemTent",_pos,[], 0, "CAN_COLLIDE"];
_bag setdir _dir;
player reveal _bag;
	
_holder = "WeaponHolder" createVehicle _pos; 
_weapons = 	getWeaponCargo _obj;
_magazines = 	getMagazineCargo _obj;
_backpacks = 	getBackpackCargo _obj;

//["dayzDeleteObj",[_objectID,_objectUID]] call callRpcProcedure;	

player playActionNow "Medic";

sleep 4;
	
//Add weapons
_objWpnTypes = 	_weapons select 0;
_objWpnQty = 	_weapons select 1;
_countr = 0;
{
	_holder addweaponcargoGlobal [_x,(_objWpnQty select _countr)];
	_countr = _countr + 1;
} forEach _objWpnTypes;
	
//Add Magazines
_objWpnTypes = _magazines select 0;
_objWpnQty = _magazines select 1;
_countr = 0;
{
	_holder addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];
	_countr = _countr + 1;
} forEach _objWpnTypes;

//Add Backpacks
_objWpnTypes = _backpacks select 0;
_objWpnQty = _backpacks select 1;
_countr = 0;
{
	_holder addbackpackcargoGlobal [_x,(_objWpnQty select _countr)];
	_countr = _countr + 1;
} forEach _objWpnTypes;
disableUserInput false;
cutText [localize "str_success_tent_pack", "PLAIN DOWN"];
} else {
	dayzDeleteObj = [_objectID,_objectUID];
publicVariable "dayzDeleteObj";
if (isServer) then {
	dayzDeleteObj call server_deleteObj;
};
deleteVehicle _obj;
sleep 4;
disableUserInput false;
cutText ["Stupid Old Camping Tent Collapsed!", "PLAIN DOWN"];
};