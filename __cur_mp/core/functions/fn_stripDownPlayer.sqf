/*
	File: fn_stripDownPlayer.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
*/
_player = [_this,0,objNull,[]] call BIS_fnc_param;
if(isNil "_player" OR isNull _player OR !isPlayer _player) then
{
	_player = player;
};

RemoveAllWeapons _player;
{_player removeMagazine _x;} foreach (magazines _player);
removeUniform _player;
removeVest _player;
removeBackpack _player;
removeGoggles _player;
removeHeadGear _player;

{
	_player unassignItem _x;
	_player removeItem _x;
} foreach (assignedItems _player);

if(hmd _player != "") then {
	_player unlinkItem (hmd _player);
};