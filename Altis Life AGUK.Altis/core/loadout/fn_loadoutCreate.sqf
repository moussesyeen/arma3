private["_display","_list","_name","_crimes","_bounty","_units","_shopType"];
disableSerialization;

createDialog "life_loadoutCreate_menu";



_display = findDisplay 80000;
_list = _display displayCtrl 80002;

_shopTypes = [];

switch (playerSide) do {
	case west:
	{
		_shopTypes set[count _shopTypes, "cop_basic"];
	};
	case civilian:
	{
		if (license_civ_rebel) then {
			_shopTypes set[count _shopTypes, "rebel"];
		};
		
		if (license_civ_whitelisted) then {
			_shopTypes set[count _shopTypes, "whitelisted"];
		};
		
		if (license_civ_donator) then {
			_shopTypes set[count _shopTypes, "donator"];
		};
	};
	case independent:
	{
		_shopTypes set[count _shopTypes, "med_basic"];
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
	case civilian:
	{
		if (license_civ_rebel) then {
			_clothingArray = [0] call life_fnc_clothingrebel;
			_clothingArray = _clothingArray + ([1] call life_fnc_clothingrebel);
			_clothingArray = _clothingArray + ([2] call life_fnc_clothingrebel);
			_clothingArray = _clothingArray + ([3] call life_fnc_clothingrebel);
			_clothingArray = _clothingArray + ([4] call life_fnc_clothingrebel);
		};
		
		if (license_civ_donator) then {
			clothingArray = [0] call life_fnc_clothingrebel;
			_clothingArray = _clothingArray + ([1] call life_fnc_clothingrebel);
			_clothingArray = _clothingArray + ([2] call life_fnc_clothingrebel);
			_clothingArray = _clothingArray + ([3] call life_fnc_clothingrebel);
			_clothingArray = _clothingArray + ([4] call life_fnc_clothingrebel);
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
				
{
	_weaponConfigEntry = configFile >> "CfgWeapons" >> (_x select 0);
	_configName = configName(_weaponConfigEntry);
	_weaponName = "";
	_model = "";
	_pic = "";
	if (isNil _configName && _configName == "") then {
		// Magazines
		_weaponConfigEntry = configFile >> "CfgMagazines" >> (_x select 0);
		_configName = configName(_weaponConfigEntry);
		_weaponName = getText(configFile >> "CfgMagazines" >> _configName >> "displayName");
		_model = getText(configFile >> "CfgMagazines" >> _configName >> "model");
		_type = getNumber(configFile >> "CfgMagazines" >> _configName >> "type");
		_scope = getNumber(configFile >> "CfgMagazines" >> _configName >> "scope");
		_pic =  getText(configFile >> "CfgMagazines" >> _configName >> "picture");
	} else {
		// Weapons
		_weaponName = getText(configFile >> "CfgWeapons" >> _configName >> "displayName");
		_model = getText(configFile >> "CfgWeapons" >> _configName >> "model");
		_type = getNumber(configFile >> "CfgWeapons" >> _configName >> "type");
		_scope = getNumber(configFile >> "CfgWeapons" >> _configName >> "scope");
		_pic =  getText(configFile >> "CfgWeapons" >> _configName >> "picture");
	};
	
	_x set[count _x, 1];
	if ((_configName!="") && (_weaponName!="") && (_model!="") && (_pic!="")) then {
		_list lbAdd format["%1", _weaponName];
		_list lbSetData [(lbSize _list)-1,str(_x)];
		_list lbSetPicture [(lbSize _list)-1,_pic];
	};
} forEach _finalArray;

{
	_details = [_x select 0] call life_fnc_fetchCfgDetails;
	_details set[count _details, 1];
	if(isNil {_x select 1}) then
	{
		_list lbAdd format["%1",(getText(configFile >> (_details select 6) >> (_x select 0) >> "DisplayName"))];
	} else {
		_list lbAdd format["%1", _x select 1];
	};
	_pic = getText(configFile >> (_details select 6) >> (_x select 0) >> "picture");
	_list lbSetData [(lbSize _list)-1, str([_x select 0])];
	_list lbSetValue [(lbSize _list)-1,_x select 2];
	_list lbSetPicture [(lbSize _list)-1,_pic];
} forEach _clothingArray;
