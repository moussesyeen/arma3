/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
*/
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(gsn_life_cash < life_ticket_val) then
{
	if(gsn_lifeatm_cash < life_ticket_val) then
	{
		hint localize "STR_Cop_Ticket_NotEnough";
		[[1,format[localize "STR_Cop_Ticket_NotEnoughNOTF",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
		life_ticket_paid = false;
	}
	else
	{
		[life_ticket_val,1,1] call life_fnc_handleMoney;
		life_ticket_paid = true;
	};
}
else
{
	[life_ticket_val,0,1] call life_fnc_handleMoney;
	life_ticket_paid = true;
};

if(life_ticket_paid) then
{
	hint format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call life_fnc_numberText];
	[[0,format[localize "STR_Cop_Ticket_PaidNOTF",profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	[[1,format[localize "STR_Cop_Ticket_PaidNOTF_2",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
	[[life_ticket_val,player,life_ticket_cop],"life_fnc_ticketPaid",life_ticket_cop,false] spawn life_fnc_MP;
};

closeDialog 0;