/*file:fn_breathalyzer author:[midgetgrimm] descrip:allows cop to breathalyze player*/
private["_cop","_drinky"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
_drinky = life_bac;
if(_drinky > 0.24) then {
[[1,format["Breathalyzing %1 \n\n BAC: %2 \n\n They are at, or over the legal limit! ",name player,[_drinky] call life_fnc_numberText]],"life_fnc_broadcast",_cop,false] spawn life_fnc_MP;
[[getPlayerUID player,player getVariable["realname",name player],"16"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
} else {
[[1,format["Breathalyzing %1 \n\n BAC: %2 \n\n Under the legal limit! ",name player,[_drinky] call life_fnc_numberText]],"life_fnc_broadcast",_cop,false] spawn life_fnc_MP;
};