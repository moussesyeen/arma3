/*
	File: fn_pumpRepair.sqf
*/
private["_method"];
if(gsn_life_cash < 500) then
{
	if(gsn_lifeatm_cash < 500) exitWith {_method = 0;};
	_method = 2;
}
	else
{
	_method = 1;
};

switch (_method) do
{
	case 0: {hint "You do not have $500 in cash or in your bank accoumt."};
	case 1: {vehicle player setDamage 0; [500,0,1] call life_fnc_handleMoney; hint "You have repaired your vehicle for $500";};
	case 2: {vehicle player setDamage 0; [500,1,1] call life_fnc_handleMoney; hint "You have repaired your vehicle for $500";};
};