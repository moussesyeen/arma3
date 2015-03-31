/*
	File: fn_pardon_selected.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_display","_list","_uid","_uids"];
disableSerialization;

_display = findDisplay 2400;
_list = _display displayCtrl 2402;

_crimeID = lbData[2402,(lbCurSel 2402)];
_crimeID = call compile format["%1", _crimeID];

_uids = lbData[2401,(lbCurSel 2401)];
_uids = call compile format["%1", _uids];

if(isNil "_crimeID") exitWith {};
if(count _crimeID == 0) exitWith {};

if(isNil "_uids") exitWith {};
if(typeName _uids != "ARRAY") exitWith {};
if(count _uids == 0) exitWith {};

_uid = _uids select 0;
[[_uid,_crimeID],"life_fnc_wantedRemoveItem",false,false] spawn life_fnc_MP;