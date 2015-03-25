#define VITEMMACRO(NAME,DISPLAYNAME,VARNAME,WEIGHT,BUYPRICE,SELLPRICE,ILLEGAL,EDIBLE,ICON) class NAME { \
		variable = VARNAME; \
		weight = WEIGHT; \
		displayName = DISPLAYNAME; \
		buyPrice = BUYPRICE; \
		sellPrice = SELLPRICE; \
		illegal = ILLEGAL; \
		edible = EDIBLE; \
		icon = ICON; \
	};
	
#define LICENSEMACRO(NAME,DISPLAYNAME,VARNAME,PRICE,ILLEGAL,SIDE) class NAME { \
		variable = VARNAME; \
		displayName = DISPLAYNAME; \
		price = PRICE; \
		illegal = ILLEGAL; \
		side = SIDE; \
	};

#define true 1
#define false 0
#include "Config_Clothing.hpp"

/*
	Master settings for various features and functionality	
*/
class Life_Settings {
	/* Persistent Settings */
	save_civ_weapons = true; //Allow civilians to save weapons on them?
	save_virtualItems = true; //Save Virtual items (all sides)?

	/* Revive system settings */
	revive_cops = false; //true to enable cops the ability to revive everyone or false for only medics/ems.
	revive_fee = 2500; //Revive fee that players have to pay and medics / EMS are rewarded
	
	/* House related settings */
	house_limit = 3; //Maximum amount of houses a player can own.

	/* Gang related settings */
	gang_price = 500000; //Price for creating a gang, remember they are persistent so keep it reasonable to avoid millions of gangs.
	gang_upgradeBase = 25000; //The base cost for upgrading slots in a gang
	gang_upgradeMultiplier = 2.5; //Not sure if in use?

	/* Player-related systems */
	enable_fatigue = true; //Set to false to disable the ARMA 3 false system.
	total_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
	total_maxWeightT = 24;  //Static variable for the maximum weight allowed without having a backpack
	paycheck_period = 10; //Scaled in minutes
	
	/* Impound Variables */
	impound_car = 5000; //Price for impounding cars
	impound_boat = 5000; //Price for impounding boats
	impound_air = 5000; //Price for impounding helicopters / planes

	/* Car-shop Settings */
	vehicleShop_rentalOnly[] = { "B_MRAP_01_hmg_F", "B_G_Offroad_01_armed_F", "I_Heli_light_03_F" };

	/* Job-related stuff */
	delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };
	
	crimes[] = { 
		{"STR_Crime_187V","15000","1"}, 
		{"STR_Crime_187","25000","2"}, 
		{"STR_Crime_901","100000","3"}, 
		{"STR_Crime_215","25000","4"}, 
		{"STR_Crime_211","25000","5"}, 
		{"STR_Crime_207","75000","6"}, 
		{"STR_Crime_207A","50000","7"},
		{"STR_Crime_390","10000","8"},
		{"STR_Crime_480","50000","9"},
		{"STR_Crime_481","35000","10"},
		{"STR_Crime_483","100000","11"},
		{"STR_Crime_459","50000","12"},
		{"STR_Crime_667","100000","13"},
		{"STR_Crime_1","5000","14"},	
		{"STR_Crime_2","10000","15"},	
		{"STR_Crime_3","15000","16"},	
		{"STR_Crime_4","25000","17"},	
		{"STR_Crime_5","35000","18"},	
		{"STR_Crime_6","50000","19"},	
		{"STR_Crime_7","100000","20"}
	};

	sellArray[] = {
		{"hgun_Pistol_Signal_F", 3500},
		{"hgun_Rook40_F", 7000},
		{"hgun_ACPC2_F", 7700},
		{"hgun_Pistol_heavy_01_F", 8750},
		{"hgun_Pistol_heavy_02_F", 12250},
		{"arifle_SDAR_F", 15750},
		{"arifle_TRG20_F", 17500},
		{"arifle_TRG21_F", 19250},
		{"arifle_Mk20_F", 24500},
		{"arifle_Katiba_C_F", 43750},
		{"arifle_MX_F", 49000},
		{"arifle_MXC_F", 52500},
		{"arifle_MX_SW_F", 63000},
		{"arifle_MXM_F", 70000},
		{"arifle_MX_Black_F", 54000},
		{"arifle_MXC_Black_F", 67500},
		{"arifle_MX_SW_Black_F", 78000},
		{"arifle_MXM_Black_F", 85000},
		{"LMG_Mk200_F", 105000},
		{"srifle_DMR_01_F", 66500},
		{"srifle_EBR_F", 80500},
		{"muzzle_snds_M", 31500},
		{"muzzle_snds_H", 42000},
		{"muzzle_snds_B", 52500},
		{"optic_Aco", 1750},
		{"optic_ACO_grn", 1750},
		{"optic_Holosight", 2100},
		{"optic_MRCO", 2450},
		{"optic_Hamr", 3500},
		{"optic_Arco", 3500},
		{"optic_DMS", 14000},
		{"acc_flashlight", 35},
		{"acc_pointer_IR", 1400},
		{"Binocular", 150},
		{"Rangefinder", 500},
		{"ToolKit", 250},
		{"FirstAidKit", 150},
		{"NVGoggles_OPFOR", 2000},
		{"Chemlight_red", 60},
		{"Chemlight_blue", 30}
	};
	
	allowedSavedVirtualItems[] = { "pickaxe", "fuelEmpty", "fuelFull", "spikeStrip", "lockpick", "defuseKit", "storageSmall", "storageBig", "redgull", "coffee", "waterBottle", "apple", "peach", "tbacon", "donut", "rabbitGrilled", "salemaGrilled", "ornateGrilled", "mackerelGrilled", "tunaGrilled", "mulletGrilled", "catsharkGrilled", "turtleSoup", "henGrilled", "roosterGrilled", "sheepGrilled", "goatGrilled" };
};

