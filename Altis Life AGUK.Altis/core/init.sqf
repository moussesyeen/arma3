#include <macro.h>
/*
	Master client initialization file
*/
life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];

_doMsg = {
	[
		format["<t size='1.3' color='#5600FF'>%1</t><br/>%2.",_this select 0, _this select 1],
		0,
		0.2,
		99999999999999,
		0,
		0,
		8
	] spawn BIS_fnc_dynamicText;
};

//0 cutText["Setting up client, please wait...","BLACK FADED"];
["Setting up client","Your client is currently loading Esport Altis Life TH Please wait"] call _doMsg; //new screan
0 cutFadeOut 9999999;
3 cutRsc ["SplashNoise","BLACK"];
//title colors
profileNamespace setVariable ['GUI_BCG_RGB_R',0.338829];
profileNamespace setVariable ['GUI_BCG_RGB_G',0];
profileNamespace setVariable ['GUI_BCG_RGB_B',1];
profileNamespace setVariable ['GUI_BCG_RGB_A',0.937124];
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
[] call compile PreprocessFileLineNumbers "core\clientValidator.sqf";
player allowDamage false;
//Setup initial client core functions
diag_log "::Life Client:: Initialization Variables";
["Loading Config Files","Your client is currently loading config files. Please wait."] call _doMsg; //new screan
0 cutFadeOut 9999999; //new screan
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";

diag_log "::Life Client:: Variables initialized";
diag_log "::Life Client:: Setting up Eventhandlers";
["Setting up Event Handlers","Creating event handlers for operation."] call _doMsg;
0 cutFadeOut 9999999; //new screan
[] call life_fnc_setupEVH;

diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Setting up user actions";
["Setting up Actions","Creating actions. Please wait"] call _doMsg;
0 cutFadeOut 9999999;
[] call life_fnc_setupActions;

diag_log "::Life Client:: User actions completed";
diag_log "::Life Client:: Waiting for server functions to transfer..";
["Receiving serversided functions","Your client is downloading some fuctions from the server."] call _doMsg;
0 cutFadeOut 9999999;
waitUntil {(!isNil {TON_fnc_clientGangLeader})};

diag_log "::Life Client:: Received server functions.";
["Waiting for server...","The server is still setting up, please wait."] call _doMsg;
0 cutFadeOut 99999999;
diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};

if(!isNil "life_server_extDB_notLoaded" && {life_server_extDB_notLoaded != ""}) exitWith {
	diag_log life_server_extDB_notLoaded;
	999999 cutText [life_server_extDB_notLoaded,"BLACK FADED"];
	999999 cutFadeOut 99999999;
};
["Loading gear from server...","You are currently in the login queue, this should not take too long. Please wait."] call _doMsg;
[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
["Finished Receiving Data","Data received, Welcome to AltisGaming!"] call _doMsg;
0 cutFadeOut 9999999;

//diag_log "::Life Client:: Group Base Execution";
[] spawn life_fnc_escInterupt;

switch (playerSide) do {
	case west: {
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};
	case civilian: {
		//Initialize Civilian Settings
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};
	case independent: {
		//Initialize Medics and blah
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};
};

player SVAR ["restrained",false,true];
player SVAR ["Escorting",false,true];
player SVAR ["transporting",false,true];
diag_log "Past Settings Init";
[] execFSM "core\fsm\AltisGaming.fsm";

diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};

diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";

life_sidechat = true;
[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false,true] call life_fnc_MP;
0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;

/* Set up frame-by-frame handlers */
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
[] spawn life_fnc_speaking; //Initiate the speaking loop
[] spawn life_fnc_fuelManager;

player SVAR ["steam64ID",getPlayerUID player];
player SVAR ["realname",profileName,true];
player enableFatigue false;

life_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

[] spawn life_fnc_survival;
[] execVM "scripts\fn_statusBar.sqf";
[] execVM "scripts\welcome.sqf";

CONSTVAR(life_paycheck); //Make the paycheck static.
if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),0)) then {player enableFatigue false;};
[[getPlayerUID player,player getVariable["realname",name player]],"life_fnc_wantedProfUpdate",false,false] spawn life_fnc_MP;

player allowDamage true; //Player init finished.

[] spawn {
	while {true} do {
		waitUntil {sleep 5; overcast != 0.2};
		0 setOvercast 0.2;
	};
};

[] spawn {
	while {true} do {
		sleep (600 + random 600);
		[] spawn SOCK_fnc_updateRequest;
		hint "Data synced to AltisGaming database, next sync in 10-20 minutes.";
	};	
};

[]spawn
{
	if (local player) then
	{
		waitUntil {not(isNull (findDisplay 46))};
		(findDisplay 46) displayAddEventHandler
		[
			"KeyDown","if
				(
					((_this select 1) in actionKeys 'ForceCommandingMode')
				)
				then
				{
					true;
				};
		"];
	};
};


[] call life_fnc_reloadUniforms;
