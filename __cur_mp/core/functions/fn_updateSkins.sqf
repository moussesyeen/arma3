#include <macro.h>

_player = [_this,0,objNull,[]] call BIS_fnc_param;
if(isNil "_player" OR isNull _player OR !isPlayer _player) then
{
    _player = player;
};


switch(side _player) do
{
    case west:
    {
        switch(uniform _player) do
        {
            case "U_B_CombatUniform_mcam_worn":
            {
                [[_player,0,"textures\cop_fatigues.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
            };
            case "U_B_survival_uniform":
            {
                [[_player,0,"textures\cop_fatigues.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
            };
            case "U_Rangemaster":
            {
                    if!(__GETC__(life_coplevel) == 0) then {
                        [[_player,0,"textures\cop_standard.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
                    };
            };
        };
    };
    case independent:
    {
        switch(uniform _player) do
        {
            case "U_C_Scientist":
            {
                [[_player,0,"textures\med_standard.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
            };
        };
    };

    case civilian:
    {
        switch(uniform _player) do
        {
            case "U_C_Scientist":
            {
                [[_player,0,"textures\prisoner_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
            };
        };
    };
};