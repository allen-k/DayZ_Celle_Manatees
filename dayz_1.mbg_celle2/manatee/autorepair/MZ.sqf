//Edited by =82nd=Dlcoates1 for Mattz for DayZ
private ["_config","_count","_i","_magazines","_object","_type","_type_name","_OldFuel"];
_object = _this select 0;
_type = typeof _object;
_OldFuel = fuel _object;
if (_object isKindOf "ParachuteBase") exitWith {};
if (!alive _object) exitWith {};
_object setVehicleAmmo 1;    // Reload turrets / drivers magazine
_type_name = typeOf _object;
_object vehicleChat format ["Reloading, Repairing, and Refueling %1... Please stand by...", _type];
sleep 6;
_object setFuel 0;
sleep 6;
_object vehicleChat format ["This does take time... Please stand by...", _type];
sleep 6;
_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");
if (count _magazines > 0) then {
    _removed = [];
    {
        if (!(_x in _removed)) then {
            _object removeMagazines _x;
            sleep 12;
            _removed set [count _removed, _x];
        };
    } forEach _magazines;
    {
        _object vehicleChat format ["Reloading %1", _x];
        sleep 13;
        if (!alive _object) exitWith {};
        _object addMagazine _x;
    } forEach _magazines;
};
_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");
if (_count > 0) then {
    for "_i" from 0 to (_count - 1) do {
        scopeName "xx_reload2_xx";
        _config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
        _magazines = getArray(_config >> "magazines");
        _removed = [];
        {
            if (!(_x in _removed)) then {
                _object removeMagazines _x;
                _removed set [count _removed, _x];
            };
        } forEach _magazines;
        {
            _object vehicleChat format ["Reloading %1", _x];
            sleep 15;
            if (!alive _object) then {breakOut "xx_reload2_xx"};
            _object addMagazine _x;
            sleep 14;
            if (!alive _object) then {breakOut "xx_reload2_xx"};
        } forEach _magazines;
        _count_other = count (_config >> "Turrets");
        if (_count_other > 0) then {
            for "_i" from 0 to (_count_other - 1) do {
                _config2 = (_config >> "Turrets") select _i;
                _magazines = getArray(_config2 >> "magazines");
                _removed = [];
                {
                    if (!(_x in _removed)) then {
                        _object removeMagazines _x;
                        _removed set [count _removed, _x];
                    };
                } forEach _magazines;
                {
                    _object vehicleChat format ["Reloading %1", _x];
                    sleep 15;
                    if (!alive _object) then {breakOut "xx_reload2_xx"};
                    _object addMagazine _x;
                    sleep 15;
                    if (!alive _object) then {breakOut "xx_reload2_xx"};
                } forEach _magazines;
            };
        };
    };
};
_object setVehicleAmmo 1;
_object vehicleChat format ["Your vehicle has been rearmed... Beginning repairs...  Please stand by...", _type];
sleep 6;
_object vehicleChat format ["Repairing %1... Please stand by...", _type];
sleep 60;
_object setDamage 0;    // Fix Vehicle
_object vehicleChat format ["Your vehicle has been repaired... Beginning refueling process...", _type];
sleep 6;
_object vehicleChat format ["Refueling %1... Please stand by...", _type];
sleep 60;
_object setFuel 1;
if (!alive _object) exitWith {};
_object vehicleChat format ["Your vehicle has been repaired, rearmed, and refueled... It is now safe to take off...", _type];
if (true) exitWith {};