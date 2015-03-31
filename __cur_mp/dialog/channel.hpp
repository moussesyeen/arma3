class channel{
	idd = 9000;
	name= "channel";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class Life_RscTitleBackground: Life_RscText
		{
			idc = -1;

			x = 0.335 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class MainBackground: Life_RscText
		{
			idc = -1;

			x = 0.335 * safezoneW + safezoneX;
			y = 0.3592 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.2816 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};

	class controls {
		class Title: Life_RscTitle
		{
			idc = -1;

			text = "Channel 7 News (CH7) "; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class Channel7NewsEditText: Life_RscStructuredText
		{
			idc = -1;

			text = "This will send a news report to ALL players."; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.237154 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Channel7Title: Life_RscEdit
		{
			idc = 9001;

			x = 0.403065 * safezoneW + safezoneX;
			y = 0.4318 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.0462 * safezoneH;
		};
		class Channel7Description: Life_RscStructuredText
		{
			idc = -1;

			text = "Do NOT abuse this system. Serious RP only!"; //--- ToDo: Localize;
			x = 0.353559 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.213467 * safezoneW;
			h = 0.0352 * safezoneH;
		};
		class CloseButtonKey: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";

			idc = 1006;
			text = "Close"; //--- ToDo: Localize;
			x = 0.334691 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class SendButtonKey: Life_RscButtonMenu
		{
			idc = 9005;
			onButtonClick = "[] call life_fnc_sendChannel; closeDialog 0;";

			text = "Send"; //--- ToDo: Localize;
			x = 0.400691 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class Channel7Body: Life_RscEdit
		{
			idc = 9002;

			x = 0.403065 * safezoneW + safezoneX;
			y = 0.4912 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.0968 * safezoneH;
		};
		class RscText_1009: RscText
		{
			idc = -1;

			text = "Title:"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0309377 * safezoneW;
			h = 0.0264 * safezoneH;
		};
		class RscText_1010: RscText
		{
			idc = -1;

			text = "Message:"; //--- ToDo: Localize;
			x = 0.345311 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0443438 * safezoneW;
			h = 0.0264 * safezoneH;
		};
	};
};