/*
	Author: Bryan "Tonic" Boardwine
*/
private["_container"];
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _container) exitWith {}; //MEH

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = (nearestObjects[(position player),["House_F"],10] select 0);
	[[_house],"TON_fnc_updateHouseContainers",false,false] spawn life_fnc_MP;
};