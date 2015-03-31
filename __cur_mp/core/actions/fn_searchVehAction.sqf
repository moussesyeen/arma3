/*
	File: fn_searchVehAction.sqf
*/
private["_vehicle","_data"];
_vehicle = cursorTarget;
if((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship")) then
{
	_purpose = _vehicle getVariable["purpose",""];
	if(_purpose == "truck_mission") then
	{
		_type = _vehicle getVariable["type","legal"];
		_driver = _vehicle getVariable["driver","Anonymous"];
		if(_type == "illegal") then
		{
			hint format["This truck is being used for an illegal delivery mission by %1. They are likely on your wanted list.",_driver];
		}
		else
		{
			hint format["This truck is being used for a legal delivery mission by %1",_driver];
		};
	}
	else
	{
		_owners = _vehicle getVariable "vehicle_info_owners";
		if(isNil {_owners}) exitWith {hint localize "STR_NOTF_VehCheat"; deleteVehicle _vehicle;};
		life_action_inUse = true;
		hint localize "STR_NOTF_Searching";
		uiSleep 3;
		life_action_inUse = false;
		if(player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {hint localize "STR_NOTF_SearchVehFail";};
		_owners = [_owners] call life_fnc_vehicleOwners;

		if(_owners == "any<br/>") then
		{
			_owners = "No owners, impound it<br/>";
		};
		hint parseText format[localize "STR_NOTF_SearchVeh",_owners];
	};
};