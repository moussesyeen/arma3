/*
	Author: Bryan "Tonic" Boardwine
*/
private["_container","_unit"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;
_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1 && playerSide != west) then {
	hint localize "STR_MISC_Backpack";
	[] spawn {
		disableUserInput true;
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		disableUserInput false;
	};
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = (nearestObjects[getPosATL player,["House_F"],20] select 0);
	if(!(_house in gsn_life_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint localize "STR_House_ContainerDeny";
		[] spawn {
			disableUserInput true;
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			disableUserInput false;
		};
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
	if(!(_container in gsn_life_vehicles) && {(locked _container) == 2}) exitWith {
		hint localize "STR_MISC_VehInventory";
		[] spawn {
			disableUserInput true;
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			disableUserInput false
		};
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if(_container isKindOf "Man" && !alive _container) exitWith {
	hint localize "STR_NOTF_NoLootingPerson";
	[] spawn {
		disableUserInput true;
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		disableUserInput false;
	};
};