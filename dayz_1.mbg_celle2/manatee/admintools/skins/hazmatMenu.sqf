_hazmatArray = [
"Hazmat_Black_DZC",
"HazmatVest_Black_DZC",
"Hazmat_Red_DZC",
"HazmatVest_Red_DZC",
"Hazmat_Yellow_DZC",
"HazmatVest_Yellow_DZC",
"Hazmat_Olive_DZC",
"HazmatVest_Olive_DZC"
];

hazmatskins = [];

hazmatskins set [count hazmatskins, player addAction [("<t color=""#FF7300"">" + ("Close Skin Menu") +"</t>"), "manatee\admintools\skins\skinsClose.sqf"]];

for "_i" from 0 to (count _hazmatArray)-1 do {
	hazmatskins set [count hazmatskins, player addAction [("<t color=""#FFC726"">" + (_hazmatArray select _i) +"</t>"), "manatee\admintools\skins\changeSkin.sqf",(_hazmatArray select _i), 0, false, true]];
};