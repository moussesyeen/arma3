uiSleep 1;
_counter = 180;
_timeSinceLastUpdate = 0;
while {true} do
{
	uiSleep 1;
	_uptime = [time,"HH:MM:SS"] call BIS_fnc_secondsToString;
	_counter = _counter - 1;
	((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetStructuredText parseText format["||<t color='#888888'> Uptime: %1</t> | <t color='#0044CC'>Cops: %2</t> | <t color='#A12b84'>Civs: %3</t> | <t color='#FF0000'>Medics: %4</t> | <t color='#00DD00'>CASH: %5</t> | <t color='#00DD00'>BANK: %6</t> | <t color='#963A65'>GRIDREF: %7</t> | <t color='#999999'>FPS: %8</t> | <t color='#198aeb'>%9</t> ||", _uptime, west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits,[gsn_life_cash] call life_fnc_numberText,[gsn_lifeatm_cash] call life_fnc_numberText,mapGridPosition player,round diag_fps,player getVariable ["realname",name player]];
};