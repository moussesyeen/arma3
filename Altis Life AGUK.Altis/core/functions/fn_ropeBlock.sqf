#include <Macro.h>
/*
	File: fn_ropeBlock.sqf
	Author: Maxi
	
	Description:
	If it is not in the allowed list for lifting, stop them!
*/
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //The fuck...
if(isNil 'life_slingload_allowed') exitWith {};
_type = typeOf _vehicle;

if(!(typeOf _vehicle in FETCH_CONST(life_slingload_allowed)) && playerSide != west) then {
	_vehicle enableRopeAttach false;
};