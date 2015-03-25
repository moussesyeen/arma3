/*
	Author: Maximum
	Version: 1.0
	Description: Gives a visual value for the treasure and converts it to a sellable item.
	(Just for some depth for the whole system)
	AltisGaming.co.uk ONLY
*/
private ["_potteryage","_artifacts"];
_potteryage = ["10,000AD","12,000AD","15,000BC","17,000BC"] call BIS_fnc_selectRandom;

	If (life_inv_roundobject == 1) then {
	hintC format ["This appears to be some kind of stone carving, and is atleast 1000 years old based on similar pieces I have seen, I would say this is worth around £125000."];
	life_inv_roundobject = 0;
	life_inv_carvedstone = 1; //Swaps the unknown item for a known one
	life_wreck_searched = false;
	life_explorer_task setTaskState "Succeeded";
	player removeSimpleTask life_explorer_task;
	deleteVehicle life_explorer_wreck;
	sleep 1; 
	["TaskSucceeded", ["Treasure Hunting", "Your items were valued! You can now sell them to the trader."]] call bis_fnc_showNotification;
	};
	
	If (life_inv_squareobject == 1) then {
	hintC format ["This is some kind of ancient stone tablet, I would estimate this would be worth approximately £125000."];
	life_inv_squareobject = 0;
	life_inv_stonetablet = 1; //Swaps the unknown item for a known one
	life_wreck_searched = false;
	life_explorer_task setTaskState "Succeeded";
	player removeSimpleTask life_explorer_task;
	deleteVehicle life_explorer_wreck;
	sleep 1;
	["TaskSucceeded", ["Treasure Hunting", "Your items were valued! You can now sell them to the trader."]] call bis_fnc_showNotification;
	};
	
	If (life_inv_pottery == 1) then {
	hintC format ["This is an extremely rare piece of pottery, It is probably worth around £175000 as it looks to be from around " + _potteryage]; 
	life_wreck_searched = false;
	life_explorer_task setTaskState "Succeeded";
	player removeSimpleTask life_explorer_task;
	deleteVehicle life_explorer_wreck;
	sleep 1; 
	["TaskSucceeded", ["Treasure Hunting", "Your items were valued! You can now sell them to the trader."]] call bis_fnc_showNotification;
	};
	
	If (life_inv_coins == 1) then {
	hintC format ["These coins are extremely valuable, and will be worth around £500000."];
	life_inv_coins = 0;
	life_inv_valuablecoins = 1;
	life_wreck_searched = false;
	life_explorer_task setTaskState "Succeeded";
	player removeSimpleTask life_explorer_task;
	deleteVehicle life_explorer_wreck;
	sleep 1; 
	["TaskSucceeded", ["Treasure Hunting", "Your items were valued! You can now sell them to the trader."]] call bis_fnc_showNotification;
	};
	
	