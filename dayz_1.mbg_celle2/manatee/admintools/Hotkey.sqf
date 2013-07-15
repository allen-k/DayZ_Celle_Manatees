//Player only
if (!isDedicated) then {

  hotkey_hitme = 0;
  hotkey_tools = 0;
  dayz_spaceInterrupt = {
    private ["_dikCode", "_handled", "_admins"];
    _dikCode =  _this select 1;
    _handled = false;
    if (_dikCode in actionKeys "User19" and hotkey_tools == 0 and (time - dayz_lastCheckBit > 1)) then {
      dayz_lastCheckBit = time;
	  hotkey_tools = 1;
	  // manatee, allen, slingshot, elfi, cookiezzz, zdtl
	  if ((getPlayerUID player) in ["17855046" , "111736326", "17020614", "58672134", "75641542", "73442502"]) then {
		toolsmenu = player addAction [("<t color=""#39E8EC"">" + ("Admin Menu") +"</t>"), "manatee\admintools\AdminToolsMain.sqf","",100];
	  } else {
		//debugmenu = player addAction [("<t color=""#39E8EC"">" + ("Debug Monitor") +"</t>"), "manatee\debug\playerdebug.sqf"];
		debugmenu = [] execVM "manatee\debug\playerdebug.sqf";
      };
	};
    if (_dikCode in actionKeys "User19" and hotkey_tools == 1 and (time - dayz_lastCheckBit > 1)) then {
      dayz_lastCheckBit = time; hintSilent "";
	  if ((getPlayerUID player) in ["17855046" , "111736326", "17020614", "58672134", "75641542", "73442502"]) then {
		player removeAction toolsmenu;
	  } else {
		//player removeAction debugmenu;
		debugmenu = [] execVM "manatee\debug\playerdebug.sqf";
      };
	  hotkey_tools = 0;
    };
    if ((_dikCode == 0x3E or _dikCode == 0x0F or _dikCode == 0xD3) and (time - dayz_lastCheckBit > 10)) then {
      dayz_lastCheckBit = time;
    };
    _handled
  };
};