/*
	Author: Bryan "Tonic" Boardwine
*/
private["_exitLoop","_group","_wait"];
if(playerSide != civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);
if(count gsn_gangData == 0) exitWith {}; //Dafuq?

_wait = round(random(8));
uiSleep _wait;

//Loop through to make sure there is not a group already created with the gang.
_exitLoop = false;
{
	_groupName = _x getVariable "gang_name";
	if(!isNil "_groupName") then {
		_groupOwner = _x getVariable["gang_owner",""];
		_groupID = _x getVariable "gang_id";
		if(_groupOwner == "" OR isNil "_groupID") exitWith {}; //Seriously?
		if((gsn_gangData select 0) == _groupID && ((gsn_gangData select 1) == _groupOwner)) exitWith {_group = _x; _exitLoop = true;};
	};
} foreach allGroups;

if(!isNil "_group") then {
	[player] join _group;
	if((gsn_gangData select 1) == (getPlayerUID player)) then {
		_group selectLeader player;
		[[player,_group],"TON_fnc_clientGangLeader",(units _group),false] spawn life_fnc_MP;
	};
} else {
	_group = group player;
	_group setVariable["gang_id",(gsn_gangData select 0),true];
	_group setVariable["gang_owner",(gsn_gangData select 1),true];
	_group setVariable["gang_name",(gsn_gangData select 2),true];
	_group setVariable["gang_maxMembers",(gsn_gangData select 3),true];
	_group setVariable["gsn_gang_bank",(gsn_gangData select 4),true];
	_group setVariable["gang_members",(gsn_gangData select 5),true];
	_group setVariable["gang_leaders",(gsn_gangData select 5),true];
};