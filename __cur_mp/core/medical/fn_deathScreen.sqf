/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_medicsOnline","_medicsNear","_respawn"];
disableSerialization;


_medicCount = [independent] call life_fnc_playerCount;
_respawn = ((findDisplay 7300) displayCtrl 7303);
_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);

waitUntil {
	_nearby = if(([independent,getPosATL player,120] call life_fnc_nearUnits)) then {"No"} else {"Yes"};
	_medicsOnline ctrlSetText format[localize "STR_Medic_Online",_medicCount];
	_medicsNear ctrlSetText format[localize "STR_Medic_Near",_nearby];
	if(_medicCount == 0) then
	{
		_respawn ctrlShow false;
	}
	else
	{
		_respawn ctrlShow true;
	};
	uiSleep 1;
	(isNull (findDisplay 7300))
};