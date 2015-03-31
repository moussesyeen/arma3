/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	case "O_Boat_Armed_01_hmg_F": {175};
	case "B_Boat_Armed_01_minigun_F": {175};
	case "I_Boat_Armed_01_minigun_F": {175};
	case "C_Boat_Civil_01_F": {85};
	case "C_Boat_Civil_01_police_F": {85};
	case "C_Boat_Civil_01_rescue_F": {85};
	case "C_Rubberboat": {45};
	case "B_G_Boat_Transport_01_F": {45};
	case "B_Boat_Transport_01_F": {45};
	case "C_Hatchback_01_F": {40};
	case "C_Hatchback_01_sport_F": {45};
	case "B_Heli_Light_01_F": {90};
	case "C_Heli_Light_01_civil_F": {90}; //New Civilian & EMS Helo
	case "O_Heli_Light_02_unarmed_F": {210};
	case "I_Heli_Transport_02_F": {375};
	case "B_Heli_Transport_03_unarmed_F": {600}; // Civilian Huron (Black)
	case "B_Heli_Transport_03_unarmed_green_F": {600}; // Donator Huron (Green)
	case "O_Heli_Transport_04_box_F": {1500}; // Donator Taru (Cargo)
	case "O_Heli_Transport_04_bench_F": {200}; // Rebel Taru (Bench)
	case "O_Heli_Transport_04_covered_F": {400}; // Civilian Taru (Transport)
	case "O_Heli_Transport_04_medevac_F": {250}; // Medic Taru (MedEvac)
	case "B_MRAP_01_F": {65};
	case "O_MRAP_02_F": {60};
	case "I_MRAP_03_F": {60};
	case "C_Offroad_01_F": {65};
	case "B_G_Offroad_01_F": {65};
	case "C_Offroad_01_repair_F": {65}; //Tow Truck
	case "B_Quadbike_01_F": {25};
	case "C_SUV_01_F": {50};
	case "B_Truck_01_box_F": {450};
	case "B_Truck_01_transport_F": {325};
	case "I_Truck_02_covered_F": {250};
	case "I_Truck_02_transport_F": {200};
	case "O_Truck_03_transport_F": {550};
	case "O_Truck_03_covered_F": {600};
	case "O_Truck_03_device_F": {700};
	case "C_Van_01_box_F": {150};
	case "C_Van_01_fuel_F": {90};
	case "C_Van_01_transport_F": {100};
	case "I_G_Van_01_transport_F": {100};
	case "B_supplyCrate_F": {500};
	case "Box_IND_Grenades_F": {350};
	case "Land_CargoBox_V1_F": {2500};
	default {-1};
};
