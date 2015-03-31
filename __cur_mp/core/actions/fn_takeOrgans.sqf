/*
	file: fn_takeOrgans.sqf
	author: [midgetgrimm] - www.grimmlife.com
*/
private["_unit"];
_unit = cursorTarget;
if(!([false,"scalpel",1] call life_fnc_handleInv)) exitWith {hint "You dont have a scalpel"};
if(isNull _unit) exitWith {};
if((_unit getVariable ["missingOrgan",FALSE])) exitWith {hint "They are already missing their kidney"};
if((animationState _unit != "Incapacitated")) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
if(side _unit == independent) exitWith {hint "Can't harvest medics organs"};
if(_unit distance (getMarkerPos "jail_marker") < 20) exitWith {hint "Can't rob organs while the vitcim is in jail"};
if(life_inv_kidney >= 2) exitWith {hint "You can't possibly need that many organs!"};
if(!([true,"kidney",1] call life_fnc_handleInv)) exitWith {hint "You don't have room to store any organs!"};
life_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic";
uiSleep 3;
_unit setVariable["missingOrgan",true,true];
life_action_inUse = false;
[[player], "life_fnc_hasOrgan", _unit, false] spawn life_fnc_MP;