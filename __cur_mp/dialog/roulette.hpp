class gsn_roulette_table {
	idd = 2505;
	name= "gsn_roulette_table";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_rouletteLoad";

	class controlsBackground {
		class MainBackground: Life_RscText
		{
			idc = 2200;

			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 38.8 * GUI_GRID_W;
			h = 21.9 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.8};
		};
	};

	class controls {
		class 3: life_RscPicture
		{
			idc = 1200;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 35.3 * GUI_GRID_W + GUI_GRID_X;
			y = 1.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 6: life_RscPicture
		{
			idc = 1201;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 35.3 * GUI_GRID_W + GUI_GRID_X;
			y = 2.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 9: life_RscPicture
		{
			idc = 1202;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 35.3 * GUI_GRID_W + GUI_GRID_X;
			y = 4.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 30: life_RscPicture
		{
			idc = 1203;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 35.3 * GUI_GRID_W + GUI_GRID_X;
			y = 14.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 27: life_RscPicture
		{
			idc = 1204;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 35.3 * GUI_GRID_W + GUI_GRID_X;
			y = 13.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 24: life_RscPicture
		{
			idc = 1205;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 35.3 * GUI_GRID_W + GUI_GRID_X;
			y = 11.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 36: life_RscPicture
		{
			idc = 1207;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 35.3 * GUI_GRID_W + GUI_GRID_X;
			y = 17.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 33: life_RscPicture
		{
			idc = 1208;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 35.3 * GUI_GRID_W + GUI_GRID_X;
			y = 16.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 2: life_RscPicture
		{
			idc = 1209;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 31.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 5: life_RscPicture
		{
			idc = 1210;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 31.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 8: life_RscPicture
		{
			idc = 1211;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 31.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 23: life_RscPicture
		{
			idc = 1212;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 31.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 17: life_RscPicture
		{
			idc = 1213;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 31.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 29: life_RscPicture
		{
			idc = 1214;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 31.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 11: life_RscPicture
		{
			idc = 1215;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 31.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 15: life_RscPicture
		{
			idc = 1216;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 35.3 * GUI_GRID_W + GUI_GRID_X;
			y = 7.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 12: life_RscPicture
		{
			idc = 1217;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 35.3 * GUI_GRID_W + GUI_GRID_X;
			y = 5.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 18: life_RscPicture
		{
			idc = 1218;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 35.3 * GUI_GRID_W + GUI_GRID_X;
			y = 8.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 21: life_RscPicture
		{
			idc = 1219;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 35.3 * GUI_GRID_W + GUI_GRID_X;
			y = 10.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 26: life_RscPicture
		{
			idc = 1220;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 31.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 35: life_RscPicture
		{
			idc = 1221;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 31.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 32: life_RscPicture
		{
			idc = 1222;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 31.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 1: life_RscPicture
		{
			idc = 1224;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 14: life_RscPicture
		{
			idc = 1225;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 31.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 20: life_RscPicture
		{
			idc = 1226;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 31.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 7: life_RscPicture
		{
			idc = 1227;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 4: life_RscPicture
		{
			idc = 1228;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 10: life_RscPicture
		{
			idc = 1229;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 13: life_RscPicture
		{
			idc = 1230;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 16: life_RscPicture
		{
			idc = 1231;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 22: life_RscPicture
		{
			idc = 1232;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 19: life_RscPicture
		{
			idc = 1233;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 25: life_RscPicture
		{
			idc = 1234;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 28: life_RscPicture
		{
			idc = 1235;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 34: life_RscPicture
		{
			idc = 1236;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 31: life_RscPicture
		{
			idc = 1237;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class column1: life_RscPicture
		{
			idc = 1238;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 1_12: life_RscPicture
		{
			idc = 1239;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 23.5 * GUI_GRID_W + GUI_GRID_X;
			y = 3.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 13_24: life_RscPicture
		{
			idc = 1240;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 23.8 * GUI_GRID_W + GUI_GRID_X;
			y = 9.6 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 25_36: life_RscPicture
		{
			idc = 1241;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 23.8 * GUI_GRID_W + GUI_GRID_X;
			y = 15.6 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 1_18: life_RscPicture
		{
			idc = 1242;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 19.4 * GUI_GRID_W + GUI_GRID_X;
			y = 2.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class even: life_RscPicture
		{
			idc = 1243;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 19.4 * GUI_GRID_W + GUI_GRID_X;
			y = 5.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class red: life_RscPicture
		{
			idc = 1244;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 19.4 * GUI_GRID_W + GUI_GRID_X;
			y = 8.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class black: life_RscPicture
		{
			idc = 1245;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 19.4 * GUI_GRID_W + GUI_GRID_X;
			y = 11.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class odd: life_RscPicture
		{
			idc = 1246;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 19.4 * GUI_GRID_W + GUI_GRID_X;
			y = 14.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class 19_36: life_RscPicture
		{
			idc = 1247;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 19.4 * GUI_GRID_W + GUI_GRID_X;
			y = 17.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.74848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
		class wheel: life_RscPicture
		{
			idc = 1248;

			text = "#(argb,8,8,3)color(0,0,0,1)"; //--- ToDo: Localize;
			x = 3.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 8.1 * GUI_GRID_H;
		};
		class 1000: Life_RscButtonMenu
		{
			idc = 1601;

			text = "10000"; //--- ToDo: Localize;
			onButtonClick = "gsn_current_bet = 10000;";
			x = 1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.2 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class 25000: Life_RscButtonMenu
		{
			idc = 1602;
			onButtonClick = "gsn_current_bet = 25000;";

			text = "25000"; //--- ToDo: Localize;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.2 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class 50000: Life_RscButtonMenu
		{
			idc = 1603;
			onButtonClick = "gsn_current_bet = 50000;";

			text = "50000"; //--- ToDo: Localize;
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.2 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class voteodd: Life_RscButtonMenu
		{
			idc = 9090;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[46, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[46, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 21.3 * GUI_GRID_W + GUI_GRID_X;
			y = 14.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class CloseButtonKey: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = 1046;

			text = "Close"; //--- ToDo: Localize;
			x = 33 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.25 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class vote19_36: Life_RscButtonMenu
		{
			idc = 1057;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[44, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[44, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 21.3 * GUI_GRID_W + GUI_GRID_X;
			y = 17.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class voteblack: Life_RscButtonMenu
		{
			idc = 1058;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[48, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[48, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 21.28 * GUI_GRID_W + GUI_GRID_X;
			y = 11.85 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class votered: Life_RscButtonMenu
		{
			idc = 1059;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[47, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[47, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 21.22 * GUI_GRID_W + GUI_GRID_X;
			y = 8.92 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class voteeven: Life_RscButtonMenu
		{
			idc = 1060;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[45, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[45, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 21.3 * GUI_GRID_W + GUI_GRID_X;
			y = 5.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote1_18: Life_RscButtonMenu
		{
			idc = 1061;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[43, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[43, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 21.2 * GUI_GRID_W + GUI_GRID_X;
			y = 2.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote1_12: Life_RscButtonMenu
		{
			idc = 1062;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[40, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[40, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 25.3 * GUI_GRID_W + GUI_GRID_X;
			y = 3.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote13_24: Life_RscButtonMenu
		{
			idc = 1063;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[41, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[41, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 25.6 * GUI_GRID_W + GUI_GRID_X;
			y = 9.6 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote25_36: Life_RscButtonMenu
		{
			idc = 1064;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[42, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[42, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 25.64 * GUI_GRID_W + GUI_GRID_X;
			y = 15.63 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote1: Life_RscButtonMenu
		{
			idc = 1065;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[1, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[1, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 29.3 * GUI_GRID_W + GUI_GRID_X;
			y = 1.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote4: Life_RscButtonMenu
		{
			idc = 1066;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[4, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[4, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 29.32 * GUI_GRID_W + GUI_GRID_X;
			y = 2.81 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote7: Life_RscButtonMenu
		{
			idc = 1067;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[7, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[7, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 29.3 * GUI_GRID_W + GUI_GRID_X;
			y = 4.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote10: Life_RscButtonMenu
		{
			idc = 1068;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[10, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[10, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 29.3 * GUI_GRID_W + GUI_GRID_X;
			y = 5.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote13: Life_RscButtonMenu
		{
			idc = 1069;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[13, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[13, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 29.3 * GUI_GRID_W + GUI_GRID_X;
			y = 7.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote16: Life_RscButtonMenu
		{
			idc = 1070;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[16, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[16, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 29.3 * GUI_GRID_W + GUI_GRID_X;
			y = 8.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote19: Life_RscButtonMenu
		{
			idc = 1071;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[19, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[19, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 29.3 * GUI_GRID_W + GUI_GRID_X;
			y = 10.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote22: Life_RscButtonMenu
		{
			idc = 1072;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[22, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[22, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 29.3 * GUI_GRID_W + GUI_GRID_X;
			y = 11.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote25: Life_RscButtonMenu
		{
			idc = 1073;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[25, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[25, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 29.3 * GUI_GRID_W + GUI_GRID_X;
			y = 13.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote31: Life_RscButtonMenu
		{
			idc = 1074;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[31, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[31, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 29.3 * GUI_GRID_W + GUI_GRID_X;
			y = 16.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote28: Life_RscButtonMenu
		{
			idc = 1075;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[28, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[28, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 29.3 * GUI_GRID_W + GUI_GRID_X;
			y = 14.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote34: Life_RscButtonMenu
		{
			idc = 1076;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[34, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[34, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 29.3 * GUI_GRID_W + GUI_GRID_X;
			y = 17.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class votecolumn1: Life_RscButtonMenu
		{
			idc = 1077;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[37, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[37, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 28.6 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote2: Life_RscButtonMenu
		{
			idc = 1078;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[2, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[2, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 33.3 * GUI_GRID_W + GUI_GRID_X;
			y = 1.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote5: Life_RscButtonMenu
		{
			idc = 1079;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[5, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[5, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 33.3 * GUI_GRID_W + GUI_GRID_X;
			y = 2.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote8: Life_RscButtonMenu
		{
			idc = 1080;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[8, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[8, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 33.3 * GUI_GRID_W + GUI_GRID_X;
			y = 4.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote11: Life_RscButtonMenu
		{
			idc = 1081;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[11, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[11, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 33.3 * GUI_GRID_W + GUI_GRID_X;
			y = 5.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote14: Life_RscButtonMenu
		{
			idc = 1082;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[14, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[14, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 33.3 * GUI_GRID_W + GUI_GRID_X;
			y = 7.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote17: Life_RscButtonMenu
		{
			idc = 1083;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[17, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[17, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 33.3 * GUI_GRID_W + GUI_GRID_X;
			y = 8.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote20: Life_RscButtonMenu
		{
			idc = 1084;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[20, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[20, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 33.3 * GUI_GRID_W + GUI_GRID_X;
			y = 10.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote23: Life_RscButtonMenu
		{
			idc = 1085;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[23, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[23, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 33.3 * GUI_GRID_W + GUI_GRID_X;
			y = 11.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote26: Life_RscButtonMenu
		{
			idc = 1086;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[26, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[26, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 33.3 * GUI_GRID_W + GUI_GRID_X;
			y = 13.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote29: Life_RscButtonMenu
		{
			idc = 1087;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[29, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[29, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 33.3 * GUI_GRID_W + GUI_GRID_X;
			y = 14.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote32: Life_RscButtonMenu
		{
			idc = 1088;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[32, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[32, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 33.3 * GUI_GRID_W + GUI_GRID_X;
			y = 16.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote35: Life_RscButtonMenu
		{
			idc = 1089;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[35, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[35, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 33.3 * GUI_GRID_W + GUI_GRID_X;
			y = 17.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class votecolumn2: Life_RscButtonMenu
		{
			idc = 9090;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[38, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[38, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 32.4 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class votecolumn3: Life_RscButtonMenu
		{
			idc = 1091;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[39, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[39, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 36.2 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote36: Life_RscButtonMenu
		{
			idc = 1092;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[36, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[36, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 37.1 * GUI_GRID_W + GUI_GRID_X;
			y = 17.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote33: Life_RscButtonMenu
		{
			idc = 1093;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[33, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[33, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 37.1 * GUI_GRID_W + GUI_GRID_X;
			y = 16.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote30: Life_RscButtonMenu
		{
			idc = 1094;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[31, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[31, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 37.1 * GUI_GRID_W + GUI_GRID_X;
			y = 14.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote27: Life_RscButtonMenu
		{
			idc = 1095;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[27, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[27, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 37.1 * GUI_GRID_W + GUI_GRID_X;
			y = 13.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote24: Life_RscButtonMenu
		{
			idc = 1096;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[24, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[24, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 37.1 * GUI_GRID_W + GUI_GRID_X;
			y = 11.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote21: Life_RscButtonMenu
		{
			idc = 1097;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[21, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[21, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 37.1 * GUI_GRID_W + GUI_GRID_X;
			y = 10.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote18: Life_RscButtonMenu
		{
			idc = 1098;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[18, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[18, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 37.1 * GUI_GRID_W + GUI_GRID_X;
			y = 8.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote15: Life_RscButtonMenu
		{
			idc = 1099;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[15, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[15, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 37.1 * GUI_GRID_W + GUI_GRID_X;
			y = 7.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote12: Life_RscButtonMenu
		{
			idc = 1008;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[12, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[12, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 37.1 * GUI_GRID_W + GUI_GRID_X;
			y = 5.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote9: Life_RscButtonMenu
		{
			idc = 1025;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[9, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[9, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 37.1 * GUI_GRID_W + GUI_GRID_X;
			y = 4.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote6: Life_RscButtonMenu
		{
			idc = 1001;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[6, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[6, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 37.1 * GUI_GRID_W + GUI_GRID_X;
			y = 2.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class vote3: Life_RscButtonMenu
		{
			idc = 1051;
			onButtonClick = "if (ctrlText (_this select 0) == ""X"") then {(_this select 0) ctrlSetText ""√"";[3, 1] call life_fnc_rouletteBet;}else{(_this select 0) ctrlSetText ""X"";[3, 0] call life_fnc_rouletteBet;};";

			text = "X"; //--- ToDo: Localize;
			x = 37.1 * GUI_GRID_W + GUI_GRID_X;
			y = 1.3 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.34848 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class spin: Life_RscButtonMenu
		{
			idc = 1600;
			onButtonClick = "[] spawn life_fnc_rouletteSpin;";

			text = "Spin!"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.7 * GUI_GRID_W;
			h = 1.1 * GUI_GRID_H;
		};
	};
};