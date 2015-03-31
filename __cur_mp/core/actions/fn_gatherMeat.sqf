private["_animal","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_animal = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
life_interrupted = false;
if(isNull _animal) exitwith {};
if(_animal getVariable["gutting",false]) exitWith {hint localize "STR_NOTF_AlreadyGutting"};

_knife = missionNamespace getVariable (["hknife",0] call life_fnc_varHandle);
if(_knife >= 1) then
{
	life_action_inUse = true;
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%","Gutting animal..."];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	_animal setVariable["gutting",true,true];
	while{true} do
	{
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
			[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		};
		uiSleep 0.12;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Gutting animal..."];
		if(_cP >= 1) exitWith {life_action_inUse = false; _animal setVariable["gutting",false,true];};
		if(!alive player) exitWith {life_action_inUse = false; _animal setVariable["gutting",false,true];};
		if(player != vehicle player) exitWith {life_action_inUse = false; _animal setVariable["gutting",false,true];};
		if(life_interrupted) exitWith {life_action_inUse = false; _animal setVariable["gutting",false,true];};
	};

	life_action_inUse = false;
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false; _animal setVariable["gutting",false,true];};
	if(player != vehicle player) exitWith {life_action_inUse = false; _animal setVariable["gutting",false,true];};

	if(_animal getVariable["high_value",false]) then
	{
		if(([true,"carcush",1] call life_fnc_handleInv)) then
		{
			if(!license_civ_hunting) then
			{
				hint "Poaching (Hunting without a license) is against the law. You have been seen and have been reported to the police!";
				[[getPlayerUID player,player getVariable["realname",name player],"200"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
			};
			_itemName = [(["carcush",0] call life_fnc_varHandle)] call life_fnc_varToStr;
			titleText[localize "STR_NOTF_GuttedAnimalRare","PLAIN"];
			_animal setVariable["has_meat",false,true];
			[[],"GSN_fnc_refreshHunting",false] spawn life_fnc_MP;
		}
		else
		{
			titleText[localize "STR_NOTF_InvFull","PLAIN"];
		};
	}
	else
	{
		if(([true,"carcus",1] call life_fnc_handleInv)) then
		{
			if(!license_civ_hunting) then
			{
				hint "Poaching (Hunting without a license) is against the law. You have been seen and have been reported to the police!";
				[[getPlayerUID player,player getVariable["realname",name player],"200"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
			};
			_itemName = [(["carcus",0] call life_fnc_varHandle)] call life_fnc_varToStr;
			titleText[localize "STR_NOTF_GuttedAnimal","PLAIN"];
			_animal setVariable["has_meat",false,true];
			[[],"GSN_fnc_refreshHunting",false] spawn life_fnc_MP;
		}
		else
		{
			titleText[localize "STR_NOTF_InvFull","PLAIN"];
		};
	};
}
else
{
	titleText[localize "STR_NOTF_NoHuntingKnife","PLAIN"];
};

