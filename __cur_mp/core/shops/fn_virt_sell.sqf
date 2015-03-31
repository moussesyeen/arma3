#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_type","_index","_price","_var","_amount","_name","_marketprice"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,__GETC__(gsn_sell_array)] call TON_fnc_index;
if(_index == -1) exitWith {};
_price = (__GETC__(gsn_sell_array) select _index) select 1;
_var = [_type,0] call life_fnc_varHandle;

_marketprice = [_type] call life_fnc_marketGetSellPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};

_amount = ctrlText 2405;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint localize "STR_Shop_Virt_NotEnough"};

_price = (_price * _amount);
_name = [_var] call life_fnc_vartostr;
if(([false,_type,_amount] call life_fnc_handleInv)) then
{
	hint format[localize "STR_Shop_Virt_SellItem",_amount,_name,[_price] call life_fnc_numberText];
	[_price,0,0] call life_fnc_handleMoney;
	if(_marketprice != -1) then
    {
        [_type, _amount] spawn
        {
        	if(_type == "") exitWith {};
			if(isNull _amount) exitWith {};
            uiSleep 60;
            [_this select 0,_this select 1] call life_fnc_marketSell;
            [[_this select 0,_this select 1],"DB_fnc_marketInsertTimes",false,false] call life_fnc_MP; // Sends the shortname and amount of the sold item to the server
        };
    };
	[true] call life_fnc_virt_update;
};

if(life_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call TON_fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	}
		else
	{
		_array pushBack [getPlayerUID player,profileName,_price];
		life_shop_npc setVariable["sellers",_array,true];
	};
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
[] call life_fnc_updateSkins;