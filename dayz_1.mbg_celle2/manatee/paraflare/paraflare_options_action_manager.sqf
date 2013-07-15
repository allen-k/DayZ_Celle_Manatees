// GeneralCarver Paraflare Script Display Action Options Script
// Author: GeneralCarver
// Version: 1
// Date: 11/15/10
// Description: This script sets a variable true so the action manager script will display all the paraflare actions available to the player.





private ["_player_magazines", "_act_id_launch_flare_white", "_act_id_launch_flare_green", "_act_id_launch_flare_red", "_act_id_launch_flare_yellow"];

_player_magazines = magazines player;
_act_id_launch_flare_white = 9999;
_act_id_launch_flare_green = 9999;
_act_id_launch_flare_red = 9999;
_act_id_launch_flare_yellow = 9999;




// ======================================================================================
// Begin Script

// make sure script is not already running, exit if so.
// check if actions displayed.
if (gc_paraflare_flare_options_displayed) then 
	{
	// actions are displayed already
	// do nothing.
	} else 
	{

	// display actions..
	gc_paraflare_flare_options_displayed = true;

	// add action to close actions
	_actid_close_paraflare_options = 0;
	s_actid_close_paraflare_options = player addaction [("<t color=""#FF7300"">" + ("Close Paraflare Menu") +"</t>"), "manatee\paraflare\close_paraflare_options.sqf", "", 6, false, true, "", ""];
	
	// check which flares player has and add coorsponding action..
	// capture player's inventory...
	_player_magazines = magazines player;

	// check if player has white flares...
	_flare_array = ["FlareWhite_GP25", "FlareWhite_M203"];
	{
	if (_player_magazines find _x == -1) then
		{
		// nothing, magazine is not white flare.
		} else 
		{
		// flare found.
		// make sure white flare launch action is not already added.
		if (_act_id_launch_flare_white == 9999) then 
			{
			// action not added. add it.
			_act_id_launch_flare_white = 0;
			s_act_id_launch_flare_white = player addaction [("<t color=""#FFFFFF"">" + ("Launch Paraflare White") +"</t>"), "manatee\paraflare\launch_paraflare.sqf", ["F_40mm_White", "FlareWhite_M203"], 5, false, true, "", ""];
			};
		};
	} foreach _flare_array;

	// check if player has green flares...
	_flare_array = ["FlareGreen_M203", "FlareGreen_GP25"];
	{
	if (_player_magazines find _x == -1) then
		{
		// nothing, magazine is not white flare.
		} else 
		{
		// flare found.
		// make sure green flare launch action is not already added.
		if (_act_id_launch_flare_green == 9999) then 
			{
			// action not added. add it.
			_act_id_launch_flare_green = 0;
			s_act_id_launch_flare_green = player addaction [("<t color=""#4AC925"">" + ("Launch Paraflare Green") +"</t>"), "manatee\paraflare\launch_paraflare.sqf", ["F_40mm_Green", "FlareGreen_M203"], 5, false, true, "", ""];
			};
		};
	} foreach _flare_array;

	// check if player has red flares...
	_flare_array = ["FlareRed_M203", "FlareRed_GP25"];
	{
	if (_player_magazines find _x == -1) then
		{
		// nothing, magazine is not white flare.
		} else 
		{
		// flare found.
		// make sure red flare launch action is not already added.
		if (_act_id_launch_flare_red == 9999) then 
			{
			// action not added. add it.
			_act_id_launch_flare_red = 0;
			s_act_id_launch_flare_red = player addaction [("<t color=""#E00707"">" + ("Launch Paraflare Red") +"</t>"), "manatee\paraflare\launch_paraflare.sqf", ["F_40mm_Red", "FlareRed_M203"], 5, false, true, "", ""];
			};
		};
	} foreach _flare_array;

	// check if player has yellow flares...
	_flare_array = ["FlareYellow_M203", "FlareYellow_GP25"];
	{
	if (_player_magazines find _x == -1) then
		{
		// nothing, magazine is not white flare.
		} else 
		{
		// flare found.
		// make sure red flare launch action is not already added.
		if (_act_id_launch_flare_yellow == 9999) then 
			{
			// action not added. add it.
			_act_id_launch_flare_yellow = 0;
			s_act_id_launch_flare_yellow = player addaction [("<t color=""#FFC726"">" + ("Launch Paraflare Yellow") +"</t>"), "manatee\paraflare\launch_paraflare.sqf", ["F_40mm_Yellow", "FlareYellow_M203"], 5, false, true, "", ""];
			};
		};
	} foreach _flare_array;

	// loop and check conditions to remove all actions
	while {gc_paraflare_flare_options_displayed} do 
		{
		if (alive player) then 
			{
			// nothing.
			} else 
			{
			gc_paraflare_flare_options_displayed = false;
			};
		sleep 1;
		};


	// remove actions if added.
	if (_act_id_launch_flare_white == 9999) then 
		{
		// nothing, action not added.
		} else 
		{
		// action added, remove it.
		player removeaction s_act_id_launch_flare_white;
		_act_id_launch_flare_white = 9999;
		};

	if (_act_id_launch_flare_green == 9999) then 
		{
		// nothing, action not added.
		} else 
		{
		// action added, remove it.
		player removeaction s_act_id_launch_flare_green;
		_act_id_launch_flare_green = 9999;
		};

	if (_act_id_launch_flare_red == 9999) then 
		{
		// nothing, action not added.
		} else 
		{
		// action added, remove it.
		player removeaction s_act_id_launch_flare_red;
		_act_id_launch_flare_red = 9999;
		};

	if (_act_id_launch_flare_yellow == 9999) then 
		{
		// nothing, action not added.
		} else 
		{
		// action added, remove it.
		player removeaction s_act_id_launch_flare_yellow;
		_act_id_launch_flare_yellow = 9999;
		};

	if (_actid_close_paraflare_options == 9999) then 
		{
		// nothing, action not added.
		} else 
		{
		// action added, remove it.
		player removeaction s_actid_close_paraflare_options;
		_actid_close_paraflare_options = 9999;
		};
	};




// End Script
// ======================================================================================





// ======================================================================================
// Release Notes

/*
v1 - 11/15/10 - Released.
*/