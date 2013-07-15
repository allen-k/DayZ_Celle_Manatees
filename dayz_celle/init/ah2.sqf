waitUntil {!isNil "BIS_fnc_init"};

loadFile = "STRING";
markerText = "STRING";

//_debug = getMarkerPos "respawn_west";
// manatee, allen, slingshot, elfi, cookie, zdtl
_list = ["17855046" , "111736326", "17020614", "58672134", "75641542", "73442502"];

fn_genRand =
{
	_arr = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","0","1","2","3","4","5","6","7","8","9"];
	_gen = "v_";
	for "_i" from 1 to 5 do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
	_gen
};

_nullrand1 = call fn_genRand;
_nullrand2 = call fn_genRand;
_nullrand3 = call fn_genRand;
_nullrand4 = call fn_genRand;
_nullrand5 = call fn_genRand;
_nullrand6 = call fn_genRand;
_nullrand7 = call fn_genRand;
_nullrand8 = call fn_genRand;
_nullrand9 = call fn_genRand;
_nullrand10 = call fn_genRand;
_nullrand11 = call fn_genRand;
_nullrand12 = call fn_genRand;
_nullrand13 = call fn_genRand;
_nullrand14 = call fn_genRand;
_nullrand15 = call fn_genRand;
_nullrand16 = call fn_genRand;
_nullrand17 = call fn_genRand;
_nullrand18 = call fn_genRand;
_nullrand19 = call fn_genRand;

