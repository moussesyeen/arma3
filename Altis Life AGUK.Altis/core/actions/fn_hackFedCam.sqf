/*
	File: fn_hackFedCam.sqf
	Author: Maximum
	
	Description:
	Hacks the fed camera.
*/
_console = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _console) exitWith {};
if(playerSide != civilian) exitWith {};
if(life_fed_hacked) exitWith {hint "The camera is already disabled!";};
life_action_inUse = true;
_upp = "Hacking security camera.";
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
while{true} do
{
	sleep 0.05;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance _console > 10) exitWith {};
	if(!alive player) exitWith {};
	if(life_istazed) exitWith {};
	if(life_interrupted) exitWith {};
};
5 cutText ["","PLAIN"];

if(player distance _console > 10) exitWith {hint "You went too far away..."; life_action_inUse = false;};
if(!alive player) exitWith {life_action_inUse = false;};
if(life_istazed) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_action_inUse = false; life_interrupted = false;};
[[],"TON_fnc_securityCamsDisable",false,false] spawn life_fnc_MP;
hint "The security at the bank is disabled for around 20 minutes.";
life_action_inUse = false