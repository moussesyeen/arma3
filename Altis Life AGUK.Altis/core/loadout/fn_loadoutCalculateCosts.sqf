private[];

_loadout = [_this, 0, [], [[]]] call BIS_fnc_param;

_weapons = _loadout select 2;
_magazines = _loadout select 3;
_clothing = _loadout select 4;


_shopTypes = [];

switch (playerSide) do {
	case west:
	{
		_shopTypes set[count _shopTypes, "cop_basic"];
		_shopTypes set[count _shopTypes, "cop_sergeant"];
		_shopTypes set[count _shopTypes, "cop_patrol"];
	};
	case civilian:
	{
		if (license_civ_rebel) then {
			_shopTypes set[count _shopTypes, "rebel"];
		} else {
			_shopTypes set[count _shopTypes, "gun"];
		};
	};
};

_finalArray = [];

{
	_shop = _x;
	_shopResult = [_shop] call life_fnc_weaponShopCfg;
	
	if (typeName _shopResult == "STRING") exitWith {};
	_addArray = _shopResult select 1;
	
	{
		_entry = _x;
		{
			_exist = _x;
			if (_entry select 0 == _exist select 0) exitWith { _entry = []; };
		} forEach _finalArray;
		
		if (count _entry != 0) then {
			_finalArray set[count _finalArray, _entry];
		};
	} forEach _addArray;
} forEach _shopTypes;

// Now add clothing
_clothingArray = [];
switch (playerSide) do {
	case west:
	{
		_clothingArray = [0] call life_fnc_clothing_cop;
		_clothingArray = _clothingArray + ([1] call life_fnc_clothing_cop);
		_clothingArray = _clothingArray + ([2] call life_fnc_clothing_cop);
		_clothingArray = _clothingArray + ([3] call life_fnc_clothing_cop);
		_clothingArray = _clothingArray + ([4] call life_fnc_clothing_cop);
	};
	case east:
	{
		if (license_civ_rebel) then {
			_clothingArray = [0] call life_fnc_clothing_reb;
			_clothingArray = _clothingArray + ([1] call life_fnc_clothing_reb);
			_clothingArray = _clothingArray + ([2] call life_fnc_clothing_reb);
			_clothingArray = _clothingArray + ([3] call life_fnc_clothing_reb);
			_clothingArray = _clothingArray + ([4] call life_fnc_clothing_reb);
		} else {
			_clothingArray = [0] call life_fnc_clothing_bruce;
			_clothingArray = _clothingArray + ([1] call life_fnc_clothing_bruce);
			_clothingArray = _clothingArray + ([2] call life_fnc_clothing_bruce);
			_clothingArray = _clothingArray + ([3] call life_fnc_clothing_bruce);
			_clothingArray = _clothingArray + ([4] call life_fnc_clothing_bruce);
		};
	};
};

_finalArray = [_finalArray,[],
{
	_weaponConfigEntry = configFile >> "CfgWeapons" >> (_x select 0);
	_configName = configName(_weaponConfigEntry);
	_type = getNumber(configFile >> "CfgWeapons" >> _configName >> "type");
	
	_type;
},
"ASCEND"] call BIS_fnc_sortBy;

fn_findCost = {
	_className = _this select 0;
	_list = _this select 1;
	
	_return = -1;
	{
		if ((_x select 0) == _className) exitWith { _return = _x select 2; };
	} forEach _list;
	
	_return;
};


_costs = 0;


_bail = false;
{
	_cost = [_x, _finalArray] call fn_findCost;
	if (_cost == -1) exitWith { diag_log format["%1 was -1 in weapons", _x]; _bail = true; };
	_costs = _costs + _cost;
} forEach _weapons;

{
	_cost = [_x select 0, _finalArray] call fn_findCost;
	if (_cost == -1) exitWith { diag_log format["%1 was -1 in mags", _x]; _bail = true; };
	_cost = _cost * (_x select 1);
	_costs = _costs + _cost;
} forEach _magazines;


{
	_cost = [_x, _clothingArray] call fn_findCost;
	
	if (_cost == -1) exitWith { diag_log format["%1 was -1 in cloths", _x]; _bail = true; };
	_costs = _costs + _cost;
} forEach _clothing;

if (_bail) exitWith {
	hint "This loadout is no longer valid.";
	
	_arr = profileNamespace getVariable["loadouts", []];
	_newArr = [];

	{
		if (_x select 0 != _loadout select 0) then {
			_newArr set[count _newArr, _x];
		};
	} forEach _arr;


	profileNamespace setVariable["loadouts", _newArr];
};

_costs;