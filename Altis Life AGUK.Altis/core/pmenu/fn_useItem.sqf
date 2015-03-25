#include <macro.h>
/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private "_item";
disableSerialization;
if(EQUAL(lbCurSel 2005,-1)) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = CONTROL_DATA(2005);

switch (true) do {
	case (_item in ["waterBottle","coffee","redgull"]): {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			life_thirst = 100;
			if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 0;};
			if(EQUAL(_item,"redgull") && {EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)}) then {
				[] spawn {
					life_redgull_effect = time;
					titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
					player enableFatigue false;
					waitUntil {!alive player OR ((time - life_redgull_effect) > (7 * 60))};
					player enableFatigue true;
				};
			};
		};
	};
	
	case (EQUAL(_item,"boltcutter")): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (_item == "medlight"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn {
				hint "You get out your medlight and attach it to your left hand.";
				_chemlight = "Chemlight_green" createVehicle [0,0,0];
				_chemlight attachTo[player,[0,0,0],"lefthand"];
				sleep 600;
				deleteVehicle _chemlight;
				hint "Your medlight has ran out.";
			};
		};
	};
	
	case (EQUAL(_item,"blastingcharge")): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
	
	case (EQUAL(_item,"defusekit")): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};
	
	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};
	
	case (EQUAL(_item,"spikeStrip")): {
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (EQUAL(_item,"fuelFull")): {
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	
	case (_item in ["apple","rabbit","rabbit_grilled","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donut","tbacon","peach","hen_fried","rooster_grilled","sheep_grilled","goat_grilled"]): {
		if(!(EQUAL(M_CONFIG(getNumber,"VirtualItems",_item,"edible"),-1))) then {
			if([false,_item,1] call life_fnc_handleInv) then {
				_val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
				_sum = life_hunger + _val;
				switch (true) do {
					case (_val < 0 && _sum < 1): {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
					case (_sum > 100): {life_hunger = 100;};
					default {life_hunger = _sum;};
				};
			};
		};
	};
	
	case (_item == "lance"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_LanceInVehicle"};
		[] spawn life_fnc_lance;
	};

	case (EQUAL(_item,"pickaxe")): {
		[] spawn life_fnc_pickAxeUse;
	};
	
	case (_item in ["marijuana","heroin_processed","cocaine_processed","meth_processed","medmarijuana"]):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[_item] spawn life_fnc_drugUse;
		};
	};
	
	case (_item =="whiskey"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.06;
			if (life_drink < 0.07) exitWith {};
			[] spawn life_fnc_drinkwhiskey;
		};
	};
	
	case (_item =="beer"):
	{
		
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.06) exitWith {};
			[] spawn life_fnc_drinkbeer;
		};
	};
	
	default {
		hint localize "STR_ISTR_NotUsable";
	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;