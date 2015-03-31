uiMessage = {1 cutText [format ["%1",_this select 0],"PLAIN DOWN"];};
warnCount = 0;
while {true} do
{
	waitUntil {sleep 1;((!isNull findDisplay 63) && (!isNull findDisplay 55))};
	uiSleep 1;
	if (ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa") then
	{
		_chatType = ctrlText ((findDisplay 63) displayCtrl 101);
		if (_chatType == localize "str_channel_side") then
		{
			switch(warnCount) do
			{
				warnCount = warnCount + 1;
				case 1:
				{
					systemChat ("Sidechat VON is not allowed. Please change your chat type. 1st warning.");
					["Side Voice Not Allowed!"] spawn uiMessage;
				};
				case 2:
				{
					systemChat ("Sidechat VON is not allowed. Please change your chat type. 2nd warning.");
					["Side Voice Not Allowed!"] spawn uiMessage;
				};
				case 3:
				{
					systemChat ("Sidechat VON is not allowed. Please change your chat type. Last warning.");
					["Side Voice Not Allowed! Last Warning before removal from game!"] spawn uiMessage;
				};
				case 4:
				{
					["You will now be removed"] spawn uiMessage;
					1 fademusic 10;
					1 fadesound 10;
					disableUserInput true;
					[3,-1,"This player was removed from the mission for voice spam. Keep an eye out for further abuse."] call life_fnc_newMsg;
					["VONSpam",false,2] call BIS_fnc_endMission;
				};
			};
		};
	};
	uiSleep 1;
};