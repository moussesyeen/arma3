#define INFINITE 1e+1000

class osefStatusBar
{
    idd = -1;
    duration = INFINITE;
    movingEnable = 0;
    fadein = 0;
    fadeout = 0;
    name = "statusBar";
	onLoad = "uiNamespace setVariable ['osefStatusBar', _this select 0]";
	onUnload = "uiNamespace setVariable ['osefStatusBar', objNull]";
	onDestroy = "uiNamespace setVariable ['osefStatusBar', objNull]";
    objects[] = {};
    controls[] = {
            statusBarText
    };

	class statusBarText: Life_RscText
	{
		idc = 1000;
		x = safezoneX + safezoneW - 1.20;
		y = safezoneY + safezoneH - 0.04;
		w = 1.2;
		h = 0.04;
		shadow = 2;
		colorBackground[] = { 0, 0, 0, 0.8 };  // uncomment and increase 4th number to have a background
		font = "puristaLight";
		size = 0.03;
		type = 13;
		style = 1;
		text="Loading server info...";
		class Attributes {
			align="left";
			color = "#FF8700";
		};
	};
};