private["_botActive","_int","_newModel","_doLoop","_wait","_hiveVer","_isHiveOk","_playerID","_playerObj","_randomSpot","_publishTo","_primary","_secondary","_key","_result","_charID","_playerObj","_playerName","_finished","_spawnPos","_spawnDir","_items","_counter","_magazines","_weapons","_group","_backpack","_worldspace","_direction","_newUnit","_score","_position","_isNew","_inventory","_backpack","_medical","_survival","_stats","_state"];
//Set Variables

diag_log ("STARTING LOGIN: " + str(_this));

_playerID = _this select 0;
_playerObj = _this select 1;
_playerName = name _playerObj;
_worldspace = [];

if (_playerName == '__SERVER__' || _playerID == '' || local player) exitWith {};

if (count _this > 2) then {
	dayz_players = dayz_players - [_this select 2];
};

//Variables
_inventory =	[];
_backpack = 	[];
_items = 		[];
_magazines = 	[];
_weapons = 		[];
_medicalStats =	[];
_survival =		[0,0,0];
_tent =			[];
_state = 		[];
_direction =	0;
_model =		"";
_newUnit =		objNull;
_botActive = false;

if (_playerID == "") then {
	_playerID = getPlayerUID _playerObj;
};

if ((_playerID == "") or (isNil "_playerID")) exitWith {
	//diag_log ("LOGIN FAILED: Player [" + _playerName + "] has no login ID");
};

if (_playerID in botPlayers) then {
	botPlayers = botPlayers - [_playerID];
};

//??? endLoadingScreen;
diag_log ("LOGIN ATTEMPT: " + str(_playerID) + " " + _playerName);

//Do Connection Attempt
_doLoop = 0;
while {_doLoop < 5} do {
	_key = format["CHILD:101:%1:%2:%3:",_playerID,dayZ_instance,_playerName];
	_primary = _key call server_hiveReadWrite;
	if (count _primary > 0) then {
		if ((_primary select 0) != "ERROR") then {
			_doLoop = 9;
		};
	};
	_doLoop = _doLoop + 1;
};

if (isNull _playerObj or !isPlayer _playerObj) exitWith {
	//diag_log ("LOGIN RESULT: Exiting, player object null: " + str(_playerObj));
};

if ((_primary select 0) == "ERROR") exitWith {	
    diag_log format ["LOGIN RESULT: Exiting, failed to load _primary: %1 for player: %2 ",_primary,_playerID];
};

//Process request
_newPlayer = 	_primary select 1;
_isNew = 		count _primary < 6; //_result select 1;
_charID = 		_primary select 2;
_randomSpot = false;

//diag_log ("LOGIN RESULT: " + str(_primary));

/* PROCESS */
_hiveVer = 0;

_defaultSkins = ["Survivor2_DZ","CIV_Pilot1_DZC","Cameraman_DZC","Clan_nobackpack_INS2_DZC","Clan_nobackpack_INS1_DZC","Clan_nobackpack_suit_DZC","Euroman02_DZC","Euroman01_DZC"];

