/* 
    File: fn_modShopSave.sqf
    Author: Maximum
    Desc: Saves the new variables to the car.
*/
private["_r","_g","_b","_a","_display","_reskinList","_cost","_nitroList","_texture","_selected_looks","_engineList","_paintR","_paintG","_paintB","_reskin","_reskinID","_nitro","_engine"];
disableSerialization;
_vehicle = vehicle player;
if(_vehicle == player) exitWith {};
_display = findDisplay 2000;
_reskinList = _display displayCtrl 1500;
_paintR = _display displayCtrl 1800;
_paintG = _display displayCtrl 1801;
_paintB = _display displayCtrl 1802;
_alpha = _display displayCtrl 1803;

_reskin = lbText [1500, lbCurSel 1500];
_reskinID = lbValue[1500, lbCurSel 1500];

_cost = 0;

//Custom image
if(_reskin == "Custom RGB") then {
    _cost = _cost + 1550;
    if(CASH < _cost) exitWith {hint "You do not have enough cash for this!";};

    _r = (sliderPosition _paintR);
    _g = (sliderPosition _paintG);
    _b = (sliderPosition _paintB);
    _a = (sliderPosition _alpha);

    _r = _r / 25.0;
    _g = _g / 25.0;
    _b = _b / 25.0;
    _a = _a / 10.0;

    _selected_looks = [_r,_g,_b,_a];
    
    _vehicle setVariable["Life_VEH_RGB",_selected_looks,true];

    _tex = format ['#(argb,8,8,3)color(%1,%2,%3,%4)', _r, _g, _b, _a];
    _vehicle setObjectTextureGlobal [0, _tex];
};


//Color
if(!(_reskin == "Custom RGB")) then {
    _cost = _cost + 2500;
    if(CASH < _cost) exitWith {hint "You do not have enough cash for this!";};
    _texture = [(typeOf _vehicle)] call life_fnc_vehicleColorCfg;
    if(count (_texture select _reskinID) > 2) then {_texture2 = (_texture select _reskinID) select 2;};
    if(count (_texture select _reskinID) > 3) then {_texture3 = (_texture select _reskinID) select 3;};
    _texture = _texture select _reskinID;
    if(typeName _texture == "ARRAY") then { _texture = _texture select 0;};
    _vehicle setVariable["Life_VEH_color",_reskinID,true];
    life_modshop_data set[1,[]]; //Set empty.
    _vehicle setVariable["Life_VEH_RGB",life_modshop_data select 1,true];
    _vehicle setObjectTextureGlobal[0,_texture];
    if(!isNil "_texture2") then
    {
        _vehicle setObjectTextureGlobal[1,_texture2];
    };
    if(!isNil "_texture3") then
    {
        _vehicle setObjectTextureGlobal[2,_texture3];
    };
};
if(CASH < _cost) exitWith {hint "You do not have enough cash for this!";};

vehicle player setDamage 0;
vehicle player setFuel 1;
[[vehicle player],"TON_fnc_updateVehicle",false,false] spawn life_fnc_MP;
CASH = CASH - _cost;
playSound "buy";
closeDialog 0;
life_modshop_purchase = true;