//Virtual Items
class VirtualItems {
	//Misc
	VITEMMACRO(pickaxe, "STR_Item_Pickaxe", "pickaxe", 2, 1750, 1350, false, -1, "icons\pickaxe.paa")
	VITEMMACRO(fuelEmpty, "STR_Item_FuelE", "fuelEmpty", 2, -1, -1, false, -1, "icons\ico_fuelempty.paa")
	VITEMMACRO(fuelFull, "STR_Item_FuelF", "fuelFull", 5, 1850, 1500, false, -1, "icons\ico_fuel.paa")
	VITEMMACRO(spikeStrip, "STR_Item_SpikeStrip", "spikeStrip", 15, 12500, 11200, false, -1, "icons\spikestrip.paa")
	VITEMMACRO(lockpick, "STR_Item_Lockpick", "lockpick", 1, 1150, 175, false, -1, "icons\lockpick.paa")
	VITEMMACRO(goldbar, "STR_Item_GoldBar", "goldBar", 12, -1, 125000, false, -1, "icons\goldbar.paa")
	VITEMMACRO(blastingcharge, "STR_Item_BCharge", "blastingCharge", 15, 135000, -1, true, -1, "icons\blastingcharge.paa")
	VITEMMACRO(boltcutter, "STR_Item_BCutter", "boltCutter", 5, 17500, -1, true, -1, "icons\boltcutter.paa")
	VITEMMACRO(defusekit, "STR_Item_DefuseKit", "defuseKit", 2, 2500, -1, false, -1, "icons\defusekit.paa")
	VITEMMACRO(storagesmall, "STR_Item_StorageBS", "storageSmall", 5, 750000, -1, false, -1, "icons\ico_storageSmall.paa")
	VITEMMACRO(storagebig, "STR_Item_StorageBL", "storageBig", 10, 1500000, -1, false, -1, "icons\ico_storageBig.paa")
	VITEMMACRO(handcuffs, "STR_Item_Zipties", "handcuffs", 10, 50000, -1, true, -1, "") //zipties
	VITEMMACRO(handcuffkeys, "STR_Item_Keys", "handcuffkeys", 10, 0, -1, true, -1, "") //keys

