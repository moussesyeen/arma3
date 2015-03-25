/* 
	Name: fn_areaCapture.sqf
	Desc: Makes the player begin the capture for their gang.
*/
_gangAreaID = [_this,0,-1,[0]] call BIS_fnc_param;
life_capture_point = _gangAreaID;

if(playerSide == civilian && (group player) getVariable["gang_id",-1] == -1) exitWith {hint "You are not in a gang, so you will not capture this area!";};
if(playerSide == independent) exitWith {};

//If they are exiting the gang area, take off the overlay.
if(_gangAreaID == -1) exitWith {
	player setVariable["incapture",false,true];
	hint "You have left the territory control area.";
	5 cutText ["","PLAIN"];
};

if((count life_config_gangArea)-1 < _gangAreaID) exitWith {systemChat "Gang Area Error: Configuration not found for this zone.";};
player setVariable["incapture",true,true];
_gangArea = life_config_gangArea select (_gangAreaID);

_areaID = [_gangArea,0,0,[0]] call BIS_fnc_param;
_mapMarker = [_gangArea,1,"",[""]] call BIS_fnc_param;
_areaName = [_gangArea,2,"Error: Gang Hideout Error",[""]] call BIS_fnc_param;
_currentGang = [_gangArea,3,grpNull,[grpNull]] call BIS_fnc_param;
_currentCapture = [_gangArea,4,0,[0]] call BIS_fnc_param;
_currentCaptureGroup = [_gangArea,5,grpNull,[grpNull]] call BIS_fnc_param;
_gangName = _currentGang getVariable["gang_name","Police"];
_captureGangName = _currentCaptureGroup getVariable["gang_name","Police"];
if(_currentCapture == 0) then {_captureGangName = _gangName; _currentCapture = 100;};

if(_gangName == "Police") then {_gangName = format["<t color='#316dff'>%1</t>",_gangName];} else {_gangName = format["<t color='#FFCC00'>%1</t>",_gangName];};

hint parseText format["<t size='2' align='center' color='#FF0000'>Gang Capture</t><br/><br/>You are currently capturing this area. (Current Owner: %1)",_gangName];

//Handles the capturing of the gang hideout.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%1 are %3%2 through the capture process.",_captureGangName,"%",_currentCapture];
_progress progressSetPosition (_currentCapture / 100);