/*
	File: fn_zoneCreator.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates triggers around the map to add the addAction for specific
	fields such as apples, cocaine, heroin, etc. This method is to reduce
	CPU load.
	
	Note: 
	Triggers are NOT my preferred method so this is considered temporary until a more suitable
	option is presented.
*/
//Create modshop zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["vehicle player in thislist && driver (vehicle player) == player","LIFE_Action_Modshop = player addAction[""Sprayshop"",life_fnc_modShopInit,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Modshop;"];
} foreach ["modshop_1","modshop_2","modshop_3","modshop_4","modshop_5"];