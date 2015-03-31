/*
	Original Code: PapaBear @ Blacklistgaming.org
	Heavily Modified By Paronity @ GSNGaming.com
*/

disableSerialization;
_display = findDisplay 5980;

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

_betamt = gsn_current_bet;

_gameover = false;
_bet1 ctrlEnable false;
_bet2 ctrlEnable false;
_bet3 ctrlEnable false;
_bet4 ctrlEnable false;
_bet5 ctrlEnable false;
_Hit ctrlEnable false;
_Stay ctrlEnable false;

_P1T = ctrlText _p1value;
_P2T = ctrlText _p2value;
_P3T = ctrlText _p3value;
_P4T = ctrlText _p4value;
_P5T = ctrlText _p5value;

_ACES = false;
_ACE1 = 0;
_ACE2 = 0;
_ACE3 = 0;
_ACE4 = 0;
_total = 0;
_win = 0;
_cash = 0;

//figure out which card is next to be dealt
_NextCard = 0;
if(_P3T != "" ) then
{
	if(_P4T != "" ) then
	{
		_NextCard = 5;
	}
	else
	{
		_NextCard = 4;
	};
}
else
{
	_NextCard = 3;
};
if(_P3T != "" && _P4T != "" && _P5T != "") exitWith {hint "You have drawn the maxcimum amount of cards."};

_number = ceil(random 13);
_number = _number + 1;

switch(_number) do
{
	case 11: {_number = "J"};
	case 12: {_number = "Q"};
	case 13: {_number = "K"};
	case 14: {_number = "A"};
};

//assign card to its place
switch ( _NextCard ) do
{
	case 3: { _Pcard3 ctrlSetText format["images\cards\%1_%2.jpg",_number,(ceil(random 3) + 1)]; _P3T = format["%1",_number];_p3value ctrlSetText format["%1",_number];};
	case 4: { _Pcard4 ctrlSetText format["images\cards\%1_%2.jpg",_number,(ceil(random 3) + 1)]; _P4T = format["%1",_number];_p4value ctrlSetText format["%1",_number];};
	case 5: { _Pcard5 ctrlSetText format["images\cards\%1_%2.jpg",_number,(ceil(random 3) + 1)]; _P5T = format["%1",_number];_p5value ctrlSetText format["%1",_number];};
	default { _Pcard3 ctrlSetText format["images\cards\%1_%2.jpg",_number,(ceil(random 3) + 1)]; _P3T = format["%1",_number];_p3value ctrlSetText format["%1",_number];}
};

_totalAces = 0;
//check if there are any aces
//and where they are
if( _P1T == "A" ) then
{
	_ACES = true;
	_ACE1 = 1;
	_totalAces = 1;
};

if( _P2T == "A" ) then
{
	_ACES = true;
	if( _ACE1 == 0 ) then
	{
		_ACE1 = 2;
		_totalAces = 1;
	}
	else
	{
		_ACE2 = 2;
		_totalAces = 2;
	};

};

if( _P3T == "A" ) then
{
	_ACES = true;
	if( _ACE1 == 0 ) then
	{
		_ACE1 = 3;
		_totalAces = 1;
	}
	else
	{
		if( _ACE2 == 0 ) then
		{
			_ACE2 = 3;
			_totalAces = 2;
		}
		else
		{
			_ACE3 = 3;
			_totalAces = 3;
		};

	};

};

if( _P4T == "A" ) then
{
	_ACES = true;
	if( _ACE1 == 0 ) then
	{
		_ACE1 = 4;
		_totalAces = 1;
	}
	else
	{
		if( _ACE2 == 0 ) then
		{
			_ACE2 = 4;
			_totalAces = 2;
		}
		else
		{
			if( _ACE3 == 0 ) then
			{
				_ACE3 = 4;
				_totalAces = 3;
			}
			else
			{
				_ACE4 = 4;
				_totalAces = 4;
			};
		};

	};

};

