#include <macro.h>
private["_nearVehicles","_vehicle","_price"];

if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship"],65]; //Fetch vehicles within 30m.
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_NoNPC"};
if(isNull _vehicle) exitWith {hint localize "STR_Garage_NoNPC"};
if(_vehicle getVariable["isInsured",false]) exitWith { hint "This vehicle already has insurance."; };
if(!(_vehicle in gsn_life_vehicles)) exitWith {hint "The target vehicle doesn't seem to be your own."; };

_price = [typeOf _vehicle,__GETC__(life_garage_prices)] call TON_fnc_index;
_price = if(_price == -1) then {1000} else {(__GETC__(life_garage_prices) select _price) select 1;};

if(_price == -1) exitWith { hint "You can not insure this type of vehicle"; };
_price = _price * 4;
if(playerSide == independent) then { _price = _price / 4; };

if(gsn_life_cash < _price) exitWith { hint format["You do not have enough money on your person to complete this transaction, it requires $%1",_price]; };
hint format["You have been charged $%1 to insure this vehicle. If it explodes, it will be placed back inside your garage.",_price];
[_price,0,1] call life_fnc_handleMoney;
closeDialog 0;
_vehicle setVariable["isInsured",true,true];
[_vehicle] spawn
{
	_vehicle = _this select 0;
	waitUntil {uiSleep 1; !alive _vehicle};
	[[_vehicle],"TON_fnc_vehicleInsurance",false,false] spawn life_fnc_MP;
};