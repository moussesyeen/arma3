/*
	File: fn_hudSetup.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_display","_alpha","_version","_p","_pg"];
disableSerialization;
_display = findDisplay 46;
_alpha = _display displayCtrl 1001;
_version = _display displayCtrl 1000;

2 cutRsc ["playerHUD","PLAIN"];
3 cutRsc ["crewListing","PLAIN"];
4 cutRsc ["osefStatusBar","PLAIN"];

_version ctrlSetText format["BETA: 0.%1.%2",(productVersion select 2),(productVersion select 3)];
[] call life_fnc_hudUpdate;
[] spawn life_fnc_crewListing;
[] spawn life_fnc_statusBar;

[] spawn
{
	private["_dam"];
	while {true} do
	{
		_dam = damage player;
		waitUntil {(damage player) != _dam};
		[] call life_fnc_hudUpdate;
	};
};