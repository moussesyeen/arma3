#include <macro.h>
/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_player","_blinkerLinks","_blinkerRechts","_blinkerWarn"];
_ctrl = SEL(_this,0);
_code = SEL(_this,1);
_shift = SEL(_this,2);
_ctrlKey = SEL(_this,3);
_alt = SEL(_this,4);
_speed = speed cursorTarget;
_handled = false;
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_interactionKey = if((EQUAL(count (actionKeys "User10"),0))) then {219} else {(actionKeys "User10") select 0};
_mapKey = SEL(actionKeys "ShowMap",0);
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player GVAR ["restrained",false])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//How About GET OFF SIDE CHAT NOW!
if (_code in (actionKeys "PushToTalk") || _code in (actionKeys "PushToTalkSide")) exitWith
{
	_chan = "";
	disableSerialization;
	_chan = ctrlText ((findDisplay 63) displayCtrl 101);
	if (_chan == "Side Channel") then {
		systemChat format["Please do not attempt to speak in %1 on our server.", _chan]; 
		_handled = true; 
	};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(!(EQUAL(count (actionKeys "User10"),0)) && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn {
			private "_handle";
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

if (life_placeable_placing_active) then {
	switch (_code) do
	{
		case 57: // Space
		{
			[] spawn life_fnc_placeablesPlaceComplete;
		};
	};
	true;
};

switch (_code) do {
	//Space key for Jumping
	case 57: {
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {!(EQUAL(animationState player,"AovrPercMrunSrasWrflDf"))} && {isTouchingGround player} && {EQUAL(stance player,"STAND")} && {speed player > 2} && {!life_is_arrested} && {SEL((velocity player),2) < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution 
			_handled = true;
		};
	};
	
	//ANIT ALT-f4
	case 62: {
		if(_alt && !_shift) then {
			[[0,"STR_ISTR_ALTF4",true,[profileName]],"life_fnc_broadcast",true,false] call life_fnc_MP;
		};
	};
	
	//Cop Base Opener Maxi 2/6/2015 - KEY O
	case 24:
	{
		if(playerSide == west) then
		{
			{
				if (_x animationPhase "Door_1_rot" == 1) then {
					_x animate ["Door_1_rot", 0];
				} 
				else 
				{
					_x animate ["Door_1_rot", 1];
				};
			} forEach (nearestObjects [vehicle player, ["Land_BarGate_F"], 20]);
			_handled = true;
		};
	};
	
	//Lower Sound Maxi 2/6/2015 - KEY SHIFT + P
	case 25:
	{
		if(_shift) then
		{
			[] call life_fnc_earplugs;
			_handled = true;
		};
	};
	
	//ANPR System - THE / KEY - Maxi 2/6/2015
	case 181:
	{
	if (!_alt && !_ctrlKey && playerSide == west) then
		{
			[] call life_fnc_ANPR;
		};
	};
	
	//Animation ( SHIFT 1) 
	case 2:
	{
		[false] spawn life_fnc_animMenu;
		_handled = true;
	};
	
	//Map Key
	case _mapKey: {
		switch (playerSide) do {
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
		};
	};
	
	//Holster / recall weapon.
	case 35: {
		if(_shift && !_ctrlKey && !(EQUAL(currentWeapon player,""))) then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchCamera cameraView;
		};
		
		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {!(EQUAL(life_curWep_h,""))}) then {
			if(life_curWep_h in [RIFLE,LAUNCHER,PISTOL]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};
	
	//Surrender - SHIFT J - Maxi 2/9/2015
	case 36: 
	{
		if(_shift && !(player getVariable ["restrained", false]) && (animationState player) != "incapacitated" && !life_istazed && vehicle player == player) then {
			if (player getVariable ["surrender", false]) then
			{
				player setVariable ["surrender", false, true];
			}
				else 
			{
				[] spawn life_fnc_surrender;
			};
			_handled = true;
		};
	};
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey: {
		if(!life_action_inUse) then {
			[] spawn  {
				private "_handle";
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	
	//Restraining (Shift + R)
case 19:
	{
    if(_shift) then {_handled = true;};
	switch (playerSide) do
	{
	    case west:
		{
		if(_shift && !(player GVAR["restrained",false]) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget GVAR "Escorting") && !(cursorTarget GVAR "restrained") && !life_knockout && speed cursorTarget < 1) then
		    {
			    [] call life_fnc_restrainAction;
			};
		};
		
		case civilian:
		{
		if(_shift && !(player GVAR["restrained",false]) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [west,civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget GVAR "Escorting") && !(cursorTarget GVAR "restrained") && speed cursorTarget < 1 && animationState cursorTarget in ["incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"]) then
		    {
			    [] call life_fnc_civRestrainAction;
			};
		};
	};
    }; 
	
	//Knock out, this is experimental and yeah...
	case 34: {
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == RIFLE OR currentWeapon player == PISTOL) && currentWeapon player != "" && !life_knockout && !(player GVAR["restrained",false]) && !life_istazed && !(player GVAR["surrender",false])) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
			_handled = true;
		};
	};

	//T Key (Trunk)
	case 20: {
		if(!_alt && !_ctrlKey) then {
			if(vehicle player != player && alive vehicle player) then {
				if((vehicle player) in life_vehicles) then {
					[vehicle player] call life_fnc_openInventory;
				};
			} else {
				private "_list";
				_list = ["landVehicle","Air","Ship","House_F"];
				if(KINDOF_ARRAY(cursorTarget,_list) && {player distance cursorTarget < 7} && {vehicle player == player} && {alive cursorTarget}) then {
					if(cursorTarget in life_vehicles OR {!(cursorTarget GVAR ["locked",true])}) then {
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
		};
	};
	//L Key?
	case 38: {
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Boat_Civil_01_rescue_F","C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Van_01_box_F"]) then {
				if(!isNil {vehicle player GVAR "lights"}) then {
					if(playerSide == west) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};
		
		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	
	//Y Player Menu
	case 21: {
		if(!_alt && !_ctrlKey && !dialog) then {
			[] call life_fnc_p_openMenu;
		};
	};
	
	//F Key
	case 33: {
		if(playerSide in [west,independent] && {vehicle player != player} && {!life_siren_active} && {((driver vehicle player) == player)}) then {
			[] spawn {
				life_siren_active = true;
				if (playerside == west) then {
					sleep 6.4;
				} else {
					sleep 5.774; //Maxi medic siren is shorter
				};
				life_siren_active = false;
			};
			
			_veh = vehicle player;
			if(isNil {_veh GVAR "siren"}) then {_veh SVAR ["siren",false,true];};
			if((_veh GVAR "siren")) then {
				titleText [localize "STR_MISC_SirensOFF","PLAIN"];
				_veh SVAR ["siren",false,true];
			} else {
				titleText [localize "STR_MISC_SirensON","PLAIN"];
				_veh SVAR ["siren",true,true];
				if(playerSide == west) then {
					[[_veh],"life_fnc_copSiren",nil,true] call life_fnc_MP;
				} else {
					//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
					[[_veh],"life_fnc_medicSiren",nil,true] call life_fnc_MP;
				};
			};
		};
	};
	
	//U Key
	case 22: {
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};
			
			if(_veh isKindOf "House_F" && {playerSide == civilian}) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(EQUAL(_door,0)) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh GVAR [format["bis_disabled_Door_%1",_door],0];
					
					if(EQUAL(_locked,0)) then {
						_veh SVAR [format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh SVAR [format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
					if(EQUAL(_locked,2)) then {
						if(local _veh) then {
							_veh lock 0;
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
						};
						systemChat localize "STR_MISC_VehUnlock";
						player say3D "UnLockCarSound";
					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
						};	
						systemChat localize "STR_MISC_VehLock";
						player say3D "LockCarSound";
					};
				};
			};
		};
	};
};

_handled;