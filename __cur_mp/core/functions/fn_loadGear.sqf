/*
    File: fn_loadGear.sqf
    Author: Bryan "Tonic" Boardwine
*/
private["_itemArray","_uniform","_vest","_backpack","_goggles","_headgear","_items","_prim","_seco","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_bMags","_vMags","_handle"];
_player = [_this,0,objNull,[]] call BIS_fnc_param;
if(isNil "_player" OR isNull _player OR !isPlayer _player) then
{
    _player = player;
};

_itemArray = life_gear;
waitUntil {!(isNull (findDisplay 46))};

[_player] call life_fnc_stripDownPlayer;

if(count _itemArray == 0) exitWith
{
    switch(playerSide) do {
        case west: {
            [] call life_fnc_copLoadout;
        };

        case civilian: {
            [] call life_fnc_civLoadout;
        };

        case independent: {
            [] call life_fnc_medicLoadout;
        };
    };
};

//check for default cop loadout if they were dead and respawned
if(life_gear isEqualTo ["U_B_CombatUniform_mcam_tshirt","V_PlateCarrierSpec_rgr","B_AssaultPack_rgr_Medic","G_Tactical_Clear","H_HelmetB_light_desert",["ItemMap","ItemCompass","ItemWatch","ItemRadio","NVGoggles"],"arifle_MX_pointer_F","hgun_P07_F",["FirstAidKit"],["30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","Chemlight_green"],["Medikit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit","FirstAidKit"],[],[],["30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","SmokeShell","SmokeShellGreen","SmokeShellBlue","SmokeShellOrange","Chemlight_green","30Rnd_65x39_caseless_mag","16Rnd_9x21_Mag"],["","acc_pointer_IR",""],["","",""],[]]) exitWith {[] call life_fnc_copLoadout;};

_uniform = [_itemArray,0,"",[""]] call BIS_fnc_param;
_vest = [_itemArray,1,"",[""]] call BIS_fnc_param;
_backpack = [_itemArray,2,"",[""]] call BIS_fnc_param;
_goggles = [_itemArray,3,"",[""]] call BIS_fnc_param;
_headgear = [_itemArray,4,"",[""]] call BIS_fnc_param;
_items = [_itemArray,5,[],[[]]] call BIS_fnc_param;
_prim = [_itemArray,6,"",[""]] call BIS_fnc_param;
_seco = [_itemArray,7,"",[""]] call BIS_fnc_param;
_uItems = [_itemArray,8,[],[[]]] call BIS_fnc_param;
_uMags = [_itemArray,9,[],[[]]] call BIS_fnc_param;
_bItems = [_itemArray,10,[],[[]]] call BIS_fnc_param;
_bMags = [_itemArray,11,[],[[]]] call BIS_fnc_param;
_vItems = [_itemArray,12,[],[[]]] call BIS_fnc_param;
_vMags = [_itemArray,13,[],[[]]] call BIS_fnc_param;
_pItems = [_itemArray,14,[],[[]]] call BIS_fnc_param;
_hItems = [_itemArray,15,[],[[]]] call BIS_fnc_param;
_yItems = [_itemArray,16,[],[[]]] call BIS_fnc_param;

if(_goggles != "") then {_handle = [_goggles,true,false,false,false,false,false,_player] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_headgear != "") then {_handle = [_headgear,true,false,false,false,false,false,_player] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_uniform != "") then {_handle = [_uniform,true,false,false,false,false,false,_player] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_vest != "") then {_handle = [_vest,true,false,false,false,false,false,_player] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_backpack != "") then {_handle = [_backpack,true,false,false,false,false,false,_player] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
{_handle = [_x,true,false,false,false,false,false,_player] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} foreach _items;

{_player addItemToUniform _x;} foreach (_uItems);
{(uniformContainer _player) addItemCargoGlobal [_x,1];} foreach (_uMags);
{_player addItemToVest _x;} foreach (_vItems);
{(vestContainer _player) addItemCargoGlobal [_x,1];} foreach (_vMags);
{_player addItemToBackpack _x;} foreach (_bItems);
{(backpackContainer _player) addItemCargoGlobal [_x,1];} foreach (_bMags);

//Primary & Secondary (Handgun) should be added last as magazines do not automatically load into the gun.
if(_prim != "") then {_handle = [_prim,true,false,false,false,false,false,_player] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_seco != "") then {_handle = [_seco,true,false,false,false,false,false,_player] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};

{
    if (_x != "") then {
        _player addPrimaryWeaponItem _x;
    };
} foreach (_pItems);
{
    if (_x != "") then {
        _player addHandgunItem _x;
    };
} foreach (_hItems);

[] call life_fnc_updateSkins;