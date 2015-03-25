/*
	File: fn_bountySelect.sqf
	
	Description:
	Selects the player, then tells the bounty hunter where they are.
*/
private["_display","_list","_uid"];
disableSerialization;

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2401,(lbCurSel 2401)];
_data = call compile format["%1", _data];
if(5000 > life_atmbank) exitWith {hint "You do not have enough money in your bank to pay the civilian.";};
if(isNil "_data") exitWith {};
if(typeName _data != "ARRAY") exitWith {};
if(count _data == 0) exitWith {};

mapGridPosition player


hint format["A civilian has seen %1 near %2. %2 is %3M away from you. You pay the civilian 5000 for the tip.",_player getVariable["realname",name _pos], _town_name, round(player distance _town_pos)];

life_atmbank = life_atmbank - 5000;