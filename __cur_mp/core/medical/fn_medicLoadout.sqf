/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player forceAddUniform "U_C_Scientist";
player addBackpack "B_Bergen_sgg";

player addItemToBackpack "Medikit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";

[] call life_fnc_saveGear;
[] call life_fnc_updateSkins;
