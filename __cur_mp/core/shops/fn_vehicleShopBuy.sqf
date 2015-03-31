/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle"];
_mode = _this select 0;
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick"};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;
 if(_mode) then {_basePrice = round(_basePrice * 1.5)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(gsn_life_cash < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - gsn_life_cash] call life_fnc_numberText];};
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense"};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

//Check if there is multiple spawn points and find a suitable spawnpoint.
if(typeName _spawnPoints == typeName []) then {
	//Find an available spawn point.
	{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
} else {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
};

if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";};
[_basePrice,0,1] call life_fnc_handleMoney;
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];

_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
waitUntil {!isNil "_vehicle"};
_vehicle setVariable ["BIS_enableRandomization", false];//Wait?
_vehicle allowDamage false; //Temp disable damage handling..
_vehicle lock 2;
_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
_vehicle setDir (markerDir _spawnPoint);
_vehicle setPos (getMarkerPos _spawnPoint);
_vehicle enableRopeAttach false;
[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
[_vehicle] call life_fnc_clearVehicleAmmo;
[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.

_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"];
//Side Specific actions.
switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
	};

	case civilian: {
		if((life_veh_shop select 2) == "civ" && {_className == "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
	};

	case independent: {
		[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
	};
};

_vehicle allowDamage true;

if(_className == "C_Offroad_01_F") then
{
	_vehicle setVariable ["selections", []];
	_vehicle setVariable ["gethit", []];
	_vehicle addEventHandler
	[
		"HandleDamage",
		{
			_i = 0;
			_newDamage = 0;
			_multiplyer = 1;
			_damage = 0;
			_olddamage = 0;
			_damageLocation = (_this select 1);
			_damageAmount = (_this select 2);
			_truck = _this select 0;
			_locations = _truck getVariable ["selections", []];
			_gethit = _truck getVariable ["gethit", []];
			if !(_damageLocation in _locations) then
			{
				_locations pushBack _damageLocation;
				_gethit pushBack 0;
			};

			{
				if(_damageLocation == _x) then {
					_i = _forEachIndex;
				};
			} foreach _locations;

			_olddamage = _gethit select _i;
			_multiplyer = .15;
			_newDamage = (_damageAmount - _olddamage) * _multiplyer;
			_damage = (_olddamage + _newDamage);
			_gethit set [_i, _damage];
			_damage;
		}
	];
};
switch(playerSide) do
{
    case west:
    {
    	[[_vehicle,"playerSide","cop",true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
    };
    case independent:
    {
    	[[_vehicle,"playerSide","med",true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
    };

    case civilian:
    {
    	[[_vehicle,"playerSide","civ",true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
    };
};


gsn_life_vehicles pushBack _vehicle;
[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] spawn life_fnc_MP;

if(_mode) then {
	if(!(_className in ["B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F"])) then {
		[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
	};
};

[0] call SOCK_fnc_updatePartial; //Sync silently because it's obviously silently..
closeDialog 0; //Exit the menu.
true;
