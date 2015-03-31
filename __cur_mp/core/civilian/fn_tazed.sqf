/*
	File: fn_tazed.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the tazed animation and broadcasts out what it needs to.
*/
private["_unit","_shooter","_curWep","_curMags","_attach","_copGun"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_shooter = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};

if(_unit == _shooter) then
{
	if(!life_istazed) then
	{
		life_istazed = true;
		_curWepPrimary = primaryWeapon _unit;
		_curWepSecondary = secondaryWeapon _unit;
		if(_curWepPrimary in life_cop_guns) then
		{
			_unit removeWeapon _curWepPrimary;
		}
		else
		{
			_unit removeWeapon _curWepPrimary;
			_unit addWeapon _curWepPrimary;
		};
		if(_curWepSecondary in life_cop_guns) then
		{
			_unit removeWeapon _curWepSecondary;
		}
		else
		{
			_unit removeWeapon _curWepSecondary;
			_unit addWeapon _curWepSecondary;
		};

		[[_unit],"life_fnc_tazeSound",true,false] spawn life_fnc_MP;
		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
		_obj setPosATL (getPosATL _unit);
		[[_unit,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		[[0,format["%1 tazed himself because he picked up a cop weapon. Psh...",name _unit]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		_unit attachTo [_obj,[0,0,0]];
		disableUserInput true;
		uiSleep 15;
		[[_unit,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		if(!(player getVariable["Escorting",false])) then {
			detach _unit;
		};
		life_istazed = false;
		_unit allowDamage true;
		disableUserInput false;
		deleteVehicle _obj;
	};
}
else
{
	if(_shooter isKindOf "Man" && alive player) then
	{
		if(!life_istazed) then
		{
			life_istazed = true;
			_curWep = currentWeapon player;
			_curMags = magazines player;
			_attach = if(primaryWeapon player != "") then {primaryWeaponItems _unit} else {[]};
			{player removeMagazine _x} foreach _curMags;
			player removeWeapon _curWep;
			player addWeapon _curWep;
			if(count _attach != 0 && primaryWeapon _unit != "") then
			{
				{
					_unit addPrimaryWeaponItem _x;
				} foreach _attach;
			};
			if(count _curMags != 0) then
			{
				{player addMagazine _x;} foreach _curMags;
			};

			[[_unit],"life_fnc_tazeSound",true,false] spawn life_fnc_MP;
			_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
			_obj setPosATL (getPosATL _unit);
			[[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
			[[0,format[localize "STR_NOTF_Tazed", _unit getVariable["realname",name _unit], _shooter getVariable["realname",name _shooter]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
			_unit attachTo [_obj,[0,0,0]];
			disableUserInput true;
			uiSleep 15;
			[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
			if(!(player getVariable["Escorting",false])) then {
				detach player;
			};
			life_istazed = false;
			player allowDamage true;
			disableUserInput false;
			deleteVehicle _obj;
		};
	}
	else
	{
		_unit allowDamage true;
		life_iztazed = false;
	};
};