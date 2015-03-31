/*
	Original Code: PapaBear @ Blacklistgaming.org
	Heavily Modified By Paronity @ GSNGaming.com
*/

#define GUI_GRID_X    (0)
#define GUI_GRID_Y    (0)
#define GUI_GRID_W    (0.025)
#define GUI_GRID_H    (0.04)
#define GUI_GRID_WAbs    (1)
#define GUI_GRID_HAbs    (1)
class BlackjackGUI
{
	idd = 5980;
	name="black_jack";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "";

	class controlsBackground
	{
		class RscFrame_1800: Life_RscText
		{
			idc = 5981;

			x = 2.9 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 31.1 * GUI_GRID_W;
			h = 20.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1000: Life_RscText
		{
			idc = 5988;

			text = "Dealer:"; //--- ToDo: Localize;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 4.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.1 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class RscText_1001: Life_RscText
		{
			idc = 5989;

			text = "Player:"; //--- ToDo: Localize;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.2 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class RscText_1012: Life_RscText
		{
			idc = 5999;

			text = "BLACKJACK"; //--- ToDo: Localize;
			x = 9 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorText[] = {0,0,0,0};
			sizeEx = 3 * (0.04) * (0.04) * (0.04) * GUI_GRID_H;
		};
		class RscText_1013: Life_RscText
		{
			idc = 6000;

			text = "Result:"; //--- ToDo: Localize;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.1 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
	};

	class controls
	{
		class STAY_BTN: Life_RscButtonMenu
		{
			idc = 5982;
			onButtonClick = "[] spawn life_fnc_blackjackStay;";

			text = "Stay"; //--- ToDo: Localize;
			x = 13.1 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class HIT_BTN: Life_RscButtonMenu
		{
			idc = 5983;
			onButtonClick = "[] spawn life_fnc_blackjackHit;";

			text = "Hit"; //--- ToDo: Localize;
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class TOTAL: Life_RscText
		{
			idc = 6007;

			text = "Your Total: "; //--- ToDo: Localize;
			x = 24.3 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class BET_5K: Life_RscButtonMenu
		{
			idc = 5984;
			onButtonClick = "[5000] spawn life_fnc_blackjackBet;";

			text = "5K"; //--- ToDo: Localize;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class BET_10K: Life_RscButtonMenu
		{
			idc = 5985;
			onButtonClick = "[10000] spawn life_fnc_blackjackBet;";

			text = "10K"; //--- ToDo: Localize;
			x = 8.5 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class BET_25K: Life_RscButtonMenu
		{
			idc = 5986;
			onButtonClick = "[25000] spawn life_fnc_blackjackBet;";

			text = "25K"; //--- ToDo: Localize;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class BET_50K: Life_RscButtonMenu
		{
			idc = 5987;
			onButtonClick = "[50000] spawn life_fnc_blackjackBet;";

			text = "50K"; //--- ToDo: Localize;
			x = 17.5 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class Dealer_Card_1: life_RscPicture
		{
			idc = 5990;
			text = "";
			x = 8.3 * GUI_GRID_W + GUI_GRID_X;
			y = 4.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Dealer_Card_2: life_RscPicture
		{
			idc = 5991;
			text = "";

			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Player_Card_1: life_RscPicture
		{
			idc = 5992;
			text = "";

			x = 8.3 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Player_Card_2: life_RscPicture
		{
			idc = 5993;
			text = "";

			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Player_Card_3: life_RscPicture
		{
			idc = 5994;
			text = "";

			x = 14.7 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Dealer_Card_4: life_RscPicture
		{
			idc = 7015;
			text = "";

			x = 17.9 * GUI_GRID_W + GUI_GRID_X;
			y = 4.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Dealer_Card_5: life_RscPicture
		{
			idc = 5996;
			text = "";

			x = 21.1 * GUI_GRID_W + GUI_GRID_X;
			y = 4.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Player_Card_4: life_RscPicture
		{
			idc = 5997;
			text = "";

			x = 17.9 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Player_Card_5: life_RscPicture
		{
			idc = 5998;
			text = "";

			x = 21.1 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Winnings: Life_RscText
		{
			idc = 6001;

			x = 8.3 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 24.6 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class EXIT_BTN: Life_RscButtonMenu
		{
			idc = 6002;
			onButtonClick = "closeDialog 0;";

			text = "EXIT"; //--- ToDo: Localize;
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
		};
		class RscText_1015: Life_RscText
		{
			idc = 6003;

			text = "BET"; //--- ToDo: Localize;
			x = 5.1 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1016: Life_RscText
		{
			idc = 6004;

			text = "BET"; //--- ToDo: Localize;
			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1017: Life_RscText
		{
			idc = 6005;

			text = "BET"; //--- ToDo: Localize;
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscText_1018: Life_RscText
		{
			idc = 6006;

			text = "BET"; //--- ToDo: Localize;
			x = 18.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class YOUR_TOTAL: Life_RscText
		{
			idc = 6008;

			text = "0"; //--- ToDo: Localize;
			x = 29.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class RscText_1028: RscText
		{
			idc = 6009;

			text = "Dealer Total: "; //--- ToDo: Localize;
			x = 24.3 * GUI_GRID_W + GUI_GRID_X;
			y = 4.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.6 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class DEALER_TOTAL: Life_RscText
		{
			idc = 6010;
			text = "0"; //--- ToDo: Localize;
			x = 30 * GUI_GRID_W + GUI_GRID_X;
			y = 4.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class Dealer_Card_3: life_RscPicture
		{
			idc = 5995;
			text = "";

			x = 14.7 * GUI_GRID_W + GUI_GRID_X;
			y = 4.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
		};
		class BET_1M: Life_RscButtonMenu
		{
			idc = 6012;
			onButtonClick = "[1000000] spawn life_fnc_blackjackBet;";

			text = "1 MILLION"; //--- ToDo: Localize;
			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			tooltip = "High Rollers Only!"; //--- ToDo: Localize;
		};
		class RscText_1032: RscText
		{
			idc = 6006;

			text = "BET"; //--- ToDo: Localize;
			x = 30.37 * GUI_GRID_W + GUI_GRID_X;
			y = 17.95 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class D1: Life_RscText
		{
			idc = 1033;
			x = 8.9 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.8 * GUI_GRID_W;
			h = 1.9 * GUI_GRID_H;
		};
		class D2: Life_RscText
		{
			idc = 1034;
			x = 12.2 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.8 * GUI_GRID_W;
			h = 1.9 * GUI_GRID_H;
		};
		class D3: Life_RscText
		{
			idc = 1035;
			x = 15.4 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.8 * GUI_GRID_W;
			h = 1.9 * GUI_GRID_H;
		};
		class D4: Life_RscText
		{
			idc = 1036;
			x = 18.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.8 * GUI_GRID_W;
			h = 1.9 * GUI_GRID_H;
		};
		class D5: Life_RscText
		{
			idc = 1037;
			x = 21.7 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.8 * GUI_GRID_W;
			h = 1.9 * GUI_GRID_H;
		};
		class P1: Life_RscText
		{
			idc = 1038;
			x = 9 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.8 * GUI_GRID_W;
			h = 1.9 * GUI_GRID_H;
		};
		class P2: Life_RscText
		{
			idc = 1039;
			x = 12.2 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.8 * GUI_GRID_W;
			h = 1.9 * GUI_GRID_H;
		};
		class P3: Life_RscText
		{
			idc = 1040;
			x = 15.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.8 * GUI_GRID_W;
			h = 1.9 * GUI_GRID_H;
		};
		class P4: Life_RscText
		{
			idc = 1041;
			x = 18.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.8 * GUI_GRID_W;
			h = 1.9 * GUI_GRID_H;
		};
		class P5: Life_RscText
		{
			idc = 1042;
			x = 21.6 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.8 * GUI_GRID_W;
			h = 1.9 * GUI_GRID_H;
		};
	};
};