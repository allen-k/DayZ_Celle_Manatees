        _vehicle = _this select 3;
		{
			dayz_myCursorTarget removeAction _x
		} forEach s_player_repairActions;s_player_repairActions = [];
		{
			dayz_myCursorTarget2 removeAction _x
		} forEach s_player_removeActions;s_player_removeActions = [];
		dayz_myCursorTarget = _vehicle;
		dayz_myCursorTarget2 = _vehicle;
 
        _hitpoints = _vehicle call vehicle_getHitpoints;
 
        {
            _damage = [_vehicle,_x] call object_getHit;
			_part = "PartGeneric";
 
            if( _damage < 0.15 ) then {
 
                //change "HitPart" to " - Part" rather than complicated string replace
                _cmpt = toArray (_x);
                _cmpt set [0,20];
                _cmpt set [1,toArray (" - ") select 0];
                _cmpt set [2,20];
                _cmpt = toString _cmpt;
 
                _skip = true;
                if( _skip and _x == "HitFuel" ) then { _skip = false; _part = "PartFueltank"; _cmpt = _cmpt + "tank"};
                if( _skip and _x == "HitEngine" ) then { _skip = false; _part = "PartEngine"; };
                if( _skip and _x == "HitLFWheel" ) then { _skip = false; _part = "PartWheel"; };
                if( _skip and _x == "HitRFWheel" ) then { _skip = false; _part = "PartWheel"; };
                if( _skip and _x == "HitLBWheel" ) then { _skip = false; _part = "PartWheel"; };
                if( _skip and _x == "HitRBWheel" ) then { _skip = false; _part = "PartWheel"; };
                if( _skip and _x == "HitGlass1" ) then { _skip = false; _part = "PartGlass"; };
                if( _skip and _x == "HitGlass2" ) then { _skip = false; _part = "PartGlass"; };
                if( _skip and _x == "HitGlass3" ) then { _skip = false; _part = "PartGlass"; };
                if( _skip and _x == "HitGlass4" ) then { _skip = false; _part = "PartGlass"; };
                if( _skip and _x == "HitGlass5" ) then { _skip = false; _part = "PartGlass"; };
                if( _skip and _x == "HitGlass6" ) then { _skip = false; _part = "PartGlass"; };
                if( _skip and _x == "HitHRotor" ) then { _skip = false; _part = "PartVRotor"; };
				if( _skip and _x == "HitBody" ) then { _skip = false; _part = "PartGeneric"; };
 
				if (!_skip ) then {
                    _string = format["<t color='#39E8EC'>Salvage%1</t>",_cmpt,_color]; //Remove - Part
                    _handle = _vehicle addAction [_string, "manatee\repair\ss_remove.sqf",[_vehicle,_part,_x], 2, false, true, "",""];
                    s_player_removeActions set [count s_player_removeActions,_handle];
                };
            };
 
        } forEach _hitpoints;