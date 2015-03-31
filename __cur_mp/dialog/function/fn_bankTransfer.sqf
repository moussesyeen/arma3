/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if(isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if(_unit == player) exitWith {hint "You can't transfer money to yourself."};
if(_val > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > gsn_lifeatm_cash) exitWith {hint localize "STR_ATM_NotEnough"};
_tax = [_val] call life_fnc_taxRate;
if((_val + _tax) > gsn_lifeatm_cash) exitWith {hint format[localize "STR_ATM_SentMoneyFail",_val,_tax]};

[(_val + _tax),1,1] call life_fnc_handleMoney;

[[_val,profileName],"TON_fnc_clientWireTransfer",_unit,false] spawn life_fnc_MP;
[] call life_fnc_atmMenu;
hint format[localize "STR_ATM_SentMoneySuccess",[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText];
[1] call SOCK_fnc_updatePartial;