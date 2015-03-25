
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "life_loadout_menu";

_display = findDisplay 70000;
_list = _display displayCtrl 70002;
ctrlShow[70003, false];
lbClear _list;
_units = [];

_loadouts = profileNamespace getVariable["loadouts", []];

if (count _loadouts <= 0) exitWith { hint "No loadouts found."; };

{
	if (playerSide == _x select 1) then {
		_list lbAdd format["%1", (_x select 0)];
		_list lbSetData [(lbSize _list)-1,str(_x)];
	};
} forEach _loadouts;