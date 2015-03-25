class life_loadout_menu {
	idd = 70000;
	name= "life_loadout_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.65;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.65;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "AltisGaming.co.uk - Loadouts";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class LoadoutList : Life_RscListBox 
		{
			idc = 70002;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] call life_fnc_loadoutInfo";
			
			x = 0.11; y = 0.26;
			w = 0.23; h = 0.485;
		};
		
		class LoadoutDetails : Life_RscListBox
		{
			idc = 70003;
			text = "test";
			sizeEx = 0.035;
			
			x = 0.35;
			y = 0.26;
			w = 0.39;
			h = 0.448;
		};
		
		class TotalCost : Life_RscText
		{
			idc = 70008;
			text = "Total cost: ";
			sizeEx = 0.035;
			
			x = 0.35;
			y = 0.51;
			w = 0.39;
			h = 0.44;
		};
		
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 60);
			h = (1 / 25);
		};
		
		class BuyButtonKey : Life_RscButtonMenu {
			idc = 70005;
			text = "Buy";
			onButtonClick = "[] spawn life_fnc_loadoutBuy;";
			x = 0.1 + (6.25 / 60) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 60);
			h = (1 / 25);
		};
		
		class DeleteButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Delete";
			onButtonClick = "[] call life_fnc_loadoutDelete;";
			x = 0.256 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 50);
			h = (1 / 25);
		};
		
		class CreateButtonKey : Life_RscButtonMenu {
			idc = 70009;
			text = "Create loadout";
			onButtonClick = "closeDialog 0; [] spawn life_fnc_loadoutCreate;";
			x = 0.385 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (8.25 / 40);
			h = (1 / 25);
		};
	};
};