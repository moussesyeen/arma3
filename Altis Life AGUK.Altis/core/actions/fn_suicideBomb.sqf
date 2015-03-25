/*
	ALAH SNACKBAR! goes in MISSION/core/actions/

private["_test"];
if(vest player != "V_HarnessOGL_brn") exitWith {};
_test = "Bo_Mk82" createVehicle [0,0,9999];
_test setPos (getPos player);
_test setVelocity [100,0,0];

if(alive player) then {player setDamage 1;};

[[0,format["%1 has set off their suicide vest.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
*/
private["_boom", "_list"];
if(vest player != "V_Chestrig_khk") exitWith {};

life_isSuiciding = true;


if(vest player != "V_Chestrig_khk") exitWith {life_isSuicide = false;};
	
removeVest player;
_boom = "Bo_Mk82" createVehicle [0,0,9999];
_boom setPos (getPos player);
_boom setVelocity [100,0,0];

if(alive player) then {player setDamage 1;};

life_isSuicide = false;

[[0,format["%1 just blew himself up.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;