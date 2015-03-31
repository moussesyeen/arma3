/*
	file: fn_hasOrgan.sqf
	author: [midgetgrimm] - www.grimmlife.com

*/
private["_organThief"];
_organThief = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _organThief) exitWith {};

[_organThief,"kidney",1] call life_fnc_handleInv;

[[getPlayerUID _organThief,_organThief getVariable["realname",name _organThief],"203"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;//add to wanted list
[[_organThief],"life_fnc_wantedFetchForCivilian",_organThief,false] spawn life_fnc_MP;