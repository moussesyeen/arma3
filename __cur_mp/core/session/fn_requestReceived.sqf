#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Parse basic player information.
gsn_life_cash = parseNumber (_this select 2);
gsn_lifeatm_cash = parseNumber (_this select 3);
[] call life_fnc_initCaches;
__CONST__(life_adminlevel,parseNumber (_this select 4));
__CONST__(life_donator,parseNumber (_this select 5));

//Loop through licenses
if(count (_this select 6) > 0) then {
	{
		missionNamespace setVariable [(_x select 0),(_x select 1)];
	} foreach (_this select 6);
};

life_gear = _this select 8;
[] spawn life_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel, parseNumber(_this select 7));
		__CONST__(life_medicLevel,0);
		life_blacklisted = _this select 9;
	};

	case civilian: {
		gsn_is_arrested = _this select 7;
		__CONST__(life_coplevel, 0);
		__CONST__(life_medicLevel, 0);
		gsn_life_houses = _this select 9;
		{
			_position = call compile format["%1",_x select 0];
			_house = nearestBuilding _position;
			_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
			if(count _houseCfg == 0 || (_house distance _position > 10)) then
			{
				_house = (nearestObjects[_position,["House_F"],20] select 0);
			};
			gsn_life_vehicles set[count gsn_life_vehicles,_house];
		} foreach gsn_life_houses;

		gsn_gangData = _This select 10;
		if(count gsn_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
	};

	case independent: {
		__CONST__(life_medicLevel, parseNumber(_this select 7));
		__CONST__(life_copLevel,0);
	};
};

if(count (_this select 12) > 0) then {
	{gsn_life_vehicles pushBack _x;} foreach (_this select 12);
};

life_session_completed = true;