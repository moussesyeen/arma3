/*
    File: fn_fatigueReset.sqf
    Author: Itsyuka
*/

[] spawn {
    while {true} do {
        if (life_fatigue < getFatigue player) then {
            player setFatigue life_fatigue;
        };
        uiSleep 1.5;
    };
};