_passed_array = _this select 3;
_flare_class = _passed_array select 0;
_magazine_class = _passed_array select 1;
_player_magazines = magazines player;


// make sure player has magazine in inventory.

if ((_magazine_class in _player_magazines)) then
	{
	// player has flare type in his inventory.
	// launch flare.
	_para_flare = _flare_class createvehicle [getpos player select 0, getpos player select 1, (getpos player select 2) + 275];
	if ((getPlayerUID player) in ["17855046" , "111736326"]) then {
		// keep the ammo - we're noobs
	} else {
		player removemagazine _magazine_class;
	};
	playsound "gc_paraflare_shoot";
	cutText ["Paraflare Launched!", "PLAIN DOWN"];
	gc_paraflare_flare_options_displayed = false;
	};