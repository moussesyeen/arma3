/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_unit"];
_unit = _this select 1;
if(life_bail_paid) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 3500;};
if(!isNil "life_canpay_bail") exitWith {hint localize "STR_NOTF_Bail_Post"};
if(gsn_lifeatm_cash < life_bail_amount) exitWith {hint format[localize "STR_NOTF_Bail_NotEnough",life_bail_amount];};

[life_bail_amount,1,1] call life_fnc_handleMoney;
life_bail_paid = true;
[[0,format[localize "STR_NOTF_Bail_Bailed", _unit getVariable ["realname",name _unit]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;