#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret set[count _ret,["U_Rangemaster","Cop Uniform",25]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["U_B_survival_uniform",nil,1250];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret pushBack ["U_B_CombatUniform_mcam_worn",nil,550];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
		};
	};

	//Hats
	case 1:
	{
		if(__GETC__(life_coplevel) > 0) then
		{
			_ret pushBack ["H_Cap_usblack",nil,150];
		};
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["H_Beret_blk_police",nil,500];
			_ret pushBack ["H_Cap_police",nil,750];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret pushBack ["H_Beret_Colonel",nil,850];
			_ret pushBack ["H_Helmetb_light_black",nil,1250];
		};
	};

	//Glasses
	case 2:
	{
		_ret =
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};

	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,800];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["V_TacVestIR_blk",nil,1500];
			_ret pushBack ["V_TacVest_blk_POLICE",nil,1500];
			_ret pushBack ["V_PlateCarrier1_blk",nil,1500];
		};
	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_cbr",nil,800],
			["B_FieldPack_cbr",nil,500],
			["B_AssaultPack_cbr",nil,700],
			["B_Bergen_sgg",nil,2500],
			["B_Carryall_cbr",nil,3500],
			["B_Bergen_blk",nil,2500],
			["B_Fieldpack_Blk",nil,500],
			["B_assaultpack_blk",nil,700]
		];
	};
};

_ret;