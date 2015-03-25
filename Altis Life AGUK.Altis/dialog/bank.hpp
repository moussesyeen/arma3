class Life_atm_management {
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			idc = -1;
			x = 0.35;
			y = 0.2;
			w = 0.3;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.35;
			y = 0.2 + (11 / 250);
			w = 0.3;
			h = 0.7 - (22 / 250);
		};
	};
	
	class controls {

		class CashTitle : Life_RscStructuredText
		{
			idc = 2701;
			text = "";
			
			x = 0.39;
			y = 0.26;
			w = 0.3;
			h = .14;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_ATM_Title";
			x = 0.35;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class k25Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "25k";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,0] spawn life_fnc_bankfast;";
			
			x = 0.36;
			y = 0.46;
			w = (2.6 / 40);
			h = (1 / 25);
		};
		
		class k100Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "100k";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,1] spawn life_fnc_bankfast;";
			
			x = 0.43;
			y = 0.46;
			w = (2.6 / 40);
			h = (1 / 25);
		};
		
		class k250Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "250k";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,2] spawn life_fnc_bankfast;";
			
			x = 0.51;
			y = 0.46;
			w = (2.6 / 40);
			h = (1 / 25);
		};
		
		class k500Button : life_RscButtonMenu 
		{
			idc = -1;
			text = "500k";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,3] spawn life_fnc_bankfast;";
			
			x = 0.58;
			y = 0.46;
			w = (2.6 / 40);
			h = (1 / 25);
		};
		
		class WithdrawButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_ATM_Withdraw";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_bankWithdraw";
			x = 0.36;
			y = 0.512;
			w = (5.4 / 40);
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class ResetButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_ATM_Reset";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,4] spawn life_fnc_bankfast;";
			x = 0.36;
			y = 0.56;
			w = 0.275;
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class DepositButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_ATM_Deposit";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_bankDeposit";
			x = 0.51;
			y = 0.5118;
			w = (5.38 / 40);
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class moneyEdit : Life_RscEdit {
		
		idc = 2702;
		
		text = "0";
		sizeEx = 0.030;
		x = 0.4; y = 0.41;
		w = 0.2; h = 0.03;
		
		};
		
		class PlayerList : Life_RscCombo 
		{
			idc = 2703;
			
			x = 0.4; y = 0.63;
			w = 0.2; h = 0.03;
		};
		
		class TransferButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_ATM_Transfer";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_bankTransfer";
			
			x = 0.432;
			y = 0.67;
			w = (5.30 / 40);
			h = (1 / 25);
		};
		
		class GangDeposit : TransferButton
		{
			idc = 2705;
			text = "$STR_pInAct_DepositToGang";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_gangDeposit";
			y = .72; x = 0.365;
			w = 0.275;
			class Attributes 
			{
				align = "center";
			};
		};
		
		class DepositallButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "Deposit Cash";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0,5] spawn life_fnc_bankfast;";
			x = 0.365;
			y = 0.77;
			w = 0.275;
			h = (1 / 25);
			class Attributes 
			{
				align = "center";
			};
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.35;
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};