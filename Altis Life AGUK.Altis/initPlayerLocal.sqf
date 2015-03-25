/*
	File: initPlayerLocal.sqf
	
	Description:
	Starts the initialization of the player.
*/
life_adminlevel = nil;life_coplevel = nil;life_donator = nil;
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
if(!hasInterface) exitWith {}; //This is a headless client, he doesn't need to do anything but keep being headless..
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);
[] execVM "core\init.sqf";

//Execute JIP code.
if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};

//Maxi - attempt to disable all the radio 'regroup' chatter and squad stuff, without blocking VON
enableRadio false; 
enableSentences false; //Maxi - Add enableSentences false. Disables radio chatter fully.