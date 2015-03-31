/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "C_Offroad_01_repair_F": //New
	{
		switch (_index) do
		{
			case 0: {_color = "Towtruck"}; //New
		};
	};

	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Red";};
			case 1: {_color = "Yellow";};
			case 2: {_color = "White";};
			case 3: {_color = "Blue";};
			case 4: {_color = "Dark Red";};
			case 5: {_color = "Blue / White"};
			case 6: {_color = "Black"};
			case 7: {_color = "Taxi"};
			case 8: {_color = "EMS Edition"};
			case 9: {_color = "GPD Black Edition"};
			case 10: {_color = "Pub Cop Edition"};
			case 11: {_color = "GPD White Edition"};
			case 12: {_color = "GPD Supervisor Edition"};
		};
	};

	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Green";};
			case 2: {_color = "Blue";};
			case 3: {_color = "Dark Blue";};
			case 4: {_color = "Yellow";};
			case 5: {_color = "White"};
			case 6: {_color = "Grey"};
			case 7: {_color = "Black"};
		};
	};

	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Channel 7 News Chopper"};
		};
	};

	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Red"};
			case 1: {_color = "Dark Blue"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Black / White"};
			case 4: {_color = "Tan"};
			case 5: {_color = "Green"};
			case 6: {_color = "GPD Edition"};
			case 7: {_Color = "Jet Black"};
			case 8: {_Color = "EMS Edition"};
		};
	};

	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dark Red";};
			case 1: {_color = "Black";};
			case 2: {_color = "Silver";};
			case 3: {_color = "Orange";};
			case 4: {_color = "Jet Black";};
			case 5: {_color = "Silver";};
			case 6: {_color = "GPD UM SUV"};
		};
	};

	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};

	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};

	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};

	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Brown"};
			case 1: {_color = "Digi Desert"};
			case 2: {_color = "Black"};
			case 3: {_color = "Blue"};
			case 4: {_color = "Red"};
			case 5: {_color = "White"};
			case 6: {_color = "Digi Green"};
			case 7: {_color = "Hunter Camo"};
			case 8: {_color = "Rebel Camo"};
		};
	};

	case "C_Heli_Light_01_civil_F": //New Civilian Helo | M-900 | New
	{
		switch (_index) do
		{
			case 0: {_color = "Medic M-900"}; //New
			/*case 1: {_color = "Civ Blue"};
			case 2: {_color = "Civ Red"};
			case 3: {_color = "Blueline"};
			case 4: {_color = "Elliptical"};
			case 5: {_color = "Furious"};
			case 6: {_color = "Jeans Blue"};
			case 7: {_color = "Speedy Redline"};
			case 8: {_color = "Sunset"};
			case 9: {_color = "Vrana"};
			case 10: {_color = "Waves Blue"};
			case 11: {_color = "Wasp"}; //New
			case 12: {_color = "Shadow"}; //New
			case 13: {_color = "Light"}; //New
			case 14: {_color = "Gray Watcher"};*/ //New
		};
	};

	case "B_Heli_Light_01_F": //GPD & Rebels Helo | Hummingbird | MH-9
	{
		switch (_index) do
		{
			case 0: {_color = "GPD"};
			case 1: {_color = "Black"};
			case 2: {_color = "Civ Blue"};
			case 3: {_color = "Civ Red"};
			case 4: {_color = "Digi Green"};
			case 5: {_color = "Blueline"};
			case 6: {_color = "Elliptical"};
			case 7: {_color = "Furious"};
			case 8: {_color = "Jeans Blue"};
			case 9: {_color = "Speedy Redline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Waves Blue"};
			case 13: {_color = "Rebel Digital"};
		};
	};

	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "White / Blue"};
			case 2: {_color = "Digi Green"};
			case 3: {_color = "Desert Digi"};
			case 4: {_color = "EMS Edition"};
		};
	};

	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
		};
	};

	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
		};
	};

	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "GPD Hunter"};
		};
	};

	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebel Ifirt"};
		};
	};

	case "I_MRAP_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "EMS Strider"};
		};
	};

	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};

	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
		};
	};

	case "O_Heli_Transport_04_box_F": // Donator Taru Cargo
	{
		switch (_index) do
		{
			case 0: {_color = "Taru Cargo"};
		};
	};

	case "O_Heli_Transport_04_covered_F": // Civilian Taru Transport
	{
		switch (_index) do
		{
			case 0: {_color = "Taru Transport"};
		};
	};

	case "O_Heli_Transport_04_bench_F": // Rebel Taru Bench
	{
		switch (_index) do
		{
			case 0: {_color = "Rebel Taru Bench"};
			case 1: {_color = "Cop Taru Bench"};
		};
	};

	case "O_Heli_Transport_04_medevac_F": // Medic Taru MedEvac
	{
		switch (_index) do
		{
			case 0: {_color = "Taru MedEvac"};
		};
	};

	case "B_Heli_Transport_03_unarmed_F": // Civilian Huron
	{
		switch (_index) do
		{
			case 0: {_color = "Civilian Huron"};
		};
	};

	case "B_Heli_Transport_03_unarmed_green_F": // Donator Huron
	{
		switch (_index) do
		{
			case 0: {_color = "Donator Huron"};
		};
	};
};

_color;
