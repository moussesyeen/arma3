/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Title 37401
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];
if(!dialog) then {
	createDialog "vInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
life_vInact_curTarget = _curTarget;

//Set Repair Action
_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";

if("ToolKit" in (items player) && (damage _curTarget < 1)) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

switch(playerSide) do
{
	case west:
	{
		_Btn2 ctrlSetText localize "STR_vInAct_Registration";
		_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";

		_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;";

		_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
		_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
		if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};

		_Btn5 ctrlSetText localize "STR_vInAct_Impound";
		_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction; closeDialog 0;";

		if(_curTarget isKindOf "Ship") then {
			_Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn6 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
		} else {
			if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_medevac_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_unarmed_green_F"]) then {
				_Btn6 ctrlSetText localize "STR_vInAct_GetInKart";
				_Btn6 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
			} else {
				_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn6 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn6 ctrlEnable false;} else {_Btn6 ctrlEnable true;};
			};
		};
		if(_curTarget getVariable["purpose",""] == "truck_mission") then
		{
			_Btn7 ctrlSetText localize "STR_vInAct_Manifest";
			_Btn7 buttonSetAction "hint format[""This vehicle is carrying %1!"",(life_vInact_curTarget getVariable[""reason"",""1050 Used Fleshlights""])]; closeDialog 0;";
		}
		else
		{
			_Btn7 ctrlShow false;
		};
		if(!isNil {(_curTarget getVariable "note")}) then
		{
			_Btn8 ctrlSetText localize "STR_vInAct_ReadNote";
			_Btn8 buttonSetAction "hint parseText format[""This vehicle has a note on it: <br/><br/><t size='1'><t color='#FF0000'>%1</t></t>"",(life_vInact_curTarget getVariable[""note"",""""])]; closeDialog 0;";
		}
		else
		{
			_Btn8 ctrlShow false;
		};
		if(!isNil {(_curTarget getVariable "hasEMP")}) then
		{
			if(_curTarget getVariable "hasEMP") then
			{
				_Btn9 ctrlSetText localize "STR_vInAct_DefuseBomb";
				_Btn9 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_defuseKit; closeDialog 0;";
			}
			else
			{
				_Btn9 ctrlShow false;
			};
		}
		else
		{
			_Btn9 ctrlShow false;
		};
	};
	case civilian:
	{
		if(_curTarget isKindOf "Ship") then
		{
			_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		}
		else
		{
			if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_medevac_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_unarmed_green_F"]) then {
				_Btn2 ctrlSetText localize "STR_vInAct_GetInKart";
				_Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
			} else {
				_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn2 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
			};
		};

		if(typeOf _curTarget == "O_Truck_03_device_F") then
		{
			_Btn3 ctrlSetText localize "STR_vInAct_DeviceMine";
			_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
			if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in gsn_life_vehicles}) then {
				_Btn3 ctrlEnable false;
			} else {
				_Btn3 ctrlEnable true;
			};
		}
		else
		{
			_Btn3 ctrlShow false;
		};
		switch(player getVariable["recruitPosition","none"]) do
		{
			case "towTruckDriver":
			{
				_Btn4 ctrlSetText "Tow Vehicle";
				_Btn4 buttonSetAction "[] spawn life_fnc_repairTruck;";
			};
			case "carSalesMan":
			{
				_Btn4 ctrlSetText "Delete Vehicle";
				_Btn4 buttonSetAction "[] spawn life_fnc_deleteVehicle;";
			};
			default
			{
				if(license_civ_rebel) then
  				{
					_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
					_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
				};
			};
		};

		if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};

		if(_curTarget in gsn_life_vehicles) then
		{
			_Btn5 ctrlSetText localize "STR_vInAct_LeaveNote";
			_Btn5 buttonSetAction "createDialog ""vehicle_note_menu"";";

			if(!isNil {(_curTarget getVariable "note")}) then
			{
				_Btn6 ctrlSetText localize "STR_vInAct_DeleteNote";
				_Btn6 buttonSetAction "life_vInact_curTarget setVariable [""note"","""",true];";
			}
			else
			{
				_Btn6 ctrlShow false;
			};
		}
		else
		{
			_Btn5 ctrlShow false;
		};
		//show truck manifest?
		if(_curTarget getVariable["purpose",""] == "truck_mission") then
		{
			_Btn7 ctrlSetText localize "STR_vInAct_Manifest";
			_Btn7 buttonSetAction "hint format[""This vehicle is carrying %1!"",(life_vInact_curTarget getVariable[""reason"",""1050 Used Fleshlights""])]; closeDialog 0;";
		}
		else
		{
			_Btn7 ctrlShow false;
		};
		//plant bomb?
		_bombs = missionNamespace getVariable (["carbomb",0] call life_fnc_varHandle);
		if(_bombs > 0) then
		{
			_Btn8 ctrlSetText localize "STR_vInAct_CarBomb";
			_Btn8 buttonSetAction "[] spawn life_fnc_carBomb;";
		}
		else
		{
			_Btn8 ctrlShow false;
		};
		switch(player getVariable["recruitPosition","none"]) do
		{
			case "towTruckDriver":
			{
				_Btn9 ctrlSetText "Fix Vehicle";
				_Btn9 buttonSetAction "[] spawn life_fnc_repairTruck;";
			};
			case "carSalesMan":
			{
				_Btn9 ctrlSetText "Offer Sale";
				_Btn9 buttonSetAction "[] spawn life_fnc_sellCar;";
			};
			default
			{
				_Btn9 ctrlShow false;
			};
		};
	};
	case independent:
	{
		if(_curTarget isKindOf "Ship") then
		{
			_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
			_Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
			if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		}
		else
		{
			if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_medevac_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_unarmed_green_F"]) then {
				_Btn2 ctrlSetText localize "STR_vInAct_GetInKart";
				_Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
			} else {
				_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
				_Btn2 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
				if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
			};
		};
		_Btn3 ctrlSetText localize "STR_vInAct_Impound";
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction; closeDialog 0;";
		if(!isNil {(_curTarget getVariable "note")}) then
		{
			_Btn4 ctrlSetText localize "STR_vInAct_ReadNote";
			_Btn4 buttonSetAction "hint parseText format[""This vehicle has a note on it: <br/><br/><t size='1'><t color='#FF0000'>%1</t></t>"",(life_vInact_curTarget getVariable[""note"",""""])]; closeDialog 0;";
		}
		else
		{
			_Btn4 ctrlShow false;
		};
		_jaws = missionNamespace getVariable (["jaws",0] call life_fnc_varHandle);
		if(_jaws > 0) then
		{
			_Btn5 ctrlSetText localize "STR_vInAct_JawsOfLife";
			_Btn5 buttonSetAction "[] spawn life_fnc_jawsOfLife;";
		}
		else
		{
			_Btn5 ctrlShow false;
		};
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
		_Btn9 ctrlShow false;
	};
};