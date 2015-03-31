/*
	Author: alleskapot

	Description: Sends AAN News to the player

*/
private["_display","_title","_name","_report"];
disableSerialization;
_title = _this select 0;
_name = _this select 1;
_report = _this select 2;
[parseText format["%1 Reporting: %2",_name,_title],parseText format["<t size='1.1'>%1 - %1 - %1</t>",_report]] spawn BIS_fnc_AAN;
uiSleep 20;
_display = uinamespace getvariable "BIS_AAN";
_display closeDisplay 0;