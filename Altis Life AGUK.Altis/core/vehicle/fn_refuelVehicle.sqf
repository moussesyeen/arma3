/*
	File: fn_refuelVehicle.sqf
	Author: Ciaran Langton
	
	Description:
	Manages refueling the nearest car.
*/
_pump = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if(isNull _pump) exitWith {};
if(life_atmbank < 750) exitWith {hint "You do not have £750 in your bank to pay for this!";};
if((count nearestObjects[_pump,["Car","Truck","Air","Ship"],10]) < 1) exitWith {};

_vehicle = (nearestObjects[_pump,["Car","Truck","Air","Ship"],10]) select 0;
_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");


life_atmbank = life_atmbank - 750;
if(!local _vehicle) then {
	[[_vehicle,1],"life_fnc_setFuel",_vehicle,false] spawn life_fnc_MP;
} else {
	_vehicle setFuel 1;
};
cutText[format["Your %1 has been refueled. Thanks for your business!",_vehicleName],"PLAIN DOWN"];