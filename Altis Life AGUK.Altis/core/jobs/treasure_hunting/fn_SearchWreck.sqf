/*
	Author: Maximum
	Version: 1.0
	Description: Searches wrecked ship for treasure!
	AltisGaming.co.uk ONLY
*/
private["_sum","_finding","_txt"];
_finding = ["roundobject","squareobject","pottery","coins"] call BIS_fnc_selectRandom;
if (_finding == "roundobject") then {_txt = "unusual marked object";};
if (_finding == "squareobject") then {_txt = "unidentifiable square object";};
if (_finding == "pottery") then {_txt = "piece of pottery";};
if (_finding == "coins") then {_txt = "handful of old coins";};
_sum = [_finding,1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
life_wreck_searched = true; //used to remove search action in fn_TreasureHunt.sqf
if(_sum > 0) then
{
	life_action_inUse = true;
	life_action_in_Use = true;
	titleText["Searching Wreck...","PLAIN"];
	titleFadeOut 5;
	sleep 5;
	if(([true,_finding,1] call life_fnc_handleInv)) then
	{
		titleText["You have collected a " + _txt,"PLAIN"];
	};
};
//wtf
life_action_inUse = false;
life_action_in_Use = false; 