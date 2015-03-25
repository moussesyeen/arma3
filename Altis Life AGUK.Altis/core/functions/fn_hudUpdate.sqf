/*
	File: fn_hudUpdate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_healthbar","_foodbar","_waterbar","_bountybar","_food","_water","_health","_bounty"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_food = _ui displayCtrl 23500;
_foodbar = _ui displayCtrl 23501;
_water = _ui displayCtrl 23510;
_waterbar = _ui displayCtrl 23511;
_health = _ui displayCtrl 23515;
_healthbar = _ui displayCtrl 23516;
_bounty = _ui displayCtrl 23521;
_bountybar = _ui displayCtrl 23520;


/*Update Water*/
_water ctrlSetPosition [safeZoneX+safeZoneW-0.06,safeZoneY+safeZoneH-0.267];
_water ctrlCommit 0;
_waterbar progressSetPosition (life_thirst / 100);
/*Update food*/
_food ctrlSetPosition [safeZoneX+safeZoneW-0.06,safeZoneY+safeZoneH-0.222];
_food ctrlCommit 0;
_foodbar progressSetPosition (life_hunger / 100);
/*Update Health*/
_health ctrlSetPosition [safeZoneX+safeZoneW-0.06,safeZoneY+safeZoneH-0.177];
_health ctrlCommit 0;
_healthbar progressSetPosition (-(damage player - 1));
//Update Bounty
_bounty ctrlSetPosition [safeZoneX+safeZoneW-0.26,safeZoneY+safeZoneH-0.132];
_bounty ctrlSetText format["£%1", ([gsn_wanted_status] call life_fnc_numberText)];
_bounty ctrlCommit 0;
_bountybar progressSetPosition (100);