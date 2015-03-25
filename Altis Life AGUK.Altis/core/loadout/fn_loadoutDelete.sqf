private[];

_display = findDisplay 70000;
_data = lbData[70002,(lbCurSel 70002)];
_data = call compile format["%1", _data];

_arr = profileNamespace getVariable["loadouts", []];

_newArr = [];

{
	if (_x select 0 != _data select 0) then {
		_newArr set[count _newArr, _x];
	};
} forEach _arr;


profileNamespace setVariable["loadouts", _newArr];

closeDialog 0;

[] spawn life_fnc_loadoutMenu;