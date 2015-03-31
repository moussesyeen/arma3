/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > gsn_life_cash) exitWith {hint localize "STR_ATM_NotEnoughCash"};

[_value,0,1] call life_fnc_handleMoney;
[_value,1,0] call life_fnc_handleMoney;

hint format[localize "STR_ATM_DepositMSG",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;