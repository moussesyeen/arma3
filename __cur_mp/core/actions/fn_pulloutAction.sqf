/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_crew"];
_crew = crew cursorTarget;

if(cursorTarget distance player > 3.5) exitWith {};
if(speed cursorTarget > 1) exitWith {};

{
	switch(playerSide) do
	{
		case independent:
		{

		};
		case civilian:
		{
			if((_x getVariable "restrainedType") == "zip") then
			{
				_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
				[[_x],"life_fnc_pulloutVeh",_x,false] spawn life_fnc_MP;
			};
		};
		case west:
		{
			_x setVariable ["transporting",false,true];
			_x setVariable ["Escorting",false,true];
			[[_x],"life_fnc_pulloutVeh",_x,false] spawn life_fnc_MP;
		};
	};
} foreach _crew;


