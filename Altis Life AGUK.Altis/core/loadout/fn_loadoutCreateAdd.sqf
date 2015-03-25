private["_display","_list","_name","_crimes","_bounty","_units","_shopType"];
_display = findDisplay 80000;
_leftList = _display displayCtrl 80002;
_rightList = _display displayCtrl 80006;


fn_getExistingItem = {
	_className = [_this,0,"",[""]] call BIS_fnc_param;
	
	private["_result", "_item", "_data"];
	_result = -1;
	for "_i" from 0 to (lbSize 80006) step 1 do {
		_item = lbData[80006, _i];
		_data = call compile format["%1", _item];
		if (_className == _data select 0) exitWith { _result = _i; };
	};
	
	_result;
};


_mags = ctrlText 80007;
if (!([_mags] call fnc_isnumber)) then { _mags = 0; };
_mags = parseNumber(_mags);
_item = lbData[80002,(lbCurSel 80002)];
_data = call compile format["%1", _item];

_weaponConfigEntry = configFile >> "CfgWeapons" >> (_data select 0);
_configName = configName(_weaponConfigEntry);
_weaponName = "";
_model = "";
_pic = "";
_tryAddMags = false;
if (isNil _configName && _configName == "") then {
	// Magazines
	_weaponConfigEntry = configFile >> "CfgMagazines" >> (_data select 0);
	_configName = configName(_weaponConfigEntry);
	_weaponName = getText(configFile >> "CfgMagazines" >> _configName >> "displayName");
	_model = getText(configFile >> "CfgMagazines" >> _configName >> "model");
	_type = getNumber(configFile >> "CfgMagazines" >> _configName >> "type");
	_scope = getNumber(configFile >> "CfgMagazines" >> _configName >> "scope");
	_pic =  getText(configFile >> "CfgMagazines" >> _configName >> "picture");
} else {
	// Weapons
	_tryAddMags = true;
	_weaponName = getText(configFile >> "CfgWeapons" >> _configName >> "displayName");
	_model = getText(configFile >> "CfgWeapons" >> _configName >> "model");
	_type = getNumber(configFile >> "CfgWeapons" >> _configName >> "type");
	_scope = getNumber(configFile >> "CfgWeapons" >> _configName >> "scope");
	_pic =  getText(configFile >> "CfgWeapons" >> _configName >> "picture");
};

_existingItem = [(_data select 0)] call fn_getExistingItem;

if (_existingItem != -1) then {
	_item = lbData[80006, _existingItem];
	_data = call compile format["%1", _item];
	_data set[2, (_data select 2) + 1];
	_pic = lbPicture[80006, _existingItem];
	
	_rightList lbDelete _existingItem;
	_rightList lbAdd format["%1 (%2x)", _weaponName, _data select 2];
	_rightList lbSetData [(lbSize _rightList) - 1, str(_data)];
	_rightList lbSetPicture [(lbSize _rightList) - 1, _pic];
} else {
	if ((_configName!="") && (_weaponName!="") && (_model!="") && (_pic!="")) then {
		_rightList lbAdd format["%1", _weaponName];
		
		if (_data select 2 != 1) then {
			_data set[2, 1];
		};
		_rightList lbSetData [(lbSize _rightList)-1,str(_data)];
		_rightList lbSetPicture [(lbSize _rightList)-1,_pic];
	} else {
		// Clothing
		_details = [_data select 0] call life_fnc_fetchCfgDetails;
		_details set[count _details, 1];
		if(isNil {_data select 1}) then
		{
			_rightList lbAdd format["%1",(getText(configFile >> (_details select 6) >> (_data select 0) >> "DisplayName"))];
		} else {
			_rightList lbAdd format["%1", _data select 1];
		};
		_pic = getText(configFile >> (_details select 6) >> (_data select 0) >> "picture");
		_rightList lbSetData [(lbSize _rightList)-1, str([_data select 0])];
		//_list lbSetValue [(lbSize _list)-1,_data select 2];
		_rightList lbSetPicture [(lbSize _rightList)-1, _pic];
	};
};


if (_tryAddMags && _mags > 0) then {
	// Now add mags.
	_magazines = getArray (configFile >> "CfgWeapons" >> (_data select 0) >> "magazines");
	if (count _magazines > 0) then {
		_magazineClass = _magazines select 0;
		_add = [];
		
		_displayName = getText(configFile >> "CfgMagazines" >> _magazineClass >> "displayName");
		_pic =  getText(configFile >> "CfgMagazines" >> _magazineClass >> "picture");
		
		_magExistingItem = [_magazineClass] call fn_getExistingItem;
		
		if (_magExistingItem != -1) then {
			_item = lbData[80006, _magExistingItem];
			_data = call compile format["%1", _item];
			_data set[2, (_data select 2) + _mags];
			_pic = lbPicture[80006, _magExistingItem];
			
			_rightList lbDelete _magExistingItem;
			_rightList lbAdd format["%1 (%2x)", _displayName, _data select 2];
			_rightList lbSetData [(lbSize _rightList) - 1, str(_data)];
			_rightList lbSetPicture [(lbSize _rightList) - 1, _pic];
		} else {
			_arr = [_magazineClass, nil, _mags];
			
			if (_mags > 1) then {
				_rightList lbAdd format["%1 (%2x)", _displayName, _mags];
			} else {
				_rightList lbAdd format["%1", _displayName];
			};
			_rightList lbSetData [(lbSize _rightList)-1,str(_arr)];
			_rightList lbSetPicture [(lbSize _rightList)-1,_pic];
		};
	};
};