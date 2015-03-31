#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
*/
private["_unit","_unitID","_leaders"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint localize "STR_GNOTF_SelectLeader"};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint localize "STR_GNOTF_AlreadyLeader"};

_unitID = getPlayerUID _unit;
_leaders = grpPlayer getVariable "gang_leaders";
if(_unitID in _leaders) exitWith {};
if(isNil "_leaders") exitWith {};
if(typeName _leaders != "ARRAY") exitWith {};
_leaders pushBack _unitID;
grpPlayer setVariable["gang_leaders",_leaders,true];

[[_unit,grpPlayer],"TON_fnc_clientAddLeader",_unit,false] spawn life_fnc_MP;
[[5,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; //Update the database.
[] call life_fnc_gangMenu;