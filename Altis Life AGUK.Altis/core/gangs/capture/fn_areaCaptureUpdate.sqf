/* 
	Name: fn_areaCaptureUpdate.sqf
	Desc: Updates the GUI.
*/
if(life_capture_point == -1) exitWith {
	5 cutText ["","PLAIN"];
};
_gangArea = life_config_gangArea select life_capture_point;
_areaID = [_gangArea,0,0,[0]] call BIS_fnc_param;
_mapMarker = [_gangArea,1,"",[""]] call BIS_fnc_param;
_areaName = [_gangArea,2,"Error: Gang Hideout Error",[""]] call BIS_fnc_param;
_currentGang = [_gangArea,3,grpNull,[grpNull]] call BIS_fnc_param;
_currentCapture = [_gangArea,4,0,[0]] call BIS_fnc_param;
_currentCaptureGroup = [_gangArea,5,grpNull,[grpNull]] call BIS_fnc_param;
_gangName = _currentGang getVariable["gang_name","Police"];
_captureGangName = _currentCaptureGroup getVariable["gang_name","Police"];
if(_currentCapture == 0) then {_captureGangName = _gangName; _currentCapture = 100;};

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%1 are %3%2 through the capture process.",_captureGangName,"%",_currentCapture];
_progress progressSetPosition (_currentCapture / 100);