/*
+	File: fn_jawsOfLife.sqf
+	Original Author: Paronity
+	Description:
+	Removed dead bodies from car for revival
+*/

private["_unit"];
_unit = cursorTarget;
if(player getVariable ["restrained",false]) exitWith {};
if(player distance _unit > 7) exitWith {hint "You need to be within 7 feet!"};
_jaws = missionNamespace getVariable (["jaws",0] call life_fnc_varHandle);
if(_jaws == 0) exitWith {};

if(_unit isKindOf "House_F") then
{
	_unit setVariable ["jawsOpen",true,true];
}
else
{
	{
		if(!alive _x) then
		{
			_x action ["Eject",_unit];
			_x action ["GetOut",_unit];
		};
	}foreach (crew _unit);
	_unit setDamage .7;
	_unit lock 0;
};
