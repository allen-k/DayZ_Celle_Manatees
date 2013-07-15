/*
_item spawn player_wearClothes;
TODO: female
iskindof Survivor_DZC
*/
private["_item","_isFemale","_itemNew","_item","_onLadder","_model","_hasclothesitem","_config","_text"];
_item = _this;
call gear_ui_init;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};

_hasclothesitem = _this in magazines player;
_config = configFile >> "CfgMagazines";
_text = getText (_config >> _item >> "displayName");

if (!_hasclothesitem) exitWith {cutText [format[(localize "str_player_31"),_text,"wear"] , "PLAIN DOWN"]};

if (vehicle player != player) exitWith {cutText ["You may not change clothes while in a vehicle", "PLAIN DOWN"]};

_isFemale = ((typeOf player == "SurvivorW2_DZ")||(typeOf player == "BanditW1_DZ"));
if (_isFemale) exitWith {cutText ["Currently Female Characters cannot change to this skin. This will change in a future update.", "PLAIN DOWN"]};

private["_itemNew","_myModel","_humanity","_isBandit","_isHero"];
_myModel = (typeOf player);
_humanity = player getVariable ["humanity",0];
_isBandit = _humanity < -5000;
_isHero = _humanity > 5000;
_itemNew = "Skin_" + _myModel;

//This line is converting skins on change pack, figure it out!
if ( !(isClass(_config >> _itemNew)) ) then {
	_itemNew = if (!_isFemale) then {"Skin_Survivor2_DZ"} else {"Skin_SurvivorW2_DZ"}; 
};

