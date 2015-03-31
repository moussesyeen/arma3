/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_medic","_dir"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
[_oldGear] spawn life_fnc_loadDeadGear;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[[life_corpse],"life_fnc_corpse",nil,FALSE] spawn life_fnc_MP;
_dir = getDir life_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[(call life_revive_fee)] call life_fnc_numberText];

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
if(gsn_lifeatm_cash > (call life_revive_fee)) then {
	[(call life_revive_fee),1,1] call life_fnc_handleMoney;
} else {
	[gsn_lifeatm_cash,1,1] call life_fnc_handleMoney;
};

//Bring me back to life.
player setVariable ["lifeRescued",true,true];
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
[[life_corpse],"life_fnc_corpse",true,false] spawn life_fnc_MP;

if(life_corpse getVariable["missingOrgan",true]) then
{
	player setVariable["missingOrgan",true,true];
};
hideBody life_corpse;
deleteVehicle life_corpse;
life_corpse setPosATL[0,0,0];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
gsn_first_event = 0;
[] call life_fnc_hudUpdate; //Request update of hud.
[] call life_fnc_updateSkins;
[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;