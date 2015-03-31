waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["info","GSN Info"];
player createDiarySubject ["rules","Rules"];
player createDiarySubject ["controls","Custom Controls"];


player createDiaryRecord ["rules", ["Important", "For full rules please visit http://gsngaming.com/rules"]];
player createDiaryRecord ["rules",
["Basic Rules",
"
<b>Failure to adhere to these will result in a kick/ban<br/>
<b>Killing yourself to get out of roleplay.<br/>
<b>Duplicating items or money.<br/>
<b>Abusing bugs or glitches.Report anyone doing this to the admins.<br/>
<b>Civilians who repeatedly look in or access other player's backpacks or vehicles without permission.<br/>
<b>Trolling/harassing players for long periods of time will be considered griefing/spamming.<br/>
<b>Getting out of jail via any method other than posting bail or escaping with a helicopter.<br/>
<b>Constant suiciding to avoid roleplay or annoy other players.<br/>
<b>Combat logging (disconnecting) from the server to avoid robbery, jail time, arrest, or any other legitimate roleplay.<br/>"]];

player createDiaryRecord ["rules",
["Definitions",
"
<b>RolePlay (RP):</b>Assuming a Role and communicating that Role to other players in voice or text that do not violate server rules. (Ex: Being a serial killer is not valid RP as it violates RDM.)<br/><b>Random Deathmatch (RDM):</b>Killing any player without roleplay, and will get you banned.<br/>
<b>Vehicle Deathmatch (VDM):</b>Intentionally killing any player with any type of vehicle unless it's self defense from another civilian or rebel using a weapon (not a police officer).  VDM will get you banned. Accidents, self defense, desync, and suicides are NOT VDM; however, you must immediately report the incident to the police so they can investigate and potentially pardon you (if they deem you are being truthful). This is YOUR responsibility.  If the cops find you and you did not report the incident prior, they can charge you for manslaughter.<br/>
<b>New Life Rule (NLR):</b>Once a player dies, that life of the player is left behind. The player cannot continue what they were doing before they died; they cannot seek revenge nor report players or locations of the players that killed them; they cannot go back to the scene of their death nor collect their dropped items or recover their vehicle.<br/>
<b>Spam:</b>Spamming any channel with unnecessary chatter, music, etc. is considered spam and will result in your removal from the server.<br/>"]];

player createDiaryRecord ["rules",
["Cop Rules",
"
<b>Cops must be in a police TeamSpeak channel if they are playing as a cop in our server.  This include both whitelisted and public cops<br/>
<b>Killing any player without roleplay, and will get you banned.<br/>
<b>Five (5) whitelisted cops must be present on the server for the Federal Reserve to be robbed. Whitelisted cops are identified by having [GPD] tags after their name.<br/>
<b>Cops cannot move to civilian channels and civilians cannot move to cop channels for ANY REASON.  Use in-game chat to communicate.<br/><b>No GPD may sell GPD clothing/items to civilians.<br/>
<b>Police officers always need probable cause to pull over, question, or restrain a civilian.<br/>"]];

	player createDiaryRecord["info",
		[
			"About",
				"
					Hello and welcome to GSN Gaming. We are a large PC gaming community focusing on efficient and well admined servers. We have spent a long time ensuring the missions and coding are as efficient as possible. We pride ourselves in having mature admins that will make sure the server remains a clean place for you to have a good time.
				"
		]
	];

	player createDiaryRecord["info",
		[
			"Website",
				"
					http://gsngaming.com
				"
		]
	];

	player createDiaryRecord["info",
		[
			"Teamspeak",
				"
					ts3.gsngaming.com
				"
		]
	];

// Controls Section

	player createDiaryRecord ["controls",
		[
			"Special Controls",
				"
					Open Player Menu: Y<br/>
					Cop & EMS Siren: F Key<br/>
					Cop & EMS Second Siren: Shift + F Key<br/>
					Cop & EMS Chirp: B Key<br/>
					Cop & EMS Lights: Shift + L Key<br/>
					Show/Hide Server Up-Time: Shift + U Key<br/>
					Access Car and House Storage (Trunk): T Key<br/>
					Retrain: Shift + R Key<br/>
					Main Interaction Hotkey: Custom Action 10 (Left Windows By Default)<br/>
					Wanted List Hotkey: Custom Action 11 (Right Windows By Default)<br/>
					Cop Radar: Custom Action 12 (Right Control by Default)<br/>
					Unlock and Lock Car and House Doors: U Key<br/>
					Left Shift + R Key: Restrain (Cop Only)<br/>
					Left Shift + G Key: Surrender (Civ Only)<br/>
					Left Shift + R Key: Knock out / stun (Civ Only, used for robbing them)<br/>
					Left Shift + Z Key: Restrain (Civilians Only (ZipTie))<br/>
					Left Ctrl + R Key:  Open Mag Repack Screen<br/>
					Right Shift Key: Change Sound Level to 10% (Ear Plugs)<br/>
					Holster Weapon: Shift + H Key<br/>
					Unholster Weapon: Control + H Key<br/>
					Pushups = Shift + Numpad /<br/>
					Takwondo = Shift + Numpad *<br/>
					Full Workout = Shift + Numpad -<br/>
					Boxing = Shift + Numpad +<br/>
					Handstand = Alt + Numpad /<br/>
					Situps = Alt + Numpad *<br/>
				"
		]
	];