_vehicle = vehicle player;
_dir = getDir _vehicle;
_playerPos = position
_vehicle; _position = [(_playerPos select 0) + (-25 * sin(_dir)), (_playerPos select 1) + (-25 * cos(_dir)), (_playerPos select 2) - 10];
moveOut player;
waitUntil {!(player in _vehicle)};
player setPos _position;
player spawn bis_fnc_halo; 