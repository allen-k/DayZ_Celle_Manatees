updateSelfhumanity = cursorTarget getVariable ["humanity",0];
updateSelfhumanity = updateSelfhumanity + 1000;
cursorTarget setVariable["humanity",updateSelfhumanity,true];
cuttext [format ["%1's Humanity is now: %2",(name cursorTarget),updateSelfhumanity],"PLAIN DOWN",1];