class life_wanted_menu {
	idd = 2400;
	name= "life_wanted_menu";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class Life_RscTitleBackground: Life_RscText
		{
			idc = -1;

			x = 0.0125;
			y = 0.02;
			w = 0.975185;
			h = 0.0400168;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class MainBackground: Life_RscText
		{
			idc = -1;

			x = 0.0125;
			y = 0.06;
			w = 0.975185;
			h = 0.86036;
			colorBackground[] = {0,0,0,0.8};
		};
	};

	class controls
	{
		class Title: Life_RscTitle
		{
			idc = -1;

			text = "GPD Wanted List"; //--- ToDo: Localize;
			x = 0.0125;
			y = 0.02;
			w = 0.975185;
			h = 0.0400168;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class WantedConnection: Title
		{
			idc = 2404;
			style = 1;

			text = "GPD Wanted List"; //--- ToDo: Localize;
			x = 0.0125;
			y = 0.02;
			w = 0.975185;
			h = 0.0400168;
			colorText[] = {0.95,0.95,0.95,1};
		};
		class WantedList: Life_RscListBox
		{
			idc = 2401;
			onLBSelChanged = "[] spawn life_fnc_wantedGrab";

			sizeEx = 0.03;
			x = 0.0225;
			y = 0.128;
			w = 0.275053;
			h = 0.464192;
		};
		class PlayerList: Life_RscListBox
		{
			idc = 2406;
			onLBSelChanged = "";

			sizeEx = 0.03;
			x = 0.3455;
			y = 0.128;
			w = 0.28;
			h = 0.464;
		};
		class WantedDetails: Life_RscListBox
		{
			idc = 2402;
			sizeEx = 0.03;
			x = 0.025;
			y = 0.6;
			w = 0.597633;
			h = 0.300126;
		};
		class BountyPrice: Life_RscText
		{
			idc = 2403;

			x = 0.7575;
			y = 0.644;
			w = 0.212541;
			h = 0.0400168;
		};
		class WantedAddL: Life_RscCombo
		{
			idc = 2407;

			x = 0.6675;
			y = 0.12;
			w = 0.3;
			h = 0.04;
		};
		class CloseButtonKey: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = 1009;

			text = "Close"; //--- ToDo: Localize;
			x = 0.0125;
			y = 0.928;
			w = 0.15628;
			h = 0.0400168;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class PardonButtonKey: Life_RscButtonMenu
		{
			idc = 2405;
			onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";

			text = "Pardon All"; //--- ToDo: Localize;
			x = 0.18;
			y = 0.928;
			w = 0.15628;
			h = 0.0400168;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class ButtonWantedAdd: Life_RscButtonMenu
		{
			idc = 9800;
			onButtonClick = "[] call life_fnc_wantedAddP;";

			text = "Add"; //--- ToDo: Localize;
			x = 0.81;
			y = 0.18;
			w = 0.15628;
			h = 0.0400168;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class wantedText: Life_RscText
		{
			idc = 1000;

			text = "Wanted People"; //--- ToDo: Localize;
			x = 0.025;
			y = 0.072;
			w = 0.200038;
			h = 0.0400168;
		};
		class citizensText: Life_RscText
		{
			idc = 1001;

			text = "Citizens"; //--- ToDo: Localize;
			x = 0.34;
			y = 0.072;
			w = 0.212541;
			h = 0.0400168;
		};
		class crimesText: Life_RscText
		{
			idc = 1002;

			text = "Crimes"; //--- ToDo: Localize;
			x = 0.6625;
			y = 0.076;
			w = 0.153876;
			h = 0.0300126;
		};
		class BountyTitle: Life_RscText
		{
			idc = -1;

			text = "Bounty:"; //--- ToDo: Localize;
			x = 0.7575;
			y = 0.608;
			w = 0.100019;
			h = 0.0400168;
		};
		class TicketTitle: Life_RscText
		{
			idc = -1;

			text = "Ticket:"; //--- ToDo: Localize;
			x = 0.7575;
			y = 0.724;
			w = 0.100019;
			h = 0.0400168;
		};
		class TicketCost: Life_RscText
		{
			idc = 2408;

			x = 0.7575;
			y = 0.776;
			w = 0.212541;
			h = 0.0400168;
		};
		class PardonSelectedButtonKey: Life_RscButtonMenu
		{
			idc = 2406;
			onButtonClick = "[] call life_fnc_pardonSelected; closeDialog 0;";

			text = "Pardon Selected"; //--- ToDo: Localize;
			x = 0.35;
			y = 0.928;
			w = 0.256775;
			h = 0.0400168;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
	};
};