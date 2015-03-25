/*
	File: initServer.sqf
	
	Description:
	Starts the initialization of the server.
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
if(!(_this select 0)) exitWith {}; //Not server
[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
master_group attachTo[bank_obj,[0,0,0]];

[8,true,true,12] execFSM "core\fsm\keepingTime.fsm";

life_fed_hacked = false;
publicVariable "life_fed_hacked";