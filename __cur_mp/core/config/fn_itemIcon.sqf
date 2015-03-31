/*
	File: fn_itemIcon.sqf
	Author: EdgeKiller

	Description:
	Return the icon for each altis life item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {("icons\items\oil.paa")};
	case "life_inv_oilp": {("icons\items\oil.paa")};
	case "life_inv_heroinu": {("icons\items\coke.paa")};
	case "life_inv_heroinp": {("icons\items\coke.paa")};
	case "life_inv_cannabis": {("icons\items\cannabis.paa")};
	case "life_inv_marijuana": {("icons\items\weed.paa")};
	case "life_inv_apple": {("icons\items\apple.paa")};
	case "life_inv_rabbit": {("icons\items\meat.paa")};
	case "life_inv_salema": {("icons\items\fish.paa")};
	case "life_inv_ornate": {("icons\items\fish.paa")};
	case "life_inv_mackerel": {("icons\items\fish.paa")};
	case "life_inv_tuna": {("icons\items\fish.paa")};
	case "life_inv_mullet": {("icons\items\fish.paa")};
	case "life_inv_catshark": {("icons\items\fish.paa")};
	case "life_inv_turtle": {("icons\items\turtle.paa")};
	case "life_inv_fishingpoles": {("icons\items\fishingpoles.paa")};
	case "life_inv_water": {("icons\items\water.paa")};
	case "life_inv_coffee": {("icons\items\coffee.paa")};
	case "life_inv_turtlesoup": {("icons\items\turtle_soup.paa")};
	case "life_inv_donuts": {("icons\items\donut.paa")};
	case "life_inv_fuelE": {("icons\items\fuel.paa")};
	case "life_inv_fuelF": {("icons\items\fuel.paa")};
	case "life_inv_pickaxe": {("icons\items\pickaxe.paa")};
	case "life_inv_copperore": {("icons\items\copper_ore.paa")};
	case "life_inv_ironore": {("icons\items\iron_ore.paa")};
	case "life_inv_ironr": {("icons\items\iron.paa")};
	case "life_inv_copperr": {("icons\items\copper.paa")};
	case "life_inv_sand": {("icons\items\sand.paa")};
	case "life_inv_salt": {("icons\items\salt_unprocessed.paa")};
	case "life_inv_saltr": {("icons\items\salt.paa")};
	case "life_inv_glass": {("icons\items\glass.paa")};
	case "life_inv_diamond": {("icons\items\diamond.paa")};
	case "life_inv_diamondr": {("icons\items\diamond.paa")};
	case "life_inv_tbacon": {("icons\items\meat.paa")};
	case "life_inv_redgull": {("icons\items\redgull.paa")};
	case "life_inv_lockpick": {("icons\items\lockpick.paa")};
	case "life_inv_peach": {("icons\items\peach.paa")};
	case "life_inv_coke": {("icons\items\cocaine.paa")};
	case "life_inv_cokep": {("icons\items\cocaine.paa")};
	case "life_inv_spikeStrip": {("icons\items\spikestrip.paa")};
	case "life_inv_rock": {("icons\items\rock.paa")};
	case "life_inv_cement": {("icons\items\cement.paa")};
	case "life_inv_goldbar": {("icons\items\goldbar.paa")};
	case "life_inv_blastingcharge": {("icons\items\blastingcharge.paa")};
	case "life_inv_boltcutter": {("icons\items\boltcutter.paa")};
	case "life_inv_defusekit": {("icons\items\defusekit.paa")};
	case "life_inv_storagesmall": {("icons\items\Small_Storage.paa")};
	case "life_inv_storagebig": {("icons\items\Large_Storage.paa")};
	case "life_inv_detector": {("icons\items\Detectors.paa")};
	case "life_inv_treasure": {("icons\items\Treasure.paa")};
	case "life_inv_hgloves": {("icons\items\Gloves.paa")};
	case "life_inv_uranium": {("icons\items\Uranium.paa")};
	case "life_inv_euranium": {("icons\items\Uranium.paa")};
	case "life_inv_sacid": {("icons\items\Sulfur.paa")};
	case "life_inv_sulfur": {("icons\items\Sulfur.paa")};
	case "life_inv_rfuel": {("icons\items\noicon.paa")};
	case "life_inv_whiskey": {("icons\items\whiskey.paa")};
	case "life_inv_grapes": {("icons\items\Grapes.paa")};
	case "life_inv_pgrapes": {("icons\items\Grapes.paa")};
	case "life_inv_ziptie": {("icons\items\Ziptie.paa")};
	case "life_inv_moonshine": {("icons\items\Moonshine.paa")};
	case "life_inv_vodka": {("icons\items\Vodka.paa")};
	case "life_inv_kidney": {("icons\items\Kidney.paa")};
	case "life_inv_scalpel": {("icons\items\Scalpel.paa")};
	case "life_inv_goldbarp": {("icons\items\Gold.paa")};
	case "life_inv_underwatercharge": {("icons\items\Blasting_charge.paa")};
	case "life_inv_carcush": {("icons\items\Bacon.paa")};
	case "life_inv_carcus": {("icons\items\Bacon.paa")};
	case "life_inv_hknife": {("icons\items\knife.paa")};
	case "life_inv_carbomb": {("icons\items\Carbomb.paa")};
	case "life_inv_jaws": {("icons\items\Jaws.paa")};
	default {("icons\items\noicon.paa")};
};