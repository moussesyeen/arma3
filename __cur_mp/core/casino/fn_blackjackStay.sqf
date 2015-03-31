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

_bet1 ctrlEnable false;
_bet2 ctrlEnable false;
_bet3 ctrlEnable false;
_bet4 ctrlEnable false;
_bet5 ctrlEnable false;
_Hit ctrlEnable false;
_Stay ctrlEnable false;

_D1T = ctrlText _d1value;
_D2T = ctrlText _d2value;
_D3T = ctrlText _d3value;
_D4T = ctrlText _d4value;
_D5T = ctrlText _d5value;

_gameover = false;
_totalPlayer = 0;
_totalDealer = 0;
_totalPlayer = parseNumber ctrlText _TOTALTXT;
_win = 0;

_number = ceil(random 13);
_number = _number + 1;

switch(_number) do
{
	case 11: {_number = "J"};
	case 12: {_number = "Q"};
	case 13: {_number = "K"};
	case 14: {_number = "A"};
};

_Dcard2 ctrlSetText format["images\cards\%1_%2.jpg",_number,(ceil(random 3) + 1)];
_d2value ctrlSetText format["%1",_number];
if( _D1T == "A" ) then
{
	if( _number in ["10","J","Q","K"]) then
	{
		_totalDealer = 21;
	}
	else
	{
		if(_number in ["10","J","Q","K"]) then
		{
			_number = "10";
		};
		_totalDealer = 11 + _number;
	};
}
else
{
	if(_D1T in ["10","J","Q","K"]) then
	{
		_D1T = "10";
	};
	if(_number in ["J","Q","K"]) then
	{
		_number = 10;
		_totalDealer = _number + (parseNumber _D1T);
	};
	_totalDealer = _number + (parseNumber _D1T);
};

_DEALERTOTAL ctrlSetText format["%1",_totalDealer];
uiSleep 2;

if( _totalDealer > _totalPlayer ) then
{
	_gameover = true;
}
else
{
	if( _totalDealer == _totalPlayer ) then
	{
		_win = 1;
		_gameover = true;
	}
	else
	{
		_gameover = false;
	};
};

if( !_gameover ) then
{
	uiSleep 2;
	_number = ceil(random 13);
	_number = _number + 1;

	switch(_number) do
	{
		case 11: {_number = "J"};
		case 12: {_number = "Q"};
		case 13: {_number = "K"};
		case 14: {_number = "A"};
	};

	_Dcard3 ctrlSetText format["images\cards\%1_%2.jpg",_number,(ceil(random 3) + 1)];
	_d3value ctrlSetText format["%1",_number];

	if(format["%1",_number] == "A") then
	{
		_totalTemp = _totalDealer + 11;
		_totalTemp2 = _totalDealer + 1;

		if( _totalTemp == 21 OR _totalTemp2 == 21 ) then
		{
			_gameover = true;
			_DEALERTOTAL ctrlSetText format["%1","21"];
		}
		else
		{
			if( _totalTemp > 21 AND _totalTemp2 > 21 ) then
			{
				_gameover = true;
				_win = 2;
				_DEALERTOTAL ctrlSetText format["%1",_totalTemp];
			};
		};
		if(!_gameover) then
		{
			if( _totalTemp > _totalPlayer ) then
			{
				if( _totalTemp < 21 ) then
				{
					_gameover = true;
					_DEALERTOTAL ctrlSetText format["%1",_totalTemp];
				};
			}
			else
			{
				if( _totalTemp2 > _totalPlayer ) then
				{
					if( _totalTemp2 < 21 ) then
					{
						_gameover = true;
						_DEALERTOTAL ctrlSetText format["%1",_totalTemp2];
					};
				};
			};
		};
	}
	else
	{
		//should check for aces... but ya
		if(_number in ["J","Q","K"]) then
		{
			_number = 10;
		};
		_totalDealer = _totalDealer + _number;
		_DEALERTOTAL ctrlSetText format["%1",_totalDealer];

		if( _totalDealer > 21 ) then
		{
			_gameover = true;
			_win = 2;
		}
		else
		{
			if( _totalDealer > _totalPlayer ) then
			{
				_gameover = true;
			}
			else
			{
				if( _totalDealer == _totalPlayer ) then
				{
					_gameover = true;
					_win = 1;
				}
				else
				{
					_gameover = false;
				};
			};
		};
	};
};