if( _P5T == "A" ) then
{
	_ACES = true;
	if( _ACE1 == 0 ) then
	{
		_ACE1 = 5;
		_totalAces = 1;
	}
	else
	{
		if( _ACE2 == 0 ) then
		{
			_ACE2 = 5;
			_totalAces = 2;
		}
		else
		{
			if( _ACE3 == 0 ) then
			{
				_ACE3 = 5;
				_totalAces = 3;
			}
			else
			{
				_ACE4 = 5;
				_totalAces = 4;
			};
		};
	};
};

	_temp1 = 0;
	_temp2 = 0;
//aces check complete.
if( _ACES ) then
{
	if( _ACE4 != 5 OR _ACE3 != 5 OR _ACE2 != 5 OR _ACE1 != 5 ) then
	{
		_total = _total + (parseNumber _P5T);
	};

	if( _ACE4 != 4 OR _ACE3 != 4 OR _ACE2 != 4 OR _ACE1 != 4 ) then
	{
		_total = _total + (parseNumber _P4T);
	};

	if( _ACE3 != 3 OR _ACE2 != 3 OR _ACE1 != 3 ) then
	{
		_total = _total + (parseNumber _P3T);
	};

	if( _ACE2 != 2 OR _ACE1 != 2 ) then
	{
		_total = _total + (parseNumber _P2T);
	};

	if( _ACE1 != 1 ) then
	{
		_total = _total + (parseNumber _P1T);
	};


	switch ( _totalAces ) do
	{
		case 4:
		{
			_temp1 = 14;
			_temp2 = 4;
		};
		case 3:
		{
			_temp1 = 13;
			_temp2 = 3;
		};
		case 2:
		{
			_temp1 = 12;
			_temp2 = 2;
		};
		case 1:
		{
			_temp1 = 11;
			_temp2 = 1;
		};
		default {_temp1 = 0; _temp2 = 0;}
	};

	_totalTemp = _total + _temp2;
	_total = _total + _temp1;

	if( _total == 21 ) then
	{
		_TOTALTXT ctrlSetText format["%1",_total];
		_win = 4;
	}
	else
	{
		if( _total > 21 ) then
		{
			if( _totalTemp > 21 ) then
			{
				_TOTALTXT ctrlSetText format["%1",_totalTemp];
				_gameover = true;
			}
			else
			{
				if( _NextCard == 5 ) then
				{
					_win = 4;
				}
				else
				{
					_TOTALTXT ctrlSetText format["%1",_totalTemp];
				};
			};
		}
		else
		{
			_TOTALTXT ctrlSetText format["%1",_total];
		};
	};
}
else
{
	if(_P1T in ["J","Q","K"]) then
	{
		_P1T = "10";
	};
	if(_P2T in ["J","Q","K"]) then
	{
		_P2T = "10";
	};
	if(_P3T in ["J","Q","K"]) then
	{
		_P3T = "10";
	};
	if(_P4T in ["J","Q","K"]) then
	{
		_P4T = "10";
	};
	if(_P5T in ["J","Q","K"]) then
	{
		_P5T = "10";
	};
	_total = (parseNumber _P1T) + (parseNumber _P2T) + (parseNumber _P3T) + (parseNumber _P4T) + (parseNumber _P5T);
	_TOTALTXT ctrlSetText format["%1",_total];
	if( _total == 21 ) then
	{
		_win = 4;
		_gameover = true;
	}
	else
	{
		if( _total > 21 ) then
		{
			_gameover = true;
		};
	};
};

if( _gameover ) then
{
	if( _win != 0 ) then
	{
		_cash = _betamt * 2;
		[_cash,0,0] call life_fnc_handleMoney;
		_winnings ctrlSetText  format["You win by getting BlackJack! You earned $%1",[_cash] call life_fnc_numberText];
	}
	else
	{
		_winnings ctrlSetText "You lose. BUST (You went over 21)";
	};
	_bet1 ctrlEnable true;
	_bet2 ctrlEnable true;
	_bet3 ctrlEnable true;
	_bet4 ctrlEnable true;
	_bet5 ctrlEnable true;
	_Hit ctrlEnable false;
	_Stay ctrlEnable false;
}
else
{
	_Hit ctrlEnable true;
	_Stay ctrlEnable true;
};