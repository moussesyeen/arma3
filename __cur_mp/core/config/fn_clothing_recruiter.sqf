 #include <macro.h>
/*
	File: fn_clothing_recruiter.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Job Recruiter Shop"];
_job = player getVariable["recruitPosition","none"];
_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		switch(_job) do
		{
			case "newsReporter":
			{
				_ret pushBack ["U_C_Journalist",nil,250];
			};
			case "towTruckDriver":
			{

			};
			case "houseSalesman":
			{

			};
			case "carSalesMan":
			{

			};
		};
	};

	//Hats
	case 1:
	{
		switch(_job) do
		{
			case "newsReporter":
			{
				_ret pushBack ["H_Cap_press",nil,150];
			};
			case "towTruckDriver":
			{

			};
			case "houseSalesman":
			{

			};
			case "carSalesMan":
			{

			};
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
		switch(_job) do
		{
			case "newsReporter":
			{
				_ret pushBack ["V_Press_F",nil,350];
			};
			case "towTruckDriver":
			{

			};
			case "houseSalesman":
			{

			};
			case "carSalesMan":
			{

			};
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