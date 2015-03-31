/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "B_Quadbike_01_F") exitWith {true}; //ATV's don't need to require a license anymore.

switch (life_veh_shop select 0) do
{
	case "civ_air": {_ret = license_civ_air;};
	case "civ_air_1": {_ret = license_civ_air;};
	case "civ_air_2": {_ret = license_civ_air;};
	case "civ_car": {_ret = license_civ_driver;};
	case "civ_car_1": {_ret = license_civ_driver;};
	case "civ_car_2": {_ret = license_civ_driver;};
	case "civ_car_3": {_ret = license_civ_driver;};
	case "civ_car_4": {_ret = license_civ_driver;};
	case "civ_servt_1": {_ret = license_civ_driver;};
	case "civ_ship": {_ret = license_civ_boat;};
	case "civ_ship_1": {_ret = license_civ_boat;};
	case "civ_ship_2": {_ret = license_civ_boat;};
	case "civ_ship_3": {_ret = license_civ_boat;};
	case "civ_ship_4": {_ret = license_civ_boat;};
	case "civ_truck": {_ret = license_civ_truck;};
	case "civ_truck_1":	{_ret = license_civ_truck;};
	case "civ_truck_2":	{_ret = license_civ_truck;};
	case "cop_air": {_ret = license_cop_air;};
	case "cop_air_1": {_ret = license_cop_air;};
	case "cop_air_2": {_ret = license_cop_air;};
	case "cop_airhq": {_ret = license_cop_air;};
	case "cop_car": {_ret = true;};
	case "cop_car_1": {_ret = true;};
	case "cop_car_2": {_ret = true;};
	case "cop_car_3": {_ret = true;};
	case "cop_car_5": {_ret = true;};
	case "cop_ship_1":{_ret = true;};
	case "donator_1": {_ret = true;};
	case "donator_2": {_ret = true;};
	case "donator_4": {_ret = true;};
	case "donator_5": {_ret = true;};
	case "kart_shop": {_ret = license_civ_driver;};
	case "med_shop": {_ret = true;};
	case "med_air_hs":{_ret=true};
	case "med_air_kav": {_ret = true;};
	case "med_air_telios": {_ret = true;};
	case "reb_car": {_ret = license_civ_rebel;};
	case "reb_v_1": {_ret = license_civ_rebel;};
	case "reb_v_2": {_ret = license_civ_rebel;};
	case "reb_v_3": {_ret = license_civ_rebel;};
	case "reb_v_4": {_ret = license_civ_rebel;};
	case "recruiter_cars": {_ret = true};
	case "recruiter_air": {_ret = true};
};

_ret;
