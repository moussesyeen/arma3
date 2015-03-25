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
life_net_dropped = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 1.30; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_vdFoot = viewDistance;
life_vdCar = viewDistance;
life_vdAir = viewDistance;
tawvd_addon_disable = true;
life_fadeSound = false; //Maxi 2/6/2015
life_capture_point = -1; //Maxi 2/8/2015
life_drink = 0; // bar shit maxi 2/13/2015
life_smoke = objNull; //drug use
life_handcuffs = ObjNull; //zipties	
life_handcuffkeys = ObjNull;  //ziptie keys 
life_escape = false; //jail break
gsn_wanted_status = 0;
life_object = objNull;
life_atm_lastCheckTime = time; //ATMs
life_atm_lastCheckResult = false; //ATMS
life_fed_hacked = false;

life_AG_clothing = [
	"H_Shemag_khk",
	"H_Shemag_tan",
	"H_Shemag_olive",
	"H_Shemag_olive_hs",
	"H_ShemagOpen_khk",
	"H_ShemagOpen_tan",
	"G_Balaclava_lowprofile",
	"G_Balaclava_combat",
	"G_Bandanna_beast"
];
life_AGNAME_clothing = [
	"U_I_GhillieSuit",
	"U_O_GhillieSuit",
	"U_I_GhillieSuit"
];
/*
**************************
******Skill Variables*****
**************************
*/
life_max_talents = 7;
life_skills = [[],0,0]; //Empty skill list.

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_thirst = 100;
life_hunger = 100;
CASH = 0;
life_smartphoneTarget = ObjNull;
life_istazed = false;
life_vehicles = [];
life_nlrtimer_stop = false; //NLR Timer Maxi 2/7/2015
life_nlrtimer_running = false; //NLR Timer Maxi 2/7/2015
life_explorer_wrecks = objNull; //shipwreck Maxi
life_wreck_searched = false; //shipwreck Maxi
life_isSuicide = false;

switch (playerSide) do {
	case west: {
		BANK = 125000; //Starting Bank Money
		life_paycheck = 5000; //Paycheck Amount
	};
	
	case civilian: {
		BANK = 125000; //Starting Bank Money
		life_paycheck = 5000; //Paycheck Amount
	};
	
	case independent: {
		BANK = 125000;
		life_paycheck = 5000;
	};
};

/*
	Master Array of items?
*/
//Setup variable inv vars.
{
	SVAR_MNS [ITEM_VARNAME(configName _x),0];
} foreach ("true" configClasses (missionConfigFile >> "VirtualItems"));

/* Setup the BLAH! */
{
	_varName = getText(_x >> "variable");
	_sideFlag = getText(_x >> "side");
	
	SVAR_MNS [LICENSE_VARNAME(_varName,_sideFlag),false];
} foreach ("true" configClasses (missionConfigFile >> "Licenses"));

//Restrict vehicles Maxi 2-9-2015
life_slingload_allowed = 
[
	"We do not have any vehicles at the moment."
];

CONST(life_slingload_allowed,life_slingload_allowed);