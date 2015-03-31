/*
	Author: Bryan "Tonic" Boardwine
*/
if(count gsn_life_houses == 0) exitWith {}; //Nothing to do.

{
	_position = call compile format["%1",_x select 0];
	_house = nearestBuilding _position;

	_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
	if(count _houseCfg == 0 || (_house distance _position > 10)) then
	{
		_house = (nearestObjects[_position,["House_F"],20] select 0);
	};
	_house setVariable["uid",round(random 99999),true];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],_position];
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";

} foreach gsn_life_houses;