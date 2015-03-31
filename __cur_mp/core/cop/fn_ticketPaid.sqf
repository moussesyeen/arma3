/*
	Author: Bryan "Tonic" Boardwine
*/
private["_value","_unit","_cop"];
_value = [_this,0,5,[0]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_cop = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR {_unit != life_ticket_unit}) exitWith {}; //NO
if(isNull _cop OR {_cop != player}) exitWith {}; //Double NO

hint format["You have been paid a bonus of %1 from that ticket being paid",[(life_cop_payout * _value)] call life_fnc_numberText];
[(life_cop_payout * _value),1,0] call life_fnc_handleMoney;