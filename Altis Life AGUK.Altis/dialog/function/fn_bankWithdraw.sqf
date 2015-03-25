#include <macro.h>
/*
	Bryan "Tonic" Boardwine
	
	Description:
	Withdraws money from the players account
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > BANK) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && BANK > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

ADD(CASH,_val);
SUB(BANK,_val);
hint format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

[[format["1|%1 has transfered %3£ to %2. The bankaccount from %1 has now a value of %4£.",player getVariable["realname",name player],_unit getVariable["realname",name _unit],[_val] call life_fnc_numberText,[life_atmcash] call life_fnc_numberText]],"Arma3Log",false,false] call life_fnc_MP;