/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_handle"];
life_respawned = false;
player playMove "amovpercmstpsnonwnondnon";
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
life_corpse setVariable["realname",nil,TRUE];
life_corpse setVariable["Reviving",nil,TRUE];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
player setVariable["restrained",FALSE,TRUE];
player setVariable["Escorting",FALSE,TRUE];
player setVariable["transporting",FALSE,TRUE];
player setVariable["steam64id",(getPlayerUID player),true];
player setVariable["realname",profileName,true];
player setVariable["missingOrgan",FALSE,TRUE];

//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {
		_handle = [] spawn life_fnc_copLoadout;
	};
	case civilian: {
		_handle = [] spawn life_fnc_civLoadout;
	};
	case independent: {
		_handle = [] spawn life_fnc_medicLoadout;
	};
	waitUntil {scriptDone _handle};
};

[player] spawn life_fnc_dropItems;

//Cleanup of weapon containers near the body & hide it.
if(!isNull life_corpse) then {
	[life_corpse] spawn
	{
		private["_containers","_unit"];
		life_corpse setVariable["Revive",TRUE,TRUE];
		_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],7];
		hideBody life_corpse;
		deleteVehicle life_corpse;
		life_corpse setPosATL[0,0,0];
		life_corpse setVariable["Revive",TRUE,TRUE];
		uiSleep 30;
		if(player getVariable["lifeRescued",false]) then
		{
			{deleteVehicle _x;} foreach _containers; //Delete the containers.
		};
		_containers = [];
		gsn_first_event = 0;
	};
};



gsn_use_atm = TRUE;
gsn_life_hunger = 100;
gsn_life_thirst = 100;
life_carryWeight = 0;
life_bac = 0;

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Bad boy
if(gsn_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	gsn_is_arrested = false;
	[player,TRUE] spawn life_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "life_copRecieve") then {
	[[getPlayerUID player,player,life_copRecieve,true],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
	life_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(life_removeWanted) then {
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
};
[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
[] call life_fnc_updateSkins;
[] call SOCK_fnc_updateRequest;
[] call life_fnc_hudUpdate; //Request update of hud.