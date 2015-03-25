#include <macro.h>
/*
	File: fn_impoundAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Impounds the vehicle
*/
private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_filters","_ropes"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_filters = ["Car","Air","Ship"];
if(!((KINDOF_ARRAY(_vehicle,_filters)))) exitWith {};
if(player distance cursorTarget > 10) exitWith {};

_vehicleData = _vehicle GVAR ["vehicle_info_owners",[]];
if(count _vehicleData == 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
_vehicleName = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _vehicle),"displayName");
[[0,"STR_NOTF_BeingImpounded",true,[SEL(SEL(_vehicleData,0),1),_vehicleName]],"life_fnc_broadcast",true,false] call life_fnc_MP;
life_action_inUse = true;

_upp = localize "STR_NOTF_Impounding";
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
	
while{true} do {
	sleep 0.09;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance _vehicle > 10) exitWith {};
	if(!alive player) exitWith {};
};

5 cutText ["","PLAIN"];
	
if(player distance _vehicle > 10) exitWith {hint localize "STR_NOTF_ImpoundingCancelled"; life_action_inUse = false;};
if(!alive player) exitWith {life_action_inUse = false;};

if(EQUAL(count crew _vehicle,0)) then {
	if(!(KINDOF_ARRAY(_vehicle,_filters))) exitWith {life_action_inUse = false;};
	_type = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _vehicle),"displayName");
	switch (true) do {
		case (_vehicle isKindOf "Car"): {_price = LIFE_SETTINGS(getNumber,"impound_car");};
		case (_vehicle isKindOf "Ship"): {_price = LIFE_SETTINGS(getNumber,"impound_boat");};
		case (_vehicle isKindOf "Air"): {_price = LIFE_SETTINGS(getNumber,"impound_air");};
	};
	
	life_impound_inuse = true;
	[[_vehicle,true,player],"TON_fnc_vehicleStore",false,false] call life_fnc_MP;
	//delete ropes on impound
	_ropes = (_vehicle getvariable ["zlt_ropes", []]);
	{deletevehicle _x} foreach _ropes;
	_vehicle setvariable ["zlt_ropes", [], true];
	waitUntil {!life_impound_inuse};
	hint format[localize "STR_NOTF_Impounded",_type,_price];
	[[0,"STR_NOTF_HasImpounded",true,[profileName,SEL(SEL(_vehicleData,0),1),_vehicleName]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	ADD(BANK,_price);
} else {
	hint localize "STR_NOTF_ImpoundingCancelled";
};

life_action_inUse = false;