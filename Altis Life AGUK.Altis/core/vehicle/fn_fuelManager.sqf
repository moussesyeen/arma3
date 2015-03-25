/*
	File: fn_fuelManager.sqf
	Author: Ciaran Langton
	
	Description:
	Ensures more realistic fuel values are used for vehicles.
*/
while {true} do {
	_vehicle = (vehicle player);
	if(_vehicle != player && {(local _vehicle)} && {(driver _vehicle == player)} && {(isEngineOn _vehicle)} && {(speed _vehicle >= 1)}) then
	{
		_speed = abs((speed _vehicle)); //Absolute Value

		//Smaller the number, more fuel used.
		_modifier = switch(true) do {
			case (_vehicle isKindOf "B_Heli_Transport_01_F"): {200000 - (getMass _vehicle)};
			case (_vehicle isKindOf "Air"): {120000 - (getMass _vehicle)};
			default {85000 - (getMass _vehicle)};
		};

		_consumption = _speed/_modifier + 0.0001;

		if(_consumption > 0.002) then
		{
			_consumption = 0.002;
		};

		_newFuelLevel = (fuel _vehicle) - _consumption;
		_vehicle setFuel _newFuelLevel;
	};
	sleep 2;
};