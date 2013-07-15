// =========================================================================================================
//  SAR_AI - DayZ AI library
//  Version: 1.1.0 
//  Author: Sarge (sarge@krumeich.ch) 
//
//		Wiki: to come
//		Forum: http://opendayz.net/index.php?threads/sarge-ai-framework-public-release.8391/
//		
// ---------------------------------------------------------------------------------------------------------
//  Required:
//  UPSMon  (special version, the standard one will NOT work
//  SHK_pos 
//  
// ---------------------------------------------------------------------------------------------------------
// SAR_config.sqf - User adjustable config values
// last modified:1.4.2013  
// ---------------------------------------------------------------------------------------------------------

// -----------------------------------------------
// enable or disable dynamic grid spawning
// -----------------------------------------------
SAR_dynamic_spawning = false;

// -----------------------------------------------
// default values for dynamic grid spawning
// -----------------------------------------------

// maximum number of groups / grid
SAR_max_grps_bandits = 6;
SAR_max_grps_soldiers = 6;
SAR_max_grps_survivors = 6;

// chance for a group to spawn (1-100)
SAR_chance_bandits = 50;
SAR_chance_soldiers = 30;
SAR_chance_survivors = 50;

// maximum size of group (including Leader)
SAR_max_grpsize_bandits = 5;
SAR_max_grpsize_soldiers = 5;
SAR_max_grpsize_survivors = 5;


// -----------------------------------------------
// run fix for the issue that bandits cant travel in a vehicle with survivors EXPERIMENTAL, might not work 100% DO NOT ENABLE for the time being
// -----------------------------------------------
SAR_FIX_VEHICLE_ISSUE = false;

// -----------------------------------------------
// modify AI behaviour
// -----------------------------------------------

// disable UPSMON AI behaviour - this means there will be no evasive/flanking, AI WILL follow players around the map outside of grids etc. EXPERIMENTAL
SAR_AI_disable_UPSMON_AI = false;

// enable / disable AI stealing vehicles - if you enable this, be sure to check KRON_UPS_searchVehicledist value below
SAR_AI_STEAL_VEHICLE = false;

// -----------------------------------------------
// Humanity values 
// -----------------------------------------------

// Humanity Value that gets substracted for a survivor or soldier AI kill
SAR_surv_kill_value = 50;

// Humanity Value that gets ADDED for a bandit AI kill
SAR_band_kill_value = 50;

// the humanity value below which a player will be considered hostile
SAR_HUMANITY_HOSTILE_LIMIT = -500;

// -----------------------------------------------
// Track and show AI kills in the debug monitor of the player 
// -----------------------------------------------

// Log AI kills
SAR_log_AI_kills = true;

// -----------------------------------------------
// Special health values for specific units
// -----------------------------------------------

// values: 0.1 - 1, 1 = no change, 0.5 = damage taken reduced by 50%, 0.1 = damage taken reduced by 90% -  EXPERIMENTAL
SAR_leader_health_factor = 1;

// -----------------------------------------------
// respawning of groups & vehicles that are dynamically spawned in the grid system
// -----------------------------------------------
SAR_dynamic_group_respawn = false;

// time after which AI are respawned if configured
SAR_respawn_waittime = 30; // default 30 seconds

// -----------------------------------------------
// Timeout values 
// -----------------------------------------------

// time after which units and groups despawn after players have left the area
SAR_DESPAWN_TIMEOUT = 120; // 2 minutes

// time after which dead AI bodies are deleted
SAR_DELETE_TIMEOUT = 120; // 2 minutes

// -----------------------------------------------
// System performance 
// -----------------------------------------------

// the max range within AI is detecting Zombies and player bandits and makes them hostile - the bigger this value, the more CPU needed
SAR_DETECT_HOSTILE = 500;

// the interval in seconds that an AI scans for new hostiles. The lower this value, the more accurate, but your server will see an impact. Recommended value: 15 
SAR_DETECT_INTERVAL = 15;

// -----------------------------------------------
// Debug 
// -----------------------------------------------

// Show AI hits and kills by players 
SAR_HITKILL_DEBUG = false;

// Shows extra debug info in .rpt
SAR_DEBUG = false;

// careful with setting this, this shows a LOT, including the grid properties and definitions for every spawn and despawn event
SAR_EXTREME_DEBUG = false;

