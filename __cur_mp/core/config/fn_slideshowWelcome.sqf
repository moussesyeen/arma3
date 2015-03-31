_list = [];

// FORMAT \\
_list = _list + [["Welcome To",["GSN Gaming!"]]];
_list = _list + [["Our Coders",["Paronity"]]];
_list = _list + [["Our Testers:",["All kinds of bishes"]]];
_list = _list + [["Our Website is",["GSNGaming.com"]]];
_list = _list + [["Our Teamspeak is",["ts.gsngaming.com"]]];
_list = _list + [["Thank our donators!",["They help us pay for the server!!"]]];

{
	uiSleep 1;
	_title = _x select 0;
	_contents = _x select 1;

	_finalText = format ["<t size='0.50' color='#0066ff' align='right'>%1<br /></t>", _title];
	_finalText = _finalText + "<t size='0.70' color='#BABABA' align='right'>";

	{_finalText = _finalText + format ["%1<br />", _x]} forEach _contents;

	_finalText = _finalText + "</t>";

	[_finalText,[(safezoneX + safezoneW - 0.95),0.50],[(safezoneY + safezoneH - 0.5),0.7],4,0.5] spawn BIS_fnc_dynamicText;

	uiSleep 4;
} forEach _list