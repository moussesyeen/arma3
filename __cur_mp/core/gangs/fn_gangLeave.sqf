#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
*/
private["_grp","_grpMembers"];
if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_grpMembers = grpPlayer getVariable "gang_members";
_grpMembers = _grpMembers - [steamid];
grpPlayer setVariable["gang_members",_grpMembers,true];
[[4,grpPlayer,player],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;

closeDialog 0;