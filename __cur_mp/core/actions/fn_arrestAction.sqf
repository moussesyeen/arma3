/*
	File: fn_arrestAction.sqf
*/
private["_unit","_id"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(isNil "_unit") exitwith {};
if(!(_unit isKindOf "Man")) exitWith {};
if(!isPlayer _unit) exitWith {};
if(!(_unit getVariable "restrained")) exitWith {};
if(!((side _unit) in [civilian,independent])) exitWith {};
if(vehicle player != player) exitWith {};


[[getPlayerUID _unit,_unit,player,false],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;

detach _unit;
[[_unit,false],"life_fnc_jail",_unit,false] spawn life_fnc_MP;
[[0,format[localize "STR_NOTF_Arrested_1", _unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;