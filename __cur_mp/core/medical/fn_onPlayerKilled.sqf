/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_unit","_killer"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
//Set some vars
if(gsn_first_event == 0) then
{
	gsn_first_event = 1;
};
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.
_unit setVariable["missingOrgan",FALSE,TRUE]; //I DONT KNOW WHY SOMETIMES THEY ARE CAPS or not
gsn_death_unit_location = _unit modelToWorld[0,3,0];
[8] call SOCK_fnc_updatePartial;

life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
[_unit] spawn
{
	private["_maxTime","_RespawnBtn","_Timer","_dude"];
	_dude = _this select 0;
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	_RespawnBtn ctrlEnable false;
	_maxTime = time + (life_respawn_timer * 60);
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	round(_maxTime - time) <= 0 OR gsn_has_requested_revive};
	if(gsn_has_requested_revive) then
	{
		_maxTime = time + (10 * 60);
		waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
		round(_maxTime - time) <= 0};
	};
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
	waitUntil{life_respawned OR (_dude getVariable["Revive",false])};
	if(life_respawned) then
	{
		_unit setVariable["name",nil,TRUE];
		[[_unit],"life_fnc_corpse",true,false] spawn life_fnc_MP;
		hideBody _unit;
	};
};

[] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		if(side _killer != independent) then
		{
			[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
			[[_killer],"life_fnc_wantedFetchForCivilian",_killer,false] spawn life_fnc_MP;
			//Get rid of this if you don't want automatic vehicle license removal.
			if(!local _killer) then {
				[[2],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
			};
		};
	} else {
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		[[_killer],"life_fnc_wantedFetchForCivilian",_killer,false] spawn life_fnc_MP;
		if(gsn_is_arrested) then
		{
			if(player distance (getMarkerPos "jail_marker") < 20) then
			{
				gsn_is_arrested = true;
			}
			else
			{
				gsn_is_arrested = false;
			};
		};
		if(!local _killer) then {
			[[3],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
		};
	};
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then
{
	life_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!gsn_use_atm && {gsn_life_cash > 0}) then
	{
		[format[localize "STR_Cop_RobberDead",[gsn_life_cash] call life_fnc_numberText],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		gsn_life_cash = 0;
	};
	if(gsn_is_arrested) then
	{
		if(player distance (getMarkerPos "jail_marker") < 9) then
		{
			gsn_is_arrested = true;
		}
		else
		{
			gsn_is_arrested = false;
		}
	};
};

//figure out if we should remove the wanted list
switch(gsn_first_event) do
{
	case 1:
	{
		if(side _unit == civilian) then
		{
			if(side _killer == west) then
			{
				life_removeWanted = true;
			};
			if(side _killer == civilian) then
			{
				_killerGang = (group _killer) getVariable ["gang_name",""];
				_unitGang = (group _unit) getVariable ["gang_name",""];
				if(_unitGang == "" && _killerGang == "") then
				{
					life_removeWanted = true;
				}
				else
				{
					//gang the same?
					if(_unitGang == _killerGang) then
					{
						//gang member killed them
						life_removeWanted = false;
					};
				};
			};
		}
		else
		{
			life_removeWanted = false;
		};
	};
	case 2:
	{
		life_removeWanted = false;
	};
	default
	{
		life_removeWanted = false;
	};
};

gsn_has_requested_revive = false;
gsn_life_hunger = 100;
gsn_life_thirst = 100;
life_bac = 0;
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"colorCorrections" ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0],[1.8, 1.8, 0.3, 0.7],[0.2, 0.59, 0.11, 0]];
"colorCorrections" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;

[] call life_fnc_hudUpdate; //Get our HUD updated.
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;