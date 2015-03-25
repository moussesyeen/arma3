/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4","NPAS HQ","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["sco19","Training Grounds","\a3\ui_f\data\map\Markers\NATO\b_air.paa"]
		];
	};
	
	case civilian:
	{		
		if(!license_civ_whitelisted && playerSide == civilian) then {
		_return = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Syrta","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Paros","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		};
		
		if(license_civ_whitelisted && playerSide == civilian) then {
		_return = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Syrta","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Paros","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["rebelspawn","PRA HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		};
		
		if(license_civ_donator && playerSide == civilian) then {
		_return = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Syrta","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Paros","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["donatorspawn","Donator Shop","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		};
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};	
	};
	
	case independent: {
		_return = [
			["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Athira Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Paros Outpost","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_return;