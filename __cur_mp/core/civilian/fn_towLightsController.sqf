/*
File: fn_towLightsController.sqf
Author: Bryan "Tonic" Boardwine
*/
private["_veh"];
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _veh) exitWith {};
if(!(typeOf _veh in ["C_Offroad_01_repair_F"])) exitWith {};
_trueorfalse = _veh getVariable["lights",false];
if(_trueorfalse) then {
	_veh setVariable["lights",false,true];
} else {
	_veh setVariable["lights",true,true];
	[[_veh,0.22],"life_fnc_towLights",true,false] call life_fnc_MP;
};