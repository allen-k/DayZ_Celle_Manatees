// GeneralCarver Paraflare Script Action Manager Script
// Author: GeneralCarver
// Date: 11/14/2010
// Version: 1
// Description: This script manages displaying the actions for the paraflare script.




// ================================================================================
// Define Variables

private ["_actid_paraflare_options", "_remove_paraflare_options_action", "_player_magazines", "_supported_rifle_grenade_array", "_player_has_riflegrenade"];
_actid_paraflare_options = 9999;
_remove_paraflare_options_action = false;
_player_has_riflegrenade = false;
_supported_rifle_grenade_array = ["FlareWhite_M203", "FlareGreen_M203", "FlareRed_M203", "FlareYellow_M203", "FlareWhite_GP25", "FlareGreen_GP25", "FlareRed_GP25", "FlareYellow_GP25"];

//
// ================================================================================




// ================================================================================
// Begin Script


While {local player} do 
	{
	// check if player has rifle grenades in inventory..
	_player_has_riflegrenade = false;
	// capture player's gear
	_player_magazines = magazines player;
	{
	if (_player_magazines find _x == -1) then 
		{
		// player has not rifle grenades.
		} else 
		{
		_player_has_riflegrenade = true;
		};
	} foreach _supported_rifle_grenade_array;

	// ===========
	// disabled code using "in" command. Not working. Reason unknown.
	/*
	// check if player has rifle grenades in inventory..
	// capture player's gear
	_player_magazines = magazines player;
	// check if player has rifle grenades..
	{
	if ((_x in _supported_rifle_grenade_array)) then 
		{
		// player has a supported rifle grenade.
		_player_has_riflegrenade = true;
		};
	} foreach _player_magazines;
	*/
	// end disabled code
	// =========================

	// Check conditions for adding paraflare actions action.
	// check if player is alive..
	if (alive player) then 
		{
		// player is alive, continue checking conditions.
		// check if player has rifle grenade in inventory.
		if (_player_has_riflegrenade) then 
			{
			// player has rifle grenade, continue checking conditions..
			// check if options are shown.
			if (gc_paraflare_flare_options_displayed) then 
				{
				// actions are shown. do nothing.
				} else 
				{
				// options not shown. continue checking conditions..
				// check if action has already been added..
				if (_actid_paraflare_options == 9999) then 
					{
					// actions are not displayed.
					// add action.
					_actid_paraflare_options = 0;
					s_actid_paraflare_options = player addaction [("<t color=""#FF7300"">" + ("Paraflare Menu") +"</t>"), "manatee\paraflare\paraflare_options_action_manager.sqf", "", 0, false, false, "", "(daytime > 20 || daytime < 4)"];
					};
				};
			};
		};

	// check conditions to remove actions..
	// check if player is dead.
	if (alive player) then 
		{
		// nothing, player is alive.
		} else  
		{
		// check if action is already added.
		if (_actid_paraflare_options == 9999) then 
			{
			// action is not displayed. do nothing.
			} else 
			{
			player removeaction s_actid_paraflare_options;
			_actid_paraflare_options = 9999;
			};
		};

	// check if player has no paraflares in inventory..
	if (_player_has_riflegrenade) then 
		{
		// nothing. player has rifle grenades.
		} else 
		{
		// check if action is already added.
		if (_actid_paraflare_options == 9999) then 
			{
			// action is not displayed. do nothing.
			} else 
			{
			player removeaction s_actid_paraflare_options;
			_actid_paraflare_options = 9999;
			};
		};

	// check if paraflare options actions are displayed.
	if (gc_paraflare_flare_options_displayed) then 
		{
		// actions are displayed. Remove show options action if displayed.
		if (_actid_paraflare_options == 9999) then 
			{
			// action is not displayed. do nothing.
			} else 
			{
			player removeaction s_actid_paraflare_options;
			_actid_paraflare_options = 9999;
			};
		};

	sleep 1; // delay before loop.	
	};
// End Script
// ================================================================================




// ================================================================================
// Change Log

/*

v1 - 11/14/10 - Released.

*/