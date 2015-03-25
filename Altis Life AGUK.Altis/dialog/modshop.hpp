class maximodshop {
    idd = 2000;
    name = "maximodshop";
    movingEnable = false;
    enableSimulation = true; 
    onUnload = "[] spawn life_fnc_modShopClose;";
    
    class controls {
	
		class RscText_1000: Life_RscText
		{
			idc = 1000;
			text = "Spray shop!";
			x = 0;
			y = 0;
			w = 1;
			h = 0.08;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class RscText_1001: Life_RscText
		{
			idc = 1001;
			x = 0;
			y = 0.08;
			w = 1;
			h = 0.86;
			colorText[] = {0,0,0,0.8};
			colorBackground[] = {0,0,0,0.8};
			colorActive[] = {0,0,0,0.8};
		};
		class RscButton_1600: Life_RscButtonMenu
		{
			idc = 1600;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.05;
			y = 0.96;
			w = 0.15;
			h = 0.04;
		};
		class RscButton_1601: Life_RscButtonMenu
		{
			idc = 1601;
			text = "Apply Mods";
			x = 0.8;
			y = 0.96;
			w = 0.15;
			h = 0.04;
			onButtonClick = "[] spawn life_fnc_modShopSave;";
		};
		class RscText_1002: Life_RscText
		{
			idc = 1002;
			text = "Reskin Store";
			x = 0.0125;
			y = 0.12;
			w = 0.2875;
			h = 0.04;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 1500;
			sizeEx = 0.030;
			x = 0.0125;
			y = 0.16;
			w = 0.2875;
			h = 0.76;
			onLBSelChanged = "[] spawn life_fnc_modShopUpdate;";
		};
		class RscText_1005: Life_RscText
		{
			idc = 1005;
			text = "Vehicle Colour Picker";
			x = 0.3125;
			y = 0.32;
			w = 0.6625;
			h = 0.04;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class RscText_1006: Life_RscText
		{
			idc = 1006;
			text = "Red";
			x = 0.325;
			y = 0.4;
			w = 0.1;
			h = 0.04;
		};
		class RscText_1007: Life_RscText
		{
			idc = 1007;
			text = "Green";
			x = 0.325;
			y = 0.48;
			w = 0.1;
			h = 0.04;
		};
		class RscText_1008: Life_RscText
		{
			idc = 1008;
			text = "Blue";
			x = 0.325;
			y = 0.56;
			w = 0.1;
			h = 0.04;
		};
		class RscText_1009: Life_RscText
		{
			idc = 1009;
			text = "Alpha";
			x = 0.325;
			y = 0.64;
			w = 0.1;
			h = 0.04;
		};

        class RedSlide : life_RscXSliderH {
			idc = 1800;
			x = 0.425;
			y = 0.4;
			w = 0.55;
			h = 0.04;
			sizeEx = 0.030;
            color[] = {1,0,0,1};
            colorActive[] = {1,0,0,1};
            onSliderPosChanged = "[true] spawn life_fnc_modShopUpdate;";
        };

        class GreenSlide : life_RscXSliderH {
            idc = 1801;
			x = 0.425;
			y = 0.48;
			w = 0.55;
			h = 0.04;
            sizeEx = 0.030;
           
            color[] = {0,1,0,1};
            colorActive[] = {0,1,0,1};
            onSliderPosChanged = "[true] spawn life_fnc_modShopUpdate;";
        };  

        class BlueSlide : life_RscXSliderH {
            idc = 1802;
			x = 0.425;
			y = 0.56;
			w = 0.55;
			h = 0.04;
            color[] = {0,0,1,1};
            colorActive[] = {0,0,1,1};
            onSliderPosChanged = "[true] spawn life_fnc_modShopUpdate;";
        };

        class AlphaSlide : life_RscXSliderH {            
            idc = 1803;
			x = 0.425;
			y = 0.64;
			w = 0.55;
			h = 0.04;
            color[] = {1,1,1,1};
            colorActive[] = {1,1,1,1};  
            onSliderPosChanged = "[true] spawn life_fnc_modShopUpdate;";
        };
		
		class RscText_1010: Life_RscText
		{
			idc = 1010;
			text = "Info On Your Modifications";
			x = 0.325;
			y = 0.76;
			w = 0.65;
			h = 0.04;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class RscText_1011: Life_RscText
		{
			idc = 1011;
			text = "Cost: $0";
			x = 0.325;
			y = 0.82;
			w = 0.65;
			h = 0.04;
		};
		class RscText_1012: Life_RscText
		{
			idc = 1012;
			text = "FREE Repair and Refuel on ALL Purchases!";
			x = 0.325;
			y = 0.88;
			w = 0.65;
			h = 0.04;
		};
    };
};