#include <macro.h>
#define IDC_LIFE_BAR_FOOD 2200
#define IDC_LIFE_BAR_WATER 2201
#define IDC_LIFE_BAR_HEALTH 2202
#define IDC_LIFE_MAIN_DISP 2203
#define IDC_LIFE_BAR_WANTED 2204
#define IDC_LIFE_BAR_BAC 2205
#define IDC_LIFE_BAR_CLEAR 2206
#define IDC_LIFE_PICTURE_FOOD 1200
#define IDC_LIFE_PICTURE_WATER 1201
#define IDC_LIFE_PICTURE_HEALTH 1202
#define IDC_LIFE_PICTURE_WANTED 1203
#define IDC_LIFE_PICTURE_BAC 1204
#define IDC_LIFE_FOOD_TEXT 1000
#define IDC_LIFE_WATER_TEXT 1001
#define IDC_LIFE_HEALTH_TEXT 1002
#define IDC_LIFE_WANTED_TEXT 1003
#define IDC_LIFE_BAC_TEXT 1004

#define LIFEdisplay (GVAR_UINS  ["playerHUD",displayNull])
#define LIFEctrl(ctrl) ((GVAR_UINS ["playerHUD",displayNull]) displayCtrl ctrl)
/*
	File: fn_hudUpdate.sqf
	Author: Dillon "Itsyuka" Modine-Thuen

	Description:
	Updates the HUD when it needs to.
*/
disableSerialization;

if(isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};
if(gsn_life_hunger > 0) then
{
	LIFEctrl(IDC_LIFE_BAR_FOOD) progressSetPosition (1 / (100 / gsn_life_hunger));
}
else
{
	LIFEctrl(IDC_LIFE_BAR_FOOD) progressSetPosition 0;
};
if(gsn_life_thirst > 0) then
{
	LIFEctrl(IDC_LIFE_BAR_WATER) progressSetPosition (1 / (100 / gsn_life_thirst));
}
else
{
	LIFEctrl(IDC_LIFE_BAR_WATER) progressSetPosition 0;
};

LIFEctrl(IDC_LIFE_BAR_HEALTH) progressSetPosition (1 - (damage player));
LIFEctrl(IDC_LIFE_BAR_BAC) progressSetPosition (life_bac);
if(playerSide == civilian) then
{
	if(gsn_wanted_status > 0) then
	{
		LIFEctrl(IDC_LIFE_BAR_WANTED) progressSetPosition (100);
		LIFEctrl(IDC_LIFE_BAR_CLEAR) progressSetPosition (0);
		LIFEctrl(IDC_LIFE_WANTED_TEXT) ctrlSetText format["$%1", ([gsn_wanted_status] call life_fnc_numberText)];
	}
	else
	{
		LIFEctrl(IDC_LIFE_BAR_WANTED) progressSetPosition (0);
		LIFEctrl(IDC_LIFE_BAR_CLEAR) progressSetPosition (100);
		LIFEctrl(IDC_LIFE_WANTED_TEXT) ctrlSetText format["$%1", "0"];
	};
}
else
{
	LIFEctrl(IDC_LIFE_BAR_WANTED) ctrlShow false;
	LIFEctrl(IDC_LIFE_BAR_CLEAR) ctrlShow false;
	LIFEctrl(IDC_LIFE_WANTED_TEXT) ctrlShow false;
	LIFEctrl(IDC_LIFE_PICTURE_WANTED) ctrlShow false;
};

LIFEctrl(IDC_LIFE_FOOD_TEXT) ctrlsetText format["%1", gsn_life_hunger];
LIFEctrl(IDC_LIFE_WATER_TEXT) ctrlsetText format["%1", gsn_life_thirst];
LIFEctrl(IDC_LIFE_HEALTH_TEXT) ctrlsetText format["%1", round((1 - (damage player)) * 100)];
LIFEctrl(IDC_LIFE_BAC_TEXT) ctrlsetText format["%1%2", round((life_bac) * 100),"%"];
