// =========================================================================================================
//  SAR_AI - DayZ AI library
//  Version: 1.0.0 
//  Author: Sarge (sarge@krumeich.ch) 
//
//		Wiki: to come
//		Forum: to come
//		
// ---------------------------------------------------------------------------------------------------------
//  Required:
//  UPSMon  
//  SHK_pos 
//  
// ---------------------------------------------------------------------------------------------------------
//   area, group & spawn  cfg file for Celle
//   last modified: 5.3.2013
// ---------------------------------------------------------------------------------------------------------

/* reconfiguring the properties of the grid (keep in mind the grid has default settings, but these you should overwrite where needed).

IMPORTANT: The grid squares are named like : SAR_area_0_0

where the first 0 is the x counter, and the second 0 the y counter.

So to adress the bottom left square in the grid, you use SAR_area_0_0.
The square above that one would be: SAR_area_0_1
the square one to the right of the bottom left square is SAR_area_1_0

You want to change the number arrays in the below lines:

The order for these numbers is always [BANDIT, SURVIVOR, SOLDIER]

Lets take an example for Chernarus
 
// Kamenka, 0 bandit groups, 1 soldier groups, 2 survivor groups - spawn probability ba,so,su - maximum group members ba,so,su
_check = [["max_grps","rnd_grps","max_p_grp"],[[0,1,2],[0,75,100],[0,4,3]],"SAR_area_0_0"] call SAR_AI_mon_upd; 
  
 [[0,1,2],[0,75,100],[0,4,3]]

the first set of numbers : 0,1,2
stands for
0 bandit groups
1 soldier group
2 surivors groups
thats the max that can spawn in this grid

the second set of numbers : 0,75,100
that means: 
0% probability to spawn bandit groups
75% for soldiers
100% for survivors

the last set of numbers : 0,4,3
thats the maximum number of ppl in the group (plus 1 leader)
0 bandits
max 4 (+1 leader) soldiers
max 3 (+1 leader) survivors
this number is randomized

 
 */
// --------------------------------------------------
// grid definition for the automatic spawn system
//
// examples see the chernarus file
// --------------------------------------------------
  
//--- _check = [["max_grps","rnd_grps","max_p_grp"],[[Bandit, Soldier, Survivor] (MAX 3),[% Bandit,% Soldier,% Survivor],[#Bandit,#Soldier,#Survivor] (+1 Leader Per)],"SAR_area_0_0" (South West Corner)] call SAR_AI_mon_upd;
/*
// Lindwedel & mellendorf
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,1],[3,1,1],[3,3,3]],"SAR_area_0_0"] call SAR_AI_mon_upd; 
// Schwarmstedt & highway 7 bridge
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,1],[9,3,3],[4,4,4]],"SAR_area_0_1"] call SAR_AI_mon_upd; 
// Hademstorf
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,1],[3,1,1],[3,3,3]],"SAR_area_0_2"] call SAR_AI_mon_upd;
// Fallingbostel & Dushorn
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,1],[9,3,3],[4,4,4]],"SAR_area_0_3"] call SAR_AI_mon_upd;
// Benefeld
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,1],[3,1,1],[3,3,3]],"SAR_area_0_4"] call SAR_AI_mon_upd;

//-------------------
*/

 
 
// ---------------------------------------------------------------
// Definition of area markers for static spawns
// ---------------------------------------------------------------

_this = createMarker ["Manatee_Map_Center", [6070.001, 6405.001, 175]];
_this setMarkerText "Manatee_Map_Center";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [6000, 6000];
Manatee_Map_Center = _this;

_this = createMarker ["Manatee_Prison_Heli", [4659.001, 8224.001, 175]];
_this setMarkerText "Manatee_Prison_Heli";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [1000, 1000];
Manatee_Prison_Heli = _this;

_this = createMarker ["Manatee_H7_North_Checkpoint", [5030.001, 12201.001, 0]];
_this setMarkerText "Manatee_H7_North_Checkpoint";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [25, 25];
Manatee_H7_North_Checkpoint = _this;

_this = createMarker ["Manatee_H7_South_Checkpoint", [3055.001, 1028.001, 0]];
_this setMarkerText "Manatee_H7_South_Checkpoint";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [50, 50];
Manatee_H7_South_Checkpoint = _this;

_this = createMarker ["Manatee_H7_Dorfmark", [3100.001, 10516.001, 0]];
_this setMarkerText "Manatee_H7_Dorfmark";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [50, 50];
Manatee_H7_Dorfmark = _this;

_this = createMarker ["Manatee_H7_Fallingbostel", [1706.001, 9222.001, 0]];
_this setMarkerText "Manatee_H7_Fallingbostel";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [50, 50];
Manatee_H7_Fallingbostel = _this;

