class Life_ticket_give
{
	idd = 2650;
	name = "life_ticket_give";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = -0.15;
			y = 0.2;
			w = 1.1;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = -0.15;
			y = 0.2 + (11 / 250);
			w = 1.1;
			h = 0.95;
		};
	};
	
	class controls 
	{
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2651;
			text = "";
			x = -0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class mid1Title : Life_RscStructuredText
		{
			idc = 2652;
			text = "1. WIP(Work in progress).";
			
			x = 0.30;
			y = 0.26;
			w = 0.7;
			h = .14;
		};
		
		class mid2Title : Life_RscStructuredText
		{
			idc = 2653;
			text = "2.WIP(Work in progress).";
			
			x = 0.30;
			y = 0.30;
			w = 0.7;
			h = .14;
		};
		
		class mid3Title : Life_RscStructuredText
		{
			idc = 2654;
			text = "3. WIP(Work in progress).";
			
			x = 0.30;
			y = 0.34;
			w = 0.7;
			h = .14;
		};
		
		class mid4Title : Life_RscStructuredText
		{
			idc = 2655;
			text = "4. WIP(Work in progress).";
			
			x = 0.30;
			y = 0.38;
			w = 0.7;
			h = .14;
		};
		
		class mid5Title : Life_RscStructuredText
		{
			idc = 2656;
			text = "5. WIP(Work in progress).";
			
			x = 0.30;
			y = 0.42;
			w = 0.7;
			h = .14;
		};
		
		class mid6Title : Life_RscStructuredText
		{
			idc = 2657;
			text = "6. WIP(Work in progress).";
			
			x = 0.30;
			y = 0.46;
			w = 0.7;
			h = .14;
		};

		class payTicket20: Life_RscButtonMenu {
			idc = -1;
			text = "35k Ticket";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_ticketGive10";
			x = 0.45;
			y = 0.52;
			w = 0.24;
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class high1Title : Life_RscStructuredText
		{
			idc = 2660;
			text = "1. WIP(Work in progress).";
			
			x = 0.30;
			y = 0.58;
			w = 0.7;
			h = .14;
		};
		
		class high2Title : Life_RscStructuredText
		{
			idc = 2661;
			text = "2. WIP(Work in progress).";
			
			x = 0.30;
			y = 0.62;
			w = 0.7;
			h = .14;
		};
			
		class high3Title : Life_RscStructuredText
		{
			idc = 2662;
			text = "3. WIP(Work in progress).";
			
			x = 0.30;
			y = 0.66;
			w = 0.7;
			h = .14;
		};
		
		class high4Title : Life_RscStructuredText
		{
			idc = 2663;
			text = "4. WIP(Work in progress).";
			
			x = 0.30;
			y = 0.70;
			w = 0.7;
			h = .14;
		};
		
		class high5Title : Life_RscStructuredText
		{
			idc = 2664;
			text = "5. WIP(Work in progress).";
			
			x = 0.30;
			y = 0.74;
			w = 0.7;
			h = .14;
		};
		
		class high6Title : Life_RscStructuredText
		{
			idc = 2665;
			text = "6. WIP(Work in progress).";
			
			x = 0.30;
			y = 0.78;
			w = 0.7;
			h = .14;
		};
		
		class jail1Title : Life_RscStructuredText
		{
			idc = 2666;
			text = "1. WIP(Work in progress).";
			
			x = 0.30;
			y = 0.90;
			w = 0.7;
			h = .14;
		};
		
		class jail2Title : Life_RscStructuredText
		{
			idc = 2667;
			text = "2. WIP(Work in progress).";
			
			x = 0.30;
			y = 0.94;
			w = 0.7;
			h = .14;
		};
		
		class jail3Title : Life_RscStructuredText
		{
			idc = 2668;
			text = "3. WIP(Work in progress).";
			
			x = 0.30;
			y = 0.98;
			w = 0.7;
			h = .14;
		};
		
		class jail4Title : Life_RscStructuredText
		{
			idc = 2669;
			text = "4. WIP(Work in progress).";
			
			x = 0.30;
			y = 1.02;
			w = 0.7;
			h = .14;
		};
		
		class ButtonArrest : life_RscButtonMenu
		{
			idc = 2685;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Give Ticket";
			onButtonClick = "[] call life_fnc_ticketAction2";
			sizeEx = 0.025;
			x = 0.45;
			y = 1.08;
			w = 0.24;
			h = 0.038;
			class Attributes 
			{
				align = "center";
			};
		};
		
		class PoliceHQTitle : Life_RscStructuredText
		{
			idc = 2670;
			text = "";
			
			x = 0.50;
			y = 1.12;
			w = 0.7;
			h = .14;
		};
		
		class wanteditle : Life_RscStructuredText
		{
			idc = 2680;
			text = "Criminals";
			
			x = -0.1; 
			y = 0.26;
			w = 0.2; 
			h = 0.3;
		};
		
		class WantedList : Life_RscListBox 
		{
			idc = 2691;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] spawn life_fnc_wantedGrab2";
			
			x = -0.1; 
			y = 0.32;
			w = 0.37; 
			h = 0.5;
		};
		
		class WantedDetails : Life_RscListBox
		{
			idc = 2692;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};
			
			x = -0.1;
			y = 0.90;
			w = 0.37;
			h = 0.24;
		};
		
		class BountyPrice : Life_RscText
		{
			idc = 2693;
			text = "";
			x = -0.1;
			y = 0.55;
			w = 0.6;
			h = 0.6;
		};

		class payTicket30: Life_RscButtonMenu {
			idc = -1;
			text = "75k Ticket";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_ticketGive30";
			x = 0.45;
			y = 0.84;
			w = 0.24;
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
	};
};

class Life_ticket_pay
{
	idd = 2600;
	name = "life_ticket_pay";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.47;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.47;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls 
	{
		class InfoMsg : Life_RscStructuredText
		{
			idc = 2601;
			sizeEx = 0.020;
			text = "";
			x = 0.287;
			y = 0.2 + (11 / 250);
			w = 0.5; h = 0.12;
		};

		class payTicket: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Ticket_PayTicket";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_ticketPay;";
			x = 0.2 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class refuseTicket : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Ticket_RefuseTicket";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0;";
			x = 0.4 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};