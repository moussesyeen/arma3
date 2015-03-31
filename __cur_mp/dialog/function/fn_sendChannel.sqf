private["_title","_report"];
disableSerialization;

waitUntil {!isnull (findDisplay 9000)};

if ( playerSide != civilian ) exitWith { systemChat "You are not a civilian"; }; // Hint if not civilian
if !( life_channel_send ) exitWith { systemChat "A news report can only be sent every 30 minutes!"; }; //Gives Player the Hint to Wait 30 mins

_title = ctrlText 9001;
_report = ctrlText 9002;
[[3,format ["%1",_title],(player getVariable["realname",name player]),format ["%1",_report]],"life_fnc_broadcast",true,false] call life_fnc_MP;
life_channel_send = false;

[] spawn
{
	uiSleep 1800;
	life_channel_send = true;
};