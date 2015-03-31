/*
	File: fn_pickaxeUse.sqf
	Author: Mike "Paronity" Maguire
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val"];
if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
switch (true) do
{
	case (player distance (getMarkerPos "beach_1") < 30): {_mine = "treasure"; _val = 2;};
	case (player distance (getMarkerPos "beach_2") < 30): {_mine = "treasure"; _val = 2;};
	case (player distance (getMarkerPos "beach_3") < 30): {_mine = "treasure"; _val = 2;};
	case (player distance (getMarkerPos "beach_4") < 30): {_mine = "treasure"; _val = 2;};
	default {_mine = "";};
};

if(_mine == "") exitWith {hint "You are not near a beach!"};
if(vehicle player != player) exitWith {hint "You can't detect treasure from inside a car!";};

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint "Your inventory is full."};
life_action_inUse = true;
life_action_gathering = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	uiSleep 2.5;
};

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format["You have mined %2 %1",_itemName,_diff],"PLAIN"];
};
life_action_inUse = false;
life_action_gathering = false;