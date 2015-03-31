/*
	File: fn_wantedInfo.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_display","_list","_crimes","_bounty","_mylist","_data"];
disableSerialization;

_data = [_this,0,[],[[]]] call BIS_fnc_param;
_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_mylist = [];
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {hint "Failed to fetch crimes";};
if(typeName _data != "ARRAY") exitWith {hint "Failed to fetch crimes";};
if(count _data == 0) exitWith {hint "Failed to fetch crimes";};
lbClear _list;

_crimes = _data select 0;
_bounty = _data select 1;

{
	_crime = _x;
	if(!((_crime select 0) in _mylist)) then
	{
		_mylist pushBack (_crime select 0);
		_list lbAdd format["%1 count(s) of %2 [%3]",{(_x select 0) == (_crime select 0)} count _crimes,(_crime select 0),(_crime select 1)];
		_list lbSetData [(lbSize _list)-1,str(_crime select 2)];
	};
} foreach _crimes;

ctrlSetText[2408,format["$%1",[(_bounty * 2)] call life_fnc_numberText]];
ctrlSetText[2403,format["$%1",[_bounty] call life_fnc_numberText]];