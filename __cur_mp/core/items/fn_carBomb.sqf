/*
+	File: fn_carBomb.sqf
+	Original Author: Fuzz
+	Modified by Paronity
+	Description:
+	Attaches a car bomb to a vehicle.
+*/
private["_unit","_owners"];
_unit = cursorTarget;

_bombCount = missionNamespace getVariable (["carbomb",0] call life_fnc_varHandle);
if(_bombCount == 0) exitWith {};
if(!(_unit isKindOf "LandVehicle")) exitWith {hint "You can only add car bombs to land vehicles."};
if(player getVariable ["restrained",false]) exitWith {};
if((_unit getVariable["hasBomb", false])) exitWith {hint "This vehicle can not have a bomb placed on it."};
if(player distance _unit > 7) exitWith {hint "You need to be within 7 feet!"};
if((_unit getVariable "playerSide") == "med") exitWith {hint localize "STR_ISTR_CarBomb_Immune"};
_owners = _unit getVariable ["vehicle_info_owners",["none"]];
_ownerIDs = [];
{
	_ownerIDs pushBack (_x select 0);
}foreach _owners;
if(getPlayerUID player in _ownerIDs) exitWith {hint localize "STR_ISTR_CarBomb_Self"};

life_action_inUse = true;

player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uiSleep 1.5;
waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};

life_action_inUse = false;
if(player distance _unit > 7) exitWith {hint "You need to be within 7 feet!"};

titleText["You have attached an armed car bomb to this vehicle.","PLAIN"];
_unit setVariable["hasBomb", true, true];
_unit setVariable["bombActive", false, true];
_unit setVariable["bombByName", player getVariable["realname",name player], true];
_unit setVariable["bombByID", getPlayerUID player, true];
[["A car bomb has just been placed on a vehicle. Find it before it gets triggered!", "Anonymous Tipper",1],"TON_fnc_clientMessage",true,false] spawn life_fnc_MP;
if(!([false,"carbomb",1] call life_fnc_handleInv)) exitWith {};
[_unit] spawn
{
	_veh = _this select 0;
	waitUntil {(speed _veh) > 65};
	hint "A car bomb you planted on a vehicle has just become active!";
	_veh setVariable["bombActive", true, true];
	[2,format["A car bomb has been activated on this vehicle and will detonate when your speed drops below 30km/h! The driver's name is %1.",driver _veh getVariable["realname",name driver _veh]],"life_fnc_broadcast",crew _veh,false] spawn life_fnc_MP;
	[[format["The car bomb has been activated. If the driver of the vehicle slows down, the bomb will detonate. The driver's name is %1.",driver _veh getVariable["realname",name driver _veh]], "Anonymous Tipper",1],"TON_fnc_clientMessage",true,false] spawn life_fnc_MP;
	waitUntil {(speed _veh < 30) OR (_veh getVariable ["hasEMP",false])};
	if(_veh getVariable ["hasEMP",false]) then
	{
		uiSleep 120; //this gives the police 2 minutes to defuse the bomb before it explodes!
	};
	if(_veh getVariable ["hasBomb",false]) then
	{
	    _bombToBlowShitUp = "Bo_Mk82" createVehicle [0,0,9999];
		_bombToBlowShitUp setPos (getPos _veh);
		_bombToBlowShitUp setVelocity [100,0,0];
		hint "A speed bomb you planted on a vehicle has detonated!";
		[["The car bomb has been exploded.", "Anonymous Tipper",1],"TON_fnc_clientMessage",true,false] spawn life_fnc_MP;
	}
	else
	{
		[["The car bomb has been successfully defused. The person responsible has been added to the wanted list for attempted terrorism.", "Anonymous Tipper",1],"TON_fnc_clientMessage",true,false] spawn life_fnc_MP;
		hint "A speed bomb you planted on a vehicle has been defused and you have been added to the wanted list!";
		[[_veh getVariable ["bombByID",false],_veh getVariable ["bombByName",false],"205"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	};
	_veh setVariable["hasBomb", nil, true];
	_veh setVariable["bombByName", nil, true];
	_veh setVariable["bombByID", nil, true];
	_veh setVariable["hasEMP", nil, true];
	_veh setVariable["bombActive", nil, true];
};
