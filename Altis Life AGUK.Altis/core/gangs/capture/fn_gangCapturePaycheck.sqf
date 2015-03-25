/* 
	Name: fn_areaCaptureUpdate.sqf
	Desc: This file gives the end user the extra cash that they will get from capturing a gang area.
*/
waitUntil {!isNil 'life_config_gangArea'};

_cash = 0;

{
	_currentGang = [_x,3,grpNull,[grpNull]] call BIS_fnc_param;
	_paycheckAddon = [_x,7,0,[0]] call BIS_fnc_param;
	if(isNull _currentGang) then
	{
		//Give them a extra paycheck
		/*if(playerSide == west) then 
		{
			_cash = _cash + _paycheckAddon;
		};*/
	}
		else
	{
		//If the players gang controls the hideout currently, then give them their paycheck.
		if(_currentGang == (group player)) then
		{
			_cash = _cash + _paycheckAddon;
		};
	};
} forEach life_config_gangArea;

if(_cash < 1) exitWith {};

systemChat format["You received a extra paycheck for securing a hazardous gang area(s)! You received £%1",[_cash] call life_fnc_numberText];
