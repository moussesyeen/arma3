/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_allowedValues"];
if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
[[0,"STR_Cop_TicketGive",true,[profileName,[35000] call life_fnc_numberText,life_ticket_unit getVariable["realname",name life_ticket_unit]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
[[player,35000],"life_fnc_ticketPrompt10",life_ticket_unit,false] spawn life_fnc_MP;
closeDialog 0;