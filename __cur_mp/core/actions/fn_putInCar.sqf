/*
	File: fn_putInCar.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !isPlayer _unit) exitWith {};

_nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],10] select 0;
if(isNil "_nearestVehicle") exitWith {hint localize "STR_NOTF_VehicleNear"};

switch(playerSide) do
{
	case independent:
	{
		if((_unit getVariable "restrainedType") == "med") then
		{
			detach _unit;
			[[_nearestVehicle],"life_fnc_moveIn",_unit,false] call life_fnc_MP;
			_unit setVariable["Escorting",FALSE,TRUE];
			_unit setVariable["transporting",TRUE,TRUE];
		};
	};
	case civilian:
	{
		if((_unit getVariable "restrainedType") == "zip") then
		{
			detach _unit;
			[[_nearestVehicle],"life_fnc_moveIn",_unit,false] call life_fnc_MP;
			_unit setVariable["Escorting",FALSE,TRUE];
			_unit setVariable["transporting",TRUE,TRUE];
		};
	};
	case west:
	{
		if((_unit getVariable "restrainedType") == "cuff") then
		{
			detach _unit;
			[[_nearestVehicle],"life_fnc_moveIn",_unit,false] call life_fnc_MP;
			_unit setVariable["Escorting",FALSE,TRUE];
			_unit setVariable["transporting",TRUE,TRUE];
		};
	};
};