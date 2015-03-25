#include <macro.h>
/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = SEL(_this,0);
_part = SEL(_this,1);
_damage = SEL(_this,2);
_source = SEL(_this,3);
_projectile = SEL(_this,4);

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if(_projectile in ["B_9x21_Ball","B_556x45_dual"] && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then {
			if(side _source == west && playerSide != west) then {
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile == "B_556x45_dual") then {100} else {25};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				_damage = false;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit GVAR ["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						} else {
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			};
			
			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = true;
			};
		};
		
		if(_curWep in ["hgun_PDW2000_F"] && !isNull _source) then {
			_damage = false;
			_damageHandle = false;
			if(uniform _source == "U_B_CombatUniform_mcam_vest" && vehicle _source == _source && isPlayer _source && player distance _source < 50 && vehicle player == player) then { //Bounty hunter clothing and distance check.
				[[player],"life_fnc_bountyTaze",_source,false] spawn life_fnc_MP;
			};
		};
		if(_projectile in ["B_556x45_Ball_Tracer_Green"] && _curWep in ["arifle_Mk20_plain_F","arifle_Mk20C_plain_F"]) then {
			//Checks if we are getting hit by a cop with rubber bullets
			if(side _source == west && playerSide != west) then {
				private["_isVehicle"];
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_damage = false;
				_damageHandle = false;
				if(!(_isVehicle && !life_istazed)) then {
					[player,"Rubber Bullet Impact",true] spawn life_fnc_knockedOut;
				};	
			};
			
			//Temp fix for super rubber bullets on cops.
			if(playerSide == west && side _source == west) then {
				_damage = true;
				_damageHandle = false;
			};
		};
		
		if (vehicle _unit == _unit) then
		{
			if ( _source isKindOf "Air" OR _source isKindOf "Car" OR _source isKindOf "Boat" ) then
			{
				diag_log "The source is a vehicle, but not a player driving a vehicle";
			}
			else
			{		
				_isVehicle = vehicle _source;
				if (_isVehicle isKindOf "Air" OR _isVehicle isKindOf "Car" OR _isVehicle isKindOf "Boat") then 
				{
					_damage = 0;
					_damageHandle = false;
					hint "Since you were VDM'ed you did not die.";
					[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
				};
			};
		};
	};
};

[] call life_fnc_hudUpdate;
_damage;