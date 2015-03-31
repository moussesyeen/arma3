#include <macro.h>

_arrayInt = [10,11,12,13,14,15,16,17,18,19,20] call BIS_fnc_selectRandom;
__CONST__(gsn_cash_cache_array_size,_arrayInt);
_arrayInt = [10,11,12,13,14,15,16,17,18,19,20] call BIS_fnc_selectRandom;
__CONST__(gsn_atm_cache_array_size,_arrayInt);

__CONST__(gsn_cash_cache_checksum,ceil(random 9251));
__CONST__(gsn_atm_cache_checksum,ceil(random 9484));

gsn_cash_caches_index = ceil(random(call gsn_cash_cache_array_size));
gsn_atm_caches_index = ceil(random(call gsn_atm_cache_array_size));

for "_y" from 0 to (call gsn_cash_cache_array_size) step 1 do
{
	gsn_cash_cache_array pushBack 0;
};

for "_y" from 0 to (call gsn_atm_cache_array_size) step 1 do
{
	gsn_atm_cache_array pushBack 0;
};

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

