#include <macro.h>
/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > CASH) exitWith {hint localize "STR_ATM_NotEnoughCash"};

CASH = CASH - _value;
BANK = BANK + _value;

hint format[localize "STR_ATM_DepositMSG",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

[[format ["1|%1 has payed %2£ into his account. %1 has now %3 on his bankaccount",player getVariable["realname",name player],[_value] call life_fnc_numberText,[BANK] call life_fnc_numberText]],"Arma3Log",false,false] call life_fnc_MP;
