/* 
    File: fn_modShopClose.sqf
    Desc: Resorts the car back to its old format.
*/
private["_oldTextureID","_vehicle","_texture"];
_vehicle = vehicle player;

if(!life_modshop_purchase) then {
    _oldTextureID = life_modshop_data select 0;
    _rgb = life_modshop_data select 1; 

    if(count _rgb > 0) then {
        _r = _rgb select 0;
        _g = _rgb select 1;
        _b = _rgb select 2;
        _a = _rgb select 3;

        _tex = format ['#(argb,8,8,3)color(%1,%2,%3,%4)', _r, _g, _b, _a];
        _vehicle setObjectTextureGlobal[0,_tex];
    } else {
        
        _texture = [(typeOf _vehicle)] call life_fnc_vehicleColorCfg;
        if(count (_texture select _oldTextureID) > 2) then {_texture2 = (_texture select _oldTextureID) select 2;};
        if(count (_texture select _oldTextureID) > 3) then {_texture3 = (_texture select _oldTextureID) select 3;};
        _texture = _texture select _oldTextureID;
        if(typeName _texture == "ARRAY") then { _texture = _texture select 0;};
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
};



life_modshop_data = nil;
life_modshop_purchase = nil;
life_modshop_cost = nil;