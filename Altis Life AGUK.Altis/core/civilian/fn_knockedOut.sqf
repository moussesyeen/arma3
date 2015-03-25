#include <macro.h>
/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts and monitors the knocked out state.
*/
private["_target","_who","_obj","_hndlBlur","_hndlGrain"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(EQUAL(_who,"")) exitWith {};

titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];
player switchMove "AcinPercMstpSnonWnonDnon_agony";
sleep 3.5;
player playMoveNow "Incapacitated";


_obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player); //WHY THE HELL WAS THIS BEING CREATED GLOBALLY?!?!?!!?!~?!?!?!?$@Q?G%@?$TGWGSXBG, BECAUSE IT WORK
_obj setPosATL ASLTOATL(visiblePositionASL player);
player attachTo [_obj,[0,0,0]];
_hndlBlur = ppEffectCreate ["DynamicBlur",450];
_hndlBlur ppEffectEnable true;
_hndlBlur ppEffectAdjust [30];
_hndlBlur ppEffectCommit 7;
_hndlGrain = ppEffectCreate ["filmGrain",450];
_hndlGrain ppEffectEnable true;
_hndlGrain ppEffectAdjust [1, 10, 4, 0, 0, true];
_hndlGrain ppEffectCommit 9;
sleep 13 + random 5;
_hndlBlur ppEffectAdjust [0];
_hndlBlur ppEffectCommit 3;
_hndlGrain ppEffectAdjust [0, 10, 4, 0, 0, true];
_hndlGrain ppEffectCommit 3;
ppEffectDestroy _hndlBlur;
ppEffectDestroy _hndlGrain;
player playMoveNow "amovppnemstpsraswrfldnon";
detach player;
deleteVehicle _obj;
player SVAR ["robbed",FALSE,TRUE];