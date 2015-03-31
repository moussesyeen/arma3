/*
	File: fn_wantedGrab.sqf
	Author: ColinM
*/
private["_display","_tab","_criminal"];
disableSerialization;
_display = findDisplay 2400;
_tab = _display displayCtrl 2402;
_criminal = lbData[2401,(lbCurSel 2401)];
_criminal = call compile format["%1", _criminal];
if(isNil "_criminal") exitWith {hint "Failed to fetch crimes";};
if(typeName _criminal != "ARRAY") exitWith {hint "Failed to fetch crimes";};
if(count _criminal == 0) exitWith {hint "Failed to fetch crimes";};

[[player,_criminal],"life_fnc_wantedCrimes",false,false] spawn life_fnc_MP;