/*
	File: fn_bountyTaze.sqf
	Author: Ciaran Langton
	
	Description:
	Returns to the client that they are tazed by a bounty hunter.
*/
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _player) exitWith {};
if(!license_civ_Bounty) exitWith {};
if(_player distance player > 50) exitWith {}; //No more than 50 meters range!
[[_player,player],"life_fnc_tazed",_player,false] spawn life_fnc_MP;