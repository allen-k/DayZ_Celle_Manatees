//===================piXel 15-02-2013===========
waitUntil {!isNil ("dayz_Totalzedscheck")};

//failsafe vehClimb.sqf
if (animationState player == "sitUnarm_L_idleLoop_inUH1Y") then {[nil,player,rSwitchMove, "AidlPpneMstpSnonWnonDnon_SleepC_killFly"] call RE;};

//intro move
showCinemaBorder true;
camUseNVG false;

_camera = "camera" camCreate [(position player select 0)-100*sin (round(random 359)), (position player select 1)-100*cos (round(random 359)),(position player select 2)+60];
_camera cameraEffect ["internal","back"];

_camera camSetFOV 2.000;
_camera camCommit 0;
waitUntil {camCommitted _camera};
TitleRsc["logo","PLAIN"];

_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,0];
_camera camCommit 8;
waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;