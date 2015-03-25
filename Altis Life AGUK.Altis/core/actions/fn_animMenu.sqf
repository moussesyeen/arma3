/* 
	File: fn_animMenu.sqf
*/

_menu = _this select 0;

_anims = [
	["Pushups","AmovPercMstpSnonWnonDnon_exercisePushup"],
	["Ninja Dance","AmovPercMstpSnonWnonDnon_exerciseKata"],
	["Knee Bends (Fast)","AmovPercMstpSnonWnonDnon_exercisekneeBendB"],
	["Knee Bends (Normal)","AmovPercMstpSnonWnonDnon_exercisekneeBendA"],
	["Scared","AmovPercMstpSnonWnonDnon_Scared"],
	["Scared","AmovPercMstpSnonWnonDnon_Scared2"]
];
disableSerialization;
if(_menu) then {

	//Check to see if they can still do the action.
	if(player getVariable ["restrained",false]) exitWith {closeDialog 0;};
	if(player getVariable ["escorting",false]) exitWith {closeDialog 0;};
	if(animationState player == "incapacitated") exitWith {closeDialog 0;};
	if(life_istazed) exitWith {closeDialog 0;};
	if(life_action_inUse) exitWith {closeDialog 0;};	
	if(!alive player) exitWith {closeDialog 0;};
	
	//Get the list from the dialog.
	_animListDiag = findDisplay 13750;
	_animList = _animListDiag displayCtrl 13751;
	_id = lbCurSel (_animList);
	if(_id == -1) exitWith {};
	_arr = _anims select _id;
	player playMoveNow (_arr select 1);
	closeDialog 0;
} else {
	if(dialog) exitWith {}; //Fix dialog
	createDialog "animMenu";

	//Before opening check if they can.
	if(player getVariable ["restrained",false]) exitWith {closeDialog 0;};
	if(player getVariable ["escorting",false]) exitWith {closeDialog 0;};
	if(animationState player == "incapacitated") exitWith {closeDialog 0;};
	if(life_istazed) exitWith {closeDialog 0;};	
	if(life_action_inUse) exitWith {closeDialog 0;};
	if(!alive player) exitWith {closeDialog 0;};	
	_animListDiag = findDisplay 13750;
	_animList = _animListDiag displayCtrl 13751;
	//Add all the animations into the list.
	{
		_animList lbAdd format["%1",_x select 0];
	} forEach _anims;
};