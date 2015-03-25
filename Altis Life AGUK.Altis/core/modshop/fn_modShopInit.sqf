/* 
	File: fn_modShopInit.sqf
	Author: Maximum
	Desc: Filters what car and what selections to use.
*/
private["_display","_reskinList","_nitroList","_engineList"];
if(dialog) exitWith {};
if(vehicle player == player) exitWith {hint "You need to be in a vehicle to use the modshop!"};
if(driver vehicle player != player) exitWith {hint "You need to be in the drivers seat in order to use the modshop!";};

if(!(createDialog "maximodshop")) exitWith {};
disableSerialization;
_display = findDisplay 2000;
_reskinList = _display displayCtrl 1500;
life_modshop_purchase = false;
_vehicle = vehicle player;
_veh = typeOf _vehicle;
//Offroad, IFRIT, Zamak 
if(_veh in ["O_Heli_Transport_04_covered_F","B_Heli_Transport_03_unarmed_F","I_Heli_light_03_unarmed_F","O_Heli_Light_02_unarmed_F","B_Heli_Transport_01_F","B_Heli_Light_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Hatchback_01_F","C_Offroad_01_F","O_MRAP_02_F","I_Truck_02_transport_F","I_Truck_02_covered_F"]) then {
	_reskinList lbAdd format["Custom RGB"];
} else {
	_paintR = _display displayCtrl 1800;
	_paintG = _display displayCtrl 1801;
	_paintB = _display displayCtrl 1802;
	
	_paintR ctrlEnable false;
	_paintG ctrlEnable false;
	_paintB ctrlEnable false;
};

_color = _vehicle getVariable["Life_VEH_color",""];
_rgb = _vehicle getVariable["Life_VEH_RGB",[]];
life_modshop_data = [_color,_rgb]; //Set up a modshop data array.

//Populate the list of textures.
_c_arr = [_veh] call life_fnc_vehicleColorCfg;

for "_i" from 0 to (count _c_arr)-1 do
{
	if((_c_arr select _i) select 1 == "civ") then
	{
		_text = [_veh,_i] call life_fnc_vehicleColorStr;
		lbAdd[1500,format["%1",_text]];
		lbSetValue [1500,(lbSize 1500)-1,_i];
	};	

	if((_c_arr select _i) select 1 == "reb" && license_civ_rebel) then
	{
		_text = [_veh,_i] call life_fnc_vehicleColorStr;
		lbAdd[1500,format["%1",_text]];
		lbSetValue [1500,(lbSize 1500)-1,_i];
	};		
};
