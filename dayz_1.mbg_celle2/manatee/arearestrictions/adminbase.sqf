// manatee, allen, sling, elfi, cookies, zdtl
if ((getPlayerUID player) in ["17855046" , "111736326", "17020614", "58672134", "75641542", "73442502"]) then {
titleText ["Hello Admin.  Welcome back.", "PLAIN DOWN", 3];
} else {
titleText ["You are entering a restricted zone, please turn back now or face certain death...", "PLAIN DOWN", 3];
sleep 15;
titleText ["You have 1 minute to turn back...", "PLAIN DOWN", 3];
sleep 15;
titleText ["You have less than 45 seconds to leave..", "PLAIN DOWN", 3];
sleep 15;
titleText ["You have less than 30 seconds to leave.. We aren't kidding!", "PLAIN DOWN", 3];
removeAllWeapons player;
sleep 15;
titleText ["You have less than 15 seconds to leave (you're about to die!)...", "PLAIN DOWN", 3];
sleep 15;
titleText ["You were warned..!", "PLAIN DOWN", 3];
sleep 5;
player setDamage 1;
};