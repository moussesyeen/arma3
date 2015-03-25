private["_display","_list","_uid","_data","_amount"];
disableSerialization;

_display = findDisplay 80000;
_name = ctrlText 80005;
_rightList = _display displayCtrl 80006;

_arr =
[
	_name,
	playerSide
];

_weapons = [];
_magazines = [];
_clothing = [];

for "_i" from 0 to (lbSize 80006) step 1 do {
	_item = lbData[80006, _i];
	_data = call compile format["%1", _item];
	
	if (count _data == 1) then {
		_clothing set [count _clothing, _data select 0];
	} else {
		_weaponConfigEntry = configFile >> "CfgWeapons" >> (_data select 0);
		_configName = configName(_weaponConfigEntry);
		_weaponName = "";
		_model = "";
		_pic = "";
		
		if (isNil _configName && _configName == "") then {
			// Magazine
			_magazines set[count _magazines, [_data select 0, _data select 2]];
		} else {
			// Weapon
			_weapons set[count _weapons, _data select 0];
		};
	};
};

_arr set[2, _weapons];
_arr set[3, _magazines];
_arr set[4, _clothing];


_existingLoadouts = profileNamespace getVariable["loadouts", []];
_existingLoadouts set[count _existingLoadouts, _arr];
profileNamespace setVariable["loadouts", _existingLoadouts];

hint "Your loadout has been saved.";

closeDialog 0;

[] spawn life_fnc_loadoutMenu;