// manatee, allen, sling, elfi, cookiezzz, zdtl
if ((getPlayerUID player) in ["17855046" , "111736326", "17020614", "58672134", "75641542", "73442502"]) then {
//
} else {
titleText ["You have reached the edge of the map. Return back now!", "PLAIN DOWN", 3];
sleep 20;
titleText ["You have 30 seconds to turn around or be exterminated!", "PLAIN DOWN", 3];
sleep 20;
titleText ["You have 10 seconds to return back to the map.", "PLAIN DOWN", 3];
removeAllWeapons player;
sleep 5;
titleText ["We are helping survivors by wiping out stupidity!", "PLAIN DOWN", 3];
sleep 5;
player setDamage 1;
};