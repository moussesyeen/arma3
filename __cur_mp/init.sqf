enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];
{_x setMarkerAlphaLocal 0} forEach ["good_1","bad_1","bad_2","bad_3","bad_4","bad_5","bad_6","bad_7","bad_8"];

life_versionInfo = "Altis Life RPG v3.1.4.8";
[] execVM "briefing.sqf";
[] execVM "KRON_Strings.sqf";
[] execVM "tools\detector1.sqf";
[] execVM "tools\detector2.sqf";
[] execVM "dialog\outlw_magRepack\MagRepack_init_sv.sqf";

if(isDedicated && isNil("life_market_prices")) then
{
	waitUntil{!isNil "DB_Async_Active"};
    [] call MKT_fnc_marketStartup;
};
StartProgress = true;