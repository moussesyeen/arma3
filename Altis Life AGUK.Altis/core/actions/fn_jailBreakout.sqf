/* 
	File: fn_jailBreakout.sqf
	Date: 2/14/15
	Desc: Initiates a prison breakout, this is our new way to break people out of Jail!
	Author: Cirian
*/
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(!alive player) exitWith {};
if(playerSide != civilian) exitWith {hint "Only civilians can do this!";};
if(vehicle player != player) exitWith {hint "You need to be outside of your vehicle!";};
if(currentWeapon player == "" || currentWeapon player == "Binocular") exitWith {hint "The guards do not feel threatened in any way!";};
if(life_inv_boltcutter < 1) exitWith {hint "You need boltcutters to initiate a prison break!";};	
if(_unit getVariable["inbreakout",false]) exitWith {hint "Someone is already breaking out the prisoners!";};
if(time - (_unit getVariable["lastbreakout",-5000]) < 500) exitWith {hint "The jail is currently under lockdown and you are unable to get near to the walls."};
_unit setVariable["lastbreakout",time,true];
_unit setVariable["inbreakout",true,true];

[[1,"Somebody is attempting to break prisoners out of the jail!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP; 
[[0,"Somebody is attempting to break prisoners out of the jail!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP; 

hint "You are currently breaking prisoners out of the prison, you need to stay close or the jailbreak will stop.";

[[_unit,player],"life_fnc_breakoutTimer",true] spawn life_fnc_MP; //Show the countdown to all prisoners, cops and the player.

_time = time + (2 * 60);

//Lazy loop to do some status checks on the breakout.
_ok = true;
while {true} do {
	if(round(_time - time) < 1) exitWith {_ok = true;}; //Times up
	if(!alive player) exitWith {_ok = false;};
	if(player distance _unit > 50) exitWith {_ok = false;};
	if(life_istazed) exitWith {_ok = false;};
	if(player getVariable["restrained",false]) exitWith {_ok = false;};
	sleep 1;
};
_unit setVariable["inbreakout",false,true]; //Stop the clock, and the breakout prevention aswell.

if(_ok) then {
	[[1,"The jailbreak ended with people being broken out!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP; 
	[[0,"The jailbreak ended with people being broken out!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP; 
	[[profileName],"life_fnc_jailBreakoutCompleted",true,false] spawn life_fnc_MP;
} else {
	hint "You failed to break out any prisoners.";	
	[[1,"The jailbreak ended with no people being broken out!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP; 
	[[0,"The jailbreak ended with no people being broken out!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP; 
};