//
// SET THIS TO 0 to hide the group markers on the map
//
//1=Enable or 0=disable debug. In debug could see a mark positioning de leader and another mark of the destination of movement, very useful for editing mission
KRON_UPS_Debug = 0;


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// Overwriting UPSMON standard values, so they dont have to be changed in the UPSMON package. Be careful with changing these.
//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Efective distance for doing perfect ambush (max distance is this x2)
KRON_UPS_ambushdist = 200;

//Frequency for doing calculations for each squad.
KRON_UPS_Cycle = 20; //org 20 , try to adjust for server performance

//Time that leader waits until doing another movement, this time reduced dynamically under fire, and on new targets
KRON_UPS_react = 60;

//Min time to wait for doing another reaction
KRON_UPS_minreact = 30; // org 30

//Max waiting is the maximum time patrol groups will wait when arrived to target for doing another target.
KRON_UPS_maxwaiting = 30;

// how long AI units should be in alert mode after initially spotting an enemy
KRON_UPS_alerttime = 300;

// how close unit has to be to target to generate a new one target or to enter stealth mode
// SARGE DEBUG CHANGE
KRON_UPS_closeenough = 300; // if you have vast plain areas, increase this to sth around 150-300 

// if you are spotted by AI group, how close the other AI group have to be to You , to be informed about your present position. over this, will lose target
KRON_UPS_sharedist = 600;

// If enabled IA communication between them with radio defined sharedist distance, 0/2 
// (must be set to 2 in order to use reinforcement !R)
KRON_UPS_comradio = 0;

// Distance from destination for searching vehicles. (Search area is about 200m), 
// If your destination point is further than KRON_UPS_searchVehicledist, AI will try to find a vehicle to go there.
KRON_UPS_searchVehicledist = 500; // 700, 900  

//Sides that are enemies of resistance // DO NOT CHANGE THIS
KRON_UPS_Res_enemy = [east];


//
// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// definition of classes and weapon loadouts
//

//
// type of soldier lists, only allowed DayZ classes listed. adjust if you run rmod or another map that allows different classes
//
// IMPORTANT: The leader types must be different to each other! So you need 3 different leader types here!

// military AI
SAR_leader_sold_list = ["Clan_UN_Cap_DZC"]; // the potential classes of the leader of a soldier group
SAR_sniper_sold_list = ["Clan_UN_Helmet_DZC"]; // the potential classes of the snipers of a soldier group
SAR_soldier_sold_list = ["Clan_Delta1","Clan_Delta3_DZC"]; // the potential classes of the riflemen of a soldier group

// bandit AI
SAR_leader_band_list = ["Clan_GER_Hvy_DZC"]; // the potential classes of the leader of a bandit group
SAR_sniper_band_list = ["Clan_GER_DZC"]; // the potential classes of the snipers of a bandit group
SAR_soldier_band_list = ["Clan_Terror_DZC","Clan_Terror2_DZC"]; // the potential classes of the bandit of a soldier group

// survivor AI
SAR_leader_surv_list = ["Survivor3_DZ"]; // the potential classes of the leaders of a survivor group
SAR_sniper_surv_list = ["Clan_nobackpack_INS1_DZC"]; // the potential classes of the snipers of a survivor group
SAR_soldier_surv_list = ["Clan_nobackpack_INS1_DZC","Clan_nobackpack_INS2_DZC","Clan_nobackpack_suit_DZC"]; // the potential classes of the riflemen of a soldier group


// ---------------------------------------------------------------------------------------------------------------------
// Skills for all possible units
// ---------------------------------------------------------------------------------------------------------------------

//
// military AI
//

// Leader
SAR_leader_sold_skills = [

    ["aimingAccuracy", 0.90, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.90, 0.10],
    ["aimingSpeed",   0.90, 0.10],
    ["spotDistance",  0.90, 0.10],
    ["spotTime",      0.90, 0.10],
    ["endurance",     0.90, 0.10],
    ["courage",       0.90, 0.10],
    ["reloadSpeed",   0.90, 0.10],
    ["commanding",    0.90, 0.10],
    ["general",       0.90, 0.10]

];

