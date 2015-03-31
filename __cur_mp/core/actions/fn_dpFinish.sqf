/*
	File: fn_dpFinish.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_dp","_dis","_price"];
_dp = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
gsn_delivery_in_progress = false;
gsn_dp_point = nil;
_dis = round((getPos life_dp_start) distance (getPos _dp));
_price = round(1.7 * _dis);

["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_1"),[_price] call life_fnc_numberText]]] call bis_fnc_showNotification;
gsn_cur_task setTaskState "Succeeded";
player removeSimpleTask gsn_cur_task;
[_price,0,0] call life_fnc_handleMoney;