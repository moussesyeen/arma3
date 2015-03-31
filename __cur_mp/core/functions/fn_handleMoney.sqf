#include <macro.h>

private ["_cashType","_mathType","_amount"];

_amount = [_this,0,0,[0]] call BIS_fnc_param;
_cashType = [_this,1,0,[0]] call BIS_fnc_param; //0 = onhand | 1 = atm
_mathType = [_this,2,0,[0]] call BIS_fnc_param; //0 = add | 1 = subtract

if(_amount == 0) exitWith {};
if!(_cashType in [0,1]) exitWith {};
if!(_mathType in [0,1]) exitWith {};

/*
if(gsn_life_cash != (gsn_cash_cache_array select gsn_cash_caches_index) - (call gsn_cash_cache_checksum)) exitWith
{
	[[player getVariable["realname",name player],_amount,_cashType,_mathType],"life_fnc_paroniNotice",true,false] spawn life_fnc_MP;
};

if(gsn_lifeatm_cash != (gsn_atm_cache_array select gsn_atm_caches_index) - (call gsn_atm_cache_checksum)) exitWith
{
	[[player getVariable["realname",name player],_amount,_cashType,_mathType],"life_fnc_paroniNotice",true,false] spawn life_fnc_MP;
};
*/

/*
diag_log "-----------------------------TRANSACTION VALUES----------------------------";
diag_log format["Server ticktime: %1",diag_tickTime];
diag_log format["Transaction Amount: %1",_amount];
if(_cashType == 1) then
{
	diag_log format["Transaction Type: %1","ATM"];
}
else
{
	diag_log format["Transaction Type: %1","Onhand Cash"];
};
if(_mathType == 1) then
{
	diag_log format["Math Type: %1","Subtraction"];
}
else
{
	diag_log format["Math Type: %1","Addition"];
};
diag_log "---------------------------END TRANSACTION VALUES--------------------------";

*/

switch(_cashType) do
{
	case 0:
	{
		switch(_mathType) do
		{
			case 0:{gsn_life_cash = gsn_life_cash + _amount;};
			case 1:{gsn_life_cash = gsn_life_cash - _amount;};
		};
	};
	case 1:
	{
		switch(_mathType) do
		{
			case 0:{gsn_lifeatm_cash = gsn_lifeatm_cash + _amount;};
			case 1:{gsn_lifeatm_cash = gsn_lifeatm_cash - _amount;};

		};
	};
};

/*gsn_cash_caches_index = ceil(random(call gsn_cash_cache_array_size));
gsn_atm_caches_index = ceil(random(call gsn_atm_cache_array_size));

for "_y" from 0 to (call gsn_cash_cache_array_size) step 1 do
{
	if(_y == gsn_cash_caches_index) then
	{
		gsn_cash_cache_array set [_y,gsn_life_cash + (call gsn_cash_cache_checksum)];
	}
	else
	{
		switch(ceil(random 3)) do
		{
			case 1:{gsn_cash_cache_array set [_y,gsn_life_cash];};
			case 2:{gsn_cash_cache_array set [_y,ceil(random(gsn_life_cash)) + ceil(random(call gsn_cash_cache_checksum))];};
			case 3:{gsn_cash_cache_array set [_y,(ceil(random(gsn_life_cash)) / 2) + ceil(random(call gsn_cash_cache_checksum))];};
		};
	};
};

for "_z" from 0 to (call gsn_atm_cache_array_size) step 1 do
{
	if(_z == gsn_atm_caches_index) then
	{
		gsn_atm_cache_array set [_z,gsn_lifeatm_cash + (call gsn_atm_cache_checksum)];
	}
	else
	{
		switch(ceil(random 3)) do
		{
			case 1:{gsn_atm_cache_array set [_z,gsn_lifeatm_cash];};
			case 2:{gsn_atm_cache_array set [_z,ceil(random(gsn_lifeatm_cash)) + ceil(random(call gsn_atm_cache_checksum))];};
			case 3:{gsn_atm_cache_array set [_z,(ceil(random(gsn_lifeatm_cash) / 2)) + ceil(random(call gsn_atm_cache_checksum))];};
		};
	};
};

*/