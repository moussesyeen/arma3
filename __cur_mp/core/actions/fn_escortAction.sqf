/*
	File: fn_escortAction.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNil "_unit" OR isNull _unit OR !isPlayer _unit) exitWith {};
if((player distance _unit > 3)) exitWith {};


switch(playerSide) do
{
	case independent:
	{
		if((_unit getVariable "restrainedType") == "med") then
		{
			_unit attachTo [player,[0.1,1.1,0]];
			_unit setVariable["transporting",false,true];
			_unit setVariable["Escorting",true,true];
			player reveal _unit;
		}
		else
		{
			hint format[localize "STR_NOTF_CantEscort", "Medically Disabled"]
		};
	};
	case civilian:
	{
		if((_unit getVariable "restrainedType") == "zip") then
		{
			_unit attachTo [player,[0.1,1.1,0]];
			_unit setVariable["transporting",false,true];
			_unit setVariable["Escorting",true,true];
			player reveal _unit;
		}
		else
		{
			hint format[localize "STR_NOTF_CantEscort", "Zip Tied"]
		};
	};
	case west:
	{
		if((_unit getVariable "restrainedType") == "cuff") then
		{
			_unit attachTo [player,[0.1,1.1,0]];
			_unit setVariable["transporting",false,true];
			_unit setVariable["Escorting",true,true];
			player reveal _unit;
		}
		else
		{
			hint format[localize "STR_NOTF_CantEscort", "Hand Cuffed"]
		};
	};
};