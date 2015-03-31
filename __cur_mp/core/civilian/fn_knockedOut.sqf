/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts and monitors the knocked out state.
*/
private["_target","_who","_obj"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who == "") exitWith {};

life_interrupted = true;
titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];
uiSleep 1;
player playMoveNow "Incapacitated";
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
uiSleep 15;
player playMoveNow "amovppnemstpsraswrfldnon";
if(!(player getVariable["Escorting",false])) then {
	detach player;
};
deleteVehicle _obj;
player setVariable["robbed",FALSE,TRUE];