	//Mined Items
	VITEMMACRO(oil_unprocessed, "STR_Item_OilU", "oilUnprocessed", 7, -1, -1, false, -1, "icons\oilu.paa")
	VITEMMACRO(oil_processed, "STR_Item_OilP", "oilProcessed", 6, -1, 3200, false, -1, "icons\oilp.paa")
	VITEMMACRO(copper_unrefined, "STR_Item_CopperOre", "copperUnrefined", 4, -1, -1, false, -1, "icons\copperore.paa")
	VITEMMACRO(copper_refined, "STR_Item_CopperIngot", "copperRefined", 3, -1, 1500, false, -1, "icons\copper.paa")
	VITEMMACRO(iron_unrefined, "STR_Item_IronOre", "ironUnrefined", 5, -1, -1, false, -1, "icons\ironore.paa")
	VITEMMACRO(iron_refined, "STR_Item_IronIngot", "ironRefined", 3, -1, 3200, false, -1, "icons\iron.paa")
	VITEMMACRO(salt_unrefined, "STR_Item_Salt", "saltUnrefined", 3, -1, -1, false, -1, "icons\salt.paa")
	VITEMMACRO(salt_refined, "STR_Item_SaltR", "saltRefined", 1, -1, 1450, false, -1, "icons\saltr.paa")
	VITEMMACRO(sand, "STR_Item_Sand", "sand", 3, -1, -1, false, -1, "icons\sand.paa")
	VITEMMACRO(glass, "STR_Item_Glass", "glass", 1, -1, 1450, false, -1, "icons\glass.paa")
	VITEMMACRO(diamond_uncut, "STR_Item_DiamondU", "diamondUncut", 4, -1, 750, false, -1, "icons\diamond.paa")
	VITEMMACRO(diamond_cut, "STR_Item_DiamondC", "diamondCut", 2, -1, 2000, false, -1, "icons\diamondr.paa")
	VITEMMACRO(rock, "STR_Item_Rock", "rock", 6, -1, -1, false, -1, "icons\rock.paa")
	VITEMMACRO(cement, "STR_Item_CementBag", "cement", 5, -1, 1950, false, -1, "icons\cement.paa")

	//Drugs
	VITEMMACRO(heroin_unprocessed, "STR_Item_HeroinU", "heroinUnprocessed", 6, -1, -1, true, -1, "icons\heroin_unprocessed.paa")
	VITEMMACRO(heroin_processed, "STR_Item_HeroinP", "heroinProcessed", 4, -1, 3000, true, -1, "icons\heroin_processed.paa")
	VITEMMACRO(cannabis, "STR_Item_Cannabis", "cannabis", 4, -1, -1, true, -1, "icons\cannabis.paa")
	VITEMMACRO(marijuana, "STR_Item_Marijuana", "marijuana", 1, -1, 4300, true, -1, "icons\ico_marijuana.paa")
	VITEMMACRO(medmarijuana, "STR_Item_MedMarijuana", "medmarijuana", 3, 5000, -1, true, -1, "icons\ico_marijuana.paa")
	VITEMMACRO(cocaine_unprocessed, "STR_Item_CocaineU", "cocaineUnprocessed", 6, -1, -1, true, -1, "icons\cocain_unprocessed.paa")
	VITEMMACRO(cocaine_processed, "STR_Item_CocaineP", "cocaineProcessed", 4, -1, 8000, true, -1, "icons\cocain_processed.paa")
	VITEMMACRO(meth_unprocessed, "STR_Item_MethU", "methUnprocessed", 5, -1, -1, true, -1, "")
	VITEMMACRO(meth_processed, "STR_Item_MethP", "methProcessed", 3, -1, 6000, true, -1, "")
	

	//Drink
	VITEMMACRO(redgull, "STR_Item_RedGull", "redgull", 1, 1500, 200, false, 100, "icons\redgull.paa")
	VITEMMACRO(coffee, "STR_Item_Coffee", "coffee", 1, 10, 5, false, 100, "icons\coffee.paa")
	VITEMMACRO(waterBottle, "STR_Item_WaterBottle", "waterBottle", 1, 10, 5, false, 100, "icons\ico_waterBottle.paa")
	VITEMMACRO(beer, "STR_Item_Beer", "beer", 1, 3500, 1000, false, 100, "")
	VITEMMACRO(whiskey, "STR_Item_Whiskey", "whiskey", 1, 5000, 2000, false, 100, "")

