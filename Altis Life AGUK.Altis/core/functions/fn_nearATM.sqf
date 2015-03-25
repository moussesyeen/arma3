/* 
	File: fn_nearATM.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-07 16:32:31
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-08 14:31:49
*/
if(time - life_atm_lastCheckTime < 0.75) exitWith {life_atm_lastCheckResult}; 

_near = nearestObjects[player,[],3];
_ret = false;
{
	if(typeOf _x == "" && {["atm_",str(_x)] call BIS_fnc_inString}) exitWith {_ret = true;};
} forEach _near;

life_atm_lastCheckResult = _ret;
life_atm_lastCheckTime = time;
_ret;