// This script was written by [BSM]SilverShot (c) 2013. Don't steal my work.. Contact at www.britishsergeantsmess.com
waitUntil {(!isNull Player) and (alive Player) and (player == player)};
sleep 1;
silverIsSnow = true;
silver_neon = -1;
silver_neon_tog = 0;
silver_neon_light = 0;
s_silver_rig_veh = -1;
s_silver_defuse = -1;
silvers_exer = 0;
silvers_dance = 0;
s_silver_menu_dance = -1;
s_silver_menu_exercise = -1;
camp_menu_added = false;
show_salvage_menu = false;
crafting_menu_open = false;
s_silver_near_camp = false;
silver_refueling_started = false;
mana_ai_shield = false;
silver_riggin = false;
silver_deleteRig = { _obj = _this;
silverDeleteRig = [_obj];
publicVariableServer "silverDeleteRig"; true };

publicVariableServer "silverIsSnow";
{
	_hasNeon = _x getVariable["SilverNeon", false];
	if( _hasNeon ) then {
		_colour = _x getVariable["SilverNeonCol", 0];
		[_x, _colour] spawn silver_spawnLight;
	};
	_hasSmoke = _x getVariable["SilverSmoke", false];
	if( _hasSmoke ) then {
		_colour = _x getVariable["SilverSmokeCol", 0];
		[_x, _colour] spawn silver_spawnSmoke;
	};
	_null = _x addEventHandler ["Engine", {_null = [_this select 0, 0, 0, [_x, 2]] execVM "manatee\jip\rig.sqf"} ];
} forEach vehicles;