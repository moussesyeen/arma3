/*
	File: fn_slotSpin.sqf
	Author: Jacob "PapaBear" Tyler
	Description: Takes bet, spins slots, determines if win, pays

*/
private["_slot","_slot1","_slot2","_slot3","_winnings","_slotcash","_betamt","_display"];
_betamt = [_this,0,1,[0]] call BIS_fnc_param;
if(gsn_life_cash < _betamt) exitWith {hint format["You don't have enough money to play ($%1)",_betamt];};
[_betamt,0,1] call life_fnc_handleMoney;
disableSerialization;
_display = findDisplay 5780;

_slotPic1 = _display displayCtrl 5771;
_slotPic2 = _display displayCtrl 5772;
_slotPic3 = _display displayCtrl 5773;
_winningsText = _display displayCtrl 5775;
_bet1 = _display displayCtrl 5778;
_bet2 = _display displayCtrl 5779;
_bet3 = _display displayCtrl 5781;
_bet4 = _display displayCtrl 5782;

_bet1 ctrlEnable false;
_bet2 ctrlEnable false;
_bet3 ctrlEnable false;
_bet4 ctrlEnable false;

_pplayer = _this select 0;

life_action_inUse = true;

_a = 0;
player say3D "spin";
while{_a =_a + 1; _a < 15} do
{
	_number = ceil(random 8);
	uiSleep .03;
	_slotPic1 ctrlSetText format["images\slots\%1.jpg",_number];
	_number = ceil(random 8);
	uiSleep .03;
	_slotPic2 ctrlSetText format["images\slots\%1.jpg",_number];
	_number = ceil(random 8);
	uiSleep .03;
	_slotPic3 ctrlSetText format["images\slots\%1.jpg",_number];
};

_number = ceil(random 8);
_slotPic1 ctrlSetText format["images\slots\%1.jpg",_number];
_slot1 = _number;

uiSleep 0.3;

_number = ceil(random 8);
_slotPic2 ctrlSetText format["images\slots\%1.jpg",_number];
_slot2 = _number;

uiSleep 0.3;

_number = ceil(random 8);
_slotPic3 ctrlSetText format["images\slots\%1.jpg",_number];
_slot3 = _number;

uiSleep 0.3;

_slot = parseNumber format["%1%2%3",_slot1,_slot2,_slot3];

//cases for wins
switch (_slot) do
{
	case 111:{_winnings = (_betamt * 3);};
	case 222:{_winnings = (_betamt * 3);};
	case 333:{_winnings = (_betamt * 3);};
	case 444:{_winnings = (_betamt * 3);};
	case 555:{_winnings = (_betamt * 3);};
	case 666:{_winnings = (_betamt * 3);};
	case 777:{_winnings = (_betamt * 3);};
	case 888:{_winnings = (_betamt * 3);};
	default {_winnings = 0;}
};

if(_winnings == 0) then
{
	if(_slot1 == _slot2 OR _slot2 == _slot3) then
	{
		_winnings = _betamt;
	};
};

if(_winnings > 0) then
{
	player say3D "win";
};

[_winnings,0,0] call life_fnc_handleMoney;
_winningsText ctrlSetText format["You won: %1",_winnings];

_bet1 ctrlEnable true;
_bet2 ctrlEnable true;
_bet3 ctrlEnable true;
_bet4 ctrlEnable true;
life_action_inUse = false;