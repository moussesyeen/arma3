/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_interactionKey2","_interactionKey3","_player"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_veh = vehicle player;

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_interactionKey2 = if(count (actionKeys "User11") == 0) then {220} else {(actionKeys "User11") select 0}; //right win
_interactionKey3 = if(count (actionKeys "User12") == 0) then {157} else {(actionKeys "User12") select 0}; //right control
_mapKey = actionKeys "ShowMap" select 0;
// hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

// Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in (actionKeys "BuldFreeLook")) && {(player getVariable ["restrained",false])}) exitWith {
	systemChat "Action not allowed while restrained.";
	true;
};

// prevent gear abuse
if((_code in (actionKeys "Gear"))&&(!(isNull (findDisplay 602)) && (isPlayer cursorTarget OR vehicle cursorTarget != cursorTarget OR alive cursorTarget))) then
{
	closeDialog 0;
	closeDialog 0;
	_handled = true;
};

if (_code in (actionKeys "TacticalView")) then
{
	hint "Command mode not allowed on GSN servers." ;
	_handled = true;
};


if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true; player playActionNow "stop";};
	_handled;
};

// Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	// Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do
{
	case 34: // Shift + G Key = Surrender
	{
		if(_shift) then {_handled = true; };
		if(_shift && vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
		{
			if (player getVariable ["surrender", false]) then
			{
				player setVariable ["surrender", false, true];
			} else
			{
				[] spawn life_fnc_surrender;
			};
		};
	};

	case _mapKey: // Map Key
	{
		switch (playerSide) do
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;[] spawn life_fnc_medicTeamMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn life_fnc_gangMarkers;}};
		};
	};

	case 35: // Shift + H Key = Holster Weapon --- CTRL + H Key = Recall Weapon
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};

		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
				life_curWep_h = "";
			};
		};
	};

	// Interaction keys
	case _interactionKey: // User Action Key 10 --- Left Windows as Default
	{
		if(!life_action_inUse) then {
			[] spawn
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};

	case _interactionKey2: // User Action Key 11 --- Wanted Menu --- Right Windows by Default
	{
		if(playerSide == west) then
		{
			if(!life_action_inUse) then
			{
				if(alive player) then
				{
					[] spawn
					{
						if(isNull (findDisplay 2400)) then
						{
							[] call life_fnc_wantedMenu;
						}
						else
						{
							(findDisplay 2400) closeDisplay 0;
						};
					};
				};
			};
		};
	};

	case _interactionKey3: // User Action Key 12 --- Cop Radar --- Right Control by Default
	{
		if(playerSide == west) then
		{
			if(!_alt) then { [] call life_fnc_radar; };
		};
	};

	case 19: // Shift + R Key = Restraining - Robbing
	{
		if(_shift) then {_handled = true; };
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget != west) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 && (animationState player) != "Incapacitated" && !(player getVariable["restrained",false]) && vehicle player == player && (side cursorTarget != independent)) then
		{
			[false] call life_fnc_restrainAction;
			[[player],"life_fnc_cuffSound",nil,false] spawn life_fnc_MP;
		};
		if(_shift) then {_handled = true; };
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1 && (side cursorTarget != independent)) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
		};
	};

	case 44: // Shift + Z Key = Ziptie
	{
		if(_shift) then {_handled = true;};
		if(_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 && !(player getVariable["restrained",false]) && ((animationState cursorTarget) == "Incapacitated")  && (vehicle player == player) && (side cursorTarget != independent)) then
		{
			if([false,"ziptie",1] call life_fnc_handleInv) then
			{
				[true] call life_fnc_zipTieAction;
				[[player],"life_fnc_zipTieSound",nil,false] spawn life_fnc_MP;
			};
		};
	};

	case 20: // T Key (Trunk)
	{
		if(!_alt && !_ctrlKey) then
		{
			if(_veh != player && alive _veh) then
			{
				if((_veh) in gsn_life_vehicles) then
				{
					[_veh] call life_fnc_openInventory;
				};
			} else {
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 7 && _veh == player && alive cursorTarget) then
				{
					if(cursorTarget in gsn_life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
		};
	};

	case 38: // L Key
	{
		if(_shift) then {_handled = true; }; // Shift + L Key = Cop & EMS Emergency Lights
		if ((_shift) && (playerSide in [west,independent] && _veh != player && ((driver _veh) == player))) then
		{
			if(!isNil {_veh getVariable "lights"}) then
			{
				if(playerSide == west) then
				{
					[_veh] call life_fnc_sirenLights;
				} else {
					[_veh] call life_fnc_medicSirenLights;
				};
			};
		};


		if(_ctrlKey) then {_handled = true; }; // Ctrl + L = Tow Lights
		if ((_ctrlKey) && (playerSide == civilian && _veh != player && ((driver _veh) == player))) then
		{
			if(playerSide == civilian && _veh != player && ((driver _veh) == player)) then
			{
				if(!isNil {_veh getVariable "lights"}) then
				{
					[_veh] call life_fnc_towLightsController;
				};
			};
		};
	};

	case 33: // F Key
	{
		if (!_shift && !_alt && !_ctrlKey) then // F Key = EMS/Cops Sirens
		{
			if(playerSide in [west,independent] && _veh != player && !life_siren_active && ((driver _veh) == player)) then
			{
				[] spawn
				{
					life_siren_active = true;
					uiSleep 0.5;
					life_siren_active = false;
				};
				if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true]; };
				if((_veh getVariable "siren")) then
				{
					titleText [localize "STR_MISC_SirensOFF","PLAIN"];
					_veh setVariable["siren",false,true];
				} else {
					titleText [localize "STR_MISC_SirensON","PLAIN"];
					_veh setVariable["siren",true,true];
					if(playerSide == west) then {
						[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
					} else {
						[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
					};
				};
			};
		};


		if(_shift) then {_handled = true; }; // F Key + Shift = EMS Federal
		if ((_shift) && (playerSide == independent && _veh != player && !life_federal_active && ((driver _veh) == player))) then
		{
			[] spawn
			{
				life_federal_active = true;
				uiSleep 0.5;
				life_federal_active = false;
			};
			if(isNil {_veh getVariable "federal"}) then {_veh setVariable["federal",false,true];};
			if((_veh getVariable "federal")) then
			{
				titleText ["Federal OFF","PLAIN"];
				_veh setVariable["federal",false,true];
			} else {
				titleText ["Federal ON","PLAIN"];
				_veh setVariable["federal",true,true];
				[[_veh],"life_fnc_medicFederal",nil,true] spawn life_fnc_MP;
			};
		};

		if(_shift) then {_handled = true; };  // F Key + Shift = Cop Wail
		if ((_shift) && (playerSide == west && _veh != player && !life_wail_active && ((driver _veh) == player))) then
		{
			[] spawn
			{
				life_wail_active = true;
				uiSleep 0.5;
				life_wail_active = false;
			};
			if(isNil {_veh getVariable "wail"}) then {_veh setVariable["wail",false,true];};
			if((_veh getVariable "wail")) then
			{
				titleText ["Wail OFF","PLAIN"];
				_veh setVariable["wail",false,true];
			} else {
				titleText ["Wail ON","PLAIN"];
				_veh setVariable["wail",true,true];
				[[_veh],"life_fnc_copWail",nil,true] spawn life_fnc_MP;
			};
		};
	};

	case 48: // B Key = "Move Bitch" Chirp for Cop & EMS
	{
		if (!_shift && !_alt && !_ctrlKey) then
		{
			if(playerSide in [west,independent] && _veh != player && !life_chirp_active && ((driver _veh) == player)) then
			{
				[] spawn
				{
					life_chirp_active = true;
					uiSleep 0.5;
					life_chirp_active = false;
				};
				if(playerSide == west) then
				{
					[[_veh],"life_fnc_copChirp",true,false] spawn life_fnc_MP;
				} else {
					[[_veh],"life_fnc_medicChirp",true,false] spawn life_fnc_MP;
				};
			};
		};
	};

	case 21: // Y Key = Player Menu
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call life_fnc_p_openMenu;
		};
	};

	case 22: // U Key = Unlock
	{
		if(_shift) then
		{
			if(life_show_up) then
			{
				life_show_up = false;
			} else {
				life_show_up = true;
			};
		};
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};

			if(_veh isKindOf "House_F") then {
				if((_veh in gsn_life_vehicles && player distance _veh < 8) OR (_veh getVariable ["jawsOpen",false] && playerSide == independent)) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in gsn_life_vehicles && player distance _veh < 8 OR vehicle player == _veh) then {
					if(!(player getVariable["restrained",false])) then
					{
						if(_locked == 2) then {
							if(local _veh) then {
								_veh lock 0;
							} else {
								[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
							};
							systemChat localize "STR_MISC_VehUnlock";
							player say3D "car_unlock";
						} else {
							if(local _veh) then {
								_veh lock 2;
							} else {
								[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
							};
							systemChat localize "STR_MISC_VehLock";
							player say3D "car_lock";
						};
					} else {
						systemChat "You can't lock/unlock this vehicle.";
					};
				};
			};
		};
	};

	case 54: // Right Shift Key = Earplugs
	{
		if (soundVolume <= 0.76) then
		{
			0.75 fadeSound 1;
			titleText ["You've taken out your ear plugs.","PLAIN"];
		} else {
			0.75 fadeSound 0.10;
			titleText ["You've inserted your ear plugs.","PLAIN"];
		};
		_handled = true;
	};

	case 181: // Shift + Num_/ = Pushup
	{
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Pushups"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
		};
	};

	case 55: // Shift + Num_* = Takwondo
	{
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Takwondo"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
		};
	};

	case 74: // Shift + Num_- = Full Workout
	{
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Full Workout"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_idle56kliky";
		};
	};

	case 78: // Shift + Num_+ = Boxing
	{
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Boxing"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_idle68boxing";
		};
	};

	case 181: // Shift + Num_/ = Handstand
	{
		if ((_alt) && (vehicle player == player)) then
		{
			cutText [format["Handstand"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou";
		};
	};

	case 55: // Shift + Num_* = Situps
	{
		if ((_alt) && (vehicle player == player)) then
		{
			cutText [format["Situps"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_idle72lehSedy";
		};
	};

	case 62: // ALT + F4 Warning
	{
		if(_alt && !_shift) then {
			diag_log format ["Server Warning: %1 used ALT+F4",player getVariable["realname",name player]];
			[3,-1,format ["Server Warning: %1 used ALT+F4",player getVariable["realname",name player]]] call life_fnc_newMsg;
		};
	};

	case 211: // CTRL + ALT + DEL Warning
	{
		if(_ctrlKey && _alt) then {
			diag_log format ["Server Warning: %1 used CTRL+ALT+DEL",player getVariable["realname",name player]];
			//[3,-1,format ["Server Warning: %1 used CTRL+ALT+DEL",player getVariable["realname",name player]]] call life_fnc_newMsg;
		};
	};

	case 1: // ESC Key Warnings
	{
		// CTRL + ESC Warning
		if( _ctrlKey ) then {
			diag_log format ["Server Warning: %1 used CTRL+ESC",player getVariable["realname",name player]];
			//[3,-1,format ["Server Warning: %1 used CTRL+ESC",player getVariable["realname",name player]]] call life_fnc_newMsg;
		};

		 // CTRL + ESC + Shift Warning
		if( _ctrlKey && _shift ) then {
			//[3,-1,format ["Server Warning: %1 used ESC + Ctrl + Shift",player getVariable["realname",name player]]] call life_fnc_newMsg;
			diag_log format ["Server Warning: %1 used ESC + Ctrl + Shift",player getVariable["realname",name player]];
		};
	};
};

_handled;