if( !_gameover ) then
{
	uiSleep 2;
	_number = ceil(random 13);
	_number = _number + 1;

	switch(_number) do
	{
		case 11: {_number = "J"};
		case 12: {_number = "Q"};
		case 13: {_number = "K"};
		case 14: {_number = "A"};
	};

	_Dcard4 ctrlSetText format["images\cards\%1_%2.jpg",_number,(ceil(random 3) + 1)];
	_d4value ctrlSetText format["%1",_number];

	if(format["%1",_number] == "A") then
	{
		_totalTemp = _totalDealer + 11;
		_totalTemp2 = _totalDealer + 1;

		if( _totalTemp == 21 OR _totalTemp2 == 21 ) then
		{
			_gameover = true;
			_DEALERTOTAL ctrlSetText format["%1","21"];
		}
		else
		{
			if( _totalTemp > 21 AND _totalTemp2 > 21 ) then
			{
				_gameover = true;
				_win = 2;
				_DEALERTOTAL ctrlSetText format["%1",_totalTemp];
			};
		};
		if(!_gameover) then
		{
			if( _totalTemp > _totalPlayer ) then
			{
				if( _totalTemp < 21 ) then
				{
					_gameover = true;
					_DEALERTOTAL ctrlSetText format["%1",_totalTemp];
				};
			}
			else
			{
				if( _totalTemp2 > _totalPlayer ) then
				{
					if( _totalTemp2 < 21 ) then
					{
						_gameover = true;
						_DEALERTOTAL ctrlSetText format["%1",_totalTemp2];
					};
				};
			};
		};
	}
	else
	{
		//should check for aces... but ya
		if(_number in ["J","Q","K"]) then
		{
			_number = 10;
		};
		_totalDealer = _totalDealer + _number;
		_DEALERTOTAL ctrlSetText format["%1",_totalDealer];

		if( _totalDealer > 21 ) then
		{
			_gameover = true;
			_win = 2;
		}
		else
		{
			if( _totalDealer > _totalPlayer ) then
			{
				_gameover = true;
			}
			else
			{
				if( _totalDealer == _totalPlayer ) then
				{
					_gameover = true;
					_win = 1;
				}
				else
				{
					_gameover = false;
				};
			};
		};
	};
};

if( !_gameover ) then
{
	_win = 2;
};

if(_win == 0) then
{
	_winnings ctrlSetText "You lose. Dealer Wins.";
};

if(_win == 1) then
{
	_cash = _betamt;
	[_cash,0,0] call life_fnc_handleMoney;
	_winnings ctrlSetText format["You tied. You got your bet back: $%1",[_cash] call life_fnc_numberText];
};

if(_win ==2) then
{
	_cash = _betamt * 2;
	[_cash,0,0] call life_fnc_handleMoney;
	_winnings ctrlSetText format["You won. You earned $%1",[_cash] call life_fnc_numberText];
};

_bet1 ctrlEnable true;
_bet2 ctrlEnable true;
_bet3 ctrlEnable true;
_bet4 ctrlEnable true;
_bet5 ctrlEnable true;



_checkDealerAces =
{
	_totalAces = 0;
	//check if there are any aces
	//and where they are
	if( _D1T == "A" ) then
	{
		_ACES = true;
		_ACE1 = 1;
		_totalAces = 1;
	};

	if( _D2T == "A" ) then
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

	if( _D3T == "A" ) then
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

	if( _D4T == "A" ) then
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

	if( _D5T == "A" ) then
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

	if( _ACES ) then
	{
		if( _ACE4 != 5 OR _ACE3 != 5 OR _ACE2 != 5 OR _ACE1 != 5 ) then
		{
			_total = _total + (parseNumber _D5T);
		};

		if( _ACE4 != 4 OR _ACE3 != 4 OR _ACE2 != 4 OR _ACE1 != 4 ) then
		{
			_total = _total + (parseNumber _D4T);
		};

		if( _ACE3 != 3 OR _ACE2 != 3 OR _ACE1 != 3 ) then
		{
			_total = _total + (parseNumber _D3T);
		};

		if( _ACE2 != 2 OR _ACE1 != 2 ) then
		{
			_total = _total + (parseNumber _D2T);
		};

		if( _ACE1 != 1 ) then
		{
			_total = _total + (parseNumber _D1T);
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
};