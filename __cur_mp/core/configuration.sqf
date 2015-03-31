#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_hit_explosive = false;
life_siren_active = false;
life_chirp_active = false;
life_federal_active = false;
life_wail_active = false;
life_show_up = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 1; //Scaled in minutes
life_knockout = false;
life_bac = 0;
life_interrupted = false;
life_respawned = false;
life_smartphoneTarget = ObjNull;
life_new_gang = false;
life_action_gathering = false;
gsn_vdm_watcher_count = 0;
gsn_emp_immune = false;
gsn_death_unit_location = [];
gsn_first_event = 0;
gsn_cash_cache_array = [];
gsn_atm_cache_array = [];
gsn_cash_caches_index = 99;
gsn_atm_caches_index = 99;
gsn_current_bet = 0;
gsn_roulette_bets = [];
gsn_has_job = false;
gsn_wanted_status = 0;
gsn_jail_clothes = [];

//Persistent Saving
__CONST__(life_save_civ,FALSE); //Save weapons for civs?
__CONST__(life_save_yinv,FALSE); //Save Y-Inventory for civs and cops? (Medics excluded for now)

//Revive constant variables.
__CONST__(life_revive_cops,FALSE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,5000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,6); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,75000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,25000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH
__CONST__(life_enableFatigue,true); //Enable / Disable the ARMA 3 Fatigue System

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];

life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

life_sitting = false;
life_channel_send = true;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
gsn_use_atm = true;
gsn_is_arrested = false;
gsn_delivery_in_progress = false;
gsn_truck_in_progress = false;
gsn_action_in_use = false;
gsn_life_thirst = 100;
gsn_life_hunger = 100;
gsn_has_requested_revive = false;
life_fatigue = 0.7;
__CONST__(life_paycheck_period,5); //Five minutes
gsn_life_cash = 0;
__CONST__(life_impound_car,750);
__CONST__(life_impound_boat,1050);
__CONST__(life_impound_air,1500);
__CONST__(life_impound_truck,1250);
life_istazed = false;
life_my_gang = ObjNull;
life_cop_payout = .35;

