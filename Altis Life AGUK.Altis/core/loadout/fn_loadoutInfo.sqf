private["_display","_list","_crimes","_bounty","_mylist"];
disableSerialization;

_display = findDisplay 70000;
_list = _display displayCtrl 70003;
_text = _display displayCtrl 70008;
lbClear 70003;
ctrlShow[70003, true];
_data = lbData[70002,(lbCurSel 70002)];
_data = call compile format["%1", _data];

/*[
	"Test",
	EAST,
	["srifle_EBR_ARCO_pointer_F","launch_B_Titan_F"],
	[
		["20Rnd_762x51_Mag",8],
		["Titan_AA",2]
	],
	["U_B_CombatUniform_wdl","B_Carryall_cbr","H_HelmetB"]
]*/
_weapons = _data select 2;
_magazines = _data select 3;
_clothing = _data select 4;

{
	_weaponConfigEntry = configFile >> "CfgWeapons" >> _x;
	_configName = configName(_weaponConfigEntry);
	
	_weaponName = getText(configFile >> "CfgWeapons" >> _configName >> "displayName");
	_model = getText(configFile >> "CfgWeapons" >> _configName >> "model");
	_type = getNumber(configFile >> "CfgWeapons" >> _configName >> "type");
	_scope = getNumber(configFile >> "CfgWeapons" >> _configName >> "scope");
	_pic =  getText(configFile >> "CfgWeapons" >> _configName >> "picture");

	if ((_configName!="") && (_weaponName!="") && (_model!="") && (_pic!="")) then {
		_list lbAdd format["%1", _weaponName];
		_list lbSetData [(lbSize _list)-1,str(_x)];
		_list lbSetPicture [(lbSize _list)-1,_pic];
	};
} forEach _weapons;

{
	_className = _x select 0;
	_count = _x select 1;

	_weaponConfigEntry = configFile >> "CfgWeapons" >> _className;
	_configName = configName(_weaponConfigEntry);
	// Magazines
	_weaponConfigEntry = configFile >> "CfgMagazines" >> _className;
	_configName = configName(_weaponConfigEntry);
	_weaponName = getText(configFile >> "CfgMagazines" >> _configName >> "displayName");
	_model = getText(configFile >> "CfgMagazines" >> _configName >> "model");
	_type = getNumber(configFile >> "CfgMagazines" >> _configName >> "type");
	_scope = getNumber(configFile >> "CfgMagazines" >> _configName >> "scope");
	_pic =  getText(configFile >> "CfgMagazines" >> _configName >> "picture");
	
	if ((_configName!="") && (_weaponName!="") && (_model!="") && (_pic!="")) then {
		if (_count > 1) then {
			_list lbAdd format["%1 (%2x)", _weaponName, _count];
		} else {
			_list lbAdd format["%1", _weaponName];
		};
		_list lbSetData [(lbSize _list)-1,str(_data)];
		_list lbSetPicture [(lbSize _list)-1,_pic];
	};

} forEach _magazines;

{
	_details = [_x] call life_fnc_fetchCfgDetails;
	_details set[count _details, 1];
	
	_list lbAdd format["%1",(getText(configFile >> (_details select 6) >> _x >> "DisplayName"))];
	_pic = getText(configFile >> (_details select 6) >> _x >> "picture");
	_list lbSetData [(lbSize _list)-1,str(_x)];
	//_list lbSetValue [(lbSize _list)-1, _x];
	_list lbSetPicture [(lbSize _list)-1,_pic];
} forEach _clothing;

_costs = [_data] call life_fnc_loadoutCalculateCosts;

_text ctrlSetText format["Total costs: $%1", [_costs] call life_fnc_numberText];