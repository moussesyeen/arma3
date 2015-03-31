private["_veh"];
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_tone = [_this,1,"Federal",[""]] call BIS_fnc_param;
_nap = [_this,2,9.984,[0]] call BIS_fnc_param;
if(isNull _veh) exitWith {};
if(isNil {_veh getVariable "federal"}) exitWith {};
while {true} do
{
	if(!(_veh getVariable "federal")) exitWith {};
	if(count (crew (_veh)) == 0) then {_veh setVariable["federal",false,true]};
	if(!alive _veh) exitWith {};
	if(isNull _veh) exitWith {};
	_veh say3D _tone;
	uisleep _nap;
	if(!(_veh getVariable "federal")) exitWith {};
};
