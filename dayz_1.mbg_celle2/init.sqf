/*	
	INITILIZATION
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance = 1;
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//start spectating
execVM "initSpec.sqf";

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
call compile preprocessFileLineNumbers "fixes\variables.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "dayz_code\init\publicEH.sqf";
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";
call compile preprocessFileLineNumbers "dayz_code\init\variables.sqf";
call compile preprocessFileLineNumbers "dayz_code\init\compiles.sqf";
call compile preprocessFileLineNumbers "dayz_code\init\settings.sqf";
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if ((!isServer) && (isNull player) ) then
{
waitUntil {!isNull player};
waitUntil {time > 3};
};

if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
  waitUntil {time > 3};
};

if (isServer) then {
	_serverMonitor = [] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};


// compile halo function
bis_fnc_halo = compile preprocessFileLineNumbers "manatee\halo\halo_fnc.sqf";
axe_server_lampObjs =    compile preprocessFileLineNumbers "manatee\lights\fnc_returnLampWS.sqf";
"axeLampObjects" addPublicVariableEventHandler {_id = (_this select 1) spawn axe_server_lampObjs};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = [] execVM "fixes\player_monitor.sqf"; // player monitor override
	//_nil = [] execVM "manatee\weather\snow.sqf"; // snow
	_nil = [] execVM "manatee\jip\jip.sqf"; // Mini loader for Misc functions
	//_nil = [] execVM "manatee\fog\fog.sqf"; // fog
	_nil = [] execVM "fixes\activeCombat.sqf"; // start combat with zeds
	_nil = [] execVM "manatee\intro\introZoom.sqf"; // intro zoom
	sleep 2;
	_nil = [] execVM "manatee\intro\joinMessages.sqf"; // join message sequence
	
	//1st person lock in Air Vehicles
	[] spawn 
	{
		while {true} do {
   
			PlayerHumanity = (player getVariable "humanity");
			if ((getPlayerUID player) in ["17855046", "111736326"] or (PlayerHumanity < -15000 or PlayerHumanity > 15000)) then {
				// allow for 3rd person Perk.
			} else {
				if((cameraView == "EXTERNAL" || cameraView == "GROUP") && (vehicle player isKindOf "Air")) then 
				{
					vehicle player switchCamera "INTERNAL"; titleText["This type of vehicle is 1st Person only!!", "PLAIN", 1]
				};
			};
		sleep 0.1;
		};
	};
};

if (!(isNull player)) then {
	// paraflare and flip video action managers
	gc_paraflare_script_action_manager_script = execVM "manatee\paraflare\action_manager.sqf";
	gc_paraflare_flare_options_displayed = false;
	gc_veh_flip_script_script_action_manager = execVM "manatee\flipvehicle\action_manager.sqf";
};
if (!isServer && isNull player) then {
	waitUntil {!isNull player};
	// paraflare and flip video action managers
	gc_paraflare_script_action_manager_script = execVM "manatee\paraflare\action_manager.sqf";
	gc_paraflare_flare_options_displayed = false;
	gc_veh_flip_script_script_action_manager = execVM "manatee\flipvehicle\action_manager.sqf";
};

// UPSMON / SHK / SAR AI
call compile preprocessFileLineNumbers "addons\UPSMON\scripts\Init_UPSMON.sqf";
call compile preprocessfile "addons\SHK_pos\shk_pos_init.sqf";
_nil = [] execVM "addons\SARGE\SAR_AI_init.sqf";
_nil = [] execVM "manatee\lights\change_streetlights.sqf"; // streetlights
_void = [] execVM "R3F_Realism\R3F_Realism_Init.sqf"; // R3F
_nil = execVM "manatee\admintools\HotKey.sqf"; // load admin/debug action manager
[0, 0.3, 0, [-1, -1], false] execVM "manatee\weather\dwe.sqf"; // dynamic weather
_nil = [] execVM "carradio\initCarRadio.sqf"; // car radio