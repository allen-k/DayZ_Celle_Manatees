pathtotools = "manatee\admintools\tools\";
pathtoskins = "manatee\admintools\skins\";
pathtoweapon = "manatee\admintools\weaponkits\";
pathtoshields = "manatee\admintools\shields\";
pathtohumanity = "manatee\admintools\humanity\";
pathtovehicles = "manatee\admintools\vehicles\";
pathdebug = "manatee\debug\";
EXECscript1 = 'player execVM "'+pathtotools+'%1"';
EXECscript2 = 'player execVM "'+pathtoskins+'%1"';
EXECscript3 = 'player execVM "'+pathtoweapon+'%1"';
EXECscript4 = 'player execVM "'+pathtoshields+'%1"';
EXECscript5 = 'player execVM "'+pathtohumanity+'%1"';
EXECscript6 = 'player execVM "'+pathtovehicles+'%1"';
execdebug = 'player execVM "'+pathdebug+'%1"';

adminmenu =
[
	["",true],
		["Admin Debug", [2], "", -5, [["expression", format[execdebug,"admindebug.sqf"]]], "1", "1"],
		["Player Debug", [3], "", -5, [["expression", format[execdebug,"playerdebug.sqf"]]], "1", "1"],
		["Tools Menu", [4], "#USER:ToolsMenu", -5, [["expression", ""]], "1", "1"],
		["Skins Menu", [5], "#USER:SkinsMenu", -5, [["expression", ""]], "1", "1"],
		["Gear Menu", [6], "#USER:GearMenu", -5, [["expression", ""]], "1", "1"],
		["Humanity Menu", [7], "#USER:HumanityMenu", -5, [["expression", ""]], "1", "1"],
		["Spawn Menu", [8], "#USER:SpawnMenu", -5, [["expression", ""]], "1", "1"],
		["Shields Menu", [9], "#USER:ShieldMenu", -5, [["expression", ""]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
		
];

ToolsMenu =
[
	["",true],
		["ESP / Tele", [2],  "", -5, [["expression", format[EXECscript1,"dayzesp.sqf"]]], "1", "1"],
		["God Mode", [3],  "", -5, [["expression", format[EXECscript1,"Godmode.sqf"]]], "1", "1"],
		["Car God", [4],  "", -5, [["expression", format[EXECscript1,"cargod.sqf"]]], "1", "1"],
		["Heal Player(s)", [5],  "", -5, [["expression", format[EXECscript1,"healp.sqf"]]], "1", "1"],
		["Look-N-Repair", [6],  "", -5, [["expression", format[EXECscript1,"looknrepair.sqf"]]], "1", "1"],
		["Look-N-Destroy", [7],  "", -5, [["expression", format[EXECscript1,"lookndestroy.sqf"]]], "1", "1"],
		["Repair Buildings", [8],  "", -5, [["expression", format[EXECscript1,"fixbuildings.sqf"]]], "1", "1"],
		["Spectate Player", [9],  "", -5, [["expression", format[EXECscript1,"spectate.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

SkinsMenu =
[
	["",true],
		["Animal Skins", [2],  "", -5, [["expression", format[EXECscript2,"animalMenu.sqf"]]], "1", "1"],
		["Bandit Skins", [3],  "", -5, [["expression", format[EXECscript2,"banditMenu.sqf"]]], "1", "1"],
		["Civilian Skins", [4],  "", -5, [["expression", format[EXECscript2,"civilianMenu.sqf"]]], "1", "1"],
		["HazMat Skins", [5],  "", -5, [["expression", format[EXECscript2,"hazmatMenu.sqf"]]], "1", "1"],
		["Officer Skins", [6],  "", -5, [["expression", format[EXECscript2,"officerMenu.sqf"]]], "1", "1"],
		["Pilot Skins", [7],  "", -5, [["expression", format[EXECscript2,"pilotMenu.sqf"]]], "1", "1"],
		["Soldier Skins", [8],  "", -5, [["expression", format[EXECscript2,"soldierMenu.sqf"]]], "1", "1"],
		["Soldier -Light- Skins", [9],  "", -5, [["expression", format[EXECscript2,"soldierlMenu.sqf"]]], "1", "1"],
		["Soldier -Heavy- Skins", [10],  "", -5, [["expression", format[EXECscript2,"soldierhMenu.sqf"]]], "1", "1"],
		["Zombie Skins", [11],  "", -5, [["expression", format[EXECscript2,"zombieMenu.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
		
GearMenu =
[
	["",true],
		["Load Toolbelt", [2],  "#USER:ToolbeltMenu", -5, [["expression", ""]], "1", "1"],
		["Base Building", [3],  "", -5, [["expression", format[EXECscript3,"basebuilding.sqf"]]], "1", "1"],
		["Vehicle Repair", [4],  "", -5, [["expression", format[EXECscript3,"vehiclerepair.sqf"]]], "1", "1"],
		["Survival Supplies", [5],  "", -5, [["expression", format[EXECscript3,"survivalsupplies.sqf"]]], "1", "1"],
		["Backpacks", [6],  "#USER:BackpackMenu", -5, [["expression", ""]], "1", "1"],
		["Clear All Gear", [7],  "", -5, [["expression", format[EXECscript3,"cleanme.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
		
ToolbeltMenu =
[
	["",true],
		["Binocular Kit", [2],  "", -5, [["expression", format[EXECscript3,"binocularkit.sqf"]]], "1", "1"],
		["Rangefinder Kit", [3],  "", -5, [["expression", format[EXECscript3,"rangefinderkit.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

BackpackMenu =
[
	["",true],
		["Vest Pouch", [2],  "", -5, [["expression", format[EXECscript3,"vestpouch.sqf"]]], "1", "1"],
		["Patrol Pack", [3],  "", -5, [["expression", format[EXECscript3,"patrolpack.sqf"]]], "1", "1"],
		["Assault Pack", [4],  "", -5, [["expression", format[EXECscript3,"assaultpack.sqf"]]], "1", "1"],
		["TK Assault Pack", [5],  "", -5, [["expression", format[EXECscript3,"tkassaultpack.sqf"]]], "1", "1"],
		["British Pack", [6],  "", -5, [["expression", format[EXECscript3,"britishpack.sqf"]]], "1", "1"],
		["Czeck Pack", [7],  "", -5, [["expression", format[EXECscript3,"czeckpack.sqf"]]], "1", "1"],
		["Alice Pack", [8],  "", -5, [["expression", format[EXECscript3,"alicepack.sqf"]]], "1", "1"],
		["Coyote Pack", [9],  "", -5, [["expression", format[EXECscript3,"coyote.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

HumanityMenu =
[
	["",true],
		["Get Target Humanity", [2],  "", -5, [["expression", format[EXECscript5,"gethumanity.sqf"]]], "1", "1"],
		["Self Humanity +500", [3],  "", -5, [["expression", format[EXECscript5,"selfi500.sqf"]]], "1", "1"],
		["Self Humanity -500", [4],  "", -5, [["expression", format[EXECscript5,"selfd500.sqf"]]], "1", "1"],
		["Self Humanity +1000", [5],  "", -5, [["expression", format[EXECscript5,"selfi1000.sqf"]]], "1", "1"],
		["Self Humanity -1000", [6],  "", -5, [["expression", format[EXECscript5,"selfd1000.sqf"]]], "1", "1"],
		["Target Humanity +500", [7],  "", -5, [["expression", format[EXECscript5,"targeti500.sqf"]]], "1", "1"],
		["Target Humanity -500", [8],  "", -5, [["expression", format[EXECscript5,"targetd500.sqf"]]], "1", "1"],
		["Target Humanity +1000", [9],  "", -5, [["expression", format[EXECscript5,"targeti1000.sqf"]]], "1", "1"],
		["Target Humanity -1000", [10],  "", -5, [["expression", format[EXECscript5,"targetd1000.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
		
];

SpawnMenu =
[
	["",true],
		["Spawn Weapon/Ammo Box", [2],  "", -5, [["expression", format[EXECscript6,"spawnBoxMenu.sqf"]]], "1", "1"],
		["Spawn Aircraft/Heli", [3],  "", -5, [["expression", format[EXECscript6,"spawnAirMenu.sqf"]]], "1", "1"],
		["Spawn Bike/Moto/ATV", [4],  "", -5, [["expression", format[EXECscript6,"spawnBikeMenu.sqf"]]], "1", "1"],
		["Spawn Civilian Car", [5],  "", -5, [["expression", format[EXECscript6,"spawnCarMenu.sqf"]]], "1", "1"],
		["Spawn Offroad Car", [6],  "", -5, [["expression", format[EXECscript6,"spawnOffroadMenu.sqf"]]], "1", "1"],
		["Spawn Military Car", [7],  "", -5, [["expression", format[EXECscript6,"spawnMilitaryMenu.sqf"]]], "1", "1"],
		["Spawn Truck", [8],  "", -5, [["expression", format[EXECscript6,"spawnTruckMenu.sqf"]]], "1", "1"],
		["Spawn Watercraft", [9],  "", -5, [["expression", format[EXECscript6,"spawnBoatMenu.sqf"]]], "1", "1"],
		["Spawn Armored Tank", [10],  "", -5, [["expression", format[EXECscript6,"spawnArmoredMenu.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
];

ShieldMenu =
[
	["",true],
		["Zombie Shield", [2],  "", -5, [["expression", format[EXECscript4,"zombieshield.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

showCommandingMenu "#USER:adminmenu";