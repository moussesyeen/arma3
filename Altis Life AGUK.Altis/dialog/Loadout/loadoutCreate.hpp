class life_loadoutCreate_menu {
	idd = 80000;
	name= "life_loadoutCreate_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.1;
			w = 0.77;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.1 + (11 / 250);
			w = 0.77;
			h = 0.8 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "AltisGaming.co.uk - Loadouts";
			x = 0.1;
			y = 0.1;
			w = 0.6;
			h = (1 / 25);
		};
		
		class InfoMsg : Life_RscStructuredText
		{
			idc = 80001;
			sizeEx = 0.020;
			text = "Name of the loadout";
			x = 0.11;
			y = 0.15;
			w = 0.5; h = 0.12;
		};
		
		class NameEdit : Life_RscEdit 
		{
			idc = 80005;
			
			text = "";
			sizeEx = 0.030;
			x = 0.34; y = 0.156;
			w = 0.33; h = 0.03;
		};
		
		class LoadoutList : Life_RscListBox 
		{
			idc = 80002;
			text = "";
			sizeEx = 0.035;
			
			x = 0.11; y = 0.2;
			w = 0.35; h = 0.649;
		};
		
		class AddedList : Life_RscListBox 
		{
			idc = 80006;
			text = "";
			sizeEx = 0.035;
			
			x = 0.51; y = 0.2;
			w = 0.35; h = 0.61;
		};
		
		class magInfoMsg : Life_RscStructuredText
		{
			idc = 80009;
			sizeEx = 0.01;
			text = "<t size='0.7'>Number of respective magazines to add</t>";
			x = 0.5;
			y = 0.82;
			w = 0.5; h = 0.12;
		};
		
		class magEdit : Life_RscEdit 
		{
			idc = 80007;
			
			text = "3";
			sizeEx = 0.030;
			x = 0.83; y = 0.82;
			w = 0.035; h = 0.03;
		};
		
		
		class AddButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "+";
			onButtonClick = "[] call life_fnc_loadoutCreateAdd";
			x = 0.47;
			y = 0.4;
			w = 0.03;
			h = 0.04;
		};
		
		class RemoveButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "- ";
			style = 0;
			onButtonClick = "[] call life_fnc_loadoutCreateRemove";
			x = 0.47;
			y = 0.5;
			w = 0.03;
			h = 0.04;
		};
		
		
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class BuyButtonKey : Life_RscButtonMenu {
			idc = 80003;
			text = "Done";
			onButtonClick = "[] call life_fnc_loadoutCreateDone; closeDialog 0;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};