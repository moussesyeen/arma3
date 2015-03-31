/*
	@Author:  [GSN] Paronity
*/

private ["_plebs","_fuzz","_doctahs","_welcome"];

_welcome = [];

_fuzz = [format["Welcome to Altis <t color='#00FF00'>%1</t>,<br/><br/>
Hello from <t color='#FF0000'>GSN Gaming</t>. Thank you for stopping by our island!  Please visit gsngaming.com for up-to-date rules, guides, and information about our server.<br/><br/>
*IMPORTANT*: <t color='#FF0000'>NEW Server Rules and Police Fines as of January, 26th, 2015.  Please see gsngaming.com/rules</t><br/><br/>
To play as a cop, you <t color='#FF0000'>MUST</t> be on TeamSpeak (ts3.gsngaming.com) <br/><br/>
Interested in becoming whitelisted? Apply @ gsngaming.com/whitelist<br/><br/>
Please report bugs, glitches, and incidents at gsngaming.com<br/><br/>
Have fun on duty, and get to work!<br/><br/> Yours truly - GSN Gaming Staff", name player]];

_plebs = [format["Welcome to Altis <t color='#00FF00'>%1</t>,<br/><br/>
Hello from <t color='#FF0000'>GSN Gaming</t>. Thank you for stopping by our island! Please visit gsngaming.com for up-to-date rules, guides, and information about our server.<br/><br/>
*IMPORTANT*: <t color='#FF0000'>NEW Server Rules as of January, 26th, 2015.  Please see gsngaming.com/rules</t><br/><br/>
Remember to sync your data often so your clothes, gear, and money will always save with your character.  Weapons, ammo, and Y menu items do not save.<br/><br/>
Please report bugs, glitches, and incidents at gsngaming.com<br/><br/>
Yours truly - GSN Gaming Staff", name player]];

_doctahs = [format["Welcome to Altis <t color='#00FF00'>%1</t>,<br/><br/>
Hello from <t color='#FF0000'>GSN Gaming</t>. Thank you for stopping by our island!  Please visit gsngaming.com for up-to-date rules, guides, and information about our server.<br/><br/>
*IMPORTANT*: <t color='#FF0000'>NEW Server Rules and Police Fines as of January, 26th, 2015.  Please see gsngaming.com/rules</t><br/><br/>
To play as a EMT, you <t color='#FF0000'>MUST</t> be on TeamSpeak (ts3.gsngaming.com) <br/><br/>
Interested in becoming whitelisted? Apply @ gsngaming.com/whitelist<br/><br/>
Please report bugs, glitches, and incidents at gsngaming.com<br/><br/>
Yours truly - GSN Gaming Staff", name player]];

switch (playerSide) do {
	case west:
	{
		{
			_welcome = _welcome + [(parseText _x)];
		} forEach _fuzz;
		_fuzz = _welcome;
		"Hello There!" hintC _fuzz;
	};
	case civilian:
	{
		{
			_welcome = _welcome + [(parseText _x)];
		} forEach _plebs;
		_plebs = _welcome;
		"Hello There!" hintC _plebs;
	};
	case independent:
	{
		{
			_welcome = _welcome + [(parseText _x)];
		} forEach _doctahs;
		_doctahs = _welcome;
		"Hello There!" hintC _doctahs;
	};
};