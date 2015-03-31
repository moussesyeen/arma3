private["_pos","_nearVehicles","_vehicle"];
_pos = [_this,0,[],[[]]] call BIS_fnc_param;
_source = [_this,1,[],[[]]] call BIS_fnc_param;
if(count _pos == 0) exitWith {};
if(player distance _pos > 125) exitWith {};
_nearVehicles = nearestObjects[_pos,["Car","Air"],45];
if(count _nearVehicles > 0) then
{
	{
		if(_x getVariable["bombActive",false]) then
		{
			_x setVariable ["hasEMP",true,true];
			_x sethit ["wheel_1_1_steering", 1];
			_x sethit ["wheel_2_1_steering", 1];
			[[2,"You have EMP'ed a car with a bomb on it. You have 2 minutes to defuse!"],"life_fnc_broadcast",_source,false] spawn life_fnc_MP;
			[[2,"Your car has been hit with an EMP. The GPD has 2 minutes to defuse the bomb before it explodes!"],"life_fnc_broadcast",crew _x,false] spawn life_fnc_MP;
		};
	} foreach _nearVehicles;
};