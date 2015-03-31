/*
	File: fn_replaceOrgan.sqf
*/

if(gsn_life_cash < 10000) exitWith {hint format[localize "STR_NOTF_HS_NoCash",10000];};

player setVariable["missingOrgan",false,true];
gsn_life_thirst = 100;
gsn_life_hunger = 100;
life_max_health = 1;
player setFatigue .5;

[10000,0,1] call life_fnc_handleMoney;

