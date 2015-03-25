waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Author: Some French Guy named Osef I presume, given the variable on the status bar
	Edited by: [midgetgrimm]
	Description: Puts a small bar in the bottom right of screen to display in-game information

*/
3 cutRsc["osefStatusBar","PLAIN"];

[] spawn {
	uiSleep 5;
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		uiSleep 1;
		_uptime = [time,"HH:MM:SS"] call BIS_fnc_secondsToString;
		_counter = _counter - 1;
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetStructuredText parseText format["||<t color='#D3FFCE'>Esport Life TH</t> | <t color='#ccff00'>TS3: altislifeesport.ts3sv.com</t> | <t color='#4752e0'>Cops: %1</t> | <t color='#bf7e00'>Civs: %2</t> | <t color='#dc143c'>Medics: %3</t> | <t color='#00DD00'>CASH: %4</t> | <t color='#00DD00'>BANK: %5</t> | <t color='#a028f7'>GRIDREF: %6</t> | <t color='#fbf896'>FPS: %7</t>||", west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits,[life_cash] call life_fnc_numberText,[life_atmbank] call life_fnc_numberText,mapGridPosition player,round diag_fps];
	};
};