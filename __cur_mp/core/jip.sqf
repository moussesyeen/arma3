/*
	File: jip.sqf
	Author: Bryan "Tonic" Boardwine
*/
if(isNil "gsn_recruit_reporter") then
{
	gsn_recruit_reporter = ["Reporter",ObjNull];
};
if(isNil "gsn_recruit_towtruck") then
{
	gsn_recruit_towtruck = ["Tow Truck Driver",ObjNull];
};
if(isNil "gsn_recruit_carsales") then
{
	gsn_recruit_carsales = ["Car Salesman",ObjNull];
};
if(isNil "gsn_recruit_housesales") then
{
	gsn_recruit_housesales = ["Realtor",ObjNull];
};

{
	_index = _x getVariable "life_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn life_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Car");

{
	_index = _x getVariable "life_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn life_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Air");


{
	if(alive _x) then
	{
		private ["_position"];
		_position = _x getVariable["recruitPosition","none"];
		if(_position != "none") then
		{
			switch(_position) do
			{
				case "newsReporter":
				{
					gsn_recruit_reporter set [1,_x];
				};
				case "towTruckDriver":
				{
					gsn_recruit_towtruck set [1,_x];
				};
				case "houseSalesman":
				{
					gsn_recruit_carsales set [1,_x];
				};
				case "carSalesMan":
				{
					gsn_recruit_housesales set [1,_x];
				};
			};
		};
	};
} foreach playableUnits;