/*
	Author: Bryan "Tonic" Boardwine
*/
private["_vault","_ui","_title","_progressBar","_cP","_titleText","_type","_cycleIncrease"];
_object = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _object) exitWith {};
if(typeOf _object == "Land_CargoBox_V1_F") then {_type == 1};
if(typeOf _object in ["Car","Truck"]) then {_type == 2};

switch{_type} do
{
	case 1://reserve
	{
		if(!(_object getVariable ["is_reserve",false])) exitWith {"This object can not be defused"};
		if(!(_object getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Defuse_Nothing"};
		_cycleIncrease = .0035;
	};
	case 2://carbomb
	{
		if(!(_object getVariable ["hasBomb",false])) exitWith{"This object does not have a bomb on it"};
		_cycleIncrease = .5;
	};
	default
	{
		if(true) exitWith{"This object can not be defused"};
	};
};

life_action_inUse = true;
//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Defuse_Process";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	uiSleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cycleIncrease;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith { };
	if(life_interrupted) exitWith { };
	if(!alive player) exitWith { };
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {life_action_inUse = false; };
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action cancelled","PLAIN"]; life_action_inUse = false; };


life_action_inUse = false;

switch{_type} do
{
	case 1://reserve
	{
		_object setVariable["chargeplaced",false,true];
		[[0,"STR_ISTR_Defuse_Success"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	};
	case 2://carbomb
	{
		_veh setVariable["hasBomb", false, true];
		[[0,format["STR_ISTR_CB_Defuse_Success"],player getVariable["realname",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	};
	default
	{
		if(true) exitWith{"This object can not be defused"};
	};
};
