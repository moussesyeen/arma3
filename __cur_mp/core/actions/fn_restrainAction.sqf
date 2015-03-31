/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_unit","_allowCop"];
_allowCop = [_this,0,ObjNull] call BIS_fnc_param;
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if(side _unit == west && !(_allowCop)) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

_unit setVariable["restrained",true,true];
_unit setVariable["restrainedType","cuff",true];
[[player], "life_fnc_restrain", _unit, false] spawn life_fnc_MP;
[[0,format[localize "STR_NOTF_Restrained",_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;