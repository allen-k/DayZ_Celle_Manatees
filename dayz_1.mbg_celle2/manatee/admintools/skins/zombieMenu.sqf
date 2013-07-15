_zombieArray = [
"z_doctor",
"z_policeman",
"z_priest",
"z_soldier",
"z_soldier_heavy",
"z_soldier_pilot",
"z_suit2", "z_teacher",
"z_villager3",
"zZombie_Base"
];

zombieskins = [];

zombieskins set [count zombieskins, player addAction [("<t color=""#FF7300"">" + ("Close Skin Menu") +"</t>"), "manatee\admintools\skins\skinsClose.sqf"]];

for "_i" from 0 to (count _zombieArray)-1 do {
	zombieskins set [count zombieskins, player addAction [("<t color=""#FFC726"">" + (_zombieArray select _i) +"</t>"), "manatee\admintools\skins\changeSkin.sqf",(_zombieArray select _i), 0, false, true]];
};