call compile ("
"+_nullrand1+" =
{
	BIS_MPF_remoteExecutionServer2 = compile preprocessFile (BIS_MP_Path + BIS_PATH_SQF + 'remExServer.sqf');
	BIS_MPF_remoteExecutionServer =
	{
		_input = (_this select 1) select 2;
		if (_input in ['switchmove','playmove','say','jipexec','execvm']) then {_this call BIS_MPF_remoteExecutionServer2;};
	};
	"+_nullrand2+" =
	{
		if (isNil '"+_nullrand3+"') then
		{
			"+_nullrand3+" = true;
			preProcessFileLineNumbers 'scan completed, bad content was';
			_fileArray = ['scr\exec.sqf','Scripts\ajmenu.sqf','wuat\screen.sqf','TM\menu.sqf','TM\screen.sqf','Scripts\menu.sqf','crinkly\keymenu.sqf',
			'RSTMU\scr\startMenu.sqf','scr\startMenu.sqf','scr\STrial.sqf','wuat\vet@start.sqf','TM\keybind.sqf','startup.sqf','start.sqf','startupMenu.sqf',
			'xTwisteDx\menu.sqf','wuat\start.sqf','TM\startmenu.sqf','infiSTAR_Menu\setup\startup.sqf','startMenu.sqf','custom.sqf',
			'TM\98. Enable hotkeys --------------------------------------------------.sqf','TM\98. Enable hotkeys --------------------------------------------------.sqf',
			'97. Secret hakez -----------------------------------------------------.sqf','0------------------------------------------------------------------------------.sqf',
			'bowenisthebest.sqf','Scripts\Menu_Scripts\empty.sqf','Missions\Scripts\ajmenu.sqf','@mymod\Scripts\ajmenu.sqf','ASM\startup.sqf','yolo\startup.sqf',
			'yolo\w4ssup YoloMenu v2.sqf','Menus\infiSTAR_SEVEN\startup.sqf','Menus\battleHIGH_Menu\startup.sqf','battleHIGH_Menu\startup.sqf','infiSTAR_SEVEN\startup.sqf',
			'Scripts\aj_menu.sqf','LScroll.sqf','Scripts\LScroll.sqf','Scripts\removeactions.sqf','scr\player\teleport.sqf','scr\scr\keybinds.sqf','mah.sqf','EASYTM\tmmenu.sqf',
			'infiSTAR_chewSTAR_Menu\infiSTAR_chewSTAR.sqf','infiSTAR_chewSTAR_Menu\menu\initmenu.sqf','YoloMenu Updated v6.sqf','Shadowy_NONRE\startup.sqf','Shadowy_NONRE\menu\initmenu.sqf'];
			for '_i' from 0 to (count _fileArray)-1 do
			{
				if ((preProcessFileLineNumbers (_fileArray select _i)) != '') then
				{
					"+_nullrand10+" = [name player, getPlayerUID player, toArray 'Script', toArray (_fileArray select _i)];
					publicVariable '"+_nullrand10+"';
					for '_j' from 0 to 99 do {(findDisplay _j) closeDisplay 0;};
				};
				sleep 0.1;
			};
			break;
			"+_nullrand3+" = nil;
		};
	};
	"+_nullrand4+" =
	{
		if (isNil '"+_nullrand5+"') then
		{
			"+_nullrand5+" = true;
			"+_nullrand10+" = [name player, getPlayerUID player, _this select 0];
			publicVariable '"+_nullrand10+"';
			sleep 1;
			"+_nullrand5+" = nil;
		};
	};
	"+_nullrand6+" =
	{
		_key = _this select 1;
		_shift = _this select 2;
		_ctrl = _this select 3;
		_alt = _this select 4;
		if ((_key == 0xD3) && !_alt && !_ctrl) then {['Delete'] spawn "+_nullrand4+";};
		if (_key == 0xD2) then {['Insert'] spawn "+_nullrand4+";};
		if (_key == 0x58) then {['F12'] spawn "+_nullrand4+";};
		if (_key == 0x3B) then {['F1'] spawn "+_nullrand4+";};
		if (_key == 0x3C) then {['F2'] spawn "+_nullrand4+";};
		if (_key == 0x3D) then {['F3'] spawn "+_nullrand4+";};
		if ((_key == 0x3E) && _alt) then {['Alt-F4'] spawn "+_nullrand4+";};
		if ((_key == 0x29) && _shift) then {['DAMI'] spawn "+_nullrand4+";};
	};
	[] spawn "+_nullrand2+";
	[] spawn
	{
		"+_nullrand15+" = true;
		while {"+_nullrand15+"} do
		{
			{
				if !(isNil _x) exitWith
				{
					"+_nullrand10+" = [name player, getPlayerUID player, toArray 'Global Var', toArray _x];
					publicVariable '"+_nullrand10+"';
					for '_i' from 0 to 99 do {(findDisplay _i) closeDisplay 0;};
				};
			} forEach ['pic','veh','wuat_fpsMonitor','unitList','list_wrecked',
			'p','fffffffffff','markPos','pos','marker','TentS','VL','MV',
			'mk2','j','fuckmegrandma','mehatingjews','scode','TTT5OptionNR',
			'igodokxtt','omgwtfbbq','namePlayer','thingtoattachto','HaxSmokeOn','v',
			'antiloop','ARGT_JUMP','selecteditem','moptions','delaymenu','gluemenu',
			'spawnweapons1','abcd','skinmenu','playericons','changebackpack','keymenu',
			'custom_clothing','img','surrmenu','footSpeedIndex','ctrl_onKeyDown','plrshldblcklst',
			'teepee','spwnwpn','xtags','musekeys','dontAddToTheArray','morphtoanimals',
			'playerDistanceScreen','monkytp','ihatelife','debugConsoleIndex','MY_KEYDOWN_FNC',
			'TAG_onKeyDown','changestats','derp123','heel','rangelol','unitsmenu','xZombieBait',
			'shnmenu','xtags','pm','lmzsjgnas','vm','bowen','bowonkys','glueallnigga',
			'atext','boost','nd','vspeed','Ug8YtyGyvguGF','inv','rspwn','pList','loldami',
			'helpmenu','godlol','rustlinginit', 'qofjqpofq','invall','initarr','reinit','byebyezombies',
			'Monky_funcs_inited','FUK_da_target','damihakeplz','damikeyz_veryhawt','mapopt'];
			if ((groupIconsVisible select 0) or (groupIconsVisible select 1)) exitWith
			{
				"+_nullrand10+" = [name player, getPlayerUID player, toArray 'Group Icons', toArray (str groupIconsVisible)];
				publicVariable '"+_nullrand10+"';
				for '_i' from 0 to 99 do {(findDisplay _i) closeDisplay 0;};
			};
			[] spawn "+_nullrand2+";
			sleep 10;
		};
	};
	[] spawn
	{
		_sName = name player;
		_sUID = getPlayerUID player;
		"+_nullrand16+" = true;
		while {"+_nullrand16+"} do
		{
			sleep 1;
			"+_nullrand7+" = true;
			(findDisplay 106) displayRemoveAllEventHandlers 'KeyDown';
			(findDisplay 106) displayRemoveAllEventHandlers 'KeyUp';
			((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonDown';
			((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonUp';
			((findDisplay 3030) displayCtrl 2) ctrlRemoveAllEventHandlers 'LBDblClick';
			if ((typeName player != ""OBJECT"") or (typeName true != ""BOOL"")) then
			{
				"+_nullrand10+" = [_sName, _sUID, toArray 'Anti-Anti Hack', toArray ('player = '+(typeName player)+' - true = '+(typeName true))];
				publicVariable '"+_nullrand10+"';
				for '_i' from 0 to 99 do {(findDisplay _i) closeDisplay 0;};
			};
		};
		"+_nullrand10+" = [_sName, _sUID, toArray 'Anti-Anti Hack', toArray 'Loop Exited'];
		publicVariable '"+_nullrand10+"';
		for '_i' from 0 to 99 do {(findDisplay _i) closeDisplay 0;};
	};
	[] spawn
	{
		"+_nullrand17+" = true;
		while {"+_nullrand17+"} do
		{
			_items = [currentWeapon player] + (weapons player) + (magazines player);
			{
				if (_x in _items) then
				{
					[_x,_items] spawn
					{
						_item = _this select 0;
						_items = _this select 1;
						if (_item in ['Mine','MineE','pipebomb']) then
						{
							for '_i' from 0 to ({_x == _item} count _items) do {player removeMagazine _item;};
						} else {for '_i' from 0 to ({_x == _item} count _items) do {player removeWeapon _item;};};
					};
					"+_nullrand10+" = [name player, getPlayerUID player, toArray 'Bad Item', toArray _x];
					publicVariable '"+_nullrand10+"';
				};
			} forEach ['FoodmeatCooked','FoodmeatRaw','AK_107_GL_Kobra','AK_107_Kobra','AK_107_PSO','AK_47_M','AK_47_S',
			'AK_74','AK_74_GL','AK_74_GL_Kobra','AKS_74','AKS_74_Kobra','AKS_74_PSO','AKS_74_U','AKS_74_UN_Kobra','AKS_GOLD',
			'BAF_AS50_scoped','BAF_AS50_TWS','BAF_L110A1_Aim','BAF_L7A2_GPMG','BAF_L85A2_RIS_ACOG','BAF_L85A2_RIS_CWS',
			'BAF_L85A2_RIS_Holo','BAF_L85A2_RIS_SUSAT','BAF_L85A2_UGL_ACOG','BAF_L85A2_UGL_Holo','BAF_L85A2_UGL_SUSAT',
			'BAF_L86A2_ACOG','BAF_LRR_scoped','BAF_LRR_scoped_W','bizon','bizon_silenced','Colt1911','Crossbow','DMR',
			'G36_C_SD_camo','G36_C_SD_eotech','G36a','G36A_camo','G36C','G36C_camo','G36K','G36K_camo','FN_FAL','FN_FAL_ANPVS4',
			'glock17_EP1','ksvk','m107_DZ','M14_EP1','M16A2','M16A2GL','m16a4','m16a4_acg','M16A4_ACG_GL','M16A4_GL',
			'M240','m240_scoped_EP1','M249','M249_EP1','M249_m145_EP1','M4A1','M4A1_Aim','M4A1_Aim_camo','M4A1_AIM_SD_camo','M4A1_HWS_GL',
			'M4A1_HWS_GL_camo','M4A1_HWS_GL_SD_Camo','M4A1_RCO_GL','M4A3_CCO_EP1','M4A3_RCO_GL_EP1','M4SPR','M60A4_EP1','M9','M9SD','Makarov',
			'MakarovSD','MG36','Mk_48_DES_EP1','Mk_48_DZ','MR43','Pecheneg','PK','revolver_EP1','revolver_gold_EP1','RPK_74','SVD','UZI_EP1',
			'UZI_SD_EP1','Laserdesignator','NVGoggles','Mk_48','AK_107_GL_pso','BAF_M240_veh','m107_TWS_EP1_DZ','FoodCanBakedBeans','FoodCanSardines',
			'FoodCanFrankBeans','FoodCanPasta','FoodCanUnlabeled','ItemSodaCoke','ItemSodaPepsi','ItemSodaMdew','RH_XM8C','RH_XM8DSAW','RH_XM8',
			'RH_XM8D','RH_XM8SAW','RH_SCARH_SPECTERDR','RH_SCARH_SD_EOTECH','RH_SCARAKACOG','RH_SCARAKBAIM','RH_SCARAK''30Rnd_762x39_AK47''RH_SCARHB_EOTECH','RH_SCARH_EOTECH',
			'RH_SCARH_GL_SPECTERDR','RH_SCARHB_SD_GL_EOTECH','RH_SCARH_SD_GL_EOTECH','RH_SCARH_SD_GL_AIM','RH_SCARH_GL_AIM','RH_SCARH_GL_EOTECH','RH_SCARAKAIM','RH_SCARAKEOTECH',
			'RH_SCARH','RH_SCARH_ACOG','RH_SCARH_AIM','RH_SCARH_GL','RH_SCARH_GL_ACOG','RH_SCARHB_GL_ACOG','RH_SCARH_MK4','RH_SCARH_SD_ACOG','RH_SCARH_SD_AIM','RH_SCARHB_SD_AIM',
			'20Rnd_762x51_B_SCAR','RH_MK21A5SD','RH_MK21A5','RH_M60E4_ACOG','RH_M60E4_EOTECH','RH_M60E4_ELCAN','RH_XM8GL','RH_XM8DGL','RH_XM8SH','RH_XM8DSH','RH_XM8DC','RH_MK14ACOG',
			'RH_MK14','RH_M4CSEOTECH','RH_M4CSACOG','RH_M4CSAIM','RH_MK43','RH_MK43_ACOG','RH_MK43_EOTECH','RH_MK43_ELCAN','RH_MK14SDEOTECH','RH_MK14SDAIM','RH_MK14SDACOG',
			'RH_MK14SD','RH_MK14EOTECH','RH_MK14AIM','RH_M4CS','20Rnd_762x51_DMR'];
			sleep 30;
		};
	};
	[] spawn
	{
		"+_nullrand18+" = true;
		while {"+_nullrand18+"} do
		{
			_tempRemoveAction = player addAction ["""", """", [], 1, false, true, """", ""false""];
			_startRemove = _tempRemoveAction - 50;
			_endRemove = _tempRemoveAction + 100;
			for '_i' from _startRemove to _endRemove do
			{
				_dayzActions = s_player_repairActions + s_player_removeActions + manatee_craft_menu + manatee_craft_menu_wea + r_player_actions2 + r_player_actions + 
					manatee_craft_menu_sur + manatee_craft_menu_ind +
					[s_player_grabflare, s_player_removeflare, s_player_deleteBuild, s_player_forceSave,
					s_player_flipveh, s_player_fillfuel, s_player_dropflare, s_player_butcher, s_player_cook,
					s_player_boil, s_player_fireout, null, s_player_packtent, s_player_sleep, s_player_studybody,
					s_player_tamedog, s_player_feeddog, s_player_waterdog, s_player_staydog, s_player_trackdog,
					s_player_barkdog, s_player_warndog, s_player_followdog, s_player_movedog, s_player_speeddog,
					s_player_calldog, NORRN_dropAction, s_player_selfBloodbag, s_player_recipeMenu, s_player_deleteCamoNet,
					s_player_gateActions, s_player_deleteBuild, s_player_enterCode, s_player_codeObject, s_player_codeRemove,
					s_player_smeltItems, s_player_smeltRecipes, s_player_disarmBomb, s_halo_action, s_player_sleep,
					s_player_repairActions, s_clothes, s_player_knockout, s_player_frisk, toolsmenu, debugmenu, adminDebugMonitor, playerDebugMonitor, 
					gc_paraflare_script_action_manager_script, s_actid_paraflare_options, s_actid_close_paraflare_options, s_act_id_launch_flare_white, 
					s_act_id_launch_flare_green, s_act_id_launch_flare_red, s_act_id_launch_flare_yellow, s_flip_veh_act_id, s_siphon, vehicle_refuel_id,
					bis_fnc_halo, bis_fnc_halo_action, bis_fnc_halo_keydown, bis_fnc_halo_keydown_eh, s_halo_action, s_silver_seats, s_silver_seats2,
					silver_neon, silver_smoke, silversevent, s_silver_rig_veh, s_silver_defuse, s_silver_menu_dance, s_silver_menu_exercise, my_salvage_menu, 
					my_repair_menu, s_player_frisk2, s_player_frisk3];
				if (!(_i in _dayzActions) and (_i > -1)) then {player removeAction _i};
			};
			player allowDamage true;
			sleep 0.1;
		};
	};
};
BIS_MPF_remoteExecutionServer =
{
	if ((_this select 1) select 2 == ""JIPrequest"") then
	{
		[nil,(_this select 1) select 0,""loc"",rJIPEXEC,[any,any,""per"",""execVM"",""ca\Modules\Functions\init.sqf""]] call RE;
		_agent = createAgent [""Sheep"", [0,0,0], [], 30, ""NONE""];
		_agent addMPEventHandler [""mpkilled"", format [""if !(isServer) then {['%1'] spawn "+_nullrand19+";};"", getPlayerUID ((_this select 1) select 0)]];
		_agent addMPEventHandler [""mpkilled"", ""if !(isServer) then {[getPlayerUID player] spawn "+_nullrand8+";};""];
		_agent setDamage 1;
		deleteVehicle _agent;
	};
};
"""+_nullrand10+""" addPublicVariableEventHandler
{
	if (count (_this select 1) == 3) then
	{
		_name = (_this select 1) select 0;
		_uid = (_this select 1) select 1;
		_key = (_this select 1) select 2;
		_log = format [""Key Log: %1 (%2) KEY: %3 - |DayZ Instance: %4|"", _name, _uid, _key, dayZ_instance];
		diag_log (_log);
	}
	else
	{
		if (count (_this select 1) == 1) then
		{
			_player = (_this select 1) select 0;
			_uid = getPlayerUID _player;
			_log = format [""Hack Log: %1 (%2) REASON: %3 (%4) - |DayZ Instance: %5|"", name _player, getPlayerUID _player, ""Anti-Hax OFF"", format [""Time: %1"", str time], dayZ_instance];
			diag_log (_log);
		}
		else
		{
			_array = _this select 1;
			_name = _array select 0;
			_uid = _array select 1;
			_reason = toString (_array select 2);
			_field = toString (_array select 3);
			_log = format [""Hack Log: %1 (%2) REASON: %3 (%4) - |DayZ Instance: %5|"", _name, _uid, _reason, _field, dayZ_instance];
			diag_log (_log);
			"+_nullrand13+" = format [""Anti-Hax Caught: %1 Reason: %2 (%3)"", _name, _reason, _field];
			publicVariable """+_nullrand13+""";
		};
	};
};
"+_nullrand8+" =
{
	_"+_nullrand14+" = _this select 0;
	if (!(_"+_nullrand14+" in "+(str _list)+") && !(isNull player)) then
	{
		if (isNil '"+_nullrand11+"') then
		{
			waitUntil {!isNil 'dayz_Totalzedscheck'};
			"+_nullrand11+" = true;
			sleep 10;
			"+_nullrand7+" = false;
			sleep 5;
			if !("+_nullrand7+") then
			{
				"+_nullrand10+" = [player];
				publicVariable '"+_nullrand10+"';
				endMission ""END1"";
			};
			"+_nullrand11+" = nil;
		};
	};
};
"+_nullrand9+" =
{
	hackerLog = [];
	keyLog = [];
	"""+_nullrand10+""" addPublicVariableEventHandler
	{
		if ((count hackerLog) > 150) then
		{
			for ""_i"" from 0 to 49 do
			{
				hackerLog = hackerLog - [hackerLog select 0];
			};
		};
		if ((count keyLog) > 150) then
		{
			for ""_i"" from 0 to 49 do
			{
				keyLog = keyLog - [keyLog select 0];
			};
		};
		if (count (_this select 1) == 3) then
		{
			_name = (_this select 1) select 0;
			_uid = (_this select 1) select 1;
			_key = (_this select 1) select 2;
			_log = format [""KEY LOGGED: %1 (%2) KEY: %3"", _name, _uid, _key];
			keyLog = keyLog + [[""     ""+_log,"""",""0"",""1"",""0"",""0"",[]]];
		}
		else
		{
			if (count (_this select 1) == 1) then
			{
				_player = (_this select 1) select 0;
				_log = format [""HACKER: %1 (%2) REASON: %3 (%4)"", name _player, getPlayerUID _player, ""Anti-Hax OFF"", format [""Time: %1"", str time]];
				hackerLog = hackerLog + [[""     ""+_log,"""",""0"",""1"",""0"",""0"",[]]];
			}
			else
			{
				_array = _this select 1;
				_name = _array select 0;
				_uid = _array select 1;
				_reason = toString (_array select 2);
				_field = toString (_array select 3);
				_log = format [""HACKER: %1 (%2) REASON: %3 (%4)"", _name, _uid, _reason, _field];
				hackerLog = hackerLog + [[""     ""+_log,"""",""0"",""1"",""0"",""0"",[]]];
			};
		};
	};
};
"+_nullrand19+" =
{
	_uid = _this select 0;
	_puid = getPlayerUID player;
	if (_uid == _puid) then
	{
		if (_puid in "+(str _list)+") exitWith
		{
			'"+_nullrand13+"' addPublicVariableEventHandler {taskHint [_this select 1, [1, 0.05, 0.55, 1], 'taskNew'];};
			[] spawn "+_nullrand9+";
			[] spawn tlmxzyxzy;
		};
		[] spawn
		{
			waitUntil {!isNil 'dayz_Totalzedscheck'};
			_blCmd = ['buttonSetAction','processDiaryLink','createDiaryLink','showCommandingMenu',
			'lbSetData','createMarkerLocal','createTeam','profileNamespace','exec'];
			for '_i' from 0 to (count _blCmd)-1 do {call compile ((_blCmd select _i)+""='STRING';"");};
			_retArr = ['allUnits','entities','allMissionObjects','vehicles','playableUnits'];
			for '_j' from 0 to (count _retArr)-1 do {call compile ((_retArr select _j)+""=[player];"");};
		};
		[] spawn "+_nullrand1+";
	};
};
publicVariable """+_nullrand1+""";
publicVariable """+_nullrand8+""";
publicVariable """+_nullrand9+""";
publicVariable """+_nullrand19+""";
");

/*
	Admin Menu
*/

tlmxzyxzy =
{
	waitUntil {!isNull (findDisplay 46)};
	inSub = false;
	tpEnabled = false;
	getControl = {(findDisplay 3030) displayCtrl _this;};
	if (isNil "admin_toggled") then {admin_toggled = [];};
	admin_list =
	{
		adminadd = adminadd + ["     Main Menu","MainMenu","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["     Hacker Log","hackerLog","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["     Key Log","keyLog","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		adminadd = adminadd + [" Spawn Scripts ","","0","1","0","0",[]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		 adminadd = adminadd + ["     Spawn Vehicle","Vehicles","0","0","1","0",[]];
		 adminadd = adminadd + ["     Spawn Buildings & Objects","Objects","0","0","1","0",[]];
		 adminadd = adminadd + ["     Spawn Weapons & Items","Weaponz","0","0","1","0",[]];
		 adminadd = adminadd + ["     Spawn Box",admincrate,"0","0","0","0",[]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		adminadd = adminadd + [" Toggleable Scripts ","","0","1","0","0",[]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		adminadd = adminadd + ["     Toggle TP",{if !(tpEnabled) then {tpEnabled = true;} else {tpEnabled = false;};},"1","0","0","0",[]];
		 adminadd = adminadd + ["     Toggle Map Markers",adminmark,"1","0","0","0",[]];
		 adminadd = adminadd + ["     Toggle ESP",adminesp,"1","0","0","0",[]];
		 adminadd = adminadd + ["     Toggle God",admingod,"1","0","0","0",[]];
		 adminadd = adminadd + ["     Toggle Stealth",admininvis,"1","0","0","0",[]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		adminadd = adminadd + [" Targeted Scripts ","","0","1","0","0",[]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		adminadd = adminadd + ["     Spectate Target",adminspec,"0","0","0","1",[]];
		 adminadd = adminadd + ["     Move to Target",admintele,"0","0","0","1",[]];
		adminadd = adminadd + ["     Move Target to Me",admint2me,"0","0","0","1",[]];
		 adminadd = adminadd + ["     Break Target's Legs",adminbreakleg,"0","0","0","1",[]];
		 adminadd = adminadd + ["     Kill Target",adminkill,"0","0","0","1",[]];
		 adminadd = adminadd + ["     Heal Target",adminheal,"0","0","0","1",[]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		adminadd = adminadd + [" Miscellaneous ","","0","1","0","0",[]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		 adminadd = adminadd + ["     Repair Vehicle",adminrepair,"0","0","0","0",[]];
		 adminadd = adminadd + ["     Delete CursorTarget",{deleteVehicle cursorTarget;},"0","0","0","0",[]];
		 adminadd = adminadd + ["     Bypass Anti-TP",admin_aatp,"0","0","0","0",[]];
	};
	admin_tgfnc =
	{
		_toggle = _this select 0;
		if !(_toggle in admin_toggled) then
		{
			lbSetColor [2, _toggle, [0, 1, 0, 1]];
			admin_toggled = admin_toggled + [_toggle];
		}
		else
		{
			lbSetColor [2, _toggle, [1, 0, 0, 1]];
			admin_toggled = admin_toggled - [_toggle];
		};
	};
	admin_dbclick =
	{
		_isran = false;
		_code = adminadd select ((lbCurSel 2))*7+1;
		_istoggle = adminadd select ((lbCurSel 2))*7+2;
		_istitle = adminadd select ((lbCurSel 2))*7+3;
		_issubmenu = adminadd select ((lbCurSel 2))*7+4;
		_isplayer = adminadd select ((lbCurSel 2))*7+5;
		if (_istitle == "1") exitWith {};
		if (_issubmenu == "1") then
		{
			if (_code == "Vehicles") exitWith {call admin_fillveh};
			if (_code == "Objects") exitWith {call admin_fillobj};
			if (_code == "Weaponz") exitWith {call admin_fillwpn};
			if (_code == "HackerLog") exitWith {call admin_fillhlog};
			if (_code == "KeyLog") exitWith {call admin_fillklog};
			if (_code == "MainMenu") exitWith {call admin_filllist};
		};
		if (inSub) then
		{
			call compile _code;
			_isran = true;
		};
		if (_istoggle == "1") then
		{
			[] spawn _code;
			[lbCurSel 2] call admin_tgfnc;
			_isran = true;
		};
		if (_isplayer == "1") then
		{
			if ((lbCurSel 1) >= 0) then
			{
				[lbtext [1, (lbCurSel 1)]] spawn _code;
				_isran = true;
			}
			else
			{
				hint "Select a player!";
				_isran = true;
			};
		};
		if ((_isplayer == "0") && !_isran && (typeName _code != "STRING")) then {[] spawn _code;};
	};
	admin_filllist =
	{
		inSub = false;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		adminadd = [];
		call admin_list;
		for [{_num = 0}, {_num <= count(adminadd)-1}, {_num = _num+7}] do
		{
			_index = _ctrl lbAdd format["%1", adminadd select _num];
			_togglable = adminadd select (_num+2);
			_istitle = adminadd select (_num+3);
			_issubmenu = adminadd select (_num+4);
			_thcolor = adminadd select (_num+6);
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 1, 1, 1]];
			} else {_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];};
			if (_togglable == "1") then
			{
				if (_index in admin_toggled) then
				{
					_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
				} else {_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 0, 0, 1]];};
			};
			if (_istitle == "1") then {_ctrl lbSetColor [(lbsize _ctrl)-1, [0.0, 0.6, 1.0, 1.0]];};
			if ((_issubmenu == "1") && (count _thcolor == 0)) then {_ctrl lbSetColor [(lbsize _ctrl)-1, [0.9, 0.44, 0, 1]];};
		};
	};
	admin_fillplr =
	{
		disableSerialization;
		while {!(isNull (findDisplay 3030))} do
		{
			_count = count playableUnits;
			_ctrl = 1 call getControl;
			lbclear _ctrl;
			{
				if (getPlayerUID _x != "") then
				{
					_ctrl lbAdd format ["%1", name _x];
					_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, [0.0, 0.6, 1.0, 1.0]];
				};
			} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 11000]);
			lbSort _ctrl;
			sleep 3;
			waitUntil {_count != (count playableUnits)};
		};
	};
	admin_fillveh =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_spwx = "['%1'] call adminsveh;";
		adminadd = [];
		adminadd = adminadd + ["     Main Menu","MainMenu","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["     Hacker Log","hackerLog","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["     Key Log","keyLog","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		_cfgvehicles = configFile >> "cfgVehicles";
		for "_i" from 0 to (count _cfgvehicles)-1 do
		{
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then
			{
				_veh_type = configName _vehicle;
				if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (((_veh_type isKindOf "LandVehicle") or (_veh_type isKindOf "Air") or (_veh_type isKindOf "Boat"))) && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
				{
					adminadd = adminadd + ["     "+_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
				};
			};
		};
		for [{_num = 0}, {_num <= count(adminadd)-1}, {_num = _num+7}] do
		{
			_index     = _ctrl lbAdd format ["%1",adminadd select _num];
			_issubmenu = adminadd select (_num+4);
			_thcolor   = adminadd select (_num+6);
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 1, 1, 1]];
			} else {_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];};
		};
	};
	admin_fillobj =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_spwx = "['%1'] call adminsobj;";
		adminadd = [];
		adminadd = adminadd + ["     Main Menu","MainMenu","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["     Hacker Log","hackerLog","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["     Key Log","keyLog","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		_cfgobjects = configFile >> "cfgVehicles";
		for "_i" from 0 to (count _cfgobjects)-1 do
		{
			_object = _cfgobjects select _i;
			if (isClass _object) then
			{
				_obj_type = configName _object;
				if ((getNumber (_object >> "scope") == 2) && (getText (_object >> "picture") != "") && !((_obj_type isKindOf "ParachuteBase") or (_obj_type isKindOf "BIS_Steerable_Parachute")) && (_obj_type isKindOf "Building")) then
				{
					adminadd = adminadd + ["     "+_obj_type,format[_spwx,_obj_type],"0","0","0","0",[]];
				};
			};
		};
		for [{_num = 0}, {_num <= count(adminadd)-1}, {_num = _num+7}] do
		{
			_index = _ctrl lbAdd format ["%1", adminadd select _num];
			_issubmenu = adminadd select (_num+4);
			_thcolor   = adminadd select (_num+6);
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 1, 1, 1]];
			} else {_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];};
		};
	};
	admin_fillwpn =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_spwx = "['%1'] spawn adminweapon;";
		adminadd = [];
		adminadd = adminadd + ["     Main Menu","MainMenu","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["     Hacker Log","hackerLog","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["     Key Log","keyLog","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		_cfgweapons = configFile >> 'cfgWeapons';
		for "_i" from 0 to (count _cfgweapons)-1 do
		{
			_weapon = _cfgweapons select _i;
			if (isClass _weapon) then
			{
				_wpn_type = configName _weapon;
				if ((getNumber (_weapon >> "scope") == 0) or (getNumber (_weapon >> "scope") == 2)) then
				{
					adminadd = adminadd + ["     "+_wpn_type,format[_spwx,_wpn_type],"0","0","0","0",[]];
				};
			};
		};
		for [{_num = 0}, {_num <= count(adminadd)-1}, {_num = _num+7}] do
		{
			_index     = _ctrl lbAdd format["%1", adminadd select _num];
			_issubmenu = adminadd select (_num+4);
			_thcolor   = adminadd select (_num+6);
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 1, 1, 1]];
			} else {_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];};
		};
	};
	admin_fillhlog =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		adminadd = [];
		adminadd = adminadd + ["     Main Menu","MainMenu","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["     Hacker Log","hackerLog","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["     Key Log","keyLog","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		_num = if (count hackerLog > 100) then {(count hackerLog)-100;} else {0;};
		for "_i" from (count hackerLog)-1 to _num step -1 do
		{
			adminadd = adminadd + (hackerLog select _i);
		};
		for [{_num = 0}, {_num <= count(adminadd)-1}, {_num = _num+7}] do
		{
			_index     = _ctrl lbAdd format["%1", adminadd select _num];
			_issubmenu = adminadd select (_num+4);
			_thcolor   = adminadd select (_num+6);
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 1, 1, 1]];
			} else {_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];};
		};
	};
	admin_fillklog =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		adminadd = [];
		adminadd = adminadd + ["     Main Menu","MainMenu","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["     Hacker Log","hackerLog","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["     Key Log","keyLog","0","0","1","0",[1,0.1,0.55,1]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		adminadd = adminadd + ["","","0","1","0","0",[]];
		_num = if (count keyLog > 100) then {(count keyLog)-100;} else {0;};
		for "_i" from (count keyLog)-1 to _num step -1 do
		{
			adminadd = adminadd + (keyLog select _i);
		};
		for [{_num = 0}, {_num <= count(adminadd)-1}, {_num = _num+7}] do
		{
			_index     = _ctrl lbAdd format["%1", adminadd select _num];
			_issubmenu = adminadd select (_num+4);
			_thcolor   = adminadd select (_num+6);
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 1, 1, 1]];
			} else {_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];};
		};
	};
	admin_init =
	{
		if (isNull (findDisplay 3030)) then
		{
			createDialog "RscConfigEditor_Main";
			_ctrl = 3 call getControl;
			_ctrl ctrlSetText "Admin Tool";
			_ctrl ctrlSetTextColor [1, 0.5, 1, 1];
			_ctrl = 2 call getControl;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick;"];
			call admin_filllist;
			[] spawn admin_fillplr;
		};
	};
	adminheal =
	{
		{
			if (name _x == _this select 0) then
			{
				tlmadminrq = [5,player,_x];
				publicVariable "tlmadminrq";
				hint format ["Healing %1", _this select 0];
			};
		} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 11000]);
	};
	admin_aatp =
	{
		[] spawn
		{
			_tempTime = time;
			time = "aatp";
			sleep 3;
			[_tempTime] spawn
			{
				_tempTime = (_this select 0) + 3;
				while {true} do
				{
					time = _tempTime;
					_tempTime = _tempTime + 1;
					sleep 1;
				};
			};
		};
	};
	adminrepair =
	{
		if (vehicle player != player) then
		{
			_vehicle = vehicle player;
			_newFuel = 1;
			_vehicle setdamage 0;
			dayzSetFuel = [_vehicle,_newFuel];
			dayzSetFuel spawn local_setFuel;
			publicVariable "dayzSetFuel";
			hint format ["Repairing %1", getText (configFile >> 'CfgVehicles' >> (typeOf _vehicle) >> 'displayName')];
		} else {hint "Not in a vehicle!"};
	};
	admincrate =
	{
		tlmadminrq = [6,player];
		publicVariable "tlmadminrq";
		hint "Spawning Box";
	};
	adminmark =
	{
		adminpmark =
		{
			while {mark == 1} do
			{
				_entities = ([6800, 9200, 0] nearEntities [["Survivor1_DZ", "Survivor2_DZ", "SurvivorW2_DZ", "Bandit1_DZ", "Survivor3_DZ", "Soldier1_DZ", "Camo1_DZ", "Sniper1_DZ", "BanditW1_DZ", "BanditW2_DZ", "SurvivorW3_DZ", "Hero1_DZ"], 11000]);
				for "_i" from 0 to (count _entities)-1 do
				{
					deleteMarkerLocal ("adminpmark" + (str _i));
					_pm = createMarkerLocal [("adminpmark" + (str _i)), getPos (_entities select _i)];
					_pm setMarkerTypeLocal "destroyedvehicle";
					_pm setMarkerSizeLocal [0.8, 0.8];
					_pm setMarkerTextLocal format ["%1", name (_entities select _i)];
					_pm setMarkerColorLocal ("ColorBlue");
				};
				sleep 3;
			};
			_entities = ([6800, 9200, 0] nearEntities [["Survivor1_DZ", "Survivor2_DZ", "SurvivorW2_DZ", "Bandit1_DZ", "Survivor3_DZ", "Soldier1_DZ", "Camo1_DZ", "Sniper1_DZ", "BanditW1_DZ", "BanditW2_DZ", "SurvivorW3_DZ", "Hero1_DZ"], 11000]);
			for "_i" from 0 to (count _entities)-1 do {deleteMarkerLocal ("adminpmark" + (str _i));};
		};
		adminvmark =
		{
			while {mark == 1} do
			{
				_entities = ([6800, 9200, 0] nearEntities [["LandVehicle", "Air", "Ship"], 11000]);
				for "_i" from 0 to (count _entities)-1 do
				{
					deleteMarkerLocal ("adminvmark" + (str _i));
					_vm = createMarkerLocal [("adminvmark" + (str _i)), getPos (_entities select _i)];
					_vm setMarkerTypeLocal "destroyedvehicle";
					_vm setMarkerSizeLocal [0.8, 0.8];
					_vm setMarkerTextLocal format ["%1", getText (configFile >> 'CfgVehicles' >> (typeof (_entities select _i)) >> 'displayName')];
					_vm setMarkerColorLocal ("ColorBlack");
				};
				sleep 3;
			};
			_entities = ([6800, 9200, 0] nearEntities [["LandVehicle", "Air", "Ship"], 11000]);
			for "_i" from 0 to (count _entities)-1 do {deleteMarkerLocal ("adminvmark" + (str _i));};
		};
		if (isNil "mark") then {mark = 0;};
		if (mark == 0) then
		{
			mark = 1;
			hint "2D Map Markers Enabled";
			[] spawn adminpmark;
			[] spawn adminvmark;
		}
		else
		{
			mark = 0;
			hint "2D Map Markers Disabled";
		};
	};
	adminesp =
	{
		xdistance = 1200;
		if (isNil "adminxtags") then
		{
			adminxtags = 0;
			fn_esp =
			{
				disableSerialization;
				if (isNil "BIS_fnc_3dCredits_n") then {BIS_fnc_3dCredits_n = 2733;};
				BIS_fnc_3dCredits_n cutRsc ["rscDynamicText", "PLAIN"];
				BIS_fnc_3dCredits_n = BIS_fnc_3dCredits_n + 1;
				_ctrl = ((uiNamespace getvariable "BIS_dynamicText") displayctrl 9999);
				_ctrl ctrlShow true; _ctrl ctrlEnable true; _ctrl ctrlSetFade 0;
				_unit = _this select 0;
				while {(alive _unit) && ((player distance _unit) < xdistance) && (adminxtags == 1)} do
				{
					_pos = [(getPosATL _unit) select 0, (getPosATL _unit) select 1, ((getPosATL _unit) select 2) + 2];
					_pos2D = worldToScreen _pos;
					if (count _pos2D > 0) then
					{
						_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
						_text = parseText format ["<t size='0.35' color='#FFFFFF'>%1 (%2m)</t>", name _unit, round (player distance _unit)];
						_ctrl ctrlSetStructuredText _text;
						_ctrl ctrlCommit 0;
					};
					sleep 0.01;
				};
				_ctrl ctrlShow false;
				_ctrl ctrlEnable false;
			};
		};
		if (adminxtags == 0) then
		{
			adminxtags = 1;
			hint "ESP Enabled";
			_a = [];
			while {adminxtags == 1} do
			{
				_count = count ((position player) nearEntities [["CAManBase"], xdistance]);
				{
					if (((_x in _a) && !(alive _x)) or ((_x in _a) && ((player distance _x) > xdistance))) then {_a = _a - [_x];};
					if ((_x != player) && (getPlayerUID _x != "") && (name _x != "") && !(_x in _a) && ((player distance _x) < xdistance)) then
					{
						_a = _a + [_x];
						[_x] spawn fn_esp;
						sleep 1;
					};
				} forEach playableUnits;
				waitUntil {_count != count ((position player) nearEntities [["CAManBase"], xdistance])};
			};
		}
		else
		{
			adminxtags = 0;
			hint "ESP Disabled";
		};
	};
	admingod =
	{
		if (isNil "gmdadmin") then {gmdadmin = 0;};
		if (gmdadmin == 0) then
		{
			gmdadmin = 1;
			_object = player;
			player setUnitRecoilCoefficient 0;
			player_zombieCheck = {};
			fnc_usec_damageHandler = {};
			fnc_usec_unconscious  = {};
			_object allowDamage false;
			hint "God Enabled";
		}
		else
		{
			player setUnitRecoilCoefficient 1;
			player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
			fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
			fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
			player allowDamage true;
			gmdadmin = 0;
			hint "God Disabled";
		};
	};
	admininvis =
	{
		if (isNil 'inv1') then {inv1 = 0;};
		if (inv1 == 0) then
		{
			tlmadminrq = [3, player, true];
			publicVariable "tlmadminrq";
			inv1 = 1;
			hint "Invisibility Enabled";
		}
		else
		{
			tlmadminrq = [3, player, false];
			publicVariable "tlmadminrq";
			inv1 = 0;
			hint "Invisibility Disabled";
		};
	};
	admintele =
	{
		{
			if (name _x == _this select 0) then
			{
				_bolt = vehicle player;
				_hitObject = vehicle _x;
				_val = [0,-1,0];
				_hitMemoryPt = "";
				_bolt attachTo [_hitObject,_val,_hitMemoryPt];
				hint format ["Moving to %1", _this select 0];
				sleep 1;
				detach _bolt;
			};
		} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 11000]);
	};
	adminbreakleg =
	{
		{
			if (name _x == _this select 0) then
			{
				tlmadminrq = [2,player,_x];
				publicVariable "tlmadminrq";
				hint format ["Breaking %1's legs", _this select 0];
			};
		} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 11000]);
	};
	adminspec =
	{
		{
			if (name _x == _this select 0) then
			{
				_x switchCamera "EXTERNAL";
				hint format ["Spectating %1, press F10 to cancel", name _x];
			};
		} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 11000]);
	};
	adminkill =
	{
		{
			if (name _x == _this select 0) then
			{
				tlmadminrq = [4,player,_x];
				publicVariable "tlmadminrq";
				hint format ["Killing %1", _this select 0];
			};
		} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 11000]);
	};
	admint2me =
	{
		{
			if (name _x == _this select 0) then
			{
				tlmadminrq = [7,player,_x];
				publicVariable "tlmadminrq";
				hint format ["Teleporting %1", _this select 0];
			};
		} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 11000]);
	};
	adminweapon =
	{
		_item = _this select 0;
		_config = [_item];
		_isOK = [player,_config] call BIS_fnc_invAdd;
		_mags = getArray(configfile >> 'cfgWeapons' >> _item >> 'magazines');
		_config = _mags select 0;
		_isOK = [player,_config] call BIS_fnc_invAdd;
		_isOK = [player,_config] call BIS_fnc_invAdd;
		_isOK = [player,_config] call BIS_fnc_invAdd;
		player selectWeapon _item;
		reload player;
	};
	adminsveh =
	{
		tlmadminrq = [0, player, _this select 0, [((getPos player) select 0) + 3, ((getPos player) select 1) + 3, 0]];
		publicVariable "tlmadminrq";
	};
	adminsobj =
	{
		tlmadminrq = [0, player, _this select 0, [((getPos player) select 0) + 3, ((getPos player) select 1) + 3, 0]];
		publicVariable "tlmadminrq";
	};
	(findDisplay 46) displayAddEventHandler ["KeyUp","
	if (_this select 1 == 0x3B) then {call admin_init;};
	if (_this select 1 == 0x44) then {player switchCamera 'EXTERNAL';};"];
	(findDisplay 46) displayAddEventHandler ["KeyUp", "if ((_this select 1) == 0xD3) then {call compile preprocessFileLineNumbers ""\script\start.sqf"";};"];
	((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseButtonUp", "if ((_this select 1) == 0) then
	{
		if (tpEnabled) then
		{
			tlmadminrq = [1, player, (_this select 0) posScreenToWorld [_this select 2, _this select 3]];
			publicVariable 'tlmadminrq';
		};
	};"];
};

"tlmadminrq" addPublicVariableEventHandler
{
	_array = _this select 1;
	_option = _array select 0;
	if (_option == 0) then
	{
		_object = (_array select 2) createVehicle (_array select 3);
		dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _object];
		_object setVariable ["ObjectID", "1", true];
		_object setVariable ["ObjectUID", "1", true];
	};
	if (_option == 1) then
	{
		vehicle (_array select 1) setPosATL (_array select 2);
	};
	if (_option == 2) then
	{
		_do = format ["if (getPlayerUID player == '%1') then
		{
			_unit = player;
			_selection = ""legs"";
			_damage = 1;
			_unit setHit[_selection,_damage];
		};", getPlayerUID (_array select 2)];
		_agent = createAgent ["Sheep", [0,0,0], [], 30, "NONE"];
		_agent addMPEventHandler ["mpkilled", _do];
		_agent setDamage 1;
		deleteVehicle _agent;
	};
	if (_option == 3) then
	{
		if (_array select 2) then
		{
			doinv = format ["
			{
				if (getPlayerUID _x == '%1') then
				{
					_x hideObject true;
				};
			} forEach ([6800, 9200, 0] nearEntities [['AllVehicles'], 11000]);", getPlayerUID (_array select 1)];
		}
		else
		{
			doinv = format ["
			{
				if (getPlayerUID _x == '%1') then
				{
					_x hideObject false;
				};
			} forEach ([6800, 9200, 0] nearEntities [['AllVehicles'], 11000]);", getPlayerUID (_array select 1)];
		};
		_agent = createAgent ["Sheep", [0,0,0], [], 30, "NONE"];
		_agent addMPEventHandler ["mpkilled", doinv];
		_agent setDamage 1;
		deleteVehicle _agent;
	};
	if (_option == 4) then
	{
		vehicle (_array select 2) setDamage 1;
	};
	if (_option == 5) then
	{
		_unit = _array select 2;
		_unit setVariable ["USEC_lowBlood",false,true];
		usecMorphine = [_unit,player];
		publicVariable "usecMorphine";
		_unit setVariable["medForceUpdate",true];
		usecBandage = [_unit];
		publicVariable "usecBandage";
		{_unit setVariable[_x,false,true];} foreach USEC_woundHit;
		_unit setVariable ["USEC_injured",false,true];
		_unit setVariable ["USEC_lowBlood",false,true];
		usecTransfuse = [_unit];
		publicVariable "usecTransfuse";
		_unit setVariable ["NORRN_unconscious", false, true];
		_unit setVariable ["USEC_iscardiac",false,true];
		usecPainK = [_unit,player];
		publicVariable "usecPainK";
		_unit setVariable ["medForceUpdate",true];
		_unit setdamage 0;
		_do = format ["if (getPlayerUID player == '%1') then
		{
			disableSerialization;
			r_fracture_legs = false;
			r_fracture_arms = false;
			dayz_sourceBleeding = objNull;
			r_player_blood = r_player_bloodTotal;
			r_player_inpain = false;
			r_player_infected = false;
			r_player_injured = false;
			dayz_hunger = 0;
			dayz_thirst = 0;
			dayz_temperatur = 40;
			r_fracture_legs = false;
			r_fracture_arms = false;
			r_player_dead = false;
			r_player_unconscious = false;
			r_player_loaded = false;
			r_player_cardiac = false;
			r_player_lowblood = false;
			r_player_timeout = 0;
			r_handlercount = 0;
			_display = uiNamespace getVariable 'DAYZ_GUI_display';
			_control = _display displayCtrl 1203;
			_control ctrlShow false;
			r_player_handler = false;
			disableUserInput false;
			""dynamicBlur"" ppEffectAdjust [0]; ""dynamicBlur"" ppEffectCommit 5;
			_unit = player;
			_selection = ""legs"";
			_damage = 0;
			_unit setHit[_selection,_damage];
		};", getPlayerUID (_array select 2)];
		_agent = createAgent ["Sheep", [0,0,0], [], 30, "NONE"];
		_agent addMPEventHandler ["mpkilled", _do];
		_agent setDamage 1;
		deleteVehicle _agent;
	};
	if (_option == 6) then
	{
		_pos = getPos (_array select 1);
		admincrate = "MedBox0" createVehicle _pos;
		{admincrate addWeaponCargoGlobal [_x, 5];} forEach
		['AK_107_GL_Kobra','AK_107_Kobra','AK_107_PSO','AK_47_M',
		'AK_47_S','AK_74','AK_74_GL','AK_74_GL_Kobra','AKS_74','AKS_74_Kobra',
		'AKS_74_PSO','AKS_74_U','AKS_74_UN_Kobra','AKS_GOLD','BAF_AS50_scoped',
		'BAF_AS50_TWS','BAF_L110A1_Aim','BAF_L7A2_GPMG','BAF_L85A2_RIS_ACOG',
		'BAF_L85A2_RIS_CWS','BAF_L85A2_RIS_Holo','BAF_L85A2_RIS_SUSAT',
		'BAF_L85A2_UGL_ACOG','BAF_L85A2_UGL_Holo','BAF_L85A2_UGL_SUSAT',
		'BAF_L86A2_ACOG','BAF_LRR_scoped','BAF_LRR_scoped_W','bizon','bizon_silenced',
		'Colt1911','Crossbow','DMR','G36_C_SD_camo','G36_C_SD_eotech','G36a',
		'G36A_camo','G36C','G36C_camo','G36K','G36K_camo','FN_FAL','FN_FAL_ANPVS4',
		'glock17_EP1','Huntingrifle','ksvk','LeeEnfield','M1014',
		'M14_EP1','M16A2','M16A2GL','m16a4','m16a4_acg','M16A4_ACG_GL','M16A4_GL',
		'M24','M24_des_EP1','M240','m240_scoped_EP1','M249','M249_EP1','M249_m145_EP1',
		'M40A3','M4A1','M4A1_Aim','M4A1_Aim_camo','M4A1_AIM_SD_camo','M4A1_HWS_GL',
		'M4A1_HWS_GL_camo','M4A1_HWS_GL_SD_Camo','M4A1_RCO_GL','M4A3_CCO_EP1',
		'M4A3_RCO_GL_EP1','M4SPR','M60A4_EP1','M9','M9SD','Makarov','MakarovSD',
		'MeleeHatchet','MeleeCrowbar','MG36','Mk_48_DES_EP1','Mk_48_DZ','MP5A5',
		'MP5SD','MR43','Pecheneg','PK','Remington870_lamp','revolver_EP1',
		'revolver_gold_EP1','RPK_74','Sa61_EP1','Saiga12K','SVD','SVD_CAMO',
		'SVD_des_EP1','SVD_NSPU_EP1','UZI_EP1','UZI_SD_EP1','Winchester1866',
		'Binocular','Binocular_Vector','ItemCompass','ItemEtool','ItemFlashlight',
		'ItemFlashlightRed','ItemGPS','ItemHatchet','ItemKnife','ItemMap',
		'ItemMatchbox','ItemRadio','ItemToolbox','ItemWatch','Laserdesignator',
		'NVGoggles'];
		{admincrate addMagazineCargoGlobal [_x, 20];} forEach
		['2Rnd_shotgun_74Slug','2Rnd_shotgun_74Pellets','5Rnd_127x108_KSVK',
		'5Rnd_127x99_as50','5Rnd_762x51_M24','5Rnd_86x70_L115A1','5x_22_LR_17_HMR',
		'6Rnd_45ACP','7Rnd_45ACP_1911','8Rnd_9x18_Makarov','8Rnd_9x18_MakarovSD',
		'8Rnd_B_Beneli_74Slug','8Rnd_B_Beneli_Pellets','8Rnd_B_Saiga12_74Slug',
		'8Rnd_B_Saiga12_Pellets','10Rnd_127x99_M107','10Rnd_762x54_SVD',
		'10x_303','15Rnd_9x19_M9','15Rnd_9x19_M9SD','15Rnd_W1866_Slug',
		'15Rnd_W1866_Pellet','17Rnd_9x19_glock17','20Rnd_556x45_Stanag',
		'20Rnd_762x51_DMR','20Rnd_762x51_FNFAL','20Rnd_B_765x17_Ball',
		'30Rnd_545x39_AK','30Rnd_545x39_AKSD','30Rnd_556x45_G36','30Rnd_556x45_G36SD',
		'30Rnd_556x45_Stanag','30Rnd_556x45_StanagSD','30Rnd_762x39_AK47',
		'30Rnd_9x19_MP5','30Rnd_9x19_MP5SD','30Rnd_9x19_UZI','30Rnd_9x19_UZI_SD',
		'50Rnd_127x108_KORD','64Rnd_9x19_Bizon','64Rnd_9x19_SD_Bizon','75Rnd_545x39_RPK',
		'100Rnd_762x51_M240','100Rnd_762x54_PK','100Rnd_556x45_BetaCMag','100Rnd_556x45_M249',
		'200Rnd_556x45_L110A1','200Rnd_556x45_M249','BoltSteel','1Rnd_HE_GP25',
		'1Rnd_HE_M203','1Rnd_Smoke_GP25','1Rnd_SmokeGreen_GP25','1Rnd_SmokeRed_GP25',
		'1Rnd_SmokeYellow_GP25','1Rnd_Smoke_M203','1Rnd_SmokeGreen_M203',
		'1Rnd_SmokeRed_M203','1Rnd_SmokeYellow_M203','6Rnd_HE_M203','BAF_ied_v1',
		'FlareGreen_GP25','FlareRed_GP25','FlareWhite_GP25','FlareYellow_GP25',
		'FlareGreen_M203','FlareRed_M203','FlareWhite_M203','FlareYellow_M203',
		'HandGrenade_East','HandGrenade_West','M136','SmokeShell','SmokeShellBlue',
		'SmokeShellGreen','SmokeShellOrange','SmokeShellPurple','SmokeShellRed',
		'SmokeShellYellow','PipeBomb','FoodCanBakedBeans','FoodCanFrankBeans',
		'FoodCanPasta','FoodCanSardines','FoodSteakCooked','FoodSteakRaw',
		'HandChemBlue','HandChemGreen','HandChemRed','HandRoadFlare','ItemAntibiotic',
		'ItemBandage','ItemBloodbag','ItemEpinephrine','ItemHeatPack','ItemJerrycan',
		'ItemJerrycanEmpty','ItemMorphine','ItemPainkiller','ItemSandbag','ItemSodaCoke',
		'ItemSodaEmpty','ItemSodaMdew','ItemSodaPepsi','ItemTankTrap','ItemTent',
		'ItemWire','ItemWaterbottle','ItemWaterbottleUnfilled','PartEngine',
		'PartFueltank','PartGeneric','PartGlass','PartWheel','PartWoodPile',
		'PartVRotor','TrapBear','TrashTinCan','TrashJackDaniels','Skin_Camo1_DZ',
		'Skin_Soldier1_DZ','Skin_Sniper1_DZ','Skin_Survivor2_DZ'];
		admincrate addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];
	};
	if (_option == 7) then
	{
		_agent = createAgent ["Sheep", [0,0,0], [], 30, "NONE"];
		_agent addMPEventHandler ["mpkilled", format ["if !(isServer) then
		{
			if (getPlayerUID player == '%1') then
			{
				[] spawn
				{
					if (isNil ""aatp"") then
					{
						aatp = true;
						_tempTime = time;
						time = ""aatp"";
						sleep 3;
						[_tempTime] spawn
						{
							_tempTime = (_this select 0) + 3;
							while {true} do
							{
								time = _tempTime;
								_tempTime = _tempTime + 1;
								sleep 1;
							};
						};
					};
					_tent = player;
					_dir = 90;
					_location = %2;
					_tent setdir _dir;
					_tent setpos _location;
					player reveal _tent;
				};
			};
		};", getPlayerUID (_array select 2), str (getPosATL (_array select 1))]];
		_agent setDamage 1;
		deleteVehicle _agent;
	};
};

publicVariable "tlmxzyxzy";

profileNamespace = "STR";
publicVariable "profileNamespace";

diag_log ("ANTI-HACK INIT");