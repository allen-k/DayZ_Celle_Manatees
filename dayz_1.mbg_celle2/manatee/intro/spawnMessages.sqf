playSound "introsong";
sleep 2;
cuttext [format ["Your story begins 2000M in the air. Don't forget to Open your Parachute!"],"PLAIN DOWN",8];
sleep 9;
cuttext [format ["%1, your chances of survival are ... None!",(name player)],"PLAIN DOWN",6];
sleep 7;
cuttext [format ["A slow and agonizing death awaits!"],"PLAIN DOWN",6];
sleep 7;
cuttext [format ["Good Luck!"],"PLAIN DOWN",2];
sleep 4;
sleep 120;
// force save the player after 2 minute.
dayzPlayerSave = [player,[],true];
publicVariable "dayzPlayerSave";