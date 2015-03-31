/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			gsn_life_thirst = 100;
			player setFatigue 0;
		};
	};

	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};

	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};

	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};

	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};

	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			gsn_life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};

	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};

	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};

	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};

	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
		[_item] call life_fnc_eatFood;
	};

	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};

	case (_item == "carbomb"):
	{
		[] spawn life_fnc_carBomb;
	};

	case (_item in ["cocainep","marijuana","heroinp"]):
	{
	    if(([false,_item,1] call life_fnc_handleInv)) then
	    {
	        [] spawn life_fnc_getHigh;
	    };
	};

	case (_item =="vodka"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if(life_bac == 1) exitWith {hint "You cannot drink any more at this time. Slow down!";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(life_bac < 1) then
			{
				if(isNil "life_bac") then {life_bac = 0;};
				if(life_bac >= 0.92) then
				{
					life_bac = 1;
				}
				else
				{
					life_bac = life_bac + 0.08;
				};
			};
		};
	};

	case (_item =="moonshine"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if(life_bac == 1) exitWith {hint "You cannot drink any more at this time. Slow down!";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(life_bac < 1) then
			{
				if(isNil "life_bac") then {life_bac = 0;};
				if(life_bac >= 0.90) then
				{
					life_bac = 1;
				}
				else
				{
					life_bac = life_bac + 0.10;
				};
			};

		};
	};

	case (_item =="whiskey"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if(life_bac == 1) exitWith {hint "You cannot drink any more at this time. Slow down!";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(life_bac < 1) then
			{
				if(isNil "life_bac") then {life_bac = 0;};
				if(life_bac >= 0.94) then
				{
					life_bac = 1;
				}
				else
				{
					life_bac = life_bac + 0.06;
				};
			};
		};
	};

	case (_item == "detector"):
	{
		[] spawn life_fnc_detectorUse;
	};

	case (_item == "kidney"):
	{
		if((player getVariable["missingOrgan",false])) then
		{
			if(([false,_item,1] call life_fnc_handleInv)) then
			{
				player setVariable["missingOrgan",false,true];
				gsn_life_thirst = 100;
				gsn_life_hunger = 100;
				player setFatigue .5;
			}
			else
			{
				hint localize "You dont have a kidney to use!";
			};
		}
		else
		{
			hint localize "STR_NOTF_HasKidney";
		};
	};

	case (_item == "underwatercharge"): {
		player reveal gold_safe;
		(group player) reveal gold_safe;
		[cursorTarget] spawn life_fnc_underwaterCharge;
	};

	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;