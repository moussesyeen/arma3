#include <macro.h>
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater","_mine","_tool","_type"];
_curTarget = cursorTarget;
if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(life_interrupted) exitWith {life_interrupted = false;};
_isWater = surfaceIsWater (getPosASL player);
if(isNull _curTarget) exitWith {
	if(_isWater) then {
		private["_fish"];
		_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") then {
			[_fish] call life_fnc_catchFish;
		};
	} else {
		if(playerSide == civilian  && !life_action_gathering) then
		{
			switch (true) do
			{
				case (player distance (getMarkerPos "lead_1") < 30): {_mine = "copperore"; _type = 1;};
				case (player distance (getMarkerPos "iron_1") < 30): {_mine = "ironore"; _type = 1;};
				case (player distance (getMarkerPos "salt_1") < 120) : {_mine = "salt"; _type = 1;};
				case (player distance (getMarkerPos "sand_1") < 75) : {_mine = "sand"; _type = 1;};
				case (player distance (getMarkerPos "diamond_1") < 50): {_mine = "diamond"; _type = 1;};
				case (player distance (getMarkerPos "oil_1") < 40) : {_mine = "oilu"; _type = 1;};
				case (player distance (getMarkerPos "oil_2") < 40) : {_mine = "oilu"; _type = 1;};
				case (player distance (getMarkerPos "rock_1") < 50): {_mine = "rock"; _type = 1;};
				case (player distance (getMarkerPos "sulfur_1") < 50): {_mine = "sulfur"; _type = 1;};
				case (player distance (getMarkerPos "uranium_1") < 50): {_mine = "uranium"; _type = 1;};
				case (player distance (getMarkerPos "apple_1") < 50): {_mine = "apple"; _type = 2;};
				case (player distance (getMarkerPos "apple_2") < 50): {_mine = "apple"; _type = 2;};
				case (player distance (getMarkerPos "apple_3") < 50): {_mine = "apple"; _type = 2;};
				case (player distance (getMarkerPos "apple_4") < 50): {_mine = "apple"; _type = 2;};
				case (player distance (getMarkerPos "peaches_1") < 50): {_mine = "peach"; _type = 2;};
				case (player distance (getMarkerPos "peaches_2") < 50): {_mine = "peach"; _type = 2;};
				case (player distance (getMarkerPos "peaches_3") < 50): {_mine = "peach"; _type = 2;};
				case (player distance (getMarkerPos "peaches_4") < 50): {_mine = "peach"; _type = 2;};
				case (player distance (getMarkerPos "heroin_1") < 50): {_mine = "heroinu"; _type = 2;};
				case (player distance (getMarkerPos "cocaine_1") < 50): {_mine = "cocaine"; _type = 2;};
				case (player distance (getMarkerPos "weed_1") < 50): {_mine = "cannabis"; _type = 2;};
				case (player distance (getMarkerPos "grapes_1") < 50): {_mine = "pgrapes"; _type = 2;};
				case (player distance (getMarkerPos "grapes_2") < 50): {_mine = "pgrapes"; _type = 2;};
				case (player distance (getMarkerPos "beach_1") < 50): {_mine = "treasure"; _type = 3;};
				case (player distance (getMarkerPos "beach_2") < 50): {_mine = "treasure"; _type = 3;};
				case (player distance (getMarkerPos "beach_3") < 50): {_mine = "treasure"; _type = 3;};
				case (player distance (getMarkerPos "beach_4") < 50): {_mine = "treasure"; _type = 3;};
				default {_mine = "";_type = 0;};
			};
			switch(_type) do
			{
				case 1:
				{
					_tool = missionNamespace getVariable (["pickaxe",0] call life_fnc_varHandle);
					if(_tool > 0) then
					{
						_handle = [] spawn life_fnc_pickAxeUse;
						waitUntil {scriptDone _handle};

					}
					else
					{
						hint localize "You need a pickaxe to mine here.";
					};
				};
				case 2:
				{
					[] spawn life_fnc_gather;
				};
				case 3:
				{
					_tool = missionNamespace getVariable (["detector",0] call life_fnc_varHandle);
					if(_tool > 0) then
					{
						_handle = [] spawn life_fnc_detectorUse;
						waitUntil {scriptDone _handle};
					}
					else
					{
						hint localize "You need a metal detector to search here.";
					};
				};
			};
		};
	};
};

if(_curTarget isKindOf "House_F" && {player distance _curTarget < 12} OR ((nearestObject [[16019.5,13857.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16740.5,13857.9,0],"Land_Airport_Tower_F"]) == _curTarget)) exitWith {
	[_curTarget] call life_fnc_houseMenu;
};

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
life_action_inUse = true;

//Temp fail safe.
[] spawn {
	uiSleep 60;
	life_action_inUse = false;
};

//Check if it's a dead body.
if(_curTarget isKindOf "Man" && {!alive _curTarget} && {playerSide in [west,independent]}) exitWith {
	//Hotfix code by ins0
	if(((playerSide == blufor && {(call life_revive_cops)}) || playerSide == independent) && {"Medikit" in (items player)}) then {
		[_curTarget] call life_fnc_revivePlayer;
	};
};


//If target is a player then check if we can use the cop menu.
if(isPlayer _curTarget && _curTarget isKindOf "Man") then {
	if((_curTarget getVariable["restrained",false]) && !dialog && playerSide == west) then {
		[_curTarget] call life_fnc_copInteractionMenu;
		};
    if((_curTarget getVariable["restrained",false]) && !dialog && playerSide == civilian) then {
        [_curTarget] call life_fnc_civInteractionMenu;
	    };
} else {
	//OK, it wasn't a player so what is it?
	private["_isVehicle","_miscItems","_money"];
	_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];
	_huntedTypes = ["Goat_random_F","Sheep_random_F"];
	_money = "Land_Money_F";

	//It's a vehicle! open the vehicle interaction key!
	if(_isVehicle) then {
		if(!dialog) then {
			if(player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2) then {
				[_curTarget] call life_fnc_vInteractionMenu;
			};
		};
	} else {
		//Is it a animal type?
		if((typeOf _curTarget) in _animalTypes) then {
			if((typeOf _curTarget) == "Turtle_F" && !alive _curTarget) then {
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_catchTurtle;
				waitUntil {scriptDone _handle};
			} else {
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_catchFish;
				waitUntil {scriptDone _handle};
			};
		} else {
			//OK, it wasn't a vehicle so let's see what else it could be?
			if((typeOf _curTarget) in _miscItems) then {
				//OK, it was a misc item (food,water,etc).
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_pickupItem;
				waitUntil {scriptDone _handle};
			} else {
				//It wasn't a misc item so is it money?
				if((typeOf _curTarget) == _money && {!(_curTarget getVariable["inUse",false])}) then {
					private["_handle"];
					_curTarget setVariable["inUse",TRUE,TRUE];
					_handle = [_curTarget] spawn life_fnc_pickupMoney;
					waitUntil {scriptDone _handle};
				};
			};
		};
	};
	if((typeOf _curTarget) in _huntedTypes) then
	{
		if(!alive _curTarget) then
		{
			if!(_curTarget getVariable["has_meat",false]) then
			{
				hint "This animal has already been gutted!";
			}
			else
			{
				_handle = [_curTarget] spawn life_fnc_gatherMeat;
				waitUntil {scriptDone _handle};
			};
		};
	};
};