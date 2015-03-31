#include <macro.h>
/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;
_return = [];
//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return pushBack ["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
		if(__GETC__(life_coplevel) > 0) then
		{
			_return pushBack ["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"];
			_return pushBack ["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"];
			_return pushBack ["cop_spawn_4","Air HQ","\a3\ui_f\data\map\Markers\NATO\b_air.paa"];
			_return pushBack ["cop_spawn_5","HW Patrol","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"];
		};
	};

	case civilian:
	{
		_return pushBack ["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
		_return pushBack ["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
		_return pushBack ["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
		_return pushBack ["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];

		if(count gsn_life_houses > 0) then
		{
			{
				_position = call compile format["%1",_x select 0];
				_house = nearestBuilding _position;

				_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
				if(count _houseCfg == 0 || (_house distance _position > 10)) then
				{
					_house = (nearestObjects[_position,["House_F"],20] select 0);
				};
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach gsn_life_houses;
		};
	};

	case independent:
	{
		_return pushBack ["medic_spawn_kav","Kavala EMS","\a3\ui_f\data\map\MapControl\hospital_ca.paa"];
		_return pushBack ["medic_spawn_tel","Central Receiving Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"];
		_return pushBack ["medic_spawn_sof","Sofia EMS","\a3\ui_f\data\map\MapControl\hospital_ca.paa"];
		_return pushBack ["medic_spawn_pyr","Pyrgos EMS","\a3\ui_f\data\map\MapControl\hospital_ca.paa"];
	};
};

_return;