if (!_isNew) then {
	//RETURNING CHARACTER		
	_inventory = 	_primary select 4;
	_backpack = 	_primary select 5;
	_survival =		_primary select 6;
	_model =		_primary select 7;
	_hiveVer =		_primary select 8;
	
	if (!(_model in ["Camo1_DZC", "Camo2_DZC", "Camo3_DZC", "Cameraman_DZC", "Hazmat_Black_DZC", "HazmatVest_Black_DZC", "Hazmat_Red_DZC", "HazmatVest_Red_DZC", "Hazmat_Yellow_DZC", "HazmatVest_Yellow_DZC", "Hazmat_Olive_DZC", "HazmatVest_Olive_DZC", "Asano_DZC", "BAF_Heavy1_DZC", "BAF_Heavy2_DZC", "BAF_Heavy3_DZC", "BAF_Officer1_DZC", "BAF_Officer2_DZC", "BAF_Officer3_DZC", "BAF_Pilot1_DZC", "BAF_Pilot2_DZC", "BAF_Pilot3_DZC", "BAF_Soldier_DDPM", "BAF_Soldier_L_DDPM", "BAF_Soldier_L_MTP", "BAF_Soldier_L_W", "BAF_Soldier_MTP", "BAF_Soldier_Officer_DDPM", "BAF_Soldier_Officer_MTP", "BAF_Soldier_Officer_W", "BAF_Soldier_W", "bandit_female", "bandit_male", "BanditW1_DZ", "Cameraman_DZC", "camo_clothes", "CDF_Commander", "CDF_Soldier", "CDF_Soldier_AR", "CDF_Soldier_Light", "CDF_Soldier_Medic", "CDF_Soldier_Militia", "CIV_Pilot1_DZC", "Civ_Soldier_DZC", "Clan_Delta1", "Clan_Delta2", "Clan_Delta3_DZC", "Clan_GER_DZC", "Clan_GER_Hvy_DZC", "Clan_nobackpack_INS1_DZC", "Clan_nobackpack_INS2_DZC", "Clan_nobackpack_INS3_DZC", "Clan_nobackpack_suit_DZC", "Clan_Officer1_DZC", "Clan_Officer2_DZC", "Clan_Officer3_DZC", "Clan_Terror_DZC", "Clan_Terror2_DZC", "Clan_UN_Cap_DZC", "Clan_UN_Helmet_DZC", "Cock", "Cow01_EP1", "Cow02", "Cow03", "CZ_Heavy1_DZC", "CZ_Heavy2_DZC", "CZ_Heavy3_DZC", "CZ_Officer1_DZC", "CZ_Officer2_DZC", "CZ_Officer3_DZC", "CZ_Pilot1_DZC", "CZ_Pilot2_DZC", "CZ_Pilot3_DZC", "CZ_Soldier_DES_EP1", "CZ_Soldier_Light_DES_EP1", "CZ_Soldier_medik_DES_EP1", "CZ_Soldier_Office_DES_EP1", "czech_soldier", "desert_clothes", "desert_green_soldier", "desert_rocket", "desert_soldier", "Doctor_DZC", "Euroman01_DZC", "Euroman02_DZC", "fake", "Fin", "FR_Corpsman", "FRG_Doctor", "FRG_SchoolTeacher", "FRG_Worker1", "FRG_Worker2", "FRG_Worker3", "FRG_Worker4", "GDR_Doctor", "GDR_SchoolTeacher", "GER_Officer1_DZC", "GER_Soldier_Medic_EP1", "ghille", "Goat", "Goat01_EP1", "Goat02_EP2", "GUE_Soldier_Medic", "Herrera", "Herrera_Light", "Ins_Bardak", "Ins_Commander", "Ins_Lopotev", "Ins_Soldier_1", "Ins_Soldier_Medic", "INS_Soldier_Pilot", "Ins_Villager3", "Ins_Villager4", "Ins_Woodlander1", "Ins_Woodlander2", "Ins_Woodlander3", "Ins_Worker2", "KPFS_Functionary_CDU", "KPFS_Functionary_FDP", "KPFS_Functionary_SED", "KPFS_Functionary_SPD", "KPFS_Sportswoman_FRG", "KPFS_Sportswoman_GDR", "Pastor", "Private_Sec1_DZC", "Private_Sec2_DZC", "Private_Sec3_DZC", "Rabbit", "rocket", "RU_Commander", "RU_Soldier_Light", "RU_Soldier_Medic", "SBE_CZ_Soldier_B_DES_EP1", "SBE_CZ_Soldier_B_WLD_EP1", "SBE_CZ_Soldier_DES_EP1", "SBE_CZ_Soldier_Light_DES_EP1", "SBE_CZ_Soldier_Light_WLD_EP1", "SBE_CZ_Soldier_Office_DES_EP1", "SBE_CZ_Soldier_Office_WLD_EP1", "SBE_CZ_Soldier_WLD_EP1", "Sheep01_EP1", "Sniper1_DZC", "Sniper2_DZC", "Sniper3_DZC", "Snow_Trooper1_DZC", "Snow_Trooper2_DZC", "soldier", "Soldier1_AT_DZC", "Soldier1_GL_DZC", "Soldier1_SF_DZC", "Soldier1_SL_DZC", "Soldier1_STD_DZC", "Soldier2_AT_DZC", "Soldier2_GL_DZC", "Soldier2_SF_DZC", "Soldier2_SL_DZC", "Soldier2_STD_DZC", "Soldier3_AT_DZC", "Soldier3_DZC", "Soldier3_GL_DZC", "Soldier3_SF_DZC", "Soldier3_SL_DZC", "Soldier3_STD_DZC", "Storm_Trooper1_DZC", "Storm_Trooper2_DZC", "Storm_Trooper3_DZC", "Storm_Trooper4_DZC", "survivor_female", "survivor_male", "Survivor3_DZ", "SurvivorW2_DZ", "TK_CIV_Takistani01_EP1", "TK_CIV_Takistani05_EP1", "TK_INS_Soldier_EP1", "TK_Soldier_Medic_EP1", "US_Heavy1_DZC", "US_Heavy2_DZC", "us_soldier", "US_Soldier_EP1", "US_Soldier_Light_EP1", "US_Soldier_Medic_EP1", "US_Soldier_Officer_EP1", "USMC_Soldier_Crew", "USMC_Soldier_Crew_EP1", "USMC_Soldier_Light", "USMC_Soldier_Medic", "USMC_Soldier_Officer", "Villager1", "WildBoar", "z_doctor", "z_policeman", "z_priest", "z_soldier", "z_soldier_heavy", "z_soldier_pilot", "z_suit2", "z_teacher", "z_villager3", "zZombie_Base" ])) then {
	// repeats for greater randomness and ratio setup
	_ranSkins =  ["CIV_Pilot1_DZC","Cameraman_DZC","Clan_nobackpack_INS2_DZC","Clan_nobackpack_suit_DZC","Euroman02_DZC","Euroman01_DZC",
				"Clan_nobackpack_INS2_DZC","Clan_nobackpack_suit_DZC","Euroman02_DZC","Euroman01_DZC","Clan_nobackpack_INS2_DZC","Cameraman_DZC",
				"Euroman01_DZC"];
	
	_ranIndex = (count _ranSkins)-1;
	_ranIndex = floor(random _ranIndex);
	_model = _ranSkins select _ranIndex;
	};
	
	// CLAN SKINS
	if (_playerID == "111736326" and _model in _defaultSkins) then {
		_model = "Clan_nobackpack_INS3_DZC"; // Allen [Admin]
	};
	
	// GOB Clan
	if (_playerID == "19378502" and _model in _defaultSkins) then { // [GOB] Randodom
		_model = "CZ_Heavy3_DZC";
	};
	if (_playerID == "17020614" and _model in _defaultSkins) then { // [GOB] SlingShoT
		_model = "CZ_Heavy3_DZC";
	};
	if (_playerID == "110856966" and _model in _defaultSkins) then { // [GOB] JAG
		_model = "CZ_Heavy3_DZC";
	};
	if (_playerID == "73442502" and _model in _defaultSkins) then { // [GOB] PickledMaggotBrainSause
		_model = "CZ_Heavy3_DZC";
	};
	if (_playerID == "71246278" and _model in _defaultSkins) then { // [GOB] t0mt0m
		_model = "CZ_Heavy3_DZC";
	};
	if (_playerID == "54768454" and _model in _defaultSkins) then { // [GOB] Lopather
		_model = "CZ_Heavy3_DZC";
	};
	if (_playerID == "58672134" and _model in _defaultSkins) then { // [GOB] Elfiero
		_model = "CZ_Heavy3_DZC";
	};
	if (_playerID == "60873286" and _model in _defaultSkins) then { // [GOB] Iapetus
		_model = "CZ_Heavy3_DZC";
	};
	
	// Nipple Clan
	if (_playerID == "146114AX" and _model in _defaultSkins) then { // Handsome Nipple
		_model = "Clan_Delta2";
	};
	if (_playerID == "105383942" and _model in _defaultSkins) then { // Selim
		_model = "Clan_Delta2";
	};
	if (_playerID == "20523590" and _model in _defaultSkins) then { // Bini
		_model = "Clan_Delta2";
	};
	if (_playerID == "56834AX" and _model in _defaultSkins) then { // Deadcraft
		_model = "Clan_Delta2";
	};
	if (_playerID == "68132934" and _model in _defaultSkins) then { // BleiEnteGenius
		_model = "Clan_Delta2";
	};
	if (_playerID == "73868166" and _model in _defaultSkins) then { // Mr.Oka
		_model = "Clan_Delta2";
	};
	
} else {
	_model =		_primary select 3;
	
	if (!(_model in ["Camo1_DZC", "Camo2_DZC", "Camo3_DZC", "Cameraman_DZC", "Hazmat_Black_DZC", "HazmatVest_Black_DZC", "Hazmat_Red_DZC", "HazmatVest_Red_DZC", "Hazmat_Yellow_DZC", "HazmatVest_Yellow_DZC", "Hazmat_Olive_DZC", "HazmatVest_Olive_DZC", "Asano_DZC", "BAF_Heavy1_DZC", "BAF_Heavy2_DZC", "BAF_Heavy3_DZC", "BAF_Officer1_DZC", "BAF_Officer2_DZC", "BAF_Officer3_DZC", "BAF_Pilot1_DZC", "BAF_Pilot2_DZC", "BAF_Pilot3_DZC", "BAF_Soldier_DDPM", "BAF_Soldier_L_DDPM", "BAF_Soldier_L_MTP", "BAF_Soldier_L_W", "BAF_Soldier_MTP", "BAF_Soldier_Officer_DDPM", "BAF_Soldier_Officer_MTP", "BAF_Soldier_Officer_W", "BAF_Soldier_W", "bandit_female", "bandit_male", "BanditW1_DZ", "Cameraman_DZC", "camo_clothes", "CDF_Commander", "CDF_Soldier", "CDF_Soldier_AR", "CDF_Soldier_Light", "CDF_Soldier_Medic", "CDF_Soldier_Militia", "CIV_Pilot1_DZC", "Civ_Soldier_DZC", "Clan_Delta1", "Clan_Delta2", "Clan_Delta3_DZC", "Clan_GER_DZC", "Clan_GER_Hvy_DZC", "Clan_nobackpack_INS1_DZC", "Clan_nobackpack_INS2_DZC", "Clan_nobackpack_INS3_DZC", "Clan_nobackpack_suit_DZC", "Clan_Officer1_DZC", "Clan_Officer2_DZC", "Clan_Officer3_DZC", "Clan_Terror_DZC", "Clan_Terror2_DZC", "Clan_UN_Cap_DZC", "Clan_UN_Helmet_DZC", "Cock", "Cow01_EP1", "Cow02", "Cow03", "CZ_Heavy1_DZC", "CZ_Heavy2_DZC", "CZ_Heavy3_DZC", "CZ_Officer1_DZC", "CZ_Officer2_DZC", "CZ_Officer3_DZC", "CZ_Pilot1_DZC", "CZ_Pilot2_DZC", "CZ_Pilot3_DZC", "CZ_Soldier_DES_EP1", "CZ_Soldier_Light_DES_EP1", "CZ_Soldier_medik_DES_EP1", "CZ_Soldier_Office_DES_EP1", "czech_soldier", "desert_clothes", "desert_green_soldier", "desert_rocket", "desert_soldier", "Doctor_DZC", "Euroman01_DZC", "Euroman02_DZC", "fake", "Fin", "FR_Corpsman", "FRG_Doctor", "FRG_SchoolTeacher", "FRG_Worker1", "FRG_Worker2", "FRG_Worker3", "FRG_Worker4", "GDR_Doctor", "GDR_SchoolTeacher", "GER_Officer1_DZC", "GER_Soldier_Medic_EP1", "ghille", "Goat", "Goat01_EP1", "Goat02_EP2", "GUE_Soldier_Medic", "Herrera", "Herrera_Light", "Ins_Bardak", "Ins_Commander", "Ins_Lopotev", "Ins_Soldier_1", "Ins_Soldier_Medic", "INS_Soldier_Pilot", "Ins_Villager3", "Ins_Villager4", "Ins_Woodlander1", "Ins_Woodlander2", "Ins_Woodlander3", "Ins_Worker2", "KPFS_Functionary_CDU", "KPFS_Functionary_FDP", "KPFS_Functionary_SED", "KPFS_Functionary_SPD", "KPFS_Sportswoman_FRG", "KPFS_Sportswoman_GDR", "Pastor", "Private_Sec1_DZC", "Private_Sec2_DZC", "Private_Sec3_DZC", "Rabbit", "rocket", "RU_Commander", "RU_Soldier_Light", "RU_Soldier_Medic", "SBE_CZ_Soldier_B_DES_EP1", "SBE_CZ_Soldier_B_WLD_EP1", "SBE_CZ_Soldier_DES_EP1", "SBE_CZ_Soldier_Light_DES_EP1", "SBE_CZ_Soldier_Light_WLD_EP1", "SBE_CZ_Soldier_Office_DES_EP1", "SBE_CZ_Soldier_Office_WLD_EP1", "SBE_CZ_Soldier_WLD_EP1", "Sheep01_EP1", "Sniper1_DZC", "Sniper2_DZC", "Sniper3_DZC", "Snow_Trooper1_DZC", "Snow_Trooper2_DZC", "soldier", "Soldier1_AT_DZC", "Soldier1_GL_DZC", "Soldier1_SF_DZC", "Soldier1_SL_DZC", "Soldier1_STD_DZC", "Soldier2_AT_DZC", "Soldier2_GL_DZC", "Soldier2_SF_DZC", "Soldier2_SL_DZC", "Soldier2_STD_DZC", "Soldier3_AT_DZC", "Soldier3_DZC", "Soldier3_GL_DZC", "Soldier3_SF_DZC", "Soldier3_SL_DZC", "Soldier3_STD_DZC", "Storm_Trooper1_DZC", "Storm_Trooper2_DZC", "Storm_Trooper3_DZC", "Storm_Trooper4_DZC", "survivor_female", "survivor_male", "Survivor3_DZ", "SurvivorW2_DZ", "TK_CIV_Takistani01_EP1", "TK_CIV_Takistani05_EP1", "TK_INS_Soldier_EP1", "TK_Soldier_Medic_EP1", "US_Heavy1_DZC", "US_Heavy2_DZC", "us_soldier", "US_Soldier_EP1", "US_Soldier_Light_EP1", "US_Soldier_Medic_EP1", "US_Soldier_Officer_EP1", "USMC_Soldier_Crew", "USMC_Soldier_Crew_EP1", "USMC_Soldier_Light", "USMC_Soldier_Medic", "USMC_Soldier_Officer", "Villager1", "WildBoar", "z_doctor", "z_policeman", "z_priest", "z_soldier", "z_soldier_heavy", "z_soldier_pilot", "z_suit2", "z_teacher", "z_villager3", "zZombie_Base" ])) then {
	// repeats for greater randomness and ratio setup
	_ranSkins =  ["CIV_Pilot1_DZC","Cameraman_DZC","Clan_nobackpack_INS2_DZC","Clan_nobackpack_suit_DZC","Euroman02_DZC","Euroman01_DZC",
				"Clan_nobackpack_INS2_DZC","Clan_nobackpack_suit_DZC","Euroman02_DZC","Euroman01_DZC","Clan_nobackpack_INS2_DZC","Cameraman_DZC","Euroman01_DZC"];
	
	_ranIndex = (count _ranSkins)-1;
	_ranIndex = floor(random _ranIndex);
	_model = _ranSkins select _ranIndex;
	};

	_hiveVer =		_primary select 4;
	if (isNil "_model") then {
		_model = "Euroman01_DZC";
	} else {
		if (_model == "") then {
			_model = "Euroman02_DZC";
		};
	};

	//Record initial inventory
	_config = (configFile >> "CfgSurvival" >> "Inventory" >> "Default");
	_mags = getArray (_config >> "magazines");
	_wpns = getArray (_config >> "weapons");
	_bcpk = getText (_config >> "backpack");
	_randomSpot = true;
	
	//Wait for HIVE to be free
	//_key = format["CHILD:203:%1:%2:%3:",_charID,[_wpns,_mags],[_bcpk,[],[]]];
	//_key call server_hiveWrite;
};

