class shops_menu {
	idd = 2400;
	name= "shops_menu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class Life_RscTitleBackground: Life_RscText
		{
			idc = -1;

			x = 0.335 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class MainBackground: Life_RscText
		{
			idc = -1;

			x = 0.335 * safezoneW + safezoneX;
			y = 0.3592 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.2816 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class vasText: Life_RscText
		{
			idc = -1;

			text = "Shop Inventory"; //--- ToDo: Localize;
			x = 0.344281 * safezoneW + safezoneX;
			y = 0.3735 * safezoneH + safezoneY;
			w = 0.138181 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class vasgText: Life_RscText
		{
			idc = -1;

			text = "Your Inventory"; //--- ToDo: Localize;
			x = 0.511351 * safezoneW + safezoneX;
			y = 0.3735 * safezoneH + safezoneY;
			w = 0.144367 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
	};

	class controls {
		class itemList: Life_RscListBox
		{
			idc = 2401;

			x = 0.34325 * safezoneW + safezoneX;
			y = 0.3955 * safezoneH + safezoneY;
			w = 0.137152 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class pItemlist: Life_RscListBox
		{
			idc = 2402;

			x = 0.513413 * safezoneW + safezoneX;
			y = 0.3955 * safezoneH + safezoneY;
			w = 0.140245 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class Title: Life_RscTitle
		{
			idc = 2403;

			x = 0.335 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class PlayersName: Title
		{
			idc = 601;
			style = 1;

			x = 0.335 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class buyEdit: Life_RscEdit
		{
			idc = 2404;

			text = "1"; //--- ToDo: Localize;
			x = 0.34325 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.13715 * safezoneW;
			h = 0.0165 * safezoneH;
		};
		class ButtonAddG: Life_RscButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_virt_buy;";

			idc = 1009;
			text = "Buy Item"; //--- ToDo: Localize;
			x = 0.35975 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class sellEdit: Life_RscEdit
		{
			idc = 2405;

			text = "1"; //--- ToDo: Localize;
			x = 0.513413 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.140243 * safezoneW;
			h = 0.0165 * safezoneH;
		};
		class ButtonRemoveG: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_virt_sell";

			idc = 1011;
			text = "Sell Item"; //--- ToDo: Localize;
			x = 0.570125 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class ButtonClose: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = 1012;
			text = "Close"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};