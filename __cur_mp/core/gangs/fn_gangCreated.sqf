#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
*/
private["_group"];
life_action_gangInUse = nil;

if(gsn_lifeatm_cash < (__GETC__(life_gangPrice))) exitWith {
	hint format[localize "STR_GNOTF_NotEnoughMoney",[((__GETC__(life_gangPrice))-gsn_lifeatm_cash)] call life_fnc_numberText];
	{(group player) setVariable[_x,nil,true];} foreach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gsn_gang_bank"];
};

[(__GETC__(life_gangPrice)),1,1] call life_fnc_handleMoney;
life_new_gang = true;
hint format[localize "STR_GNOTF_CreateSuccess",(group player) getVariable "gang_name",[(__GETC__(life_gangPrice))] call life_fnc_numberText];