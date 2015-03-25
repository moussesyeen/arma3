private["_display","_list","_name","_crimes","_bounty","_units","_shopType"];
disableSerialization;

createDialog "life_loadoutAddMag_menu";

waitUntil { !dialog };

_amount = ctrlText 90005;

_amount;