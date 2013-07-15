_spawn = "Medbox0";
_posplr = [((getPos player) select 0) + 2, ((getPos player) select 1) + 2, 0];
_dirplr = getDir player;
_spwnveh = _spawn createVehicle (_posplr);
_spwnveh setVariable ["Sarge",1,true];
_spwnveh addMagazineCargoGlobal ["ItemAntibiotic",5];
_spwnveh addMagazineCargoGlobal ["ItemHeatpack",5];