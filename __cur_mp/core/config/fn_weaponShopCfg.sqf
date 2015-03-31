#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			default
			{
				["Altis Cop Shop",
					[
						["arifle_sdar_F","Taser Rifle",20000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["Rangefinder",nil,100],
						["acc_pointer_IR",nil,1000],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["NVGoggles_OPFOR",nil,2000],
						["NVGoggles_INDEP",nil,2000],
						["SmokeShellRed",nil,750],
						["SmokeShellGreen",nil,750],
						["SmokeShell",nil,750],
						["16Rnd_9x21_Mag","Tazer Pistol Magazine",50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125]
					]
				];
			};
		};
	};

	case "med_basic":
	{
		switch (true) do
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,25],
						["Rangefinder",nil,25],
						["ToolKit",nil,100],
						["FirstAidKit",nil,100],
						["Medikit",nil,200],
						["NVGoggles",nil,400],
						["NVGoggles_OPFOR",nil,400],
						["NVGoggles_INDEP",nil,400],
						["B_FieldPack_ocamo",nil,500],
						["b_bergen_blk",nil,700],
						["V_RebreatherB",nil,1000]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 1): {"You are not at cadet rank!"};
			default
			{
				["Altis Cadet Shop",
					[
						["arifle_MXC_Black_F",nil,35000],
						["arifle_MK20C_plain_F",nil,30000],
						["hgun_ACPC2_F",nil,6500],
						["acc_flashlight",nil,750],
						["optic_Holosight","Holosight",1200],
						["optic_Holosight_smg","Holosight SMG",1200],
						["optic_Arco",nil,2500],
						["optic_ACO_grn",nil,3500],
						["optic_hamr",nil,3500],
						["muzzle_snds_H",nil,3000],
						["SmokeShellRed",nil,750],
						["SmokeShellGreen",nil,750],
						["SmokeShell",nil,750],
						["11Rnd_45ACP_Mag",nil,75],
						["30Rnd_556x45_Stanag",nil,100],
						["30Rnd_65x39_caseless_mag",nil,130],
						["9Rnd_45ACP_Mag",nil,130,nil,300],
						["muzzle_snds_M",nil,150]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 3): {"You are not at a sergeant rank!"};
			default
			{
				["Altis Sergeant Officer Shop",
					[
						["hgun_Pistol_heavy_01_F",nil,6500],
						["hgun_ACPC2_F",nil,17500],
						["SMG_01_F",nil,19000],
						["arifle_MX_GL_Black_F","MX Black w/ EMP",40000],
						["arifle_MXC_Black_F","MXC Black",30000],
						["srifle_EBR_F","Mk18 7.62",100000],
						["optic_Arco",nil,2500],
						["optic_hamr",nil,3500],
						["muzzle_snds_H",nil,2750],
						["SmokeShellRed",nil,750],
						["SmokeShellGreen",nil,750],
						["SmokeShell",nil,750],
						["UGL_FlareCIR_F","EMP Round",2500],
						["20Rnd_762x51_Mag","Mk18 Mag",700],
						["30Rnd_65x39_caseless_mag","MX-MXC Mag",100],
						["30Rnd_9x21_Mag",nil,60],
						["30Rnd_45ACP_Mag_SMG_01",nil,85],
						["9Rnd_45ACP_Mag",nil,200],
						["muzzle_snds_B","7.62 Suppressor",3000],
						["muzzle_snds_acp",nil,1500]
					]
				];
			};
		};
	};

	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_SDAR_F",nil,20000],
						["arifle_Mk20_F",nil,25000],
						["arifle_MX_F",nil,30000],
						["srifle_DMR_01_F","Rahim 7.62",75000],
						["Rangefinder",nil,25],
						["optic_ACO_grn",nil,3500],
						["optic_Arco",nil,2500],
						["optic_Holosight","Holosight",1200],
						["optic_Holosight_smg","Holosight SMG",1200],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,400],
						["NVGoggles_OPFOR",nil,400],
						["NVGoggles_INDEP",nil,400],
						["acc_flashlight",nil,1000],
						["acc_pointer_IR",nil,2500],
						["optic_Hamr",nil,7500],
						["30Rnd_9x21_Mag",nil,200],
						["20Rnd_556x45_UW_mag","Underwater Mag",125],
						["30Rnd_556x45_Stanag",nil,300],
						["30Rnd_65x39_caseless_mag","MX Mag",275],
						["10Rnd_762x51_Mag","Rahim Mag",350],
						["muzzle_snds_acp",nil,1500]
					]
				];
			};
		};
	};

	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};

	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,9500],
						["optic_ACO_grn_smg",nil,950],
						["optic_hamr",nil,3500],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};

	case "genstore":
	{
		["Altis General Store",
			[
				["Rangefinder",nil,250],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["NVGoggles_OPFOR",nil,2000],
				["NVGoggles_INDEP",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300],
				["SmokeShellRed",nil,750],
				["SmokeShellGreen",nil,750],
				["SmokeShell",nil,750]
			]
		];
	};

	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"You are not a donator!"};
			case (__GETC__(life_donator) == 1):
			{
				["STS Donator Shop Tier 1",
					[
						["hgun_Rook40_F",nil,750],
						["hgun_PDW2000_F",nil,6500],
						["SMG_02_F",nil,8500],
						["optic_ACO_grn_smg",nil,750],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["Rangefinder",nil,20],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["SmokeShellRed",nil,750],
						["SmokeShellGreen",nil,750],
						["SmokeShell",nil,750]
					]
				];
			};

			case (__GETC__(life_donator) == 2):
			{
				["STS Donator Shop Tier 2",
					[
						["hgun_Rook40_F",nil,750],
						["hgun_PDW2000_F",nil,6500],
						["SMG_02_F",nil,8500],
						["arifle_TRG20_F",nil,25000],
						["optic_ACO_grn_smg",nil,750],
						["Rangefinder",nil,20],
						["NVGoggles",nil,350],
						["NVGoggles_OPFOR",nil,350],
						["NVGoggles_INDEP",nil,350],
						["acc_pointer_IR",nil,1250],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["30Rnd_556x45_Stanag",nil,125],
						["SmokeShellRed",nil,750],
						["SmokeShellGreen",nil,750],
						["SmokeShell",nil,750]
					]
				];
			};

			case (__GETC__(life_donator) >= 3):
			{
				["STS Donator Shop Tier 3",
					[
						["hgun_Rook40_F",nil,500],
						["hgun_PDW2000_F",nil,6500],
						["hgun_pistol_heavy_01_F",nil,5850],
						["SMG_02_F",nil,8500],
						["arifle_TRG20_F",nil,25000],
						["optic_ACO_grn_smg",nil,750],
						["optic_MRCO",nil,10000],
						["Rangefinder",nil,20],
						["NVGoggles",nil,350],
						["NVGoggles_OPFOR",nil,350],
						["NVGoggles_INDEP",nil,350],
						["acc_pointer_IR",nil,1000],
						["ToolKit",nil,50],
						["itemgps",nil,50],
						["FirstAidKit",nil,25],
						["16Rnd_9x21_Mag",nil,25],
						["30Rnd_9x21_Mag",nil,75],
						["11Rnd_45ACP_Mag",nil,85],
						["30Rnd_556x45_Stanag",nil,125],
						["SmokeShellRed",nil,750],
						["SmokeShellGreen",nil,750],
						["SmokeShell",nil,750]
					]
				];
			};
		};
	};
};