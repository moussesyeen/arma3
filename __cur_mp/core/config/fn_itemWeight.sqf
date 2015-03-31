/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {7};
	case "oilp": {6};
	case "heroinu": {6};
	case "heroinp": {4};
	case "cannabis": {4};
	case "marijuana": {3};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {6};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {4};
	case "ironore": {5};
	case "copper_r": {3};
	case "iron_r": {3};
	case "sand": {3};
	case "salt": {3};
	case "salt_r": {1};
	case "glass": {1};
	case "diamond": {4};
	case "diamondc": {2};
	case "cocaine": {6};
	case "cocainep": {4};
	case "spikeStrip": {15};
	case "rock": {6};
	case "cement": {5};
	case "goldbar": {8};
	case "blastingcharge": {8};
	case "boltcutter": {5};
	case "defusekit": {2};
	case "storagesmall": {5};
	case "storagebig": {10};
	case "vodka": {2};
	case "moonshine": {2};
	case "grapes": {3};
	case "pgrapes": {3};
	case "treasure": {2};
	case "uranium": {5};
	case "euranium": {4};
	case "sulfur": {5};
	case "sacid": {4};
	case "rfuel": {7};
	case "detector": {4};
	case "kidney": {6};
	case "underwatercharge": {10};
	case "goldbarp": {8};
	case "carcus": {6};
	case "carcush": {6};
	case "jaws": {6};
	case "carbomb": {10};
	default {1};
};
