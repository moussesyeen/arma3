#include <macro.h>
/*
	File: fn_seizeWeaponsClient.sqf
	Author: Maximum
	
	Description:
	"Seizes" the weapons
*/
private["_unit"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_mode = [_this,1,false,[false]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(side _unit != west) exitWith {};

if(_mode) then {
	if(primaryWeapon player == "") exitWith {[[0,"No primary weapon was found to remove!"],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;};
	player removeWeapon (primaryWeapon player); //Remove that primary!
	[[0,"Removed primary weapon from player!"],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
} else {
	if(handgunWeapon player == "") exitWith {[[0,"No handgun was found to remove!"],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;};
	player removeWeapon (handgunWeapon player); //Remove that handgun!
	[[0,"Removed handgun from player!"],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;	
};