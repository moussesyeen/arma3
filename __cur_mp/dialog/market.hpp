//Grid macros
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class marketView
{
	idd = 39500;
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground
	{
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "<t size='1.2' align='center'>GSN Market</t>"; //--- ToDo: Localize;
			x = 0.340157 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.31453 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 0.340157 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.31453 * safezoneW;
			h = 0.462 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};

	class controls
	{
		class lblResourceName: RscText
		{
			idc = 1000;

			text = "Resource"; //--- ToDo: Localize;
			x = 0.470092 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.173253 * safezoneW;
			h = 0.055 * safezoneH;
			sizeEx = .07;
		};
		class IGUIBack_2201: IGUIBack
		{
			idc = 2201;

			x = 0.469062 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class lblResourcePrice: RscText
		{
			idc = 1001;

			text = "$0.00"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {0,1,0,1};
			sizeEx = .1;
		};
		class IGUIBack_2202: IGUIBack
		{
			idc = 2202;

			x = 0.469062 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.264 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 1101;

			text = "<t align='center'>Market Value</t>"; //--- ToDo: Localize;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class picTrendGlobal: RscPicture
		{
			idc = 1200;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class picTrendLocal: RscPicture
		{
			idc = 1201;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscText_1002: RscText
		{
			idc = 1002;

			text = "Since Server Start"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = .05;
		};
		class RscText_1003: RscText
		{
			idc = 1003;

			text = "Globally"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = .05;
		};
		class lblTrendGlobal: RscText
		{
			idc = 1004;

			text = "$0.00"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lblTrendLocal: RscText
		{
			idc = 1005;

			text = "$0.00"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class bClose: RscButtonMenu
		{
			idc = 2400;
			onButtonClick = "closeDialog 0;";

			text = "Close"; //--- ToDo: Localize;
			x = 0.595907 * safezoneW + safezoneX;
			y = 0.7332 * safezoneH + safezoneY;
			w = 0.0588318 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class listResources: RscListBox
		{
			idc = 1500;
			onLBSelChanged = "[] spawn life_fnc_refreshMarketView";

			x = 0.343252 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.121684 * safezoneW;
			h = 0.4268 * safezoneH;
		};
	};
};

