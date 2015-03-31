/*
	File: fn_robAction.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_target"];
_target = cursorTarget;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

if(_target getVariable["robbed",false]) exitWith {};
[[player],"life_fnc_robPerson",_target,false] spawn life_fnc_MP;
_target setVariable["robbed",TRUE,TRUE];