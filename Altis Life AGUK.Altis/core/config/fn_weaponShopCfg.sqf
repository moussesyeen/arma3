#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles_OPFOR",nil,1200],
						["B_Carryall_mcamo",nil,3000]
					]
				];
			};
		};
	};
	
	case "cop_equipment":
	{
		switch(true) do
		{
			case (playerside !=west):{"You are not a cop"};
			case (FETCH_CONST(life_coplevel) > 0):
			{
				["Equipment",
					[
						["Binocular","Binocular",0],
						["Rangefinder","RangeFinder",0],
						["ItemGPS",nil,0],
						["ToolKit",nil,0],
						["FirstAidKit",nil,0],
						["Medikit",nil,0],
						["NVGoggles",nil,0],
						["NVGoggles_OPFOR",nil,0],
						["Chemlight_red",nil,0],
						["Chemlight_yellow",nil,0],
						["Chemlight_blue",nil,0]
					]
				];
			};
		};
	
	};
	
	case "cop_basic":	
        {
                switch(true) do
                {
                        case (playerSide != west): {"You are not a Police Officer!"};
                        case (FETCH_CONST(life_coplevel) == 1): //PSCO
                        {
                                ["PCSO Store",
                                        [
                                            ["hgun_P07_snds_F","Taser",0], //PISTOLTASER
                                            ["16Rnd_9x21_Mag",nil,0], //PISTOLAMMOAMMO
											//Items
											["Binocular",nil,150],
											["Rangefinder","RangeFinder",500],
											["ItemGPS",nil,100],
											["ToolKit",nil,250],
											["FirstAidKit",nil,150],
											["Medikit",nil,200],
											["NVGoggles_OPFOR",nil,2000],
											["Chemlight_red",nil,300],
											["Chemlight_yellow",nil,300],
											["Chemlight_blue",nil,300]
                                        ]
                                ];
                        };
                        case (FETCH_CONST(life_coplevel) == 2): //PC
                        {
                                ["PC Store",
                                        [
                                                ["hgun_P07_snds_F","Taser",0], //PISTOLTASER
                                                ["16Rnd_9x21_Mag",nil,0], //PISTOLAMMO
												["SMG_02_F",nil,0], //STING9mm
												["30Rnd_9x21_Mag",nil,0], //STINGAMMO
												["SMG_01_F",nil,0], //vermin
												["30Rnd_45ACP_Mag_SMG_01",nil,0], //verminammo
												["arifle_Mk20_plain_F",nil,0], //rubber gun
												["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
												["optic_Holosight",nil,0], //holosight	
												["optic_ACO_grn",nil,0], //ACO
												["I_IR_Grenade",nil,0],
//Items
											["Binocular",nil,150],
											["Rangefinder","RangeFinder",500],
											["ItemGPS",nil,100],
											["ToolKit",nil,250],
											["FirstAidKit",nil,150],
											["MedKit",nil,200],
											["NVGoggles_OPFOR",nil,2000],
											["Chemlight_red",nil,300],
											["Chemlight_yellow",nil,300],
											["Chemlight_blue",nil,300]												
                                        ]
                                ];
                        };
                        case (FETCH_CONST(life_coplevel) == 3): //SPC
                        {
                          ["SPC Store",
                                        [
												["hgun_P07_snds_F","Taser",0], //PISTOLTASER
												["16Rnd_9x21_Mag",nil,0], //PISTOLAMMO
												["SMG_02_F",nil,0], //STING9mm
												["30Rnd_9x21_Mag",nil,0], //STINGAMMO
												["SMG_01_F",nil,0], //vermin
												["30Rnd_45ACP_Mag_SMG_01",nil,0], //verminammo
												["arifle_Mk20_plain_F",nil,0], //rubber gun
												["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
												["arifle_MXC_Black_F",nil,67500], //MXC
												["30Rnd_65x39_caseless_mag",nil,0], //MXAMMO
												["muzzle_snds_H",nil,42000],
												["optic_Holosight",nil,0], //holosight	
												["optic_ACO_grn",nil,0],
												["optic_Hamr",nil,0], //RCO
												["acc_flashlight",nil,0], //FLASHLIGHT
												["acc_pointer_IR",nil,0], //POINTER
												["I_IR_Grenade",nil,0],
												//Items
											["Binocular",nil,150],
											["Rangefinder","RangeFinder",500],
											["ItemGPS",nil,100],
											["ToolKit",nil,250],
											["FirstAidKit",nil,150],
											["Medikit",nil,0],
											["NVGoggles_OPFOR",nil,2000],
											["Chemlight_red",nil,300],
											["Chemlight_yellow",nil,300],
											["Chemlight_blue",nil,300]
                                        ]
                                ];
                        };
                        case (FETCH_CONST(life_coplevel) == 4): //SGT
                        {
                          ["SGT Store",
                                        [
                                                ["hgun_P07_snds_F","Taser",0], //PISTOLTASER
												["16Rnd_9x21_Mag",nil,0], //PISTOLAMMO
												["SMG_02_F",nil,0], //STING9mm
												["30Rnd_9x21_Mag",nil,0], //STINGAMMO
												["SMG_01_F",nil,0], //vermin
												["30Rnd_45ACP_Mag_SMG_01",nil,0], //verminammo
												["arifle_Mk20_plain_F",nil,0], //rubber gun
												["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
												["arifle_TRG20_F",nil,17500], //TRG
												["30Rnd_556x45_Stanag",nil,0], //TRGAMMO
												["arifle_MXC_Black_F",nil,67500], //MXC
												["arifle_MX_Black_F",nil,54000], //MX
												["30Rnd_65x39_caseless_mag",nil,0], //MXAMMO
												["muzzle_snds_H",nil,42000],
												["optic_Holosight",nil,0], //holosight	
												["optic_ACO_grn",nil,0],
												["optic_Hamr",nil,0], //RCO
												["optic_Arco",nil,0],
												["acc_flashlight",nil,0], //FLASHLIGHT
												["acc_pointer_IR",nil,0], //POINTER
												["I_IR_Grenade",nil,0],
												//Items
											["Binocular",nil,150],
											["Rangefinder","RangeFinder",500],
											["ItemGPS",nil,100],
											["ToolKit",nil,250],
											["FirstAidKit",nil,150],
											["MedKit",nil,200],
											["NVGoggles_OPFOR",nil,2000],
											["Chemlight_red",nil,300],
											["Chemlight_yellow",nil,300],
											["Chemlight_blue",nil,300]
                                        ]
                                ];
                        };
                        case (FETCH_CONST(life_coplevel) == 5): //Insp
                        {
                                ["Inspector Store",
                                        [
                                                ["hgun_P07_snds_F","Taser",0], //PISTOLTASER
												["16Rnd_9x21_Mag",nil,0], //PISTOLAMMO
												["SMG_02_F",nil,0], //STING9mm
												["30Rnd_9x21_Mag",nil,0], //STINGAMMO
												["SMG_01_F",nil,0], //vermin
												["30Rnd_45ACP_Mag_SMG_01",nil,0], //verminammo
												["arifle_Mk20_plain_F",nil,0], //rubber gun
												["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
												["arifle_TRG20_F",nil,17500], //TRG
												["30Rnd_556x45_Stanag",nil,0], //TRGAMMO
												["arifle_MXC_Black_F",nil,67500], //MXC
												["arifle_MX_Black_F",nil,54000], //MX
												["arifle_MXM_Black_F",nil,85000],
												["30Rnd_65x39_caseless_mag",nil,0], //MXAMMO
												["muzzle_snds_H",nil,42000],
												["optic_Holosight",nil,0], //holosight	
												["optic_ACO_grn",nil,0],
												["optic_Hamr",nil,0], //RCO
												["optic_Arco",nil,0],
												["optic_DMS",nil,0],
												["acc_flashlight",nil,0], //FLASHLIGHT
												["acc_pointer_IR",nil,0], //POINTER
												["I_IR_Grenade",nil,0],
												//Items
											["Binocular",nil,150],
											["Rangefinder","RangeFinder",500],
											["ItemGPS",nil,100],
											["ToolKit",nil,250],
											["FirstAidKit",nil,150],
											["MediKit",nil,0],
											["NVGoggles_OPFOR",nil,2000],
											["Chemlight_red",nil,300],
											["Chemlight_yellow",nil,300],
											["Chemlight_blue",nil,300]
                                        ]
                                ];
                        };
                        case (FETCH_CONST(life_coplevel) == 6): //CSuper
                        {
                                ["Chief Superintendent",
                                        [
                                                ["hgun_P07_snds_F","Taser",0], //PISTOLTASER
												["16Rnd_9x21_Mag",nil,0], //PISTOLAMMO
												["SMG_02_F",nil,0], //STING9mm
												["30Rnd_9x21_Mag",nil,0], //STINGAMMO
												["SMG_01_F",nil,0], //vermin
												["30Rnd_45ACP_Mag_SMG_01",nil,0], //verminammo
												["arifle_Mk20_plain_F",nil,0], //rubber gun
												["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
												["arifle_TRG20_F",nil,17500], //TRG
												["30Rnd_556x45_Stanag",nil,0], //TRGAMMO
												["arifle_MXC_Black_F",nil,67500], //MXC
												["arifle_MX_Black_F",nil,54000], //MX
												["arifle_MX_SW_Black_F",nil,78000],
												["arifle_MXM_Black_F",nil,85000],
												["30Rnd_65x39_caseless_mag",nil,0], //MXAMMO
												["100Rnd_65x39_caseless_mag_Tracer",nil,0],
												["muzzle_snds_H",nil,42000],
												["optic_Holosight",nil,0], //holosight
												["optic_ACO_grn",nil,0],
												["optic_Hamr",nil,0], //RCO
												["optic_Arco",nil,0],
												["optic_DMS",nil,0],
												["acc_flashlight",nil,0], //FLASHLIGHT
												["acc_pointer_IR",nil,0], //POINTER
												["I_IR_Grenade",nil,0],
												//Items
											["Binocular",nil,150],
											["Rangefinder","RangeFinder",500],
											["ItemGPS",nil,100],
											["ToolKit",nil,250],
											["FirstAidKit",nil,150],
											["Medikit",nil,200],
											["NVGoggles_OPFOR",nil,2000],
											["Chemlight_red",nil,300],
											["Chemlight_yellow",nil,300],
											["Chemlight_blue",nil,300]
                                        ]
                                ];
                        };
                        case (FETCH_CONST(life_coplevel) == 7): //Supt
                        {
                                ["Superintendent",
                                        [
                                                ["hgun_P07_snds_F","Taser",0], //PISTOLTASER
												["16Rnd_9x21_Mag",nil,0], //PISTOLAMMO
												["SMG_02_F",nil,0], //STING9mm
												["30Rnd_9x21_Mag",nil,0], //STINGAMMO
												["SMG_01_F",nil,0], //vermin
												["30Rnd_45ACP_Mag_SMG_01",nil,0], //verminammo
												["arifle_Mk20_plain_F",nil,0], //rubber gun
												["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
												["arifle_TRG20_F",nil,17500], //TRG
												["30Rnd_556x45_Stanag",nil,0], //TRGAMMO
												["arifle_MXC_Black_F",nil,67500], //MXC
												["arifle_MX_Black_F",nil,54000], //MX
												["arifle_MX_SW_Black_F",nil,78000],
												["arifle_MXM_Black_F",nil,85000],
												["30Rnd_65x39_caseless_mag",nil,0], //MXAMMO
												["100Rnd_65x39_caseless_mag_Tracer",nil,0],
												["srifle_EBR_F",nil,80500],
												["20Rnd_762x51_Mag",nil,0], //18ammo
												["muzzle_snds_H",nil,42000],
												["muzzle_snds_B",nil,0],
												["optic_Holosight",nil,0], //holosight	
												["optic_ACO_grn",nil,0],
												["optic_Hamr",nil,0], //RCO
												["optic_Arco",nil,0],
												["optic_DMS",nil,0],
												["acc_flashlight",nil,0], //FLASHLIGHT
												["acc_pointer_IR",nil,0], //POINTER
												["I_IR_Grenade",nil,0],
												//Items
											["Binocular",nil,150],
											["Rangefinder","RangeFinder",500],
											["ItemGPS",nil,100],
											["ToolKit",nil,250],
											["FirstAidKit",nil,150],
											["Medikit",nil,0],
											["NVGoggles_OPFOR",nil,2000],
											["Chemlight_red",nil,300],
											["Chemlight_yellow",nil,300],
											["Chemlight_blue",nil,300]
                                        ]
                                ];
                        };
						case (FETCH_CONST(life_coplevel) == 8): //Csup
                        {
                                ["Chief Superintendent",
                                        [
                                                ["hgun_P07_snds_F","Taser",0], //PISTOLTASER
												["16Rnd_9x21_Mag",nil,0], //PISTOLAMMO
												["SMG_02_F",nil,0], //STING9mm
												["30Rnd_9x21_Mag",nil,0], //STINGAMMO
												["SMG_01_F",nil,0], //vermin
												["30Rnd_45ACP_Mag_SMG_01",nil,0], //verminammo
												["arifle_Mk20_plain_F",nil,0], //rubber gun
												["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
												["arifle_TRG20_F",nil,17500], //TRG
												["30Rnd_556x45_Stanag",nil,0], //TRGAMMO
												["arifle_MXC_Black_F",nil,67500], //MXC
												["arifle_MX_Black_F",nil,54000], //MX
												["arifle_MX_SW_Black_F",nil,78000],
												["arifle_MXM_Black_F",nil,85000],
												["30Rnd_65x39_caseless_mag",nil,0], //MXAMMO
												["100Rnd_65x39_caseless_mag_Tracer",nil,0],
												["srifle_EBR_F",nil,80500],
												["20Rnd_762x51_Mag",nil,0], //18ammo
												["muzzle_snds_H",nil,42000],
												["muzzle_snds_B",nil,0],
												["optic_Holosight",nil,0], //holosight	
												["optic_ACO_grn",nil,0],
												["optic_Hamr",nil,0], //RCO
												["optic_Arco",nil,0],
												["optic_DMS",nil,0],
												["optic_SOS",nil,0],
												["acc_flashlight",nil,0], //FLASHLIGHT
												["acc_pointer_IR",nil,0], //POINTER
												["I_IR_Grenade",nil,0],
												//Items
											["Binocular",nil,150],
											["Rangefinder","RangeFinder",500],
											["ItemGPS",nil,100],
											["ToolKit",nil,250],
											["FirstAidKit",nil,150],
											["Medikit",nil,200],
											["NVGoggles_OPFOR",nil,2000],
											["Chemlight_red",nil,300],
											["Chemlight_yellow",nil,300],
											["Chemlight_blue",nil,300]
                                        ]
                                ];
                        };
						case (FETCH_CONST(life_coplevel) == 9): //DAC
                        {
                                ["Deputy Assistant Store",
                                        [
                                                ["hgun_P07_snds_F","Taser",0], //PISTOLTASER
												["16Rnd_9x21_Mag",nil,0], //PISTOLAMMO
												["SMG_02_F",nil,0], //STING9mm
												["30Rnd_9x21_Mag",nil,0], //STINGAMMO
												["SMG_01_F",nil,0], //vermin
												["30Rnd_45ACP_Mag_SMG_01",nil,0], //verminammo
												["arifle_Mk20_plain_F",nil,0], //rubber gun
												["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
												["arifle_TRG20_F",nil,0], //TRG
												["30Rnd_556x45_Stanag",nil,0], //TRGAMMO
												["arifle_MXC_Black_F",nil,0], //MXC
												["arifle_MX_Black_F",nil,0], //MX
												["arifle_MX_SW_Black_F",nil,78000],
												["arifle_MXM_Black_F",nil,85000],
												["30Rnd_65x39_caseless_mag",nil,0], //MXAMMO
												["100Rnd_65x39_caseless_mag_Tracer",nil,0],
												["srifle_EBR_F",nil,80500],
												["20Rnd_762x51_Mag",nil,0], //18ammo
												["muzzle_snds_H",nil,42000],
												["muzzle_snds_B",nil,0],
												["optic_Holosight",nil,0], //holosight	
												["optic_ACO_grn",nil,0],
												["optic_Hamr",nil,0], //RCO
												["optic_Arco",nil,0],
												["optic_DMS ",nil,0],
												["optic_SOS",nil,0],
												["acc_flashlight",nil,0], //FLASHLIGHT
												["acc_pointer_IR",nil,0], //POINTER
												["I_IR_Grenade",nil,0],
												//Items
											["Binocular",nil,150],
											["Rangefinder","RangeFinder",500],
											["ItemGPS",nil,100],
											["ToolKit",nil,250],
											["FirstAidKit",nil,150],
											["Medikit",nil,200],
											["NVGoggles_OPFOR",nil,2000],
											["Chemlight_red",nil,300],
											["Chemlight_yellow",nil,300],
											["Chemlight_blue",nil,300]
                                        ]
                                ];
                        };
						case (FETCH_CONST(life_coplevel) == 10): //AssistantComissioner
                        {
                                ["Assistant Store",
                                        [
                                                ["hgun_P07_snds_F","Taser",0], //PISTOLTASER
												["16Rnd_9x21_Mag",nil,0], //PISTOLAMMO
												["SMG_02_F",nil,0], //STING9mm
												["30Rnd_9x21_Mag",nil,0], //STINGAMMO
												["SMG_01_F",nil,0], //vermin
												["30Rnd_45ACP_Mag_SMG_01",nil,0], //verminammo
												["arifle_Mk20_plain_F",nil,0], //rubber gun
												["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
												["arifle_TRG20_F",nil,0], //TRG
												["30Rnd_556x45_Stanag",nil,0], //TRGAMMO
												["arifle_MXC_Black_F",nil,0], //MXC
												["arifle_MX_Black_F",nil,0], //MX
												["arifle_MX_SW_Black_F",nil,78000],
												["arifle_MXM_Black_F",nil,85000],
												["30Rnd_65x39_caseless_mag",nil,0], //MXAMMO
												["100Rnd_65x39_caseless_mag_Tracer",nil,0],
												["srifle_EBR_F",nil,80500],
												["20Rnd_762x51_Mag",nil,0], //18ammo
												["muzzle_snds_H",nil,42000],
												["muzzle_snds_B",nil,0],
												["optic_Holosight",nil,0], //holosight	
												["optic_ACO_grn",nil,0],
												["optic_Hamr",nil,0], //RCO
												["optic_Arco",nil,0],
												["optic_DMS",nil,0],
												["optic_SOS",nil,0],
												["acc_flashlight",nil,0], //FLASHLIGHT
												["acc_pointer_IR",nil,0], //POINTER
												["I_IR_Grenade",nil,0],
												//Items
											["Binocular",nil,150],
											["Rangefinder","RangeFinder",500],
											["ItemGPS",nil,100],
											["ToolKit",nil,250],
											["Medikit",nil,0],
											["FirstAidKit",nil,150],
											["NVGoggles_OPFOR",nil,2000],
											["Chemlight_red",nil,300],
											["Chemlight_yellow",nil,300],
											["Chemlight_blue",nil,300]
                                        ]
                                ];
                        };
						case (FETCH_CONST(life_coplevel) == 11): //Deputy
                        {
                                ["Deputy Store",
                                        [
                                                ["hgun_P07_snds_F","Taser",0], //PISTOLTASER
												["16Rnd_9x21_Mag",nil,0], //PISTOLAMMO
												["SMG_02_F",nil,0], //STING9mm
												["30Rnd_9x21_Mag",nil,0], //STINGAMMO
												["SMG_01_F",nil,0], //vermin
												["30Rnd_45ACP_Mag_SMG_01",nil,0], //verminammo
												["arifle_Mk20_plain_F",nil,0], //rubber gun
												["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
												["arifle_TRG20_F",nil,0], //TRG
												["30Rnd_556x45_Stanag",nil,0], //TRGAMMO
												["arifle_MXC_Black_F",nil,0], //MXC
												["arifle_MX_Black_F",nil,0], //MX
												["arifle_MX_SW_Black_F",nil,78000],
												["arifle_MXM_Black_F",nil,85000],
												["30Rnd_65x39_caseless_mag",nil,0], //MXAMMO
												["100Rnd_65x39_caseless_mag_Tracer",nil,0],
												["srifle_EBR_F",nil,80500],
												["20Rnd_762x51_Mag",nil,0], //18ammo
												["muzzle_snds_H",nil,42000],
												["muzzle_snds_B",nil,0],
												["optic_Holosight",nil,0], //holosight
												["optic_ACO_grn",nil,0],
												["optic_Hamr",nil,0], //RCO
												["optic_DMS",nil,0],
												["optic_SOS",nil,0],
												["acc_flashlight",nil,0], //FLASHLIGHT
												["acc_pointer_IR",nil,0], //POINTER
												["I_IR_Grenade",nil,0],
												//Items
											["Binocular",nil,150],
											["Rangefinder","RangeFinder",500],
											["ItemGPS",nil,100],
											["ToolKit",nil,250],
											["FirstAidKit",nil,150],
											["Medikit",nil,200],
											["NVGoggles_OPFOR",nil,2000],
											["Chemlight_red",nil,300],
											["Chemlight_yellow",nil,300],
											["Chemlight_blue",nil,300]
                                        ]
                                ];
                        };
						case (FETCH_CONST(life_coplevel) == 12): //Commissioner
                        {
                                ["COMM Store",
                                        [
                                                ["hgun_P07_snds_F","Taser",0], //TASER
                                                ["16Rnd_9x21_Mag",nil,0], //TASERAMMO
												["SMG_02_F",nil,0], //STING
												["30Rnd_9x21_Mag",nil,0], //9mmAMMO
												["SMG_01_F",nil,0], //45
												["30Rnd_45ACP_Mag_SMG_01",nil,0], //45ammo
												["arifle_Mk20_plain_F",nil,0], //rubber gun
												["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
												["arifle_MXC_Black_F",nil,67500], //MXC
												["arifle_MX_Black_F",nil,54000], //mx
												["arifle_MX_SW_Black_F",nil,78000], //MXSW
												["arifle_MXM_Black_F",nil,85000], //MXM
												["30Rnd_65x39_caseless_mag",nil,0], //mxammo
												["100Rnd_65x39_caseless_mag",nil,0],
												["srifle_EBR_F",nil,80500], //mk18
												["20Rnd_762x51_Mag",nil,0], //18ammo
												["muzzle_snds_M",nil,31500], //5.56SILCENCER
												["muzzle_snds_H",nil,42000], //6SILENCER
												["muzzle_snds_B",nil,52500],
												["optic_Aco_smg",nil,0], //SMGSCOPE
												["optic_Aco",nil,0], //SCOPE
												["optic_Arco",nil,0], //ARCO
												["optic_Hamr",nil,0], //HAMR
												["optic_DMS",nil,0], //DMS
												["optic_SOS",nil,0],
												["I_IR_Grenade",nil,0],
												//Items
											["Binocular",nil,150],
											["Rangefinder","RangeFinder",500],
											["ItemGPS",nil,100],
											["ToolKit",nil,250],
											["FirstAidKit",nil,150],
											["Medikit",nil,200],
											["NVGoggles_OPFOR",nil,2000],
											["Chemlight_red",nil,300],
											["Chemlight_yellow",nil,300],
											["Chemlight_blue",nil,300]
												
                                        ]
                                ];
                        };
						case (FETCH_CONST(life_coplevel) == 13): //SCO19
                        {
                                ["SCO Store",
                                        [
											["hgun_P07_snds_F","Taser",0], //TASER
                                            ["16Rnd_9x21_Mag",nil,0], //TASERAMMO
											["hgun_Rook40_snds_F",nil,7000], //rook40
											["30Rnd_9x21_Mag",nil,0], //30rnd
											["arifle_Mk20_plain_F",nil,0], //rubber gun
											["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
											["arifle_MXC_Black_F",nil,67500], //MXC
											["arifle_MX_Black_F",nil,54000], //mx
											["arifle_MX_SW_Black_F",nil,78000], //MXSW
											["arifle_MXM_Black_F",nil,85000], //MXM
											["30Rnd_65x39_caseless_mag",nil,0], //mxammo
											["100Rnd_65x39_caseless_mag",nil,0],
											["srifle_EBR_F",nil,80500], //mk18
											["20Rnd_762x51_Mag",nil,0], //18ammo
											["muzzle_snds_M",nil,31500], //5.56SILCENCER
											["muzzle_snds_H",nil,42000], //6SILENCER	
											["muzzle_snds_B",nil,52500], //762
											["acc_pointer_IR",nil,0],
											["acc_flashlight",nil,0],
											["optic_Holosight",nil,0],
											["optic_Arco",nil,0],
											["optic_Hamr",nil,0],
											["optic_DMS",nil,0],
											["I_IR_Grenade",nil,0],
											["SmokeShellYellow","Smoke",0],
											//Items
											["Binocular",nil,150],
											["Rangefinder","RangeFinder",500],
											["ItemGPS",nil,100],
											["ToolKit",nil,250],
											["FirstAidKit",nil,150],
											["Medikit",nil,200],
											["NVGoggles_OPFOR",nil,2000],
											["Chemlight_red",nil,300],
											["Chemlight_yellow",nil,300],
											["Chemlight_blue",nil,300]
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
			case (!license_civ_rebel): {"You don't have Rebel training!"};
			default
			{
				["Rebel Gear",
					[
						//Handguns
						["hgun_Pistol_Signal_F",nil,10000],["hgun_Rook40_F",nil,20000],["hgun_ACPC2_F",nil,22000],["hgun_Pistol_heavy_01_F",nil,25000],["hgun_Pistol_heavy_02_F",nil,35000],["SMG_01_F",nil,50000],
												

						//5.56mm
						["arifle_SDAR_F",nil,45000],["arifle_TRG20_F",nil,50000],["arifle_TRG21_F",nil,55000],["arifle_Mk20_F",nil,70000],

						//6.5mm
						["arifle_Katiba_C_F",nil,125000],["arifle_MX_F",nil,140000],["arifle_MXC_F",nil,150000],["arifle_MX_SW_F",nil,180000],["arifle_MXM_F",nil,200000],["arifle_MX_Black_F",nil,155000],["arifle_MXC_Black_F",nil,165000],["arifle_MX_SW_Black_F",nil,195000],["arifle_MXM_Black_F",nil,215000],["LMG_Mk200_F",nil,300000],

						//7.62mm
						["srifle_DMR_01_F",nil,190000],["srifle_EBR_F",nil,230000],

						//Suppressors
						["muzzle_snds_M",nil,90000],["muzzle_snds_H",nil,120000],["muzzle_snds_B",nil,150000],

						//Attachments
						["optic_Aco",nil,5000],["optic_ACO_grn",nil,5000],["optic_Holosight",nil,6000],["optic_MRCO",nil,7000],["optic_Hamr",nil,10000],["optic_Arco",nil,10000],["optic_DMS",nil,40000],["acc_flashlight",nil,1000],["acc_pointer_IR",nil,4000],

						//Mags
						["16Rnd_9x21_Mag",nil,250],["30Rnd_45ACP_Mag_SMG_01",nil,400],["30Rnd_9x21_Mag",nil,500],["11Rnd_45ACP_Mag",nil,900],["9Rnd_45ACP_Mag",nil,800],["6Rnd_45ACP_Cylinder",nil,600],
						["30Rnd_556x45_Stanag",nil,1000],["30Rnd_556x45_Stanag_Tracer_Red",nil,1200],["30Rnd_556x45_Stanag_Tracer_Green",nil,1200],["30Rnd_556x45_Stanag_Tracer_Yellow",nil,1200],
						["20Rnd_556x45_UW_mag",nil,600],["30Rnd_65x39_caseless_mag",nil,1000],["30Rnd_65x39_caseless_green",nil,1200],["30Rnd_65x39_caseless_mag_Tracer",nil,1200],["30Rnd_65x39_caseless_green_mag_Tracer",nil,1200],
						["100Rnd_65x39_caseless_mag",nil,1800],["200Rnd_65x39_cased_Box",nil,2500],["200Rnd_65x39_cased_Box_Tracer",nil,2700],
						["10Rnd_762x51_Mag",nil,2000],["20Rnd_762x51_Mag",nil,4000],
						["6Rnd_RedSignal_F",nil,100],
						
						//Items
						["Binocular",nil,150],
						["Rangefinder","RangeFinder",500],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles_OPFOR",nil,2000],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_blue",nil,300]
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
						["hgun_Pistol_Signal_F",nil,10000],
						["hgun_Rook40_F",nil,20000],
						["hgun_ACPC2_F",nil,22000],
						["hgun_Pistol_heavy_01_F",nil,25000],
						["hgun_Pistol_heavy_02_F",nil,35000],
						["6Rnd_RedSignal_F",nil,100],
						["16Rnd_9x21_Mag",nil,250],
						["9Rnd_45ACP_Mag",nil,800],
						["11Rnd_45ACP_Mag",nil,900],
						["6Rnd_45ACP_Cylinder",nil,600]	
					]
				];
			};
		};
	};
	
	case "Bounty":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_Bounty): {"You don't have a Bounty Hunters license!"};
			default
			{
				["Bounty Hunter Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["30Rnd_9x21_Mag",nil,75],
						["Binocular",nil,150],
						["Rangefinder","RangeFinder",500],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles_OPFOR",nil,2000],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
		};
	};
	
	case "whitelisted":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_whitelisted): {"You are not apart of the P.R.A!"};
			default
			{
				["P.R.A Firearms",
					[
						//Handguns
						["hgun_Pistol_Signal_F",nil,3500],["hgun_Rook40_F",nil,7000],["hgun_ACPC2_F",nil,7700],["hgun_Pistol_heavy_01_F",nil,8750],["hgun_Pistol_heavy_02_F",nil,12250],

						//5.56mm
						["arifle_SDAR_F",nil,15750],["arifle_TRG20_F",nil,17500],["arifle_TRG21_F",nil,19250],["arifle_Mk20_F",nil,24500],

						//6.5mm
						["arifle_Katiba_C_F",nil,43750],["arifle_MX_F",nil,49000],["arifle_MXC_F",nil,52500],["arifle_MX_SW_F",nil,63000],["arifle_MXM_F",nil,70000],["arifle_MX_Black_F",nil,54000],["arifle_MXC_Black_F",nil,67500],["arifle_MX_SW_Black_F",nil,78000],["arifle_MXM_Black_F",nil,85000],["LMG_Mk200_F",nil,105000],

						//7.62mm
						["srifle_DMR_01_F",nil,66500],["srifle_EBR_F",nil,80500],

						//Suppressors
						["muzzle_snds_M",nil,31500],["muzzle_snds_H",nil,42000],["muzzle_snds_B",nil,52500],

						//Attachments
						["optic_Aco",nil,1750],["optic_ACO_grn",nil,1750],["optic_Holosight",nil,2100],["optic_MRCO",nil,2450],["optic_Hamr",nil,3500],["optic_Arco",nil,3500],["optic_DMS",nil,14000],["acc_flashlight",nil,35],["acc_pointer_IR",nil,1400],

						//Mags
						["16Rnd_9x21_Mag",nil,250],["30Rnd_9x21_Mag",nil,500],["11Rnd_45ACP_Mag",nil,900],["9Rnd_45ACP_Mag",nil,800],["6Rnd_45ACP_Cylinder",nil,600],
						["30Rnd_556x45_Stanag",nil,1000],["30Rnd_556x45_Stanag_Tracer_Red",nil,1200],["30Rnd_556x45_Stanag_Tracer_Green",nil,1200],["30Rnd_556x45_Stanag_Tracer_Yellow",nil,1200],
						["20Rnd_556x45_UW_mag",nil,600],["30Rnd_65x39_caseless_mag",nil,1000],["30Rnd_65x39_caseless_green",nil,1200],["30Rnd_65x39_caseless_mag_Tracer",nil,1200],["30Rnd_65x39_caseless_green_mag_Tracer",nil,1200],
						["100Rnd_65x39_caseless_mag",nil,1800],
						["10Rnd_762x51_Mag",nil,2000],["200Rnd_65x39_cased_Box",nil,2500],["200Rnd_65x39_cased_Box_Tracer",nil,2700],["20Rnd_762x51_Mag",nil,4000],
						["6Rnd_RedSignal_F",nil,100],

						//Items
						["SmokeShell","Smoke",0],
						["Binocular",nil,150],
						["Rangefinder","RangeFinder",500],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles_OPFOR",nil,2000],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_blue",nil,300]
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
						["hgun_Pistol_Signal_F",nil,10000],
						["hgun_Rook40_F",nil,20000],
						["hgun_ACPC2_F",nil,22000],
						["hgun_Pistol_heavy_01_F",nil,25000],
						["hgun_Pistol_heavy_02_F",nil,35000],
						["6Rnd_RedSignal_F",nil,100],
						["16Rnd_9x21_Mag",nil,250],
						["9Rnd_45ACP_Mag",nil,800],
						["11Rnd_45ACP_Mag",nil,900],
						["6Rnd_45ACP_Cylinder",nil,600]	
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["Rangefinder","RangeFinder",500],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles_OPFOR",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
	
	//Donator
	case "donator":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_donator): {"You are not a donator!"};
			default
			{
				["The Donator Club",
					[
						//Handguns
						["hgun_Pistol_Signal_F",nil,3500],["hgun_Rook40_F",nil,7000],["hgun_ACPC2_F",nil,7700],["hgun_Pistol_heavy_01_F",nil,8750],["hgun_Pistol_heavy_02_F",nil,12250],

						//5.56mm
						["arifle_SDAR_F",nil,15750],["arifle_TRG20_F",nil,17500],["arifle_TRG21_F",nil,19250],["arifle_Mk20_F",nil,24500],

						//6.5mm
						["arifle_Katiba_C_F",nil,43750],["arifle_MX_F",nil,49000],["arifle_MXC_F",nil,52500],["arifle_MX_SW_F",nil,63000],["arifle_MXM_F",nil,70000],["arifle_MX_Black_F",nil,54000],["arifle_MXC_Black_F",nil,67500],["arifle_MX_SW_Black_F",nil,78000],["arifle_MXM_Black_F",nil,85000],["LMG_Mk200_F",nil,105000],

						//7.62mm
						["srifle_DMR_01_F",nil,66500],["srifle_EBR_F",nil,80500],

						//Suppressors
						["muzzle_snds_M",nil,31500],["muzzle_snds_H",nil,42000],["muzzle_snds_B",nil,52500],

						//Attachments
						["optic_Aco",nil,1750],["optic_ACO_grn",nil,1750],["optic_Holosight",nil,2100],["optic_MRCO",nil,2450],["optic_Hamr",nil,3500],["optic_Arco",nil,3500],["optic_DMS",nil,14000],["acc_flashlight",nil,35],["acc_pointer_IR",nil,1400],

						//Mags
						["16Rnd_9x21_Mag",nil,250],["30Rnd_9x21_Mag",nil,500],["11Rnd_45ACP_Mag",nil,900],["9Rnd_45ACP_Mag",nil,800],["6Rnd_45ACP_Cylinder",nil,600],
						["30Rnd_556x45_Stanag",nil,1000],["30Rnd_556x45_Stanag_Tracer_Red",nil,1200],["30Rnd_556x45_Stanag_Tracer_Green",nil,1200],["30Rnd_556x45_Stanag_Tracer_Yellow",nil,1200],
						["20Rnd_556x45_UW_mag",nil,600],["30Rnd_65x39_caseless_mag",nil,1000],["30Rnd_65x39_caseless_green",nil,1200],["30Rnd_65x39_caseless_mag_Tracer",nil,1200],["30Rnd_65x39_caseless_green_mag_Tracer",nil,1200],
						["100Rnd_65x39_caseless_mag",nil,1800],
						["10Rnd_762x51_Mag",nil,2000],["20Rnd_762x51_Mag",nil,4000],["200Rnd_65x39_cased_Box",nil,2500],["200Rnd_65x39_cased_Box_Tracer",nil,2700],
						["6Rnd_RedSignal_F",nil,100],

						//Items
						["Binocular",nil,150],
						["Rangefinder","RangeFinder",500],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles_OPFOR",nil,2000],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
		};
	};
};