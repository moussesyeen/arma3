/*
	File: fn_roulleteBet.sqf
	Author: Paronity
	Description: Add/Remove values from the bet array.
*/

_number = [_this,0,0,[0]] call BIS_fnc_param;
_addOrRemove = [_this,1,0,[0]] call BIS_fnc_param; //0 = remove | 1 = add

switch(_addOrRemove) do
{
	case 0:
	{
		_index = [_number,gsn_roulette_bets] call _fnc_index;
		if(_index != -1) then
		{
			gsn_roulette_bets set [_index,-1];
			gsn_roulette_bets = gsn_roulette_bets - [-1];
		};
	};
	case 1:
	{
		gsn_roulette_bets pushBack _number;
	};
};

_fnc_index =
{
	private["_item"",""_stack"];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;

	{
		if(_item == _x) exitWith {
			_return = _forEachIndex;
		};
	} foreach _stack;

	_return;
};
