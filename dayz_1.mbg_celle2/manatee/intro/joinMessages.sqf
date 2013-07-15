waitUntil {!isNil ("dayz_Totalzedscheck")};
sleep 4;
cuttext [format ["Welcome, %1",(name player)],"PLAIN DOWN",1];
sleep 5;
_humanity = player getVariable['humanity', 0];

if (dayz_skilllevel == 1) then {
cuttext [format ["You have made it %1 Day, your humanity is: %2",(dayz_skilllevel), _humanity],"PLAIN DOWN",1];
} else {
cuttext [format ["You have made it %1 Days, your humanity is: %2",(dayz_skilllevel), _humanity],"PLAIN DOWN",1];
};