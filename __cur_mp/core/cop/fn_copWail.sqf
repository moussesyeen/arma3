private["_veh"];
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_tone = [_this,1,"Wail",[""]] call BIS_fnc_param;
_nap = [_this,2,5.105,[0]] call BIS_fnc_param;
if(isNull _veh) exitWith {};
if(isNil {_veh getVariable "wail"}) exitWith {};
while {true} do
{
	if(!(_veh getVariable "wail")) exitWith {};
	if(count (crew (_veh)) == 0) then {_veh setVariable["wail",false,true]};
	if(!alive _veh) exitWith {};
	if(isNull _veh) exitWith {};
	_veh say3D _tone;
	uisleep _nap;
	if(!(_veh getVariable "wail")) exitWith {};
};