// rifleman
SAR_soldier_sold_skills  = [

    ["aimingAccuracy", 0.90, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.90, 0.10],
    ["aimingSpeed",   0.90, 0.10],
    ["spotDistance",  0.90, 0.10],
    ["spotTime",      0.90, 0.10],
    ["endurance",     0.90, 0.10],
    ["courage",       0.90, 0.10],
    ["reloadSpeed",   0.90, 0.10],
    ["commanding",    0.90, 0.10],
    ["general",       0.90, 0.10]

];

// Sniper
SAR_sniper_sold_skills = [

    ["aimingAccuracy", 0.90, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.90, 0.10],
    ["aimingSpeed",   0.90, 0.10],
    ["spotDistance",  0.90, 0.10],
    ["spotTime",      0.90, 0.10],
    ["endurance",     0.90, 0.10],
    ["courage",       0.90, 0.10],
    ["reloadSpeed",   0.90, 0.10],
    ["commanding",    0.90, 0.10],
    ["general",       0.90, 0.10]

];

//
// bandit AI
//

// Leader
SAR_leader_band_skills = [

    ["aimingAccuracy", 0.90, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.90, 0.10],
    ["aimingSpeed",   0.90, 0.10],
    ["spotDistance",  0.90, 0.10],
    ["spotTime",      0.90, 0.10],
    ["endurance",     0.90, 0.10],
    ["courage",       0.90, 0.10],
    ["reloadSpeed",   0.90, 0.10],
    ["commanding",    0.90, 0.10],
    ["general",       0.90, 0.10]

];
// Rifleman
SAR_soldier_band_skills = [

    ["aimingAccuracy", 0.90, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.90, 0.10],
    ["aimingSpeed",   0.90, 0.10],
    ["spotDistance",  0.90, 0.10],
    ["spotTime",      0.90, 0.10],
    ["endurance",     0.90, 0.10],
    ["courage",       0.90, 0.10],
    ["reloadSpeed",   0.90, 0.10],
    ["commanding",    0.90, 0.10],
    ["general",       0.90, 0.10]

];
// Sniper
SAR_sniper_band_skills = [

    ["aimingAccuracy", 0.90, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.90, 0.10],
    ["aimingSpeed",   0.90, 0.10],
    ["spotDistance",  0.90, 0.10],
    ["spotTime",      0.90, 0.10],
    ["endurance",     0.90, 0.10],
    ["courage",       0.90, 0.10],
    ["reloadSpeed",   0.90, 0.10],
    ["commanding",    0.90, 0.10],
    ["general",       0.90, 0.10]

];

//
// survivor AI
//

// Leader
SAR_leader_surv_skills = [

    ["aimingAccuracy", 0.90, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.90, 0.10],
    ["aimingSpeed",   0.90, 0.10],
    ["spotDistance",  0.90, 0.10],
    ["spotTime",      0.90, 0.10],
    ["endurance",     0.90, 0.10],
    ["courage",       0.90, 0.10],
    ["reloadSpeed",   0.90, 0.10],
    ["commanding",    0.90, 0.10],
    ["general",       0.90, 0.10]

];
// Rifleman
SAR_soldier_surv_skills = [

    ["aimingAccuracy", 0.90, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.90, 0.10],
    ["aimingSpeed",   0.90, 0.10],
    ["spotDistance",  0.90, 0.10],
    ["spotTime",      0.90, 0.10],
    ["endurance",     0.90, 0.10],
    ["courage",       0.90, 0.10],
    ["reloadSpeed",   0.90, 0.10],
    ["commanding",    0.90, 0.10],
    ["general",       0.90, 0.10]

];
// Sniper
SAR_sniper_surv_skills = [

    ["aimingAccuracy", 0.90, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.90, 0.10],
    ["aimingSpeed",   0.90, 0.10],
    ["spotDistance",  0.90, 0.10],
    ["spotTime",      0.90, 0.10],
    ["endurance",     0.90, 0.10],
    ["courage",       0.90, 0.10],
    ["reloadSpeed",   0.90, 0.10],
    ["commanding",    0.90, 0.10],
    ["general",       0.90, 0.10]

];


// ---------------------------------------------------------------------------------------------------------------------
// Weapon & Item Loadout
// ---------------------------------------------------------------------------------------------------------------------

// a general note: you CAN use either rifles OR pistols. Do not use both. AI will get stuck after switching weapons.

// potential weapon list for leaders
SAR_leader_weapon_list = ["RH_deagle","RH_mk22sd","RH_mk22vsd","RH_uspsd","RH_m1911sd","RH_m9sd","RH_Deagleg","RH_Deagles"];
SAR_leader_pistol_list = [];  // do NOT populate, Arma still has a bug that renders AI unresponsive after switching to the sidearm

