class jobs_menu {
	idd = 3400;
	name= "jobs_menu";
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

			text = "Available Jobs"; //--- ToDo: Localize;
			x = 0.342219 * safezoneW + safezoneX;
			y = 0.3724 * safezoneH + safezoneY;
			w = 0.138181 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class vasgText: Life_RscText
		{
			idc = -1;

			text = "Taken Jobs"; //--- ToDo: Localize;
			x = 0.511344 * safezoneW + safezoneX;
			y = 0.3735 * safezoneH + safezoneY;
			w = 0.144367 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
	};

	class controls {
		class availableJobs: Life_RscListBox
		{
			idc = 2401;

			x = 0.34325 * safezoneW + safezoneX;
			y = 0.3955 * safezoneH + safezoneY;
			w = 0.137152 * safezoneW;
			h = 0.2002 * safezoneH;
		};
		class takenJobs: Life_RscListBox
		{
			idc = 2402;

			x = 0.513406 * safezoneW + safezoneX;
			y = 0.3955 * safezoneH + safezoneY;
			w = 0.140245 * safezoneW;
			h = 0.2002 * safezoneH;
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
		class ButtonAddG: Life_RscButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_startJob;";
			idc = 1009;

			text = "Start Job"; //--- ToDo: Localize;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.6078 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class ButtonRemoveG: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_quitJob";
			idc = 1011;

			text = "Quit Job"; //--- ToDo: Localize;
			x = 0.587656 * safezoneW + safezoneX;
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