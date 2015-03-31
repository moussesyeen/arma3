#include <macro.h>
/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_vehicle","_vehicleInfo","_value"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {};
if(!((_vehicle isKindOf "Air") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "LandVehicle"))) exitWith {};

_vehicleInfo = _vehicle getVariable ["Trunk",[]];

if(_vehicle getVariable["purpose",""] == "truck_mission") then
{
	_type = _vehicle getVariable["type","legal"];
	if (_type == "legal") then
	{
		hint format["This truck is a humanitarian truck working for Global Savant Nutrition Agency. They are carying food for families of fallen soldiers and you are making their dinner get cold. Ass."];
	}
	else
	{
		if(_vehicle getVariable["goodsRemoved","1"] == "1") then
		{
			hint "The goods in this truck have already been submitted to evidence. Impound the damn thing...";
		}
		else
		{
			_vehicle setVariable["goodsRemoved","1",true];
			hint format["You have searched an illegal delivery truck and discovered %1! You have been rewarded a finders fee of %2 for finding these items.",(_vehicle getVariable["reason","1050 Used Fleshlights"]),45000];
			[45000,1,0] call life_fnc_handleMoney;
		};
	};
}
else
{
	if(count _vehicleInfo == 0) exitWith {hint localize "STR_Cop_VehEmpty"};

	_value = 0;
	{
		_var = _x select 0;
		_val = _x select 1;

		_index = [_var,life_illegal_items] call TON_fnc_index;
		if(_index != -1) then
		{
			_vIndex = [_var,__GETC__(gsn_sell_array)] call TON_fnc_index;
			if(_vIndex != -1) then
			{
				_value = _value + (_val * ((__GETC__(gsn_sell_array) select _vIndex) select 1));
			};
		};
	} foreach (_vehicleInfo select 0);

	if(_value > 0) then
	{
		[[0,format[localize "STR_NOTF_VehContraband",[_value] call life_fnc_numberText]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		[_value,1,0] call life_fnc_handleMoney;
		_vehicle setVariable["Trunk",[],true];
	}
		else
	{
		hint localize "STR_Cop_NoIllegalVeh";
	};
};