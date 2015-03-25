/*
	File: fn_wantedGrab.sqf
	Author: ColinM
	
	Description:
	Prepare the array to query the crimes.
*/
private["_display","_tab","_criminal"];
disableSerialization;
_display = findDisplay 2650;
_tab = _display displayCtrl 2692;
_criminal = lbData[2691,(lbCurSel 2691)];
_criminal = call compile format["%1", _criminal];

[[player,_criminal],"life_fnc_wantedCrimes",false,false] spawn life_fnc_MP; 