/*
	Author: Bryan "Tonic" Boardwine
*/
private["_ammoType","_projectile","_unit"];
_unit = _this select 0;
_weaponFired = _this select 1;
_ammoType = _this select 4;
_projectile = _this select 6;

if(_ammoType == "F_40mm_Cir") then {
	[_projectile,_unit] spawn {
		private["_position","_shooter","_object"];
		_object = _this select 0;
		_shooter = _this select 1;
		while {((velocity _object select 0) != 0) && ((velocity _object select 1) != 0) && ((velocity _object select 2) != 0)} do {
			_position = getPosATL _object;
			uiSleep 0.1;
		};
		[[_position,_shooter],"life_fnc_carEMP",true,false] spawn life_fnc_MP;
		deleteVehicle _projectile;
	};
};

if(playerSide == west) then
{
	if (_weaponFired == "hgun_P07_snds_F") then
	{
		_ammo = _unit ammo _weaponFired;
		if (_ammo > 4) then
		{
		    _unit setAmmo ["hgun_P07_snds_F",4];
		};
	};
};