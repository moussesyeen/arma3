/*
	File: fn_fatigueManager.sqf
	Author: Maxi
	Desc: Prevents players fatigue levels from going above our limit.
*/

while {true} do {
	//If our player has a fatigue above limit then reset it to fatigue - 0.5
	if (0.7 < getFatigue player) then {
		player setFatigue 0.65;
	};
	sleep 1.5;
};