	//Food
	VITEMMACRO(apple, "STR_Item_Apple", "apple", 1, 65, 50, false, 10, "icons\apple.paa")
	VITEMMACRO(peach, "STR_Item_Peach", "peach", 1, 68, 55, false, 10, "icons\peach.paa")
	VITEMMACRO(tbacon, "STR_Item_TBacon", "tbacon", 1, 75, 25, false, 40, "icons\ico_tbacon.paa")
	VITEMMACRO(donut, "STR_Item_Donuts", "donut", 1, 120, 60, false, 30, "icons\donut.paa")
	VITEMMACRO(rabbit_raw, "STR_Item_Rabbit", "rabbitRaw", 2, -1, 65, false, -1, "icons\food.paa")
	VITEMMACRO(rabbit_grilled, "STR_Item_RabbitGrilled", "rabbitGrilled", 1, 150, 115, false, 20, "icons\ico_cookedMeat.paa")
	VITEMMACRO(salema_raw, "STR_Item_Salema", "salemaRaw", 2, -1, 45, false, -1, "icons\fish.paa")
	VITEMMACRO(salema_grilled, "STR_Item_SalemaGrilled", "salemaGrilled", 1, 75, 55, false, 30, "icons\ico_cookedMeat.paa")
	VITEMMACRO(ornate_raw, "STR_Item_OrnateMeat", "ornateRaw", 2, -1, 40, false, -1, "icons\fish.paa")
	VITEMMACRO(ornate_grilled, "STR_Item_OrnateGrilled", "ornateGrilled", 1, 175, 150, false, 25, "icons\ico_cookedMeat.paa")
	VITEMMACRO(mackerel_raw, "STR_Item_MackerelMeat", "mackerelRaw", 4, -1, 175, false, -1, "icons\fish.paa")
	VITEMMACRO(mackerel_grilled, "STR_Item_MackerelGrilled", "mackerelGrilled", 2, 250, 200, false, 30, "icons\ico_cookedMeat.paa")
	VITEMMACRO(tuna_raw, "STR_Item_TunaMeat", "tunaRaw", 6, -1, 700, false, -1, "icons\fish.paa")
	VITEMMACRO(tuna_grilled, "STR_Item_TunaGrilled", "tunaGrilled", 3, 1250, 1000, false, 100, "icons\ico_cookedMeat.paa")
	VITEMMACRO(mullet_raw, "STR_Item_MulletMeat", "mulletRaw", 4, -1, 250, false, -1, "icons\fish.paa")
	VITEMMACRO(mullet_fried, "STR_Item_MulletFried", "mulletFried", 2, 600, 400, false, 80, "icons\ico_cookedMeat.paa")
	VITEMMACRO(catshark_raw, "STR_Item_CatSharkMeat", "catsharkRaw", 6, -1, 300, false, -1, "icons\fish.paa")
	VITEMMACRO(catshark_fried, "STR_Item_CatSharkFried", "catsharkFried", 3, 750, 500, false, 100, "icons\ico_cookedMeat.paa")
	VITEMMACRO(turtle_raw, "STR_Item_TurtleMeat", "turtleRaw", 6, -1, 25000, true, -1, "icons\turtle.paa")
	VITEMMACRO(turtle_soup, "STR_Item_TurtleSoup", "turtleSoup", 2, 2500, 1000, false, 100, "icons\turtle_soup.paa")
	VITEMMACRO(hen_raw, "STR_Item_HenRaw", "henRaw", 1, -1, 10000, false, -1, "icons\food.paa")
	VITEMMACRO(hen_fried, "STR_Item_HenFried", "henFried", 1, 500, 500, false, 65, "icons\ico_cookedMeat.paa")
	VITEMMACRO(rooster_raw, "STR_Item_RoosterRaw", "roosterRaw", 1, -1, 10000, false, -1, "icons\food.paa")
	VITEMMACRO(rooster_grilled, "STR_Item_RoosterGrilled", "roosterGrilled",1, 500, 500, false, 45, "icons\ico_cookedMeat.paa")
	VITEMMACRO(sheep_raw, "STR_Item_SheepRaw", "sheepRaw", 2, -1, 25000, false, -1, "icons\food.paa")
	VITEMMACRO(sheep_grilled, "STR_Item_SheepGrilled", "sheepGrilled", 2, 500, 500, false, 100, "icons\ico_cookedMeat.paa")
	VITEMMACRO(goat_raw, "STR_Item_GoatRaw", "goatRaw", 2, -1, 25000, false, -1, "icons\food.paa")
	VITEMMACRO(goat_grilled, "STR_Item_GoatGrilled", "goatGrilled", 2, 500, 500, false, 100, "icons\ico_cookedMeat.paa")	
	
