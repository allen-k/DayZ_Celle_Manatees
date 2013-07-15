_skin = _this select 3;
[dayz_playerUID,dayz_characterID,_skin] spawn player_humanityMorph;
sleep 2;
hint format ["Changed Skin to: \n%1",_skin];
sleep 1;
toolsmenu = player addAction [("<t color=""#39E8EC"">" + ("Admin Menu") +"</t>"), "manatee\admintools\AdminToolsMain.sqf"];