/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};

if(life_inv_handcuffs < 1) then
{
    hint "You have no zipties";
} else {
    life_inv_handcuffs = life_inv_handcuffs - 1;
    //Broadcast!
    _unit say3D "handcuffs";
    _unit setVariable["restrained",true,true];
    hint "The target is now handcuffed";
    [[player], "life_fnc_civRestrain", _unit, false] spawn life_fnc_MP;
    [[0,"STR_NOTF_Restrained",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
}; 