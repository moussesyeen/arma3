class life_progress
{
	name = "life_progress";
	idd = 38200;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['life_progress',_this select 0]";
	objects[]={};

	class controlsBackground 
	{
		class Group: Life_RscControlsGroup
		{
			idc = 0;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.215 * safezoneW;
			h = 0.099 * safezoneH;

			class controls
			{
				class RscProgress_1000: Life_RscProgress
				{
					idc = 38201;
					x = 0.00515602 * safezoneW;
					y = 0.066 * safezoneH;
					w = 0.204687 * safezoneW;
					h = 0.022 * safezoneH;
					colorBar[] = {0,0,0.8,0.6};
					colorFrame[] = {1,1,1,0.8};
					colorBackground[] = {0,0,0,0.3};
				};
				
				class RscText_1100: Life_RscText
				{
					idc = 38202;
					style = 0x02;
					sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
					x = 0.00515602 * safezoneW;
					y = 0.011 * safezoneH;
					w = 0.204687 * safezoneW;
					h = 0.044 * safezoneH;
				};

			};
		};
	};
};

class life_timer
{
	name = "life_timer";
	idd = 38300;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['life_timer',_this select 0]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : life_RscPicture
		{
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.04;
			h = 0.045;
		};

		class TimerText : life_RscText
		{
			colorBackground[] = {0,0,0,0};
			idc = 38301;
			text = "";
			x = 0.0204688 * safezoneW + safezoneX;
			y = 0.2778 * safezoneH + safezoneY;
			w = 0.09125 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};

class life_breakouttimer
{
	name = "life_breakouttimer";
	idd = 38300;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['life_breakouttimer',_this select 0]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : life_RscPicture
		{
			idc = -1;
			text = "icons\breakout.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.491 * safezoneH + safezoneY;
			w = 0.04;
			h = 0.045;
		};

		class TimerText : life_RscText
		{
			colorBackground[] = {0,0,0,0};
			idc = 38301;
			text = "";
			x = 0.0204688 * safezoneW + safezoneX;
			y = 0.4778 * safezoneH + safezoneY;
			w = 0.09125 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};

class life_nlrtimer
{
	name = "life_nlrtimer";
	idd = 38300;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['life_nlrtimer',_this select 0]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : life_RscPicture
		{
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.691 * safezoneH + safezoneY;
			w = 0.04;
			h = 0.045;
		};

		class TimerText : life_RscText
		{
			colorBackground[] = {0,0,0,0};
			idc = 38301;
			text = "";
			x = 0.0204688 * safezoneW + safezoneX;
			y = 0.6778 * safezoneH + safezoneY;
			w = 0.09125 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};