gsn_life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west:
	{
		gsn_lifeatm_cash = 35000; //Starting Bank Money
	};
	case civilian:
	{
		gsn_lifeatm_cash = 45000; //Starting Bank Money
	};

	case independent: {
		gsn_lifeatm_cash = 50000;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

gsn_inv_items =
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_detector",
	"life_inv_treasure",
	"life_inv_hgloves",
	"life_inv_uranium",
	"life_inv_euranium",
	"life_inv_sacid",
	"life_inv_sulfur",
	"life_inv_rfuel",
	"life_inv_whiskey",
	"life_inv_grapes",
	"life_inv_pgrapes",
	"life_inv_ziptie",
	"life_inv_moonshine",
	"life_inv_vodka",
	"life_inv_kidney",
	"life_inv_scalpel",
	"life_inv_goldbarp",
	"life_inv_underwatercharge",
	"life_inv_carcush",
	"life_inv_carcus",
	"life_inv_hknife",
	"life_inv_carbomb",
	"life_inv_jaws"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach gsn_inv_items;
//Licenses [license var, civ/cop]
gsn_licenses =
[
	["license_civ_uranium", "civ"],
	["license_civ_sulfur", "civ"],
	["license_civ_rfuel", "civ"],
	["license_civ_grapes","civ"],
	["license_civ_moonshine","civ"],
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_civ_home", "civ"],
	["license_civ_hunting", "civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach gsn_licenses;

//Line for dev:
life_admin_ids = [""];

life_bad_houses = [];
life_bad_houses pushBack [[4352.2,14542.7,-0.55611],"Kavala Moonshine Trader"];

//Line for Prod:
//life_admin_ids = [""];

gsn_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25","dp_26","dp_27","dp_28","dp_29"];

life_cop_guns = ["hgun_P07_snds_F","Taser Rifle","Stun Pistol","arifle_MXC_Black_F","SMG_01_F","arifle_MX_Black_F","srifle_EBR_F","arifle_MK20C_plain_F","hgun_ACPC2_F","MX Black","MXC Black","arifle_MX_GL_Black_F","1Rnd_HE_Grenade_shell","EMP Round","MX Black w/ EMP","arifle_MK20C_Black_F"];

life_truck_points = ["ABDERA","ZAROS","KAVALA","AGGELOCHORI","NEOCHORI","LAKKA","CHALKEIA","CHARKIA","PYRGOS","PAROS","SOFIA","SELAKANO"];

life_illegal_items = [["heroinu",1200],["heroinp",2500],["cocaine",1500],["cocainep",3500],["cannabis",1000],["marijuana",2000],["turtle",3000],["blastingcharge",10000],["boltcutter",500],["moonshine",1050],["uranium",3000],["euranium",4000],["kidney",5000],["scalpel",2500],["ziptie",2000],["lockpick",350]];

gsn_sell_array =
[
	["apple",50],
	["heroinu",1850],
	["pgrapes",125],
	["heroinp",2650],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["rabbit",65],
	["oilp",3200],
	["turtle",3000],
	["grapes",70],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",2350],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",55],
	["detector",500],
	["cocaine",3000],
	["cocainep",5000],
	["diamond",750],
	["diamondc",2000],
	["iron_r",3200],
	["copper_r",1500],
	["salt_r",1650],
	["glass",1450],
	["fuelF",500],
	["spikeStrip",1200],
	["cement",1950],
	["uranium",3500],
	["euranium",5000],
	["hgloves",1000],
	["treasure",500],
	["sulfur",1500],
	["sacid",3500],
	["rfuel",3500],
	["kidney",50000],
	["moonshine",1750],
	["vodka",1000],
	["carcus",9500],
	["carcush",29500],
	["goldbar",45000],
	["goldbarp",35000],
	["carbomb",750000]
];
__CONST__(gsn_sell_array,gsn_sell_array);

gsn_buy_array =
[
	["grapes",95],
	["apple",65],
	["rabbit",75],
	["salema",55],
	["whiskey",250],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["detector",1000],
	["hazmatg",2000],
	["tbacon",75],
	["lockpick",750],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["spikeStrip",2500],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",250000],
	["storagebig",750000],
	["hgloves",25000],
	["kidney",75000],
	["scalpel",15000],
	["underwatercharge",50000],
	["ziptie",5000],
	["hknife",2500],
	["carbomb",1500000],
	["jaws",10000]
];
__CONST__(gsn_buy_array,gsn_buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["10Rnd_762x51_Mag",75],
	["20Rnd_762x51_Mag",100],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_DMR_01_F",10000],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",550],
	["C_Hatchback_01_F",1500],
	["C_Offroad_01_F", 2500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",5250],
	["C_Van_01_transport_F",7890],
	["C_Hatchback_01_sport_F",2350],
	["C_Van_01_fuel_F",4500],
	["I_Heli_Transport_02_F",100000],
	["C_Van_01_box_F",9000],
	["I_Truck_02_transport_F",12000],
	["I_Truck_02_covered_F",14500],
	["I_MRAP_03_F",7500],
	["B_Truck_01_transport_F",25650],
	["B_Truck_01_box_F", 35000],
	["O_MRAP_02_F",45000],
	["C_Heli_Light_01_civil_F",40000], //New Civilian Helo
	["B_Heli_Light_01_F",60000],
	["O_Heli_Light_02_unarmed_F",65000],
	["C_Rubberboat",400],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",450],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",16500],
	["B_SDV_01_F",25000],
	["B_MRAP_01_F",7500],
	["O_Truck_03_covered_F",125000],
	["I_Heli_light_03_unarmed_F",70000],
	["O_Truck_03_device_F",375000],
	["O_Heli_Transport_04_box_F", 1250000], // Donator Taru (Cargo)
	["O_Heli_Transport_04_covered_F", 100000], // Civilian Taru (Transport)
	["O_Heli_Transport_04_bench_F", 100000], // Rebel Taru (Bench)
	["O_Heli_Transport_04_medevac_F", 10000], // Medic Taru (MedEvac)
	["B_Heli_Transport_03_unarmed_F", 125000], // Civilian Huron (Black)
	["B_Heli_Transport_03_unarmed_green_F", 75000] // Donator Huron (Green)
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",950],
	["C_Hatchback_01_F",4500],
	["C_Offroad_01_F", 6500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",15000],
	["C_Van_01_transport_F",25000],
	["C_Hatchback_01_sport_F",7500],
	["C_Van_01_fuel_F",3850],
	["I_Heli_Transport_02_F",125000],
	["I_MRAP_03_F",25000],
	["C_Van_01_box_F",35000],
	["I_Truck_02_transport_F",49800],
	["I_Truck_02_covered_F",25000],
	["B_Truck_01_transport_F",135000],
	["B_Truck_01_box_F", 150000],
	["O_MRAP_02_F",65000],
	["C_Heli_Light_01_civil_F",57000], //New Civilian Helo
	["B_Heli_Light_01_F",65000],
	["O_Heli_Light_02_unarmed_F",72500],
	["C_Rubberboat",950],
	["C_Boat_Civil_01_F",6800],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_Boat_Armed_01_minigun_F",21000],
	["B_SDV_01_F",45000],
	["B_MRAP_01_F",25000],
	["O_Truck_03_covered_F",1000000],
	["O_Truck_03_device_F",1500000],
	["O_Heli_Transport_04_box_F", 250000], // Donator Taru (Cargo)
	["O_Heli_Transport_04_covered_F", 1000000], // Civilian Taru (Transport)
	["O_Heli_Transport_04_bench_F", 2500000], // Rebel Taru (Bench)
	["O_Heli_Transport_04_medevac_F", 50000], // Medic Taru (MedEvac)
	["B_Heli_Transport_03_unarmed_F", 2000000], // Civilian Huron (Black)
	["B_Heli_Transport_03_unarmed_green_F", 1250000] // Donator Huron (Green)

];
__CONST__(life_garage_sell,life_garage_sell);

//crime id, name, class, bounty,ticket, type (auto/manual)
gsn_crimes_array = [];

gsn_crimes_array pushBack ["1","Unnecessary Use of Horn","V",250,500,0];
gsn_crimes_array pushBack ["2","Driving w/o Headlights","V",250,500,0];
gsn_crimes_array pushBack ["3","Failure to Yield to Pedestrians","V",500,1000,0];
gsn_crimes_array pushBack ["4","Obstruction of Traffic","V",750,1500,0];
gsn_crimes_array pushBack ["5","Speeding","V",750,1500,0];
gsn_crimes_array pushBack ["6","Driving w/o License","V",1000,2000,0];
gsn_crimes_array pushBack ["7","Unsafe Motor Vehicle Operation","V",1250,2500,0];
gsn_crimes_array pushBack ["8","Illegal Chopper Landing","V",2500,5000,0];
gsn_crimes_array pushBack ["9","Leaving the Scene of an Accident","V",1250,2500,0];
gsn_crimes_array pushBack ["10","Disturbing the Peace","M",1250,2500,0];
gsn_crimes_array pushBack ["11","Brandishing (Legal)","M",1250,2500,0];
gsn_crimes_array pushBack ["12","Interfering with Police","M",2500,5000,0];
gsn_crimes_array pushBack ["13","Entering Police HQ","M",2500,5000,0];
gsn_crimes_array pushBack ["14","Federal Reserve Trespassing","M",2500,5000,0];
gsn_crimes_array pushBack ["15","Hunting w/o License","M",2500,5000,0];
gsn_crimes_array pushBack ["16","Drunk in Public","M",500,5000,0];
gsn_crimes_array pushBack ["17","Public Discharge","M",3500,7000,0];
gsn_crimes_array pushBack ["18","Solicitation","M",1250,2500,0];
gsn_crimes_array pushBack ["19","Hit and Run","F",5000,10000,0];
gsn_crimes_array pushBack ["20","Attempted Murder","F",7500,15000,0];
gsn_crimes_array pushBack ["21","Kidnapping","F",7500,15000,0];
gsn_crimes_array pushBack ["22","Attempted Kidnapping","F",3750,7500,0];
gsn_crimes_array pushBack ["23","Evading Arrest","F",12500,25000,0];
gsn_crimes_array pushBack ["24","Assault on an Officer","F",20000,40000,0];
gsn_crimes_array pushBack ["25","Aiding a Felon","F",15000,30000,0];
gsn_crimes_array pushBack ["26","False 911 Calls","F",5000,10000,0];
gsn_crimes_array pushBack ["27","Carrying an Illegal/Unlicensed Weapon","F",15000,30000,0];
gsn_crimes_array pushBack ["28","Brandishing Illegal Gear or Vechicles","F",15000,30000,0];
gsn_crimes_array pushBack ["29","DUI","F",5000,10000,0];
gsn_crimes_array pushBack ["30","Breaking and Entering","F",7500,15000,0];
gsn_crimes_array pushBack ["31","Petty Theft","F",2500,5000,0];
gsn_crimes_array pushBack ["32","Attempted Bank Robbery","F",25000,50000,0];
gsn_crimes_array pushBack ["33","Attempted Organ Theft","F",5000,10000,0];
gsn_crimes_array pushBack ["34","Theft of Police Property","F",15000,30000,0];
gsn_crimes_array pushBack ["35","Impersonating a Police Officer","F",15000,30000,0];
gsn_crimes_array pushBack ["36","Grand Theft","F",12500,25000,0];
gsn_crimes_array pushBack ["37","Abusing Government Resources","M",2500,5000,0];

// Automatic Fines
gsn_crimes_array pushBack ["186","Terror Threat","F",25000,50000,1];
gsn_crimes_array pushBack ["187V","Vehicular Manslaughter","F",10000,20000,1];
gsn_crimes_array pushBack ["187","Manslaughter","F",20000,40000,1];
gsn_crimes_array pushBack ["188","Robbery","F",10000,20000,1];
gsn_crimes_array pushBack ["189","Assault","F",7500,15000,1];
gsn_crimes_array pushBack ["190","Use of Illegal Explosives","F",5000,10000,1];
gsn_crimes_array pushBack ["198","Grand Theft","F",12500,25000,1];
gsn_crimes_array pushBack ["191","Attempted Auto Theft","F",12500,25000,1];
gsn_crimes_array pushBack ["192","Public Intoxication","F",7500,15000,1];
gsn_crimes_array pushBack ["193","Burglary","F",10000,20000,1];
gsn_crimes_array pushBack ["194","Possession of Illegal Items","F",15000,30000,1];
gsn_crimes_array pushBack ["195","Intent to Sell Illegal Items","F",5000,10000,1];
gsn_crimes_array pushBack ["196","Drug Trafficking","F",15000,30000,1];
gsn_crimes_array pushBack ["197","Moving Stolen Goods","F",15000,30000,1];
gsn_crimes_array pushBack ["199","Tax Evasion","F",1000,2000,1];
gsn_crimes_array pushBack ["200","Unlicensed Hunting","F",7500,15000,1];
gsn_crimes_array pushBack ["201","Animal Poaching","F",5000,10000,1];
gsn_crimes_array pushBack ["202","Escaping Jail","F",5000,10000,1];
gsn_crimes_array pushBack ["203","Organ Theft","F",10000,20000,1];
gsn_crimes_array pushBack ["204","Bank Robbery","F",37500,75000,1];
gsn_crimes_array pushBack ["205","Attempted Terrorism","F",37500,75000,1];

__CONST__(gsn_crimes_array,gsn_crimes_array);