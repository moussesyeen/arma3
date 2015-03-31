#define INFINITE 1e+1000
class playerHUD
{
    idd = -1;
    duration = INFINITE;
    movingEnable = 0;
    fadein = 0;
    fadeout = 0;
    name = "playerHUD";
    onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
    objects[] = {};
    controls[] = {
            LIFE_BAR_FOOD,
            LIFE_BAR_WATER,
            LIFE_BAR_HEALTH,
            LIFE_PICTURE_FOOD,
            LIFE_PICTURE_WATER,
            LIFE_PICTURE_HEALTH,
            LIFE_FOOD_TEXT,
            LIFE_WATER_TEXT,
            LIFE_HEALTH_TEXT,
            LIFE_BAR_WANTED,
            LIFE_PICTURE_WANTED,
            LIFE_WANTED_TEXT,
            LIFE_BAC_TEXT,
            LIFE_PICTURE_BAC,
            LIFE_BAR_BAC,
            LIFE_GSN_LOGO,
            LIFE_BAR_CLEAR
    };


    class LIFE_GSN_LOGO: life_RscPicture
    {
        idc = 2207;

        text = "textures\watermark.paa"; //--- ToDo: Localize;
        x = -8.01657e-005 * safezoneW + safezoneX;
        y = 0.9071 * safezoneH + safezoneY;
        w = 0.0579474 * safezoneW;
        h = 0.0970164 * safezoneH;
    };
    class LIFE_BAR_FOOD: Life_RscProgress
    {
        idc = 2200;
        colorBar[] = {0,0,0.6,0.2};

        x = 0.958836 * safezoneW + safezoneX;
        y = 0.86309 * safezoneH + safezoneY;
        w = 0.04187 * safezoneW;
        h = 0.0220054 * safezoneH;
    };
    class LIFE_BAR_WATER: Life_RscProgress
    {
        idc = 2201;
        colorBar[] = {0,0,0.6,0.2};

        x = 0.958836 * safezoneW + safezoneX;
        y = 0.885095 * safezoneH + safezoneY;
        w = 0.04187 * safezoneW;
        h = 0.0220054 * safezoneH;
    };
    class LIFE_BAR_HEALTH: Life_RscProgress
    {
        idc = 2202;
        colorBar[] = {0,0,0.6,0.2};

        x = 0.958836 * safezoneW + safezoneX;
        y = 0.9071 * safezoneH + safezoneY;
        w = 0.04187 * safezoneW;
        h = 0.0220054 * safezoneH;
    };
    class LIFE_BAR_BAC: Life_RscProgress
    {
        idc = 2205;
        colorBar[] = {0,0,0.6,0.2};

        x = 0.958836 * safezoneW + safezoneX;
        y = 0.929106 * safezoneH + safezoneY;
        w = 0.04187 * safezoneW;
        h = 0.0220054 * safezoneH;
    };
    class LIFE_BAR_WANTED: Life_RscProgress
    {
        idc = 2204;
        colorBar[] = {1,0,0,0.2};

        x = 0.958836 * safezoneW + safezoneX;
        y = 0.951111 * safezoneH + safezoneY;
        w = 0.04187 * safezoneW;
        h = 0.0220054 * safezoneH;
    };
    class LIFE_BAR_CLEAR: Life_RscProgress
    {
        idc = 2206;
        colorBar[] = {0,1,0,0.2};

        x = 0.958836 * safezoneW + safezoneX;
        y = 0.951111 * safezoneH + safezoneY;
        w = 0.04187 * safezoneW;
        h = 0.0220054 * safezoneH;
    };
    class LIFE_FOOD_TEXT: Life_RscText
    {
        idc = 1000;

        x = 0.969147 * safezoneW + safezoneX;
        y = 0.86309 * safezoneH + safezoneY;
        w = 0.0206225 * safezoneW;
        h = 0.0200049 * safezoneH;
    };
    class LIFE_WATER_TEXT: Life_RscText
    {
        idc = 1001;

        x = 0.969147 * safezoneW + safezoneX;
        y = 0.885095 * safezoneH + safezoneY;
        w = 0.0206225 * safezoneW;
        h = 0.0200049 * safezoneH;
    };
    class LIFE_HEALTH_TEXT: Life_RscText
    {
        idc = 1002;

        x = 0.969147 * safezoneW + safezoneX;
        y = 0.9071 * safezoneH + safezoneY;
        w = 0.0206225 * safezoneW;
        h = 0.0200049 * safezoneH;
    };
    class LIFE_BAC_TEXT: Life_RscText
    {
        idc = 1004;

        x = 0.969147 * safezoneW + safezoneX;
        y = 0.929106 * safezoneH + safezoneY;
        w = 0.0340267 * safezoneW;
        h = 0.0200049 * safezoneH;
    };
    class LIFE_WANTED_TEXT: Life_RscText
    {
        idc = 1003;

        x = 0.958836 * safezoneW + safezoneX;
        y = 0.951111 * safezoneH + safezoneY;
        w = 0.0381566 * safezoneW;
        h = 0.0200049 * safezoneH;
    };
    class LIFE_PICTURE_FOOD: life_RscPicture
    {
        idc = 1200;

        text = "icons\food.paa"; //--- ToDo: Localize;
        x = 0.94337 * safezoneW + safezoneX;
        y = 0.86309 * safezoneH + safezoneY;
        w = 0.0123731 * safezoneW;
        h = 0.0198049 * safezoneH;
    };
    class LIFE_PICTURE_WATER: life_RscPicture
    {
        idc = 1201;

        text = "icons\water.paa"; //--- ToDo: Localize;
        x = 0.94337 * safezoneW + safezoneX;
        y = 0.885095 * safezoneH + safezoneY;
        w = 0.0123731 * safezoneW;
        h = 0.0198049 * safezoneH;
    };
    class LIFE_PICTURE_HEALTH: life_RscPicture
    {
        idc = 1202;

        text = "icons\health.paa"; //--- ToDo: Localize;
        x = 0.94337 * safezoneW + safezoneX;
        y = 0.9071 * safezoneH + safezoneY;
        w = 0.0123731 * safezoneW;
        h = 0.0198049 * safezoneH;
    };
    class LIFE_PICTURE_BAC: life_RscPicture
    {
        idc = 1203;

        text = "icons\beer.jpg"; //--- ToDo: Localize;
        x = 0.94337 * safezoneW + safezoneX;
        y = 0.929106 * safezoneH + safezoneY;
        w = 0.0123731 * safezoneW;
        h = 0.0198049 * safezoneH;
    };
    class LIFE_PICTURE_WANTED: life_RscPicture
    {
        idc = 1203;

        text = "icons\wanted.paa"; //--- ToDo: Localize;
        x = 0.94337 * safezoneW + safezoneX;
        y = 0.951111 * safezoneH + safezoneY;
        w = 0.0123731 * safezoneW;
        h = 0.0198049 * safezoneH;
    };
};