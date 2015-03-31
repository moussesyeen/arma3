
#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_display","_list","_name","_bounty","_units","_crimes"];
disableSerialization;

createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
_players = _display displayCtrl 2406;
lbClear _list;
_units = [];

lbClear _players;

{
    _side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"};  case independent: {"EMS"}; default {"???"};};
    if(_side == "Civ") then
	{
		_players lbAdd format["%1", name _x];
    	_players lbSetdata [(lbSize _players)-1,str(_x)];
	};
} foreach ([] call life_fnc_getSortedPlayers);

_list2 = getControl(2400,2407);
_pardon = getControl(2400,2405);
if(playerSide != west) then
{
	_pardon ctrlShow false;
};
lbClear _list2;

{
	_list2 lbAdd format["%1 [%2]",(_x select 1),(_x select 2)];
	_list2 lbSetData [(lbSize _list2)-1,(_x select 0)];
} foreach (__GETC__(gsn_crimes_array));

ctrlSetText[2404,"Establishing connection..."];
_add = getControl(2400,9800);
if(__GETC__(life_coplevel) < 2 && __GETC__(life_adminlevel) == 0) then
{
	ctrlShow[2405,false];
	_add ctrlShow false;
	_pardon ctrlShow false;
};

[[player],"life_fnc_wantedFetch",false,false] spawn life_fnc_MP;
