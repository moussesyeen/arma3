/*
	Original Code: PapaBear @ Blacklistgaming.org
	Heavily Modified By Paronity @ GSNGaming.com
*/

private ["_betamt"];
_betamt = [_this,0,1,[0]] call BIS_fnc_param;
gsn_current_bet = _betamt;
disableSerialization;
_display = findDisplay 5980;

if(gsn_life_cash < _betamt) exitWith {hint format["You don't have enough money to play ($%1)",[_betamt] call life_fnc_numberText];};

[_betamt,0,1] call life_fnc_handleMoney;

_Pcard1 = _display displayCtrl 5992;
_Pcard2 = _display displayCtrl 5993;
_Pcard3 = _display displayCtrl 5994;
_Pcard4 = _display displayCtrl 5997;
_Pcard5 = _display displayCtrl 5998;
_Dcard1 = _display displayCtrl 5990;
_Dcard2 = _display displayCtrl 5991;
_Dcard3 = _display displayCtrl 5995;
_Dcard4 = _display displayCtrl 7015;
_Dcard5 = _display displayCtrl 5996;
_p1value = _display displayCtrl 1038;
_p2value = _display displayCtrl 1039;
_p3value = _display displayCtrl 1040;
_p4value = _display displayCtrl 1041;
_p5value = _display displayCtrl 1042;
_d1value = _display displayCtrl 1033;
_d2value = _display displayCtrl 1034;
_d3value = _display displayCtrl 1035;
_d4value = _display displayCtrl 1036;
_d5value = _display displayCtrl 1037;
_bet1 = _display displayCtrl 5984;
_bet2 = _display displayCtrl 5985;
_bet3 = _display displayCtrl 5986;
_bet4 = _display displayCtrl 5987;
_bet5 = _display displayCtrl 6012;
_winnings = _display displayCtrl 6001;
_Stay = _display displayCtrl 5982;
_Hit = _display displayCtrl 5983;
_TOTALTXT = _display displayCtrl 6008;
_DEALERTOTAL = _display displayCtrl 6010;

_Pcard1 ctrlSetText "";
_Pcard2 ctrlSetText "";
_Pcard3 ctrlSetText "";
_Pcard4 ctrlSetText "";
_Pcard5 ctrlSetText "";
_Dcard1 ctrlSetText "";
_Dcard2 ctrlSetText "";
_Dcard3 ctrlSetText "";
_Dcard4 ctrlSetText "";
_Dcard5 ctrlSetText "";
_p1value ctrlSetText "";
_p2value ctrlSetText "";
_p3value ctrlSetText "";
_p4value ctrlSetText "";
_p5value ctrlSetText "";
_d1value ctrlSetText "";
_d2value ctrlSetText "";
_d3value ctrlSetText "";
_d4value ctrlSetText "";
_d5value ctrlSetText "";
_winnings ctrlSetText "";
_TOTALTXT ctrlSetText "0";
_DEALERTOTAL ctrlSetText "0";
_total = 0;
_bet1 ctrlEnable false;
_bet2 ctrlEnable false;
_bet3 ctrlEnable false;
_bet4 ctrlEnable false;
_bet5 ctrlEnable false;
_Hit ctrlEnable false;
_Stay ctrlEnable false;

_number = ceil(random 13);
_number = _number + 1;
switch(_number) do
{
	case 11: {_number = "J";};
	case 12: {_number = "Q";};
	case 13: {_number = "K";};
	case 14: {_number = "A";};
};

_Pcard1 ctrlSetText format["images\cards\%1_%2.jpg",_number,(ceil(random 3) + 1)];
_P1 = format ["%1",_number];

uiSleep 0.5;

_number = ceil(random 12);
_number = _number + 2;

switch(_number) do
{
	case 11: {_number = "J";};
	case 12: {_number = "Q";};
	case 13: {_number = "K";};
	case 14: {_number = "A";};
};

_Dcard1 ctrlSetText format["images\cards\%1_%2.jpg",_number,(ceil(random 3) + 1)];
_D1 = format ["%1",_number];
uiSleep 0.5;

_number = ceil(random 13);
_number = _number + 1;

switch(_number) do
{
	case 11: {_number = "J";};
	case 12: {_number = "Q";};
	case 13: {_number = "K";};
	case 14: {_number = "A";};
};

_Pcard2 ctrlSetText format["images\cards\%1_%2.jpg",_number,(ceil(random 3) + 1)];
_P2 = format ["%1",_number];

uiSleep 0.5;

_total = 0;

