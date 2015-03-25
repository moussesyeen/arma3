#include <macro.h>
/*
	File: fn_captureHideout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah blah.
*/
private["_group","_flag","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_markername","_gangname2"];

_flag = _this select 0;
_group = _flag getVariable ["gangOwner",grpNull];

if(isNil {grpPlayer getVariable "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"];};
if(_group == grpPlayer) exitWith {titleText[localize "STR_GNOTF_Controlled","PLAIN"]};
if((_flag getVariable ["inCapture",FALSE])) exitWith {hint localize "STR_GNOTF_Captured";};
if(!isNull _group) then {
	_gangName = _group getVariable ["gang_name",""];
	_action = [
		format[localize "STR_GNOTF_AlreadyControlled",_gangName],
		localize "STR_GNOTF_CurrentCapture",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;
	
	_cpRate = 0.0045;
} else {
	_cpRate = 0.0075;
};

if(!isNil "_action" && {!_action}) exitWith {titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"];};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_GNOTF_Capturing";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

_flag spawn {
	for "_i" from 0 to 30 do {
		sleep 1.2;
		[[_this,"Alarm",150],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	};
};

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	_flag setVariable["inCapture",true,true];
	if(_cP >= 1 OR !alive player) exitWith {_flag setVariable["inCapture",false,true];};
	if(life_istazed) exitWith {_flag setVariable["inCapture",false,true];}; //Tazed
	if(life_interrupted) exitWith {_flag setVariable["inCapture",false,true];};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_flag setVariable["inCapture",false,true];};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_flag setVariable["inCapture",false,true];};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"]; life_action_inUse = false;_flag setVariable["inCapture",false,true];};
life_action_inUse = false;
titleText["Hideout has been captured.","PLAIN"];
_flagTexture = [
	"\A3\Data_F\Flags\Flag_red_CO.paa",
	"\A3\Data_F\Flags\Flag_green_CO.paa",
	"\A3\Data_F\Flags\Flag_blue_CO.paa",
	"\A3\Data_F\Flags\flag_fd_red_CO.paa",
	"\A3\Data_F\Flags\flag_fd_green_CO.paa",
	"\A3\Data_F\Flags\flag_fd_blue_CO.paa",
	"\A3\Data_F\Flags\flag_fd_orange_CO.paa"
] call BIS_fnc_selectRandom;
_flag setFlagTexture _flagTexture;
[[[0,1],format[localize "STR_GNOTF_CaptureSuccess",name player,(group player) getVariable "gang_name" ]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
 
//CL - Generate a marker to say who controls the hideout at that time. Good to bring more RP with enemy and friendly gangs.
_markername = str(getPos _flag);
_gangname2 = formatText["Captured by: %1",(group player) getVariable "gang_name"];
if (getMarkerColor _markername == "") then 
{
	gang_owner_marker = createMarker [_markername, position player]; 
	_markername setMarkerShape "ICON"; 
	_markername setMarkerType "hd_warning"; 
	_markername setMarkerColor "ColorRed"; 
	_markername setMarkerText str(_gangname2);
	gang_owner_marker = "";
}
else 
{
	_markername setMarkerText str(_gangname2);
};


_flag setVariable["inCapture",false,true];
_flag setVariable["gangOwner",grpPlayer,true];
_flag setVariable["gangOwnerId",grpPlayer getVariable "gang_id",true];