	//Shipwreck
	VITEMMACRO(artifact, "STR_Item_Artifact", "artifact", 2, -1, 75000, false, -1, "")
	VITEMMACRO(roundobject, "STR_Item_roundobject", "roundobject", 2, -1, 75000, false, -1, "")
	VITEMMACRO(squareobject, "STR_Item_squareobject", "squareobject", 2, -1, 75000, false, -1, "")
	VITEMMACRO(pottery, "STR_Item_pottery", "pottery", 2, -1, 175000, false, -1, "")
	VITEMMACRO(coins, "STR_Item_coin", "coins", 2, -1, 250000, false, -1, "")
	VITEMMACRO(stonetablet, "STR_Item_stonetablet", "stonetablet", 2, -1, 125000, false, -1, "")
	VITEMMACRO(carvedstone, "STR_Item_carvedstone", "carvedstone", 2, -1, 125000, false, -1, "")
	VITEMMACRO(valuablecoins, "STR_Item_highcoin", "valuablecoins", 2, -1, 500000, false, -1, "")
	VITEMMACRO(goldore, "STR_Item_goldore", "goldore", 2, -1, 350000, false, -1, "")
	VITEMMACRO(goldingot, "STR_Item_goldignot", "goldingot", 2, -1, 450000, false, -1, "")
	VITEMMACRO(platinumore, "STR_Item_platore", "platinumore", 2, -1, 250000, false, -1, "")
	VITEMMACRO(platinumingot, "STR_Item_platingot", "platinumingot", 2, -1, 300000, false, -1, "")
	
	//shipwreck x2
	VITEMMACRO(lance, "STR_Item_Lance", "lance", 2, 25000, 15000, false, -1, "")
	
	//Cop Items
	VITEMMACRO(roadcone, "STR_Item_roadcone", "roadcone", 2, 25000, -1, false, -1, "")
	VITEMMACRO(roadbarrier, "STR_Item_roadbarrier", "roadbarrier", 2, 25000, -1, false, -1, "")
	VITEMMACRO(tapesign, "STR_Item_tapesign", "tapesign", 2, 25000, -1, false, -1, "")
	VITEMMACRO(arrowleft, "STR_Item_arrowleft", "arrowleft", 2, 25000, -1, false, -1, "")
	VITEMMACRO(arrowright, "STR_Item_arrowright", "arrowright", 2, 25000, -1, false, -1, "")
	
	//Medic Items
	VITEMMACRO(medlight, "STR_Item_medlight", "medlight", 2, 100, 100, false, -1, "")
	
	//Jail
	VITEMMACRO(wood, "STR_Item_wood", "wood", 2, 100, 100, false, -1, "")
	VITEMMACRO(woodp, "STR_Item_woodp", "woodp", 2, 100, 100, false, -1, "")
};


/*
	Licenses
	
	Params:
	CLASS ENTRY,DisplayName,VariableName,price,illegal,side indicator
*/
class Licenses {
	LICENSEMACRO(driver,"STR_License_Driver","driver",15000,false,"civ")
	LICENSEMACRO(boat,"STR_License_Boat","boat",20000,false,"civ")
	LICENSEMACRO(pilot,"STR_License_Pilot","pilot",75000,false,"civ")
	LICENSEMACRO(gun,"STR_License_Firearm","gun",35000,false,"civ")
	LICENSEMACRO(dive,"STR_License_Diving","dive",10000,false,"civ")
	LICENSEMACRO(oil,"STR_License_Oil","oil",25000,false,"civ")
	LICENSEMACRO(cAir,"STR_License_Pilot","cAir",15000,false,"cop")
	LICENSEMACRO(coastguard,"STR_License_CG","cg",8000,false,"cop")
	LICENSEMACRO(heroin,"STR_License_Heroin","heroin",50000,false,"civ")
	LICENSEMACRO(marijuana,"STR_License_Marijuana","marijuana",65000,false,"civ")
	LICENSEMACRO(medmarijuana,"STR_License_Medmarijuana","medmarijuana",75000,false,"civ")
	LICENSEMACRO(rebel,"STR_License_Rebel","rebel",500000,false,"civ")
	LICENSEMACRO(trucking,"STR_License_Truck","trucking",30000,false,"civ")
	LICENSEMACRO(diamond,"STR_License_Diamond","diamond",30000,false,"civ")
	LICENSEMACRO(salt,"STR_License_Salt","salt",15000,false,"civ")
	LICENSEMACRO(cocaine,"STR_License_Cocaine","cocaine",100000,false,"civ")
	LICENSEMACRO(sand,"STR_License_Sand","sand",12500,false,"civ")
	LICENSEMACRO(iron,"STR_License_Iron","iron",10000,false,"civ")
	LICENSEMACRO(copper,"STR_License_Copper","copper",8000,false,"civ")
	LICENSEMACRO(cement,"STR_License_Cement","cement",6500,false,"civ")
	LICENSEMACRO(mAir,"STR_License_Pilot","mAir",75000,false,"med")
	LICENSEMACRO(home,"STR_License_Home","home",2000000,false,"civ")
	LICENSEMACRO(Bounty,"STR_License_Bounty","Bounty",7500000,true,"civ") //Bounty hunter
	LICENSEMACRO(whitelisted,"STR_License_whitelisted","whitelisted",999999999,false,"civ") //whitelisted rebels
	LICENSEMACRO(meth,"STR_License_Meth","meth",50000,false,"civ") //meth
	LICENSEMACRO(donator,"STR_License_Donator","donator",9999999999999999999,false,"civ") //donator
	LICENSEMACRO(med420,"STR_License_med420","med420",75000,false,"civ") //donator
};

