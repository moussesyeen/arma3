/*
	File: fn_impoundAction.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_ropes"];
_vehicle = cursorTarget;
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
if(player distance cursorTarget > 10) exitWith {};

_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
if(count _vehicleData == 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
if(_vehicle getVariable["purpose",""] == "truck_mission") then
{
	[[0,format["%1 is impounding a delivery truck.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
}
else
{
	[[0,format["%1 your %2 is being impounded.",(_vehicleData select 0) select 1,_vehicleName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};

life_action_inUse = true;

_upp = localize "STR_NOTF_Impounding";
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
while{true} do
{
	uiSleep 0.09;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance _vehicle > 10) exitWith {};
	if(!alive player) exitWith {};
};
5 cutText ["","PLAIN"];

if(player distance _vehicle > 10) exitWith {hint localize "STR_NOTF_ImpoundingCancelled"; life_action_inUse = false; };
if(!alive player) exitWith {life_action_inUse = false; };

if((count crew _vehicle) == 0) then
{
	if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {life_action_inUse = false; };
	_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	switch (true) do
	{
		case (_vehicle isKindOf "Car"): {_price = (call life_impound_car);};
		case (_vehicle isKindOf "Ship"): {_price = (call life_impound_boat);};
		case (_vehicle isKindOf "Air"): {_price = (call life_impound_air);};
	};

	life_impound_inuse = true;
	if(_vehicle getVariable["purpose",""] == "truck_mission") then
	{
		_price = call life_impound_truck;
		hint format["You have impounded a delivery truck.\n\nYou have received $%1 for cleaning up the streets!",_price];
		[[0,format["%1 has impounded a delivery truck",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		deleteVehicle _vehicle;
		life_impound_inuse = false;
	}
	else
	{
		if(alive _vehicle) then
		{
			[[_vehicle,true,player,false],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;
		}
		else
		{
			[[_vehicle,true,player,true],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;
		};
	};
	waitUntil {!life_impound_inuse};
	hint format[localize "STR_NOTF_Impounded",_type,_price];
	[[0,format[localize "STR_NOTF_HasImpounded",profileName,(_vehicleData select 0) select 1,_vehicleName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	[_price,1,0] call life_fnc_handleMoney;
}
else
{
	hint localize "STR_NOTF_ImpoundingCancelled";
	life_action_inUse = false;
};
life_action_inUse = false;