/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Knocks out the target.
*/
private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
life_knockout = true;
[[player,"AwopPercMstpSgthWrflDnon_End2"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
uiSleep 0.08;
[[_target,profileName],"life_fnc_knockedOut",_target,false] spawn life_fnc_MP;
[[getPlayerUID player,player getVariable["realname",name player],"189"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
hint "You have been added to the wanted list for assault";
uiSleep 5;
life_knockout = false;