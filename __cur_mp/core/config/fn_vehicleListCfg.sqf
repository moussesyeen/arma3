#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "cop_car":
	{
		_return pushBack
		["C_Offroad_01_F",5000];

		if(__GETC__(life_coplevel) > 0) then
		{
			_return pushBack ["C_SUV_01_F",20000];
			_return pushBack ["C_Hatchback_01_sport_F",12500];
			_return pushBack ["B_MRAP_01_F",75000];
		};
	};

	case "cop_car_1":
	{
		_return pushBack
		["C_Offroad_01_F",5000];

		if(__GETC__(life_coplevel) > 0) then
		{
			_return pushBack ["C_SUV_01_F",20000];
			_return pushBack ["C_Hatchback_01_sport_F",12500];
			_return pushBack ["B_MRAP_01_F",75000];
		};
	};

	case "cop_car_2":
	{
		_return pushBack ["C_Offroad_01_F",5000];

		if(__GETC__(life_coplevel) > 0) then
		{
			_return pushBack ["C_SUV_01_F",20000];
			_return pushBack ["C_Hatchback_01_sport_F",12500];
			_return pushBack ["B_MRAP_01_F",75000];
		};
	};

	case "cop_car_3":
	{
		_return pushBack ["C_Offroad_01_F",5000];

		if(__GETC__(life_coplevel) > 0) then
		{
			_return pushBack ["C_SUV_01_F",20000];
			_return pushBack ["C_Hatchback_01_sport_F",12500];
			_return pushBack ["B_MRAP_01_F",75000];
		};
	};

	case "cop_car_5":
	{
		_return pushBack ["C_Offroad_01_F",5000];

		if(__GETC__(life_coplevel) > 0) then
		{
			_return pushBack ["C_SUV_01_F",20000];
			_return pushBack ["C_Hatchback_01_sport_F",12500];
			_return pushBack ["B_MRAP_01_F",75000];
		};
	};

	case "cop_air":
	{
		_return pushBack ["B_Heli_Light_01_F",75000];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return pushBack ["B_Heli_Transport_01_F",200000];
			_return pushBack ["O_Heli_Transport_04_bench_F",350000]; // Police Taru (Bench)
		};
	};

	case "cop_air_1":
	{
		_return pushBack ["B_Heli_Light_01_F",75000];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return pushBack ["B_Heli_Transport_01_F",200000];
			_return pushBack ["O_Heli_Transport_04_bench_F",350000]; // Police Taru (Bench)
		};
	};

	case "cop_air_2":
	{
		_return pushBack ["B_Heli_Light_01_F",75000];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return pushBack ["B_Heli_Transport_01_F",200000];
			_return pushBack ["O_Heli_Transport_04_bench_F",350000]; // Police Taru (Bench)
		};
	};

	case "cop_airhq":
	{
		_return pushBack ["B_Heli_Light_01_F",75000];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return pushBack ["B_Heli_Transport_01_F",200000];
			_return pushBack ["O_Heli_Transport_04_bench_F",350000]; // Police Taru (Bench)
		};
	};

	case "civ_air":
	{
		_return =
		[
			//["C_Heli_Light_01_civil_F",253000], // New Civilian Heli
			["B_Heli_Light_01_F",253000], // Old MH-9 Soon to replaced by M-900
			["O_Heli_Transport_04_covered_F",3750000], // Civilian Taru (Transport)
			["B_Heli_Transport_03_unarmed_F",5000000], // Civilian Huron (Black)
			["O_Heli_Light_02_unarmed_F",750000]
		];
	};

	case "civ_air_1":
	{
		_return =
		[
			//["C_Heli_Light_01_civil_F",253000], // New Civilian Heli
			["B_Heli_Light_01_F",253000], // Old MH-9 Soon to replaced by M-900
			["O_Heli_Transport_04_covered_F",3750000], // Civilian Taru (Transport)
			["B_Heli_Transport_03_unarmed_F",5000000], // Civilian Huron (Black)
			["O_Heli_Light_02_unarmed_F",750000]
		];
	};

	case "civ_air_2":
	{
		_return =
		[
			//["C_Heli_Light_01_civil_F",253000], // New Civilian Heli
			["B_Heli_Light_01_F",253000], // Old MH-9 Soon to replaced by M-900
			["O_Heli_Transport_04_covered_F",3750000], // Civilian Taru (Transport)
			["B_Heli_Transport_03_unarmed_F",5000000], // Civilian Huron (Black)
			["O_Heli_Light_02_unarmed_F",750000]
		];
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_F",20000],
			["B_SDV_01_F",100000]
		];
	};

	case "cop_ship_1":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_f",20000],
			["B_SDV_01_F",100000]
		];
	};

	case "civ_ship_1":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]

		];
	};

	case "civ_ship_2":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};

	case "civ_ship_3":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};

	case "civ_ship_4":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};

	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};

	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",15000],
			["C_Hatchback_01_sport_F",10000],
			["I_MRAP_03_F",25000]
		];
	};

	case "med_air_hs": {
		_return = [
			["C_Heli_Light_01_civil_F",25000], // Medic Littlebird (Civilian Hummingbird)
			["O_Heli_Transport_04_medevac_F",100000], // Medic Taru (MedEvac)
			["O_Heli_Light_02_unarmed_F",50000]
		];
	};

	case "med_air_telios": {
		_return = [
			["C_Heli_Light_01_civil_F",25000], // Medic Littlebird (Civilian Hummingbird)
			["O_Heli_Transport_04_medevac_F",100000], // Medic Taru (MedEvac)
			["O_Heli_Light_02_unarmed_F",50000]
		];
	};

	case "civ_car_1":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",9500],
			["C_Offroad_01_F",12500],
			["C_SUV_01_F",35000],
			["C_Van_01_transport_F",40000]
		];
	};

	case "civ_car_2":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",9500],
			["C_Offroad_01_F",12500],
			["C_SUV_01_F",35000],
			["C_Van_01_transport_F",40000]
		];
	};

	case "civ_car_3":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",9500],
			["C_Offroad_01_F",12500],
			["C_SUV_01_F",35000],
			["C_Van_01_transport_F",40000]
		];
	};

	case "civ_car_4":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",9500],
			["C_Offroad_01_F",12500],
			["C_SUV_01_F",35000],
			["C_Van_01_transport_F",40000]
		];
	};

	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",60000],
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["B_Truck_01_transport_F",275000],
			["O_Truck_03_transport_F",200000],
			["O_Truck_03_covered_F",250000],
			["B_Truck_01_box_F",350000]
		];
	};

	case "civ_servt_1":
	{
		_return =
		[
			["C_Offroad_01_F",15000] //Service Truck
		];
	};

	case "civ_truck_1":
	{
		_return =
		[
			["C_Van_01_box_F",60000],
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["B_Truck_01_transport_F",200000]
		];
	};

	case "civ_truck_2":
	{
		_return =
		[
			["C_Van_01_box_F",60000],
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["B_Truck_01_transport_F",200000]
		];
	};

	case "reb_v_1":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",15000],
			["B_Heli_Light_01_F",325000]
		];

		if(license_civ_rebel) then
		{
			_return pushBack ["B_G_Offroad_01_armed_F",750000];
			_return pushBack ["O_Heli_Transport_04_bench_F",6000000]; // Rebel Taru (Bench)
			_return pushBack ["O_MRAP_02_F",250000];
		};
	};

	case "reb_v_2":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",15000],
			["B_Heli_Light_01_F",325000]
		];

		if(license_civ_rebel) then
		{
			_return pushBack ["B_G_Offroad_01_armed_F",750000];
			_return pushBack ["O_Heli_Transport_04_bench_F",6000000]; // Rebel Taru (Bench)
			_return pushBack ["O_MRAP_02_F",250000];
		};
	};

	case "reb_v_3":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",15000],
			["B_Heli_Light_01_F",325000]
		];

		if(license_civ_rebel) then
		{
			_return pushBack ["B_G_Offroad_01_armed_F",750000];
			_return pushBack ["O_Heli_Transport_04_bench_F",6000000]; // Rebel Taru (Bench)
			_return pushBack ["O_MRAP_02_F",250000];
		};
	};

	case "reb_v_4":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",15000],
			["B_Heli_Light_01_F",325000]
		];

		if(license_civ_rebel) then
		{
			_return pushBack ["B_G_Offroad_01_armed_F",750000];
			_return pushBack ["O_Heli_Transport_04_bench_F",6000000]; // Rebel Taru (Bench)
			_return pushBack ["O_MRAP_02_F",250000];
		};
	};

	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",15000],
			["B_Heli_Light_01_F",325000]
		];

		if(license_civ_rebel) then
		{
			_return pushBack ["B_G_Offroad_01_armed_F",750000];
			_return pushBack ["O_Heli_Transport_04_bench_F",6000000]; // Rebel Taru (Bench)
			_return pushBack ["O_MRAP_02_F",250000];
		};
	};

	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};

	case "atv_1":
	{
		_return pushBack ["B_Quadbike_01_F",5000];
	};

	case "donator_1":
	{
		switch (__GETC__(life_donator)) do {
			case 1:
			{
				_return =
				[

				];
			};
			case 2:
			{
				_return =
				[

				];
			};
			case 3:
			{
				_return =
				[
					["B_Quadbike_01_F",2000],
					["C_Hatchback_01_F",7600],
					["C_Offroad_01_F",10000],
					["C_SUV_01_F",28000],
					["C_Van_01_transport_F",32000],
					["C_Van_01_Fuel_F",6000],
					["B_Truck_01_box_F",200000],
					["B_Heli_Light_01_F",200000],
					["C_Hatchback_01_sport_F",10000]
				];
			};
			case 4:
			{
				_return =
				[
					["B_Quadbike_01_F",1875],
					["C_Hatchback_01_F",7125],
					["C_Offroad_01_F",9375],
					["C_SUV_01_F",26250],
					["C_Van_01_transport_F",30000],
					["C_Van_01_Fuel_F",5625],
					["B_Truck_01_box_F",187500],
					["B_Heli_Light_01_F",195000],
					["C_Hatchback_01_sport_F",9950],
					["O_Truck_03_covered_F",1500000],
					["O_Truck_03_device_F",2550000],
					["O_Heli_Light_02_unarmed_F",600000]
				];
			};
			case 5:
			{
				_return =
				[
					["B_Quadbike_01_F",1875],
					["C_Hatchback_01_F",7125],
					["C_Offroad_01_F",9375],
					["C_SUV_01_F",26250],
					["C_Van_01_transport_F",30000],
					["C_Van_01_Fuel_F",5625],
					["B_Truck_01_box_F",187500],
					["B_Heli_Light_01_F",190000],
					["C_Hatchback_01_sport_F",9850],
					["O_Heli_Light_02_unarmed_F",590000],
					["O_Truck_03_covered_F",1450000],
					["O_Truck_03_device_F",2500000],
					["O_Heli_Transport_04_box_F",5000000], // Donator Taru (Cargo)
					["B_Heli_Transport_03_unarmed_green_F",2000000], // Donator Huron (Green)
					["I_Heli_Transport_02_F",1195000]
				];
			};
		};
	};

	case "donator_2":
	{
		switch (__GETC__(life_donator)) do {
			case 1:
			{
				_return =
				[

				];
			};
			case 2:
			{
				_return =
				[

				];
			};
			case 3:
			{
				_return =
				[

				];
			};
			case 4:
			{
				_return =
				[
					["B_Quadbike_01_F",1875],
					["C_Hatchback_01_F",7125],
					["C_Offroad_01_F",9375],
					["C_SUV_01_F",26250],
					["C_Van_01_transport_F",30000],
					["C_Van_01_Fuel_F",5625],
					["B_Truck_01_box_F",187500],
					["B_Heli_Light_01_F",195000],
					["C_Hatchback_01_sport_F",9950],
					["O_Truck_03_covered_F",1500000],
					["O_Truck_03_device_F",2550000],
					["O_Heli_Light_02_unarmed_F",600000]
				];
			};
			case 5:
			{
				_return =
				[
					["B_Quadbike_01_F",1875],
					["C_Hatchback_01_F",7125],
					["C_Offroad_01_F",9375],
					["C_SUV_01_F",26250],
					["C_Van_01_transport_F",30000],
					["C_Van_01_Fuel_F",5625],
					["B_Truck_01_box_F",187500],
					["B_Heli_Light_01_F",19000],
					["C_Hatchback_01_sport_F",9850],
					["O_Heli_Light_02_unarmed_F",590000],
					["O_Truck_03_covered_F",1450000],
					["O_Truck_03_device_F",2500000],
					["O_Heli_Transport_04_box_F",5000000], // Donator Taru (Cargo)
					["B_Heli_Transport_03_unarmed_green_F",2000000], // Donator Huron (Green)
					["I_Heli_Transport_02_F",1195000]
				];
			};
		};
	};

	case "donator_4":
	{
		switch (__GETC__(life_donator)) do {
			case 1:
			{
				_return =
				[
					["B_Quadbike_01_F",2250],
					["C_Hatchback_01_F",8550],
					["C_Offroad_01_F",11250],
					["C_SUV_01_F",31500],
					["C_Van_01_transport_F",36000]
				];
			};
			case 2:
			{
				_return =
				[
					["B_Quadbike_01_F",2125],
					["C_Hatchback_01_F",8075],
					["C_Offroad_01_F",10625],
					["C_SUV_01_F",29750],
					["C_Van_01_transport_F",30600],
					["C_Van_01_Fuel_F",6375],
					["B_Truck_01_box_F",212500]
				];
			};
			case 3:
			{
				_return =
				[
					["B_Quadbike_01_F",2000],
					["C_Hatchback_01_F",7600],
					["C_Offroad_01_F",10000],
					["C_SUV_01_F",28000],
					["C_Van_01_transport_F",32000],
					["C_Van_01_Fuel_F",6000],
					["B_Truck_01_box_F",200000],
					["B_Heli_Light_01_F",200000],
					["C_Hatchback_01_sport_F",10000]
				];
			};
			case 4:
			{
				_return =
				[
					["B_Quadbike_01_F",1875],
					["C_Hatchback_01_F",7125],
					["C_Offroad_01_F",9375],
					["C_SUV_01_F",26250],
					["C_Van_01_transport_F",30000],
					["C_Van_01_Fuel_F",5625],
					["B_Truck_01_box_F",187500],
					["B_Heli_Light_01_F",195000],
					["C_Hatchback_01_sport_F",9950],
					["O_Truck_03_covered_F",3000000],
					["O_Truck_03_device_F",2550000],
					["O_Heli_Light_02_unarmed_F",600000]
				];
			};
			case 5:
			{
				_return =
				[
					["B_Quadbike_01_F",1875],
					["C_Hatchback_01_F",7125],
					["C_Offroad_01_F",9375],
					["C_SUV_01_F",26250],
					["C_Van_01_transport_F",30000],
					["C_Van_01_Fuel_F",5625],
					["B_Truck_01_box_F",187500],
					["B_Heli_Light_01_F",195000],
					["C_Hatchback_01_sport_F",9950],
					["O_Heli_Light_02_unarmed_F",600000],
					["O_Truck_03_covered_F",1500000],
					["O_Truck_03_device_F",2500000],
					["O_Heli_Transport_04_box_F",5000000], // Donator Taru (Cargo)
					["B_Heli_Transport_03_unarmed_green_F",2000000], // Donator Huron (Green)
					["I_Heli_Transport_02_F",1195000]
				];
			};
		};
	};

	case "donator_5":
	{
		switch (__GETC__(life_donator)) do {
			case 1:
			{
				_return =
				[

				];
			};
			case 2:
			{
				_return =
				[
					["B_Quadbike_01_F",2125],
					["C_Hatchback_01_F",8075],
					["C_Offroad_01_F",10625],
					["C_SUV_01_F",29750],
					["C_Van_01_transport_F",30600],
					["C_Van_01_Fuel_F",6375],
					["B_Truck_01_box_F",212500]
				];
			};
			case 3:
			{
				_return =
				[
					["B_Quadbike_01_F",2000],
					["C_Hatchback_01_F",7600],
					["C_Offroad_01_F",10000],
					["C_SUV_01_F",28000],
					["C_Van_01_transport_F",32000],
					["C_Van_01_Fuel_F",6000],
					["B_Truck_01_box_F",200000],
					["B_Heli_Light_01_F",200000],
					["C_Hatchback_01_sport_F",10000]
				];
			};
			case 4:
			{
				_return =
				[
					["B_Quadbike_01_F",1875],
					["C_Hatchback_01_F",7125],
					["C_Offroad_01_F",9375],
					["C_SUV_01_F",26250],
					["C_Van_01_transport_F",30000],
					["C_Van_01_Fuel_F",5625],
					["B_Truck_01_box_F",187500],
					["B_Heli_Light_01_F",195000],
					["C_Hatchback_01_sport_F",9950],
					["O_Truck_03_covered_F",1500000],
					["O_Truck_03_device_F",2550000],
					["O_Heli_Light_02_unarmed_F",600000]
				];
			};
			case 5:
			{
				_return =
				[
					["B_Quadbike_01_F",1875],
					["C_Hatchback_01_F",7125],
					["C_Offroad_01_F",9375],
					["C_SUV_01_F",26250],
					["C_Van_01_transport_F",30000],
					["C_Van_01_Fuel_F",5625],
					["B_Truck_01_box_F",187500],
					["B_Heli_Light_01_F",19000],
					["C_Hatchback_01_sport_F",9850],
					["O_Heli_Light_02_unarmed_F",590000],
					["O_Truck_03_covered_F",1450000],
					["O_Truck_03_device_F",2500000],
					["O_Heli_Transport_04_box_F",5000000], // Donator Taru (Cargo)
					["B_Heli_Transport_03_unarmed_green_F",2000000], // Donator Huron (Green)
					["I_Heli_Transport_02_F",1195000]
				];
			};
		};
	};

	case "recruiter_cars":
	{
		switch(player getVariable["recruitPosition","none"]) do
		{
			case "newsReporter":
			{
				//_return pushBack ["C_Offroad_01_F",15000];
			};
			case "towTruckDriver":
			{
				_return pushBack ["C_Offroad_01_repair_F",15000];
			};
			case "houseSalesman":
			{
				//_return pushBack ["C_SUV_01_F",15000];
			};
			case "carSalesMan":
			{
				//_return pushBack ["C_Hatchback_01_Sport_F",15000];
			};
			default
			{
				_return = [];
			};
		};
	};

	case "recruiter_air":
	{
		switch(player getVariable["recruitPosition","none"]) do
		{
			case "newsReporter":
			{
				_return pushBack ["I_Heli_light_03_unarmed_F",20000];
			};
			case "towTruckDriver":
			{
				//_return pushBack ["C_SUV_01_F",20000];
			};
			case "houseSalesman":
			{
				//_return pushBack ["C_SUV_01_F",20000];
			};
			case "carSalesMan":
			{
				//_return pushBack ["C_SUV_01_F",20000];
			};
			default
			{
				_return = [];
			};
		};
	};
};

_return;
