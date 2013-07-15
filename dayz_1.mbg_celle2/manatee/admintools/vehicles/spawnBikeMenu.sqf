_bikeArray = [
"ATV_US_EP1",
"M1030",
"Old_moto_TK_Civ_EP1",
"Post_bike_E",
"TT650_Civ",
"TT650_Ins",
"TT650_TK_EP1"
];

adminspawnbike = [];

adminspawnbike set [count adminspawnbike, player addAction [("<t color=""#FF7300"">" + ("Close Spawn Menu") +"</t>"), "manatee\admintools\vehicles\spawnClose.sqf"]];

for "_i" from 0 to (count _bikeArray)-1 do {
	adminspawnbike set [count adminspawnbike, player addAction [("<t color=""#FFC726"">" + (_bikeArray select _i) +"</t>"), "manatee\admintools\vehicles\spawnItem.sqf",(_bikeArray select _i), 0, false, true]];
};