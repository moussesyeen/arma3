/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

if (_damage > 0.99) then
{
	if(vehicle _source isKindOf "LandVehicle" && driver (vehicle _source) == _source) then
	{
		if(_source != _unit AND alive _unit AND isPlayer _source) then
		{
			//comment out VDM script until the kinks are worked out. Yay arma.....
			////[[],"life_fnc_vdmWatcher",_source,false] spawn life_fnc_MP;
		};
	};
};

if(!isNull _source) then
{
	_curWep = currentWeapon _source;
	if(_projectile in ["1Rnd_HE_Grenade_shell",""] && _curWep in ["arifle_MX_GL_Black_F"]) then
	{
		_isVehicle = if(vehicle player != player) then {true} else {false};
		if(_isVehicle) then
		{
			vehicle player setDammage .5;
		};
		_damage = false;
	};
	if(_source != _unit) then
	{
		if !(alive _unit) exitWith {};
		if(_projectile in ["B_9x21_Ball","B_556x45_dual"] && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then
		{
			if(side _source == west && playerSide == civilian) then
			{
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile == "B_556x45_dual") then {100} else {35};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};

				_damage = false;
				if(_unit distance _source < _distance) then
				{
					if(!life_istazed && !(_unit getVariable["restrained",false])) then
					{
						if(_isVehicle && _isQuad) then
						{
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						}
						else
						{
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			};
			if(playerSide == west && side _source == west) then
			{
				_damage = false;
			};
			if(playerSide == independent && side _source == west) then
			{
				_damage = false;
			};
		};
	};
};

[] call life_fnc_hudUpdate;
_damage;