_animal1Array = [
"Cock",
"Cow01_EP1",
"Cow02",
"Cow03",
"Fin",
"Goat",
"Goat01_EP1",
"Goat02_EP2",
"Pastor",
"Rabbit",
"Sheep01_EP1",
"WildBoar"
];

animalskins = [];

animalskins set [count animalskins, player addAction [("<t color=""#FF7300"">" + ("Close Skin Menu") +"</t>"), "manatee\admintools\skins\skinsClose.sqf"]];

for "_i" from 0 to (count _animal1Array)-1 do {
	animalskins set [count animalskins, player addAction [("<t color=""#FFC726"">" + (_animal1Array select _i) +"</t>"), "manatee\admintools\skins\changeSkin.sqf",(_animal1Array select _i), 0, false, true]];
};