#include <macro.h>
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_vehicle","_vid","_pid","_unit","_price","_nearVehicles","_sp"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;

switch(typeName life_garage_sp) do
{
	case "STRING":
	{
		_sp = (getMarkerPos life_garage_sp);
	};
	case "ARRAY":
	{
		_sp = (life_garage_sp select 0);
	};
	default
	{
		_sp = (getPos player);
	};
};

_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

_price = [_vehicle,__GETC__(life_garage_prices)] call TON_fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_prices) select _price) select 1;};
if(gsn_lifeatm_cash < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};
_nearestVehicle = nearestObjects[_sp,["Car","Ship","Submarine","Air"],10] select 0;
if!(isNil "_nearestVehicle") exitWith {[[1,(localize "STR_Garage_SpawnPointError")],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;};

if(typeName life_garage_sp == "ARRAY") then {
	[[_vid,_pid,life_garage_sp select 0,_unit,_price,life_garage_sp select 1],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
} else {
	if(life_garage_sp in ["med_heli_kav"]) then {
		[[_vid,_pid,life_garage_sp,_unit,_price],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
	} else {
		[[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
	};
};

hint localize "STR_Garage_SpawningVeh";

[_price,1,1] call life_fnc_handleMoney;