// potential item list for leaders -> Item / Chance 1 - 100
SAR_leader_items = [["ItemSodaRabbit",1],["ItemMorphine",1],["ItemAntibiotic",1],["ItemBloodbag",1],["ItemHeatPack",1],["ItemPainkiller",1],["ItemBandage",1],["ItemEpinephrine",1],["FoodMRE",1],["Skin_BAF_Officer1_DZC",1],	["Skin_BAF_Officer2_DZC",1],["Skin_BAF_Officer3_DZC",1],["Skin_CZ_Officer1_DZC",1],["Skin_CZ_Officer2_DZC",1],["Skin_CZ_Officer3_DZC",1],["HandGrenade_west",1],["PipeBomb", 1]];
SAR_leader_tools =  [["ItemGPS",1],["ItemEtool",1],["ItemMatchbox",1],["Binocular_Vector",1],["ItemRadio",100]];

//potential weapon list for riflemen
SAR_rifleman_weapon_list = ["RH_mk22","RH_mk22v","RH_usp","RH_uspm","RH_m1911","RH_m1911old","RH_m93r","RH_m9","RH_g17","RH_g18","RH_mk2","RH_tt33","RH_vz61","RH_tec9","RH_muzi","RH_ppk","RH_p38","RH_p226"];
SAR_rifleman_pistol_list = [];   // do NOT populate, Arma still has a bug that renders AI unresponsive after switching to the sidearm

// potential item list for riflemen
SAR_rifleman_items = [["ItemSodaDrwaste",1],["ItemMorphine",1],["ItemAntibiotic",1],["ItemBloodbag",1],["ItemHeatPack",1],["ItemPainkiller",1],["ItemBandage",1],["ItemEpinephrine",1],["FoodNutmix",1],["Skin_Camo1_DZC",1],["Skin_Camo2_DZC",1],["Skin_Camo3_DZC",1],["HandGrenade_west",1]];
SAR_rifleman_tools = [["ItemMap",1],["ItemEtool",1],["ItemMatchbox",1],["ItemToolbox",1],["ItemCompass",1],["ItemRadio",1],["ItemKnife",1],["ItemHatchet",1],["ItemCrowbar",1],["ItemGPS",1]];

//potential weapon list for snipers
SAR_sniper_weapon_list = ["Huntingrifle","RH_HK53eot", "RH_mp5a4eot", "RH_mp5a5eot", "RH_mp5a5riseot", "RH_mp5a5eodeot", "RH_mp5sd6eot", "RH_mp5kpdweot", "RH_P90eot", "RH_p90sdeot", "RH_umpeot", "RH_umpsdeot", "RH_krisseot", "RH_krisssdeot", "RH_uzi", "RH_mac10", "RH_tmpeot", "RH_tmpsdeot", "RH_pp2000eot", "RH_mp7eot", "RH_mp7sdeot"];
SAR_sniper_pistol_list = [];  // do NOT populate, Arma still has a bug that renders AI unresponsive after switching to the sidearm

// potential item list for snipers
//SAR_sniper_items = [["ItemSodaR4z0r",1],["ItemMorphine",1],["ItemAntibiotic",1],["ItemBloodbag",1],["ItemHeatPack",1],["ItemPainkiller",1],["ItemBandage",1],["ItemEpinephrine",1],["FoodPistachio",1],["Skin_Sniper1_DZC",1],["Skin_Sniper2_DZC",1],["Skin_Sniper3_DZC",1],["HandGrenade_west",1]];
SAR_sniper_items = [];
SAR_sniper_tools = [["ItemMap",1],["ItemEtool",1],["ItemMatchbox",1],["ItemToolbox",1],["ItemCompass",1],["ItemRadio",1],["ItemKnife",1],["ItemHatchet",1],["ItemCrowbar",1],["ItemGPS",1]];

// ---------------------------------------------------------------------------------------------------------------------
// heli patrol definiton
// ---------------------------------------------------------------------------------------------------------------------

// define the type of heli(s) you want to use here for the heli patrols - make sure you include helis that have minimum 2 gunner positions, anything else might fail
SAR_heli_type = ["UH1H_DZ","MH60S"];