if( _P1 == "A" ) then
{
	if( _P2 in ["10","J","Q","K"] ) then
	{
		_total = 21;
	}
	else
	{
		if( _P2 == "A" ) then
		{
			_total = 12;
		}
		else
		{
			if(_P2 in ["J","Q","K"]) then
			{
				_P2 = "10";
			};
			_total = 11 + (parseNumber _P2);
		};
	};
}
else
{
	if( _P2 == "A" ) then
	{
		if(_P1 in ["10","J","Q","K"]) then
		{
			_p1value ctrlSetText _P1;
			_p2value ctrlSetText _P2;
			_total = 21;
		}
		else
		{
			if( _P1 == "A" ) then
			{
				_total = 12;
				_p1value ctrlSetText _P1;
				_p2value ctrlSetText _P2;
			}
			else
			{
				if(_P1 in ["J","Q","K"]) then
				{
					_P1 = "10";
				};
				_p1value ctrlSetText _P1;
				_p2value ctrlSetText _P2;
				_total = 11 + (parseNumber _P1);
			};
		};
	}
	else
	{
		if(_P1 in ["J","Q","K"]) then
		{
			_P1 = "10";
		};
		if(_P2 in ["J","Q","K"]) then
		{
			_P2 = "10";
		};
		_p2value ctrlSetText _P2;
		_p1value ctrlSetText _P1;
		_total = (parseNumber _P1) + (parseNumber _P2);
	};
};

_TOTALTXT ctrlSetText format["%1",_total];

if( _total == 21 ) then
{
	_win = 4 * _betamt;
	[_win,0,0] call life_fnc_handleMoney;
	_winnings ctrlSetText format["You got BlackJack. You earned $%1",[_win] call life_fnc_numberText];

	_bet1 ctrlEnable true;
	_bet2 ctrlEnable true;
	_bet3 ctrlEnable true;
	_bet4 ctrlEnable true;
	_bet5 ctrlEnable true;
}
else
{
	_number = ceil(random 13);
	_number = _number + 1;
	switch(_number) do
	{
		case 11: {_number = "J"};
		case 12: {_number = "Q"};
		case 13: {_number = "K"};
		case 14: {_number = "A"};
	};

	if( format["%1",_number] == "A" ) then
	{
		if( _D1 in ["10","J","Q","K"]) then
		{
			_Dcard2 ctrlSetText format["images\cards\%1_%2.jpg",_number,(ceil(random 3) + 1)];
			_winnings = _display displayCtrl 6001;
			_d2value ctrlSetText format["%1",_number];
			_d1value ctrlSetText format["%1",_D1];
			_DEALERTOTAL ctrlSetText format["%1","21"];
			_winnings ctrlSetText "You Lose. Dealer got BlackJack.";
			_bet1 ctrlEnable true;
			_bet2 ctrlEnable true;
			_bet3 ctrlEnable true;
			_bet4 ctrlEnable true;
			_bet5 ctrlEnable true;
		}
		else
		{
			if(_D1 in ["J","Q","K"]) then
			{
				_D1 = "10";
			};
			_d1value ctrlSetText _D1;
			_Dcard2 ctrlSetText "images\cards\back.jpg";
			_DEALERTOTAL ctrlSetText format["%1",(parseNumber _D1)];
		};
	}
	else
	{
		if( format["%1",_D1] == "A" ) then
		{
			if( format["%1",_number] in ["10","J","Q","K"]) then
			{
				_Dcard2 ctrlSetText format["images\cards\%1_%2.jpg",_number,(ceil(random 3) + 1)];
				_winnings = _display displayCtrl 6001;
				_DEALERTOTAL ctrlSetText format["%1","21"];
				_winnings ctrlSetText "You Lose. Dealer got Black Jack.";
				_bet1 ctrlEnable true;
				_bet2 ctrlEnable true;
				_bet3 ctrlEnable true;
				_bet4 ctrlEnable true;
				_bet5 ctrlEnable true;
			}
			else
			{
				_Dcard2 ctrlSetText "images\cards\back.jpg";
				_d1value ctrlSetText _D1;
				if(_D1 in ["J","Q","K"]) then
				{
					_D1 = "10";
				};
				if(_D1 == "A") then
				{
					_D1 = "11";
				};
				_DEALERTOTAL ctrlSetText format["%1",(parseNumber _D1)];
			};
		}
		else
		{
			_Dcard2 ctrlSetText "images\cards\back.jpg";
			_d1value ctrlSetText _D1;
			if(_D1 in ["J","Q","K"]) then
			{
				_D1 = "10";
			};
			_DEALERTOTAL ctrlSetText format["%1",(parseNumber _D1)];
		};
	};
	_Hit ctrlEnable true;
	_Stay ctrlEnable true;
};
