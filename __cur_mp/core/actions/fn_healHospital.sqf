/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
*/
if(gsn_life_cash < 100) exitWith {hint format[localize "STR_NOTF_HS_NoCash",100];};
titleText[localize "STR_NOTF_HS_Healing","PLAIN"];
uiSleep 8;
if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
player setdamage 0;
[100,0,1] call life_fnc_handleMoney;