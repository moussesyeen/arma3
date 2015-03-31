/*
	File: fn_settingsInit.sqf
	Author: Bryan "Tonic" Boardwine
*/
tawvd_foot = viewDistance;
tawvd_car = viewDistance;
tawvd_air = viewDistance;
tawvd_addon_disable = true;

[] spawn
{
	private["_recorded"];
	while {true} do
	{
		_recorded = vehicle player;
		if(vehicle player != _recorded OR !alive player) then {
			[] call life_fnc_updateViewDistance;
		};
		uiSleep 2.2;
	};
};