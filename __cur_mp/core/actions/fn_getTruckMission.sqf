/*
	File: fn_getTruckMission.sqf
	Author: [GSN] Paronity
*/
private["_yard","_target","_type","_spawn","_sp","_newTruck","_civCar","_points","_giveGarage"];
_target = [_this,0,ObjNull] call BIS_fnc_param;
_type =  _this select 3 select 0;
_spawn = _this select 3 select 1;
_sp = getMarkerPos _spawn;

if(!license_civ_truck) exitWith {hint "You must have a truck license to get a delivery mission."};

_points = life_truck_points - [(str(_target))];
_yard = _points call BIS_fnc_selectRandom;
_nearTrucks = nearestObjects [_sp, ["Car","Air"], 15];
if(count _nearTrucks > 0) exitWith {hint "There is a delivery truck already on the spawn point";};
gsn_truck_in_progress = true;
life_truck_point = call compile format["%1",_yard];

if(vehicle player != player) then
{
	_civCar = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air"],30]; //Fetch vehicles within 30m.
	if(count _nearVehicles > 0) then
	{
		{
			private["_vehData","_vehOwner"];
			if(!isNil "_civCar") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_civCar = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(!isNil "_civCar") then
{
	[[_civCar,false,(_this select 1)],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;
    _giveGarage = "1";
}
else
{
    _giveGarage = "0";
};

uiSleep 3;

_newTruck = "I_Truck_02_covered_F" createVehicle _sp;
_newTruck setVectorUp (surfaceNormal _sp);
_newTruck setPos _sp;
[_newTruck] call life_fnc_clearVehicleAmmo;

_newTruck setVariable["purpose","truck_mission",true];
_newTruck setVariable["driver",player getVariable["realname",name player],true];
_newTruck setVariable["startYard",_target,true];
_newTruck setVariable["goodsRemoved","0",true];
_newTruck setVariable["giveGarage",_giveGarage,true];
_newTruck setVariable["vehicle_info_owners",["truck_mission"],true];

if(_type == "legal") then
{
	_newTruck setVariable["type","legal",true];
	_newTruck setVariable["reason","Food for Families of Fallen Soldiers",true];
}
else
{
	private ["_truckTypes"];
	_truckTypes = [];
	_truckTypes pushBack "45 Plasma Televisions";
	_truckTypes pushBack "35 Stratis Immigrants";
	_truckTypes pushBack "85 Pounds of Crack Cocaine";
	_truckTypes pushBack "10 Crates of Stolen Kidneys";
	_truckTypes pushBack "1500 Footballs";
	_truckTypes pushBack "Shamoo";
	_truckTypes pushBack "15 Asian Matheletes";
	_truckTypes pushBack "250 Google Glasses";
	_truckTypes pushBack "250 Oculus Rift Dev Kits";
	_truckTypes pushBack "Absolutely Nothing!? Must have been a false report. (Can't arrest driver)";
	_truckTypes pushBack "150 Bottles of Vodka";
	_truckTypes pushBack "20 Prostitutes";
	_truckTypes pushBack "125 XBOX 360s";
	_truckTypes pushBack "100 PS4s";
	_truckTypes pushBack "1050 Used Fleshlights";
	_truckTypes pushBack "1500 pair of womens shoes";
	_truckTypes pushBack "10,000 scalpels";
	_truckTypes pushBack "135 naked mannequins.";
	_truckTypes pushBack "15 crates of C4.";
	_truckTypes pushBack "45 crates of peaches.";
	_truckTypes pushBack "125 stolen GPD turbos.";

	_newTruck setVariable["type","illegal",true];
	_newTruck setVariable["reason",(_truckTypes call BIS_fnc_selectRandom),true];
	hint "You have chosen an illegal mission. This means the cops have been alerted to your activites. Completing the mission will immediately clear it from your record. RUN!!";
	[[format["%1 has accepted an illegal truck mission. They are leaving from the freightyard now. Catch them!",player getVariable["realname",name player]], "Anonymous Tipper",1],"TON_fnc_clientMessage",true,false] spawn life_fnc_MP;
	[[getPlayerUID player,player getVariable["realname",name player],"197"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
};

gsn_cur_task = player createSimpleTask [format["Truck_%1",life_truck_point]];
gsn_cur_task setSimpleTaskDescription [format["You are to deliver this truck to the %1 freight yard.",toUpper _yard],"Truck Job",""];
["DeliveryAssigned",[format["Deliver this truck to the %1 freight yard.",toUpper _yard]]] call bis_fnc_showNotification;
gsn_cur_task setTaskState "Assigned";
_text = format["%1_FY",life_truck_point];
gsn_cur_task setSimpleTaskDestination (getMarkerPos _text);
player setCurrentTask gsn_cur_task;

[_newTruck] spawn
{
	_truckToWatch = _this select 0;
	waitUntil {!gsn_truck_in_progress OR !alive player OR !alive _truckToWatch};
	if(gsn_truck_in_progress) then
	{
		if(!alive player) then
		{
			gsn_cur_task setTaskState "Failed";
			cancelSimpleTaskDestination gsn_cur_task;
			player removeSimpleTask gsn_cur_task;
			["DeliveryFailed",["You failed to deliver the truck because you died. Noob."]] call BIS_fnc_showNotification;
			gsn_truck_in_progress = false;
			life_truck_point = nil;
		};
		if(!alive _truckToWatch) then
		{
			gsn_cur_task setTaskState "Failed";
			cancelSimpleTaskDestination gsn_cur_task;
			player removeSimpleTask gsn_cur_task;
			["DeliveryFailed",["Truck exploded or was impounded. Mission failed noob."]] call BIS_fnc_showNotification;
			gsn_truck_in_progress = false;
			life_truck_point = nil;
		};
	};
};