_this = createMarker ["Schwarmstedt_Survivor_Cave", [262.001, 4180.001, 0]];
_this setMarkerText "Schwarmstedt_Survivor_Cave";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [20, 20];
Schwarmstedt_Survivor_Cave = _this;

_this = createMarker ["Schwarmstedt_Bandit_Cave", [35.001, 3248.001, 0]];
_this setMarkerText "Schwarmstedt_Bandit_Cave";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [20, 20];
Schwarmstedt_Bandit_Cave = _this;
// NAF ============================================================== NAF
_this = createMarker ["Manatee_NAF_Barracks", [4671.6343, 443.48831, 0]];
_this setMarkerText "Manatee_NAF_Barracks";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [150, 150];
Manatee_NAF_Barracks = _this;

_this = createMarker ["Manatee_NAF_Hangars", [4672.1519, 3009.2664, 0]];
_this setMarkerText "Manatee_NAF_Hangars";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [150, 150];
Manatee_NAF_Hangars = _this;

_this = createMarker ["Manatee_NAF_Firehouse", [5618.9297, 3712.0496, 0]];
_this setMarkerText "Manatee_NAF_Firehouse";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [150, 150];
Manatee_NAF_Firehouse = _this;

_this = createMarker ["Manatee_SAF_Barracks", [7438.001, 1452.001, 0]];
_this setMarkerText "Manatee_SAF_Barracks";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [150, 150];
Manatee_SAF_Barracks = _this;

_this = createMarker ["Manatee_SAF_Tower", [7581.001, 1093.001, 0]];
_this setMarkerText "Manatee_SAF_Tower";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [150, 150];
Manatee_SAF_Tower = _this;

_this = createMarker ["Manatee_SAF_Firehouse", [7704.001, 1492.001, 0 ]];
_this setMarkerText "Manatee_SAF_Firehouse";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [150, 150];
Manatee_SAF_Firehouse = _this;

_this = createMarker ["Manatee_Prison_RRR", [4482.001, 8182.001, 0]];
_this setMarkerText "Manatee_Prison_RRR";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [50, 50];
Manatee_Prison_RRR = _this;

_this = createMarker ["Manatee_Prison_Entrance", [4547.001, 8121.001, 0]];
_this setMarkerText "Manatee_Prison_Entrance";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [125, 125];
Manatee_Prison_Entrance = _this;

_this = createMarker ["Manatee_Prison_Courtyard", [4721.001, 8263.001, 0]];
_this setMarkerText "Manatee_Prison_Courtyard";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [40, 40];
Manatee_Prison_Courtyard = _this;

_this = createMarker ["Manatee_Prison_North_Patrol", [4577.001, 8284.001, 0]];
_this setMarkerText "Manatee_Prison_North_Patrol";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [125, 125];
Manatee_Prison_North_Patrol = _this;

_this = createMarker ["Manatee_Prison_South_Patrol", [4696.001, 8157.001, 0]];
_this setMarkerText "Manatee_Prison_South_Patrol";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [125, 125];
Manatee_Prison_South_Patrol = _this;

_this = createMarker ["Manatee_Slums_South", [4410.001, 8376.001, 0]];
_this setMarkerText "Manatee_Slums_South";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [100, 100];
Manatee_Slums_South = _this;

_this = createMarker ["Manatee_Slums_North", [4394.001, 8604.001, 0]];
_this setMarkerText "Manatee_Slums_North";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [100, 100];
Manatee_Slums_North = _this;

_this = createMarker ["Manatee_South_East_Quadrant", [9427.001, 3538.001, 0]];
_this setMarkerText "Manatee_South_East_Quadrant";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [3500, 3500];
Manatee_South_East_Quadrant = _this;

_this = createMarker ["Manatee_North_East_Quadrant", [9427.001, 9693.001, 0]];
_this setMarkerText "Manatee_North_East_Quadrant";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [3500, 3500];
Manatee_North_East_Quadrant = _this;

_this = createMarker ["Manatee_North_West_Quadrant", [2972.001, 9165.001, 0]];
_this setMarkerText "Manatee_North_West_Quadrant";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [3500, 3500];
Manatee_North_West_Quadrant = _this;

_this = createMarker ["Manatee_South_West_Quadrant", [3027.001, 3293.001, 0]];
_this setMarkerText "Manatee_South_West_Quadrant";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [3500, 3500];
Manatee_South_West_Quadrant = _this;

// Barracks patrol
_this = createMarker ["Manatee_North_Barracks", [10448, 11523.3, 0]];
_this setMarkerText "Manatee_North_Barracks";
_this setMarkerType "Flag";
_this setMarkeralpha 0;
_this setMarkerBrush "Solid";
_this setMarkerSize [100, 100];
Manatee_North_Barracks = _this;

