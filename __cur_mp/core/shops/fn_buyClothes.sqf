/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_price"];
if((lbCurSel 3101) == -1) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

if(_price > gsn_life_cash) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};

[_price,0,1] call life_fnc_handleMoney;

life_clothesPurchased = true;
closeDialog 0;

[] call life_fnc_updateSkins;