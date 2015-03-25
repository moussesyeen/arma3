/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player addUniform "U_B_CombatUniform_mcam";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addBackpack "B_Carryall_cbr";

[[player,0,"textures\medic\medic_uniform.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;

[] call life_fnc_reloadUniforms;
[] call life_fnc_saveGear;
