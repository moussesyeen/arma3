/*
	Author: Bryan "Tonic" Boardwine
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(!(_vehicle in gsn_life_vehicles)) then
{
	gsn_life_vehicles pushBack _vehicle;
	[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] spawn life_fnc_MP;
};