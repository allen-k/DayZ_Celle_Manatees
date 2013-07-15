updateSelfhumanity = player getVariable ["humanity",0];
updateSelfhumanity = updateSelfhumanity - 1000;
player setVariable["humanity",updateSelfhumanity,true];
cuttext [format ["Your Humanity is now: %1",updateSelfhumanity],"PLAIN DOWN",1];