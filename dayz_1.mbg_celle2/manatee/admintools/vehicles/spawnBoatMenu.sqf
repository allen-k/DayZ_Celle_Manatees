_boatArray = [
"Fishing_Boat",
"PBX",
"smallboat_1",
"smallboat_2"
];

adminspawnboat = [];

adminspawnboat set [count adminspawnboat, player addAction [("<t color=""#FF7300"">" + ("Close Spawn Menu") +"</t>"), "manatee\admintools\vehicles\spawnClose.sqf"]];

for "_i" from 0 to (count _boatArray)-1 do {
	adminspawnboat set [count adminspawnboat, player addAction [("<t color=""#FFC726"">" + (_boatArray select _i) +"</t>"), "manatee\admintools\vehicles\spawnItem.sqf",(_boatArray select _i), 0, false, true]];
};