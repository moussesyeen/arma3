/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine

	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
if(isNil "life_ticket_paid") then {life_ticket_paid = false;};
if(count _ret > 0) then { life_bail_amount = (_ret select 3); };
[] call life_fnc_updateSkins;
if(isNil "life_ticket_val") then
{
	life_bail_amount = 5000;
}
else
{
	life_bail_amount = life_ticket_val * .10;
};


if(life_ticket_paid) then {_time = time + (10 * 60);} else { _time = time + (15 * 60);};
_esc = false;
_bail = false;

[_bad,_time] spawn
{
	_badMan = (_this select 0);
	_bailTime = (_this select 1);
	life_canpay_bail = false;
	if(_badMan) then
	{
		sleep (_bailTime / 1.5);
	}
	else
	{
		sleep (_bailTime / 3);
	};
	life_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
		hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " $%2",_countDown,[life_bail_amount] call life_fnc_numberText,if(isNil "life_canpay_bail") then {"Yes"} else {"No"}];
	};

	if(player distance (getMarkerPos "jail_marker") > 40) exitWith {
		_esc = true;
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
	case (_bail) :
	{
		gsn_is_arrested = false;
		life_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
		removeUniform player;
		player addVest (gsn_jail_clothes select 0);
		player forceAddUniform (gsn_jail_clothes select 1);
		[] call life_fnc_updateSkins;
		[5] call SOCK_fnc_updatePartial;
	};

	case (_esc) :
	{
		gsn_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[[0,format[localize "STR_Jail_EscapeNOTF",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		[[getPlayerUID player,profileName,"202"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};

	case (alive player && !_esc && !_bail) :
	{
		gsn_is_arrested = false;
		hint localize "STR_Jail_Released";
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
		player setPos (getMarkerPos "jail_release");
		removeUniform player;
		player addVest (gsn_jail_clothes select 0);
		player forceAddUniform (gsn_jail_clothes select 1);
		[] call life_fnc_updateSkins;
		[5] call SOCK_fnc_updatePartial;
	};
};