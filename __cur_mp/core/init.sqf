#include <macro.h>
life_firstSpawn = true;
life_session_completed = false;
if(isNil "gsn_recruit_reporter") then
{
	gsn_recruit_reporter = ["Reporter",ObjNull];
};
if(isNil "gsn_recruit_towtruck") then
{
	gsn_recruit_towtruck = ["Tow Truck Driver",ObjNull];
};
if(isNil "gsn_recruit_carsales") then
{
	gsn_recruit_carsales = ["Car Salesman",ObjNull];
};
if(isNil "gsn_recruit_housesales") then
{
	gsn_recruit_housesales = ["Realtor",ObjNull];
};
private["_handle","_timeStamp"];
0 cutText["Setting up client, please wait...","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
[] call compile PreprocessFileLineNumbers "core\clientValidator.sqf";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
[] call life_fnc_setupEVH;
[] call life_fnc_setupActions;
waitUntil {(!isNil {TON_fnc_clientGangLeader})};
0 cutText ["Waiting for the server to be ready...","BLACK FADED"];
0 cutFadeOut 99999999;
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded") exitWith {
	999999 cutText ["The server-side extension extDB was not loaded into the engine, report this to the server admin.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};
[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["Finishing client setup procedure","BLACK FADED"];
0 cutFadeOut 9999999;

[] spawn life_fnc_escInterupt;

switch (playerSide) do
{
	case west:
	{
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};

	case civilian:
	{
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};

	case independent:
	{
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};
};

[] spawn
{
	[] call life_fnc_slideshowWelcome;
};
[] call life_fnc_updateJIPSkins;
player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
player setVariable["recruitPosition","none",true];
[] execFSM "core\fsm\plebian.fsm";
waitUntil {!(isNull (findDisplay 46))};
[[getPlayerUID player,player getVariable["realname",name player]],"life_fnc_wantedProfUpdate",false,false] spawn life_fnc_MP;
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
life_sidechat = true;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
[] call life_fnc_settingsInit;
player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];
player setVariable["missingOrgan",false,true];//sets variables to false on start
life_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

life_fnc_garageRefund = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	[_price,1,0] call life_fnc_handleMoney;
";

switch (__GETC__(life_donator)) do {
	case 1: { gsn_life_paycheck = 1000; };
	case 2: { gsn_life_paycheck = 2000; };
	case 3: { gsn_life_paycheck = 3000; };
	case 4: { gsn_life_paycheck = 4000; };
	case 5: { gsn_life_paycheck = 5000; };
	default { gsn_life_paycheck = 500; };
};
switch (playerSide) do
{
	case west:
	{
		gsn_life_paycheck = gsn_life_paycheck + 750;
	};
	case independent:
	{
		gsn_life_paycheck = gsn_life_paycheck + 2000;
	};
};

[] execVM "core\init_survival.sqf";
[] spawn life_fnc_stopSideChatVON;
[] spawn life_fnc_showDirectVON;
MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;

};

__CONST__(gsn_life_paycheck,gsn_life_paycheck); //Make the paycheck static.
player enableFatigue (__GETC__(life_enableFatigue));
[] spawn life_fnc_fatigueReset;
