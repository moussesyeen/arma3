/*
	File: fn_wantedList.sqf
	Author: Bryan "Tonic" Boardwine"
*/
private["_info","_display","_list",/*"_units",*/"_entry"];
disableSerialization;
_info = [_this,0,[],[[]]] call BIS_fnc_param;
_display = findDisplay 2400;
_list = _display displayctrl 2401;
{
	_entry = _x;
	_list lbAdd format["%1", _entry select 1];
	_list lbSetData [(lbSize _list)-1,str(_entry)];
} forEach _info;

ctrlSetText[2404,"Connection Established"];

if(((lbSize _list)-1) == -1) then
{
	_list lbAdd "No criminals";
};