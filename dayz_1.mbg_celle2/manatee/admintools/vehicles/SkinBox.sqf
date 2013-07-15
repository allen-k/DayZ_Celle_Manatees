_spawn = "Medbox0";
_posplr = [((getPos player) select 0) + 2, ((getPos player) select 1) + 2, 0];
_dirplr = getDir player;
_spwnveh = _spawn createVehicle (_posplr);
_spwnveh setVariable ["Sarge",1,true];
_allowedTakeSkin = ["Sniper1_DZC","Sniper2_DZC","Sniper3_DZC","Snow_Trooper1_DZC","Snow_Trooper2_DZC","Soldier1_DZC","Soldier2_DZC","Soldier3_DZC","Soldier1_SF_DZC","Soldier2_SF_DZC","Soldier3_SF_DZC","BAF_Officer1_DZC","BAF_Officer2_DZC","BAF_Officer3_DZC","CZ_Officer1_DZC","CZ_Officer2_DZC","CZ_Officer3_DZC","GER_Officer1_DZC","CZ_Heavy1_DZC",
"CZ_Heavy2_DZC","CZ_Heavy3_DZC","BAF_Heavy1_DZC","BAF_Heavy2_DZC","BAF_Heavy3_DZC","US_Heavy1_DZC","US_Heavy2_DZC","CIV_Pilot1_DZC","US_Pilot1_DZC","CZ_Pilot1_DZC","CZ_Pilot2_DZC","CZ_Pilot3_DZC","BAF_Pilot1_DZC","BAF_Pilot2_DZC","BAF_Pilot3_DZC","Hazmat_Black_DZC","HazmatVest_Black_DZC","Hazmat_Red_DZC","HazmatVest_Red_DZC",
"Hazmat_Yellow_DZC","HazmatVest_Yellow_DZC","Hazmat_Olive_DZC","HazmatVest_Olive_DZC","Doctor_DZC","Civ_Soldier_DZC","Cameraman_DZC","EuroMan01_DZC","EuroMan02_DZC","Storm_Trooper1_DZC","Storm_Trooper2_DZC","Storm_Trooper3_DZC","Storm_Trooper4_DZC","Camo1_DZC","Camo2_DZC","Camo3_DZC","Soldier1_STD_DZC","Soldier2_STD_DZC","Soldier3_STD_DZC",
"Soldier1_GL_DZC","Soldier2_GL_DZC","Soldier3_GL_DZC","Soldier1_AT_DZC","Soldier2_AT_DZC","Soldier3_AT_DZC","Soldier1_SL_DZC","Soldier2_SL_DZC","Soldier3_SL_DZC"];
{
	_spwnveh addMagazineCargoGlobal [format["Skin_%1",_x],5];
} forEach _allowedTakeSkin;