//ActiveCombat 1.0 by Daimyo
private["_dialog","_dangerNear","_dangerClosest","_cnt","_isInCombat","_playerCombat","_inVehicle"];
disableSerialization;
_cnt = 0;
while {true} do {
    _playerCombat = player;
    _isInCombat = _playerCombat getVariable["startcombattimer",0];
    _inVehicle = (vehicle player != player);
    _dangerNear = (getPosATL player) nearEntities [["zZombie_Base","CAManBase"],35];
    _dialog = findDisplay 106;
if ( !(isNull _dialog) ) then {
_playerCombat setVariable["startcombattimer", 1, true];
};
//Make sure player is not detecting self
if (player in _dangerNear) then {
_dangerNear set [0, player];
_dangerNear = _dangerNear - [player];
};
//Any zombies, players near 25 meters?
if (count _dangerNear > 0) then {
    {
    _dangerClosest = _dangerNear select _cnt;
    if (_dangerClosest distance player < 15) then {_playerCombat setVariable["startcombattimer", 1, true];};
    _cnt = _cnt + 1;
    if (_cnt >= (count _dangerNear)) then {_cnt = 0};
    } foreach _dangerNear;
};
sleep 5;
};