/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "restrained")) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};

_unit setVariable["restrained",true,true];
_unit setVariable["restrainedType","zip",true];
[[player], "life_fnc_zipTie", _unit, false] spawn life_fnc_MP;
[[getPlayerUID player,player getVariable["realname",name player],"16"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
hint "You have been added to the wanted list for kidnapping";
[[0,format[localize "STR_NOTF_ZipTied",_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;