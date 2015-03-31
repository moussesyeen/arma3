////refresh all player skins for a newly joined player
{
	if(alive _x) then
	{
		[_x] call life_fnc_updateSkins;
	};
} foreach playableUnits;