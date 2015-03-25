/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for lock-picking.
*/
private["_unit","_string","_isPlayer","_title","_progressBar","_cP","_ui","_titleText","_dice","_badDistance"];
_unit = cursorTarget;
_string = "Handcuffs";

life_interrupted = false;
if(life_action_inUse) exitWith {};

if(isNil "_unit" OR isNull _unit) exitWith {};
if(!(isPlayer _unit)) exitWith {};
if(player distance _unit > 2) exitWith {};
if(!(_unit getVariable["restrained",false])) exitWith {};
_isPlayer = if(isPlayer _unit) then {true} else {false};

_title = format[localize "STR_ISTR_Lock_Process",_string];
life_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_string];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

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
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _unit > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};

life_action_inUse = false;

_dice = random(100);
if(_dice < 70) then 
{
    titleText[localize "STR_ISTR_HandcuffsLock_Success","PLAIN"];
	_unit setVariable["restrained",false,true];
	_unit setVariable["Escorting",false,true];
	_unit setVariable["transporting",false,true];
	[[getPlayerUID player,profileName,"486"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
} else {
	titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
	[[getPlayerUID player,profileName,"485"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
}; 
