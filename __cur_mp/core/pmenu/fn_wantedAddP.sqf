private["_unit","_amount"];
if(playerSide != west) exitWith {hint "Who do you think you are?"};
if((lbCurSel 2406) == -1) exitWith {hint "You must select a perp."};
if((lbCurSel 2407) == -1) exitWith {hint "You must select a crime."};
_unit = lbData [2406,lbCurSel 2406];
_unit = call compile format["%1",_unit];
_amount = lbData [2407,lbCurSel 2407];
if(isNil "_unit") exitWith {};
if(_unit == player) exitWith {hint "You can't make yourself wanted";};
if(isNull _unit) exitWith {};

[[1,format["%1 has been added to the wanted list by %2.",_unit getVariable["realname",name _unit],player getVariable["realname",name _unit]]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

[[getPlayerUID _unit,_unit getVariable["realname",name _unit],_amount,-1, getPlayerUID player],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
[[_unit],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;