diag_log ("LOGIN LOADED: " + str(_playerObj) + " Type: " + (typeOf _playerObj));

_isHiveOk = false;	//EDITED
if (_hiveVer >= dayz_hiveVersionNo) then {
	_isHiveOk = true;
};
//diag_log ("SERVER RESULT: " + str("X") + " " + str(dayz_hiveVersionNo));

// FEEL FREE TO CHANCE ALL OF THIS, JUST WANTED TO GET IT SET UP AND WORKING!

if (count _inventory == 1) then {
	if ((_inventory select 0) == "New Player") then {
		_key = format["CHILD:999:select replace(cl.`inventory`, '""', '""""') inventory, replace(cl.`backpack`, '""', '""""') backpack, replace(coalesce(cl.`model`, 'Survivor2_DZ'), '""', '""""') model from `cust_loadout` cl join `cust_loadout_profile` clp on clp.`cust_loadout_id` = cl.`id` where clp.`unique_id` = '?':[%1]:",str(_playerID)];
		_data = "HiveEXT" callExtension _key;
		_result = call compile format ["%1", _data];
		
		_inventory = [["ItemWatch","ItemCompass"],["ItemBandage","ItemWaterbottleUnfilled","ItemHeatpack"]];
		_backpack = ["CZ_VestPouch_EP1",[[],[]],[[],[]]];
		
		_foodItems = ["FoodCanGriff","FoodCanBadguy","FoodCanBoneboy","FoodCanCorn","FoodCanCurgon","FoodCanDemon","FoodCanFraggleos","FoodCanHerpy","FoodCanOrlok","FoodCanPowell","FoodCanTylers"];
		_drinkItems = ["ItemSodaMtngreen","ItemSodaR4z0r","ItemSodaClays","ItemSodaSmasht","ItemSodaDrwaste","ItemSodaLemonade","ItemSodaLvg","ItemSodaMzly","ItemSodaRabbit"];

		_foodItem =  _foodItems select (floor(random (count _foodItems)));
		_drinkItem = _drinkItems select (floor(random (count _drinkItems)));
		
		// add doubles for ratio and randomness setup
		_possibleLoadouts = ["UnpreparedCiv","UnpreparedCiv"];
		_loadoutSelect = _possibleLoadouts select (floor(random ((count _possibleLoadouts)-1)));
		
		switch (_loadoutSelect) do {
			case "UnpreparedCiv":
			{
				_inventory = [["RH_p38","ItemWatch","ItemCompass","ItemMap"],["RH_8Rnd_9x19_P38","RH_8Rnd_9x19_P38","ItemBandage","ItemWaterbottleUnfilled","ItemHeatpack",_foodItem,_drinkItem]];
				_backpack = ["CZ_VestPouch_EP1",[[],[]],[[],[]]];
			};
		};
	};
};

//Server publishes variable to clients and WAITS
//_playerObj setVariable ["publish",[_charID,_inventory,_backpack,_survival,_isNew,dayz_versionNo,_model,_isHiveOk,_newPlayer],true];

dayzPlayerLogin = [_charID,_inventory,_backpack,_survival,_isNew,dayz_versionNo,_model,_isHiveOk,_newPlayer];
(owner _playerObj) publicVariableClient "dayzPlayerLogin";