// ----------------------------------------------------------------------------------------
// End of area marker definition section
// ----------------------------------------------------------------------------------------

diag_log format["SAR_AI: Area & Trigger definition finalized"];
diag_log format["SAR_AI: Static Spawning for Helicopter patrols started"];

//
// Static, predefined heli patrol areas with configurable units
//
// Parameters used: 
//                  Areaname
//                  1,2,3 = soldier, survivors, bandits
//

// add if needed, see examples in the chernarus file

//[Manatee_Map_Center,1] call SAR_AI_heli;
//[Manatee_Map_Center,2] call SAR_AI_heli;

// Prison Bandits
[Manatee_Prison_Heli,3] call SAR_AI_heli;
[Manatee_Prison_Heli,3] call SAR_AI_heli;


diag_log format["SAR_AI: Static Spawning for Helicopter patrols finished"];

//---------------------------------------------------------------------------------
// Static, predefined infantry patrols in defined areas with configurable units
//---------------------------------------------------------------------------------
// Example: [SAR_area_DEBUG,1,0,1,""] call SAR_AI;
// 
// SAR_area_DEBUG = areaname (must have been defined further up)
// 1 = type of group (1 = soldiers, 2 = survivors, 3 = bandits)
// 0 = amount of snipers in the group
// 1 = amount of rifleman in the group
//
//

// North Barracks
//[Manatee_North_Barracks,3,3,8,"fortify",false] call SAR_AI;
[Manatee_North_Barracks,3,3,8,"patrol",false] call SAR_AI;

// Highway 7
[Manatee_H7_Dorfmark,3,1,3,"ambush",false] call SAR_AI;
[Manatee_H7_Fallingbostel,3,1,3,"ambush",false] call SAR_AI;
[Manatee_H7_North_Checkpoint,1,1,3,"fortify",false] call SAR_AI;
[Manatee_H7_South_Checkpoint,1,1,3,"fortify",false] call SAR_AI;

// NAF - Bandits
//[Manatee_NAF_Barracks,3,3,8,"fortify",false] call SAR_AI;
//[Manatee_NAF_Hangars,3,3,8,"patrol",false] call SAR_AI;
[Manatee_NAF_Firehouse,3,2,3,"fortify",false] call SAR_AI;

// SAF - Bandits
//[Manatee_SAF_Barracks,3,3,8,"fortify",false] call SAR_AI;
//[Manatee_SAF_Tower,3,3,8,"patrol",false] call SAR_AI;
[Manatee_SAF_Firehouse,3,2,3,"fortify",false] call SAR_AI;

// Prison - Bandits
[Manatee_Prison_RRR,3,1,3,"ambush",false] call SAR_AI;
[Manatee_Prison_Entrance,3,1,3,"fortify",false] call SAR_AI;
[Manatee_Prison_Courtyard,3,1,3,"fortify",false] call SAR_AI;
[Manatee_Prison_North_Patrol,3,1,3,"patrol",false] call SAR_AI;
//[Manatee_Prison_South_Patrol,3,1,8,"patrol",false] call SAR_AI;

// Slums - Survivors
[Manatee_Slums_South,2,1,3,"fortify",false] call SAR_AI;
//[Manatee_Slums_North,2,3,8,"fortify",false] call SAR_AI;

// Hideouts - Survivors & Bandits
[Schwarmstedt_Survivor_Cave,2,1,3,"ambush",false] call SAR_AI;
[Schwarmstedt_Bandit_Cave,3,1,3,"ambush",false] call SAR_AI;

// Quadrant Foot Patrols - Soldiers
[Manatee_North_East_Quadrant,1,1,3,"patrol",false] call SAR_AI;
[Manatee_North_West_Quadrant,1,1,3,"patrol",false] call SAR_AI;

[Manatee_South_East_Quadrant,1,1,3,"patrol",false] call SAR_AI;
[Manatee_South_West_Quadrant,1,1,3,"patrol",false] call SAR_AI;

// Example entries:
// SARGE DEBUG - Debug group
// military, 0 snipers, 1 riflemen, patrol
//[SAR_area_DEBUG,1,0,1,""] call SAR_AI;

// military, 2 snipers, 4 riflemen, patrol
//[SAR_area_DEBUG,1,2,4,""] call SAR_AI;

// survivors, 1 snipers, 3 riflemen, patrolling the NWAF
//[SAR_marker_helipatrol_nwaf,2,1,3,""] call SAR_AI;

// bandits, 5 snipers, 2 riflemen, patrolling the NWAF
//[SAR_marker_helipatrol_nwaf,3,5,2,""] call SAR_AI;
//---------------------------------------------------------------------------------

// add here if needed




// ---- end of configuration area ----

diag_log format["SAR_AI: Static Spawning for infantry patrols finished"];

