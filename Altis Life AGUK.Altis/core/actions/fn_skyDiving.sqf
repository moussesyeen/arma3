/*
	File: fn_skyDiving.sqf
	Author: Maximum @ AltisGaming.co.uk
	Desc: Makes the player skydive.
*/
if(life_action_inUse) exitWith {};
life_action_inUse = true;
life_skydive_backpack = backpack player;
life_skydive_backpackItems = backpackItems player;

_pos = getPosATL player;
_pos set[5,000]; //Calculate the position to drop from.

cutText ["", "BLACK OUT", 5];
sleep 3;
cutText ["You are about to skydive!", "BLACK FADED"];
0 cutFadeOut 999999; 
sleep 1;
player setVelocity [0,0,0];
player addBackpack "B_Parachute";
sleep 5;
player setPosATL _pos;
_currentView = viewDistance;
setViewDistance 6000;
cutText["","PLAIN"];  

waitUntil {isTouchingGround player};
hint "Here is your old backpack!";
removeBackpack player;
player addBackpack life_skydive_backpack;
clearBackpackCargo player;
{
	[_x,true,true] call life_fnc_handleItem;
} foreach life_skydive_backpackItems;

setViewDistance _currentView;
life_action_inUse = false;