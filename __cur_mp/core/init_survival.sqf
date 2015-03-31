[] spawn  {
	private["_fnc_food","_fnc_water"];
	_fnc_food =
	{
		if(gsn_life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
		else
		{
		gsn_life_hunger = gsn_life_hunger - 10;
		[] call life_fnc_hudUpdate;
		if(gsn_life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
		switch(gsn_life_hunger) do {
			case 30: {hint localize "STR_NOTF_EatMSG_1";};
			case 20: {hint localize "STR_NOTF_EatMSG_2";};
			case 10: {hint localize "STR_NOTF_EatMSG_3";player setFatigue 1;};
			};
		};
	};

	_fnc_water =
	{
		if(gsn_life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
		else
		{
			gsn_life_thirst = gsn_life_thirst - 10;
			[] call life_fnc_hudUpdate;
			if(gsn_life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
			switch(gsn_life_thirst) do
			{
				case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
				case 20: {hint localize "STR_NOTF_DrinkMSG_2"; player setFatigue 1;};
				case 10: {hint localize "STR_NOTF_DrinkMSG_3"; player setFatigue 1;};
			};
		};
	};

	while{true} do
	{
		uiSleep 600;
		[] call _fnc_water;
		uiSleep 250;
		[] call _fnc_food;
	};
};

[] spawn
{
	private["_fnc_bac"];
	//part of alcohol system written by [midgetgrimm] - modified by Paronity
	_fnc_bac =
	{
		if(life_bac > 0) then
		{
			"chromAberration" ppEffectEnable true;
			"radialBlur" ppEffectEnable true;
			"chromAberration" ppEffectAdjust[0,(life_bac / 3), true];
			"chromAberration" ppEffectCommit 1;
			"radialBlur" ppEffectAdjust  [random 0.1,random 0.1,0.3,0.3];
			"radialBlur" ppEffectCommit 1;
			"colorCorrections" ppEffectAdjust[ 0.44, (life_bac / 2), 0.7, [0.1, -0.57, 0, 0.05],[1.8, 1.3, 0.3, 0.7],[0.2, (life_bac / 2), 0.11, 0]];
			"colorCorrections" ppEffectCommit 1;
			addcamShake[random (life_bac * 10), 2, (life_bac * 10)];

			_lLimit = (life_bac * 5);
			//passout chance
			_dice = random(150);
			if(_dice < _lLimit) then
			{
				titleText [localize "STR_MISC_DrunkBlackOut","BLACK OUT"];
				player playMoveNow "Incapacitated";
				uiSleep 25;
				removeUniform player;removeVest player;
				player playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
				uiSleep 15;
				titleText[localize "STR_MISC_DrunkBlackOut1","PLAIN"];
				player playMoveNow "amovppnemstpsraswrfldnon";
				life_bac = life_bac * .5;
			};
		}
		else
		{
			"chromAberration" ppEffectAdjust [0,0,true];
			"chromAberration" ppEffectCommit 5;
			"colorCorrections" ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0],[1.8, 1.8, 0.3, 0.7],[0.2, 0.59, 0.11, 0]];
			"colorCorrections" ppEffectCommit 5;
			"radialBlur" ppEffectAdjust  [0,0,0,0];
			"radialBlur" ppEffectCommit 5;
			"chromAberration" ppEffectEnable false;
			"radialBlur" ppEffectEnable false;
			resetCamShake;
			life_bac = 0;
		};
		[] call life_fnc_hudUpdate;
	};

	while{true} do
	{
		uiSleep 27;
		if(life_bac > 0.04) then
		{
			life_bac = life_bac - 0.04;
			[] call _fnc_bac;
			uiSleep 6;
			[] call _fnc_bac;
			uiSleep 6;
			[] call _fnc_bac;
		}
		else
		{
			life_bac = 0;
			"chromAberration" ppEffectAdjust [0,0,true];
			"chromAberration" ppEffectCommit 5;
			"colorCorrections" ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0],[1.8, 1.8, 0.3, 0.7],[0.2, 0.59, 0.11, 0]];
			"colorCorrections" ppEffectCommit 5;
			"radialBlur" ppEffectAdjust  [0,0,0,0];
			"radialBlur" ppEffectCommit 5;
			"chromAberration" ppEffectEnable false;
			"radialBlur" ppEffectEnable false;
			resetCamShake;
			life_bac = 0;
			[] call _fnc_bac;
		};
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};

[] spawn
{
	while {true} do
	{
		uiSleep 1.5;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint localize "STR_NOTF_MaxWeight";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};

[] spawn
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1800;
	while{true} do
	{
		uiSleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					gsn_life_thirst = gsn_life_thirst - 5;
					gsn_life_hunger = gsn_life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

[] spawn  {
	while{true} do
	{
		waitUntil {(player getVariable "missingOrgan")};
		life_max_health = .50;
		while{(player getVariable "missingOrgan")} do {
			gsn_life_thirst =  50;
			gsn_life_hunger =  50;
			if(damage player < (1 - life_max_health)) then {player setDamage (1 - life_max_health);};
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [2];
			"dynamicBlur" ppEffectCommit 1;
			uiSleep 5;
		};
		"dynamicBlur" ppEffectEnable false;
		life_max_health = 1;
	};
};

if(playerSide == civilian) then
{
	[] spawn
	{
		while{true} do
		{
			[[player],"life_fnc_wantedFetchForCivilian",false,false] spawn life_fnc_MP;
			uiSleep 600;
		};
	};
};
