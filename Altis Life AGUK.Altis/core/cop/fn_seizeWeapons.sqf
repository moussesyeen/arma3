#include <macro.h>
/*
	File: fn_seizeWeapons.sqf
	Author: Maximum
	
	Description:
	Sends the request to seize weapons to player.
*/
private["_unit"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(playerSide != west) exitWith {};

_action = [
	"Please select if you would like to take the players pistol or primary.",
	"Primary or Secondary?",
	"Primary",
	"Handgun"
] call BIS_fnc_guiMessage;

_msg = format[localize "STR_NOTF_RemovedWeapons",profileName,(_unit GVAR["realname",name _unit])];
[[0,_msg],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
[[player,_action],"life_fnc_seizeWeaponsClient",_unit,false] spawn life_fnc_MP;