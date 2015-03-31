/*
	File: fn_getDPMission.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_dp","_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(str(_target) in gsn_dp_points) then
{
	private["_point"];
	_point = gsn_dp_points - [(str(_target))];
	_dp = _point call BIS_fnc_selectRandom;
}
	else
{
	_dp = gsn_dp_points call BIS_fnc_selectRandom;
};

life_dp_start = _target;

gsn_delivery_in_progress = true;
gsn_dp_point = call compile format["%1",_dp];

_dp = [_dp,"_"," "] call KRON_Replace;
gsn_cur_task = player createSimpleTask [format["Delivery_%1",gsn_dp_point]];
gsn_cur_task setSimpleTaskDescription [format[localize "STR_NOTF_DPStart",toUpper _dp],"Delivery Job",""];
gsn_cur_task setTaskState "Assigned";
player setCurrentTask gsn_cur_task;
_text = format["%1",gsn_dp_point];
gsn_cur_task setSimpleTaskDestination (getMarkerPos _text);

["DeliveryAssigned",[format[localize "STR_NOTF_DPTask",toUpper _dp]]] call bis_fnc_showNotification;

[] spawn
{
	waitUntil {!gsn_delivery_in_progress OR !alive player};
	if(!alive player) then
	{
		gsn_cur_task setTaskState "Failed";
		player removeSimpleTask gsn_cur_task;
		["DeliveryFailed",[localize "STR_NOTF_DPFailed"]] call BIS_fnc_showNotification;
		gsn_delivery_in_progress = false;
		gsn_dp_point = nil;
	};
};