class VirtualShops {
	class market {
		name = "STR_Shops_Market";
		items[] = { "waterBottle", "rabbit_grilled", "hen_fried", "rooster_grilled", "sheep_grilled", "goat_grilled", "apple", "redgull", "tbacon", "hen_raw", "rooster_raw", "sheep_raw", "goat_raw", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "storagesmall", "storagebig" };
	};
	
	class cop {
		name = "STR_Shops_Cop";
		items[] = { "donut", "coffee", "spikeStrip", "waterBottle", "rabbit_grilled", "apple", "redgull", "fuelFull", "defusekit" };
	};

	class rebel {
		name = "STR_Shops_Rebel";
		items[] = { "waterBottle", "rabbit_grilled", "hen_fried", "rooster_grilled", "sheep_grilled", "goat_grilled", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge", "handcuffs" };
	};
	
	class Bounty {
		name = "STR_Shops_C_Bounty";
		items[] = { "waterBottle", "rabbit_grilled", "hen_fried", "rooster_grilled", "sheep_grilled", "goat_grilled", "apple", "redgull", "tbacon", "lockpick", "fuelFull", "handcuffs" };
	};

	class gang {
		name = "STR_Shops_Gang";
		items[] = { "waterBottle", "rabbit_grilled", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge" };
	};

	class wongs {
		name = "STR_Shops_Wongs";
		items[] = { "turtle_soup", "turtle_raw" };
	};

	class coffee {
		name = "STR_Shops_Coffee";
		items[] = { "coffee", "donut" };
	};
	
	class drugdealer {
		name = "STR_Shops_DrugDealer";
		items[] = { "cocaine_processed", "heroin_processed", "marijuana", "meth_processed" };
	};
	
	class medical {
		name = "STR_Shops_medjane";
		items[] = { "medmarijuana" };
	};
	
	class nhs {
		name = "STR_Shops_medjane";
		items[] = { "medmarijuana" };
	};
	
	class artifact {
		name = "STR_Shops_artifact";
		items[] = { "artifact", "roundobject", "squareobject", "pottery", "coins", "stonetablet", "carvedstone", "valuablecoins", "goldore", "goldingot", "platinumore", "platinumingot"  };
	};

	class oil {
		name = "STR_Shops_Oil";
		items[] = { "oil_processed", "pickaxe", "fuelFull" };
	};

	class fishmarket {
		name = "STR_Shops_FishMarket";
		items[] = { "salema_raw", "salema_grilled", "ornate_raw", "ornate_grilled", "mackerel_raw", "mackerel_grilled", "tuna_raw", "tuna_grilled", "mullet_raw", "mullet_fried", "catshark_raw", "catshark_fried" };
	};

	class glass {
		name = "STR_Shops_Glass";
		items[] = { "glass" };
	};

	class iron  {
		name = "STR_Shops_Minerals";
		items[] = { "iron_refined", "copper_refined" };
	};

	class diamond {
		name = "STR_Shops_Diamond";
		items[] = { "diamond_uncut", "diamond_cut" };
	};

	class salt {
		name = "STR_Shops_Salt";
		items[] = { "salt_refined" };
	};

	class cement {
		name = "STR_Shops_Cement";
		items[] = { "cement" };
	};

	class gold {
		name = "STR_Shops_Gold";
		items[] = { "goldbar" };
	};
	
	class bar {
		name = "STR_Shops_Bar";
		items[] = { "beer", "whiskey" };
	};
};

#include "Config_Vehicles.hpp"
#include "Config_Houses.hpp"