//Add the trillion custom skins
switch (_item) do {
	case "Skin_Sniper1_DZC": {
		_model = "Sniper1_DZC";
	};
	case "Skin_Sniper2_DZC": {
		_model = "Sniper2_DZC";
	};
	case "Skin_Sniper3_DZC": {
		_model = "Sniper3_DZC";
	};
	case "Skin_Snow_Trooper1_DZC": {
		_model = "Snow_Trooper1_DZC";
	};
	case "Skin_Snow_Trooper2_DZC": {
		_model = "Snow_Trooper2_DZC";
	};
	case "Skin_Soldier1_DZC": {
		_model = "Soldier1_DZC";
	};
	case "Skin_Soldier2_DZC": {
		_model = "Soldier2_DZC";
	};
	case "Skin_Soldier3_DZC": {
		_model = "Soldier3_DZC";
	};
	case "Skin_Soldier1_SF_DZC": {
		_model = "Soldier1_SF_DZC";
	};
	case "Skin_Soldier2_SF_DZC": {
		_model = "Soldier2_SF_DZC";
	};
	case "Skin_Soldier3_SF_DZC": {
		_model = "Soldier3_SF_DZC";
	};
	case "Skin_BAF_Officer1_DZC": {
		_model = "BAF_Officer1_DZC";
	};
	case "Skin_BAF_Officer2_DZC": {
		_model = "BAF_Officer2_DZC";
	};
	case "Skin_BAF_Officer3_DZC": {
		_model = "BAF_Officer3_DZC";
	};
	case "Skin_CZ_Officer1_DZC": {
		_model = "CZ_Officer1_DZC";
	};
	case "Skin_CZ_Officer2_DZC": {
		_model = "CZ_Officer2_DZC";
	};
	case "Skin_CZ_Officer3_DZC": {
		_model = "CZ_Officer3_DZC";
	};
	case "Skin_GER_Officer1_DZC": {
		_model = "GER_Officer1_DZC";
	};
	case "Skin_CZ_Heavy1_DZC": {
		_model = "CZ_Heavy1_DZC";
	};
	case "Skin_CZ_Heavy2_DZC": {
		_model = "CZ_Heavy2_DZC";
	};
	case "Skin_CZ_Heavy3_DZC": {
		_model = "CZ_Heavy3_DZC";
	};
	case "Skin_BAF_Heavy1_DZC": {
		_model = "BAF_Heavy1_DZC";
	};
	case "Skin_BAF_Heavy2_DZC": {
		_model = "BAF_Heavy2_DZC";
	};
	case "Skin_BAF_Heavy3_DZC": {
		_model = "BAF_Heavy3_DZC";
	};
	case "Skin_US_Heavy1_DZC": {
		_model = "US_Heavy1_DZC";
	};
	case "Skin_US_Heavy2_DZC": {
		_model = "US_Heavy2_DZC";
	};
	case "Skin_CIV_Pilot1_DZC": {
		_model = "CIV_Pilot1_DZC";
	};
	case "Skin_US_Pilot1_DZC": {
		_model = "US_Pilot1_DZC";
	};
	case "Skin_CZ_Pilot1_DZC": {
		_model = "CZ_Pilot1_DZC";
	};
	case "Skin_CZ_Pilot2_DZC": {
		_model = "CZ_Pilot2_DZC";
	};
	case "Skin_CZ_Pilot3_DZC": {
		_model = "CZ_Pilot3_DZC";
	};
	case "Skin_BAF_Pilot1_DZC": {
		_model = "BAF_Pilot1_DZC";
	};
	case "Skin_BAF_Pilot2_DZC": {
		_model = "BAF_Pilot2_DZC";
	};
	case "Skin_BAF_Pilot3_DZC": {
		_model = "BAF_Pilot3_DZC";
	};
	case "Skin_Hazmat_Black_DZC": {
		_model = "Hazmat_Black_DZC";
	};
	case "Skin_HazmatVest_Black_DZC": {
		_model = "HazmatVest_Black_DZC";
	};
	case "Skin_Hazmat_Red_DZC": {
		_model = "Hazmat_Red_DZC";
	};
	case "Skin_HazmatVest_Red_DZC": {
		_model = "HazmatVest_Red_DZC";
	};
	case "Skin_Hazmat_Yellow_DZC": {
		_model = "Hazmat_Yellow_DZC";
	};
	case "Skin_HazmatVest_Yellow_DZC": {
		_model = "HazmatVest_Yellow_DZC";
	};
	case "Skin_Hazmat_Olive_DZC": {
		_model = "Hazmat_Olive_DZC";
	};
	case "Skin_HazmatVest_Olive_DZC": {
		_model = "HazmatVest_Olive_DZC";
	};
	case "Skin_Doctor_DZC": {
		_model = "Doctor_DZC";
	};
	case "Skin_Civ_Soldier_DZC": {
		_model = "Civ_Soldier_DZC";
	};		
	case "Skin_Cameraman_DZC": {
		_model = "Cameraman_DZC";
	};
	case "Skin_EuroMan01_DZC": {
		_model = "EuroMan01_DZC";
	};
	case "Skin_EuroMan02_DZC": {
		_model = "EuroMan02_DZC";
	};
	case "Skin_Storm_Trooper1_DZC": {
		_model = "Storm_Trooper1_DZC";
	};
	case "Skin_Storm_Trooper2_DZC": {
		_model = "Storm_Trooper2_DZC";
	};
	case "Skin_Storm_Trooper3_DZC": {
		_model = "Storm_Trooper3_DZC";
	};
	case "Skin_Storm_Trooper4_DZC": {
		_model = "Storm_Trooper4_DZC";
	};
	case "Skin_Camo1_DZC": {
		_model = "Camo1_DZC";
	};
	case "Skin_Camo2_DZC": {
		_model = "Camo2_DZC";
	};
	case "Skin_Camo3_DZC": {
		_model = "Camo3_DZC";
	};
	case "Skin_Soldier1_STD_DZC": {
		_model = "Soldier1_STD_DZC";
	};
	case "Skin_Soldier2_STD_DZC": {
		_model = "Soldier2_STD_DZC";
	};		
	case "Skin_Soldier3_STD_DZC": {
		_model = "Soldier3_STD_DZC";
	};
	case "Skin_Soldier1_GL_DZC": {
		_model = "Soldier1_GL_DZC";
	};
	case "Skin_Soldier2_GL_DZC": {
		_model = "Soldier2_GL_DZC";
	};
	case "Skin_Soldier3_GL_DZC": {
		_model = "Soldier3_GL_DZC";
	};
	case "Skin_Soldier1_AT_DZC": {
		_model = "Soldier1_AT_DZC";
	};
	case "Skin_Soldier2_AT_DZC": {
		_model = "Soldier2_AT_DZC";
	};
	case "Skin_Soldier3_AT_DZC": {
		_model = "Soldier3_AT_DZC";
	};
	case "Skin_Soldier1_SL_DZC": {
		_model = "Soldier1_SL_DZC";
	};
	case "Skin_Soldier2_SL_DZC": {
		_model = "Soldier2_SL_DZC";
	};
	case "Skin_Soldier3_SL_DZC": {
		_model = "Soldier3_SL_DZC";
	};	

	case "Skin_Survivor2_DZ": {
		_model = "EuroMan01_DZC";
		if (_isBandit) then {
			_model = "EuroMan01_DZC";
		};
		if (_isHero) then {
			_model = "EuroMan02_DZC";
		};
	};
};

if (_model != _myModel) then {
	player removeMagazine _item;
	player addMagazine _itemNew;
	[dayz_playerUID,dayz_characterID,_model] spawn player_humanityMorph;
};