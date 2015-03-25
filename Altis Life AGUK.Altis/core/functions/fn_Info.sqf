/*
	File: fn_welcome.sqf
	Author: Maximum
	
	Description:
	Shows the welcome message.
*/
disableSerialization;
createDialog "RscDisplayWelcome";

_display = findDisplay 999999;
_AGTEXT = _display displayCtrl 1100;
_buttonSpoiler = _display displayctrl 2400;
_textSpoiler = _display displayctrl 1101;
_AGTEXT2 = _display displayCtrl 1102;

_message = "";
_message = _message + "<t align='center' size='8' shadow='0'><img image='intrologo.paa' /></t><br /><br />";
_message = _message + "Welcome to <a href='http://www.AltisGaming.co.uk' color='#5600FF'>AltisGaming.co.uk</a> where roleplay is at it's finest!<br /><br />";
_message = _message + "Please read the rules at <a href= 'http://altisgaming.co.uk' color='#5600FF'>AltisGaming.Rules</a> or you will find yourself being removed from the server<br /><br />";
_message = _message + "AltisGaming.co.uk is now currently running on 4.0, Alot has changed and the server was built from ground up with the community members in mind, We hope you enjoy this update and if you have any issues or concerns then please feel free to join our teamspeak!<br />";
_message = _message + "Yours truly,<br />";
_message = _message + "<t size='4' shadow='0'><img image='maxi.paa' /></t>";

_AGTEXT ctrlSetStructuredText (parseText _message);


_positionText1 = ctrlPosition _AGTEXT;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _AGTEXT;
_AGTEXT ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_AGTEXT ctrlcommit 0;
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_AGTEXT2 ctrlSetFade 1;
_AGTEXT2 ctrlCommit 0;