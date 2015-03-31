/*
	File: fn_makeWeather.sqf
	Author: Distrikt41.de - Dscha

	Description:
	Random Weather Script
*/
	private ["_fnc_D41_WetterWerte"];

	fogAmount = [0,0,0];
	wavesOnOff = 1;
	overcastAmount = 0.5;
	windAmount = [1, 1, true];
	rainAmount = 0;
	rainAmountCounter = 1;

	_fnc_D41_WetterWerte =
	{
		if (isDedicated) then
			{
				randomValue = round(random 100);
				if(randomValue <= 5) then
					{
						fogAmount = [0,0,0]; wavesOnOff = 1; overcastAmount = 0.2; windAmount = [2, 2, true]; rainAmount = 0; rainAmountCounter = 0;
						typeModifier = round(random 9);
						switch(typeModifier) do
						{
							case 0:{fogAmount = [0.9, 0.1,10]; rainAmount = 0.1; overcastAmount = 0.4;};
							case 1:{fogAmount = [0.9, 0.2,10]; rainAmount = 0.2; overcastAmount = 0.3;};
							case 2:{fogAmount = [0.9, 0.3,10]; rainAmount = 0.2; overcastAmount = 0.2;};
							case 3:{fogAmount = [0.8, 0.1,15]; rainAmountCounter = 0;};
							case 4:{fogAmount = [0.7, 0.1,15]; rainAmount = 0.2; overcastAmount = 0.4;};
							case 5:{fogAmount = [0.6, 0.1,15]; rainAmountCounter = 0;};
							case 6:{fogAmount = [0.5, 0.1,30]; rainAmountCounter = 0;};
							case 7:{fogAmount = [0.4, 0.1,30]; rainAmount = 0.2; overcastAmount = 0.5;};
							case 8:{fogAmount = [0.3, 0.1,30]; rainAmountCounter = 0;};
							case 9:{fogAmount = [0.2, 0.1,50]; rainAmount = 0.4; wavesOnOff = 1; overcastAmount = 0.5;};
						};
					};

				if(randomValue >=6 && randomValue <= 35 && rainAmountCounter == 0) then
					{
						fogAmount = [0,0,0]; wavesOnOff = 1; overcastAmount = 1; rainAmount = 0; rainAmountCounter = 0;
						typeModifier = round(random 9);
						switch(typeModifier) do
						{
							case 0:{fogAmount = 0.1; wavesOnOff = 1; overcastAmount = 1; windAmount = [4, 4, true]; rainAmount = 0.6;};
							case 1:{fogAmount = 0.3; wavesOnOff = 1; pvercastAmount = 1; windAmount = [4, 4, true]; rainAmount = 0.6;};
							case 2:{fogAmount = 0.1; wavesOnOff = 1; overcastAmount = 0.9; windAmount = [4, 4, true]; rainAmount = 0.5;};
							case 3:{fogAmount = 0.2; wavesOnOff = 1; overcastAmount = 0.8; windAmount = [0, 5, true]; rainAmount = 0.5;};
							case 4:{fogAmount = 0.1; wavesOnOff = 1; overcastAmount = 0.7; windAmount = [6, 0, true]; rainAmount = 0.3;};
							case 5:{fogAmount = 0.1; wavesOnOff = 1; overcastAmount = 0.7; windAmount = [0, 6, true]; rainAmount = 0.3;};
							case 6:{fogAmount = 0.1; wavesOnOff = 1; overcastAmount = 0.6; windAmount = [5, 0, true]; rainAmount = 0.2;};
							case 7:{fogAmount = 0.1; wavesOnOff = 1; overcastAmount = 0.5; windAmount = [2, 4, true]; rainAmount = 0.2;};
							case 8:{fogAmount = 0.1; wavesOnOff = 1; overcastAmount = 0.4; windAmount = [3, 2, true]; rainAmount = 0.2;};
							case 9:{fogAmount = 0.1; wavesOnOff = 1; overcastAmount = 0.4; windAmount = [2, 1, true]; rainAmount = 0.1;};
						};
					};

				if(randomValue >=6 && randomValue <= 35 && rainAmountCounter == 1) then {randomValue = 36};

				if(randomValue >=36 && randomValue <= 90) then
				{
					fogAmount = [0,0,0]; wavesOnOff = 1; overcastAmount = 0.2; windAmount = [5, 5, true]; rainAmount = 0; rainAmountCounter = 0;
					typeModifier = round(random 9);
					switch(typeModifier) do
					{
						case 0:{overcastAmount = 0.9; windAmount = [3, 0, true];};
						case 1:{overcastAmount = 0.9; windAmount = [0, 3, true];};
						case 2:{overcastAmount = 0.7; windAmount = [2, 3, true];};
						case 3:{overcastAmount = 0.7; windAmount = [3, 2, true];};
						case 4:{overcastAmount = 0.6; windAmount = [0, 3, true];};
						case 5:{overcastAmount = 0.6; windAmount = [2, 0, true];};
						case 6:{overcastAmount = 0.5; windAmount = [2, 2, true];};
						case 7:{overcastAmount = 0.5; windAmount = [2, 0, true];};
						case 8:{overcastAmount = 0.4; windAmount = [0, 2, true];};
						case 9:{overcastAmount = 0.4; windAmount = [1, 1, true];};
					};
				};

				if(randomValue >=91 && randomValue <= 100) then
				{
					fogAmount = [0,0,0]; wavesOnOff = 1; overcastAmount = 0.2; windAmount = [1, 1, true]; rainAmount = 0; rainAmountCounter = 1;
					typeModifier = round(random 2);
					switch(typeModifier) do
					{
						case 0:{overcastAmount = 0.2; windAmount = [3, 0, true];};
						case 1:{overcastAmount = 0.2; windAmount = [0, 3, true];};
						case 2:{overcastAmount = 0.1; windAmount = [0, 0, true];};
					};
				};
				publicVariable "fogAmount";
				publicVariable "wavesOnOff";
				publicVariable "overcastAmount";
				publicVariable "windAmount";
				publicVariable "rainAmount";
			};
	};

	if(isDedicated)then
	{
		while{true}do
		{
			[] call _fnc_D41_WetterWerte;
			uiSleep 1;
			120 setfog (fogAmount);
			60 setRain (rainAmount);
			45 setOvercast (overcastAmount);
			setWind (windAmount);
			60 setWaves (wavesOnOff);
			uiSleep 1200;
		};
	};

	//JIP und sync Ged?hns
	if (!isDedicated) then
	{
		while{true}do
		{
			120 setfog (fogAmount);
			60 setRain (rainAmount);
			45 setOvercast (overcastAmount);
			setWind (windAmount);
			60 setWaves (wavesOnOff);
			uiSleep 120;
		};
	};