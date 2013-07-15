private["_temp","_diff","_dateNow","_deathTime","_body","_name","_method","_methodStr"];
_body =    _this select 3;
_name =    _body getVariable["bodyName","unknown"];
_method =    _body getVariable["deathType","unknown"];
_deathTime =    _body getVariable["deathTime",-1];
_methodStr = localize format ["str_death_%1",_method];
 
//diag_log ("STUDY: deathtime " +str(_deathTime));
if (_deathTime < 0) then {
    _temp = ""; // empty if no time of death
} else {
    _dateNow = (DateToNumber date);
    _diff = (_dateNow - _deathTime) * 525948;
 
    _temp = "The body is freezing cold (>30 Min).";
 
    if ( _diff < 30 ) then {
        _temp = "The body is cold (<30 Min).";
    };
 
    if ( _diff < 15 ) then {
        _temp = "The body is slightly warm (<15 Min).";
    };
 
    if ( _diff < 5 ) then {
        _temp = "The body is still warm (<5 Min).";
    };
};
 
 
//cutText [format["His name was %1 It appears he died from unknown causes %2. %3",_name,_methodStr,_temp], "PLAIN DOWN"];
cutText [format["His name was %1. %2",_name,_temp], "PLAIN DOWN"];