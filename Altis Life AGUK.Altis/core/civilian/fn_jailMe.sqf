#include <macro.h>
/*
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
if(_bad) then { _time = time + (20 * 60); } else { _time = time + (15 * 60); };

_clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];

["U_B_CombatUniform_mcam",true] call life_fnc_handleItem;
waitUntil {uniform player == "U_B_CombatUniform_mcam"};
[player, true] call life_fnc_reloadUniforms;
removeVest player;
removeHeadgear player;

if(count _ret > 0) then { life_bail_amount = SEL(_ret,3); } else { life_bail_amount = gsn_wanted_status; _time = time + (15 * 60); };
_esc = false;
_bail = false;

[_bad] spawn {
	life_canpay_bail = false;
	if(_this select 0) then {
		sleep (15 * 60);
	} else {
		sleep (10 * 60);
	};
	life_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
		hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " £%2",_countDown,[life_bail_amount] call life_fnc_numberText,if(isNil "life_canpay_bail") then {"Yes"} else {"No"}];
	};
	
	if(vehicle player != player) then {
		player action["Eject",vehicle player];
		if(driver (vehicle player) == player) then {vehicle player setFuel 0;};
	};
	
	if(player distance (getMarkerPos "jail_marker") > 50) then {
		player setPos (getMarkerPos "jail_marker");
	};
	
	if(life_escape) exitWith {
		_esc = true;
		life_escape = false;
	};
	
	if(life_bail_paid) exitWith {
		_bail = true;
	};
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith {};
	sleep 0.1;
};


switch (true) do
{
	case (_bail): {
		life_is_arrested = false;
		life_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] call life_fnc_MP;
		[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
		[(_clothings call BIS_fnc_selectRandom),true] call life_fnc_handleItem;
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (_esc): {
		life_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[[0,"STR_Jail_EscapeNOTF",true,[profileName]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
		[[getPlayerUID player,profileName,"901"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
		[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
		player setPos (getMarkerPos "jail_release");
	};
	
	case (alive player && !_esc && !_bail): {
		life_is_arrested = false;
		hint localize "STR_Jail_Released";
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] call life_fnc_MP;
		[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
		player setPos (getMarkerPos "jail_release");
		[(_clothings call BIS_fnc_selectRandom),true] call life_fnc_handleItem;
		[5] call SOCK_fnc_updatePartial;
	};
};