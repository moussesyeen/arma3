/*
	Author: Bryan "Tonic" Boardwine
*/
private["_item","_details","_bool","_ispack","_items","_isgun","_ongun","_override","_toUniform","_toVest"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_bool = [_this,1,false,[false]] call BIS_fnc_param;
_ispack = [_this,2,false,[false]] call BIS_fnc_param;
_ongun = [_this,3,false,[false]] call BIS_fnc_param;
_override = [_this,4,false,[false]] call BIS_fnc_param;
_toUniform = [_this,5,false,[false]] call BIS_fnc_param; //Manual override to send items specifically to a uniform.
_toVest = [_this,6,false,[false]] call BIS_fnc_param; //Manual override to send items specifically to a vest
_player = [_this,7,objNull,[]] call BIS_fnc_param;
if(isNil "_player" OR isNull _player OR !isPlayer _player) then
{
    _player = player;
};
//Some checks
if(_item == "") exitWith {};
_isgun = false;

_details = [_item] call life_fnc_fetchCfgDetails;
if(count _details == 0) exitWith {};

if(_bool) then
{
	switch((_details select 6)) do
	{
		case "CfgGlasses":
		{
			if(_toUniform) exitWith {_player addItemToUniform _item;};
			if(_toVest) exitWith {_player addItemToVest _item;};

			if(_ispack) then
			{
				_player addItemToBackpack _item;
			}
				else
			{
				if(_override) then
				{
					_player addItem _item;
				}
					else
				{
					if(goggles _player != "") then
					{
						removeGoggles _player;
					};
					_player addGoggles _item;
				};
			};
		};

		case "CfgVehicles":
		{
			if(backpack _player != "") then
			{
				_items = (backpackItems _player);
				removeBackpack _player;
			};
			_player addBackpack _item;
			clearAllItemsFromBackpack _player;
			if(!isNil {_items}) then
			{
				{[_x,true,true,false,true] spawn life_fnc_handleItem; } foreach _items;
			};
		};

		case "CfgMagazines":
		{
			if(_toUniform) exitWith {_player addItemToUniform _item;};
			if(_toVest) exitWith {_player addItemToVest _item;};
			if(_ispack) exitWith {_player addItemToBackpack _item;};

			_player addMagazine _item;
		};

		case "CfgWeapons":
		{
			//New addition
			if(_toUniform) exitWith {_player addItemToUniform _item;};
			if(_toVest) exitWith {_player addItemToVest _item;};
			if(_ispack) exitWith {_player addItemToBackpack _item;};

			if((_details select 4) in [1,2,4,5,4096]) then
			{
				if((_details select 4) == 4096) then
				{
					if((_details select 5) == -1) then
					{
						_isgun = true;
					};
				}
					else
				{
					_isgun = true;
				};
			};

			if(_isgun) then
			{
				if(!_ispack && _override) exitWith {}; //It was in the vest/uniform, try to close to prevent it overriding stuff... (Actual weapon and not an item)
				if(_item == "MineDetector") then
				{
					_player addItem _item;
				}
					else
				{
					_player addWeapon _item;
				};
			}
				else
			{
				switch(_details select 5) do
				{
					case 0:
					{
						if(_ispack) then
						{
							_player addItemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								_player addItem _item;
							}
								else
							{
								if(_item in (assignedItems  _player)) then
								{
									_player addItem _item;
								}
									else
								{
									_player addItem _item;
									_player assignItem _item;
								};
							};
						};
					};
					case 605:
					{
						if(_ispack) then
						{
							_player addItemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								_player addItem _item;
							}
								else
							{
								if(headGear _player == _item) then
								{
									_player addItem _item;
								}
									else
								{
									if(headGear _player != "") then
									{
										removeHeadGear _player;
									};
									_player addHeadGear _item;
								};
							};
						};
					};
					case 801:
					{
						if(_ispack) then
						{
							_player addItemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								_player addItem _item;
							}
								else
							{
								if(_player isKindOf "Civilian") then {
									if(uniform _player == _item) then {
										_player addItem _item;
									} else {
										if(uniform _player != "") then {
											_items = uniformItems _player;
											removeUniform _player;
										};

										_player addUniform _item;
										if(!isNil "_items") then {
											{_player addItemToUniform _x} foreach _items;
										};
									};
								} else {
									if(uniform _player != "") then {
										_items = uniformItems _player;
										removeUniform _player;
									};

									if(!(_player isUniformAllowed _item)) then {
										_player forceAddUniform _item;
									} else {
										_player addUniform _item;
									};
									if(!isNil "_items") then {
										{_player addItemToUniform _x} foreach _items;
									};
								};
							};
						};
					};
					case 701:
					{
						if(_ispack) then
						{
							_player addItemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								_player addItem _item;
							}
								else
							{
								if(vest _player == _item) then
								{
									_player addItem _item;
								}
									else
								{
									if(vest _player != "") then
									{
										_items = vestItems _player;
										removeVest _player;
									};

									_player addVest _item;

									if(!isNil {_items}) then
									{
										{[_x,true,false,false,true] spawn life_fnc_handleItem;} foreach _items;
									};
								};
							};
						};
					};

					case 201:
					{
						if(_ispack) then
						{
							_player addItemToBackpack _item;
						}
							else
						{
							private["_type"];
							_type = [_item,201] call life_fnc_accType;
							if(_ongun) then
							{
								switch (_type) do
								{
									case 1: { _player addPrimaryWeaponItem _item; };
									case 2: { _player addSecondaryWeaponItem _item; };
									case 3: { _player addHandgunItem _item; };
								};
							}
								else
							{
								if(_override) then
								{
									_player addItem _item;
								}
									else
								{
									private["_wepItems","_action","_slotTaken"];
										_wepItems = switch(_type) do {case 1:{primaryWeaponItems _player}; case 2:{secondaryWeaponItems _player}; case 3:{handgunItems _player}; default {["","",""]};};
										_slotTaken = false;

										if(_wepItems select 2 != "") then {_slotTaken = true;};

										if(_slotTaken) then {
											_action = [localize "STR_MISC_AttachmentMSG",localize "STR_MISC_Attachment",localize "STR_MISC_Weapon",localize "STR_MISC_Inventory"] call BIS_fnc_guiMessage;
											if(_action) then {
												switch(_type) do {
													case 1: {_player addPrimaryWeaponItem _item;};
													case 2: {_player addSecondaryWeaponItem _item;};
													case 3: {_player addHandgunItem _item;};
													default {_player addItem _item;};
												};
											} else {
												_player addItem _item; //Add it to any available container
											};
										} else {
											switch(_type) do {
												case 1: {_player addPrimaryWeaponItem _item;};
												case 2: {_player addSecondaryWeaponItem _item;};
												case 3: {_player addHandgunItem _item;};
												default {_player addItem _item;};
											};
										};
								};
							};
						};
					};

					case 301:
					{
						if(_ispack) then
						{
							_player addItemToBackpack _item;
						}
							else
						{
							private["_type"];
							_type = [_item,301] call life_fnc_accType;

							if(_ongun) then
							{
								switch (_type) do
								{
									case 1: { _player addPrimaryWeaponItem _item; };
									case 2: { _player addSecondaryWeaponItem _item; };
									case 3: { _player addHandgunItem _item; };
								};
							}
								else
							{
								if(_override) then
								{
									_player addItem _item;
								}
									else
								{
									private["_wepItems","_action","_slotTaken"];
										_wepItems = switch(_type) do {case 1:{primaryWeaponItems _player}; case 2:{secondaryWeaponItems _player}; case 3:{handgunItems _player}; default {["","",""]};};
										_slotTaken = false;

										if(_wepItems select 1 != "") then {_slotTaken = true;};

										if(_slotTaken) then {
											_action = [localize "STR_MISC_AttachmentMSG",localize "STR_MISC_Attachment",localize "STR_MISC_Weapon",localize "STR_MISC_Inventory"] call BIS_fnc_guiMessage;
											if(_action) then {
												switch(_type) do {
													case 1: {_player addPrimaryWeaponItem _item;};
													case 2: {_player addSecondaryWeaponItem _item;};
													case 3: {_player addHandgunItem _item;};
													default {_player addItem _item;};
												};
											} else {
												_player addItem _item; //Add it to any available container
											};
										} else {
											switch(_type) do {
												case 1: {_player addPrimaryWeaponItem _item;};
												case 2: {_player addSecondaryWeaponItem _item;};
												case 3: {_player addHandgunItem _item;};
												default {_player addItem _item;};
											};
										};
								};
							};
						};
					};

					case 101:
					{
						if(_ispack) then
						{
							_player addItemToBackpack _item;
						}
							else
						{
							private["_type"];
							_type = [_item,101] call life_fnc_accType;

							if(_ongun) then
							{
								switch (_type) do
								{
									case 1: { _player addPrimaryWeaponItem _item; };
									case 2: { _player addSecondaryWeaponItem _item; };
									case 3: { _player addHandgunItem _item; };
								};
							}
								else
							{
								if(_override) then
								{
									_player addItem _item;
								}
									else
								{
									private["_wepItems","_action","_slotTaken"];
										_wepItems = switch(_type) do {case 1:{primaryWeaponItems _player}; case 2:{secondaryWeaponItems _player}; case 3:{handgunItems _player}; default {["","",""]};};
										_slotTaken = false;

										if(_wepItems select 0 != "") then {_slotTaken = true;};

										if(_slotTaken) then {
											_action = [localize "STR_MISC_AttachmentMSG",localize "STR_MISC_Attachment",localize "STR_MISC_Weapon",localize "STR_MISC_Inventory"] call BIS_fnc_guiMessage;
											if(_action) then {
												switch(_type) do {
													case 1: {_player addPrimaryWeaponItem _item;};
													case 2: {_player addSecondaryWeaponItem _item;};
													case 3: {_player addHandgunItem _item;};
													default {_player addItem _item;};
												};
											} else {
												_player addItem _item; //Add it to any available container
											};
										} else {
											switch(_type) do {
												case 1: {_player addPrimaryWeaponItem _item;};
												case 2: {_player addSecondaryWeaponItem _item;};
												case 3: {_player addHandgunItem _item;};
												default {_player addItem _item;};
											};
										};
								};
							};
						};
					};

					case 621:
					{
						if(_ispack) then
						{
							_player addItemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								_player addItem _item;
							}
								else
							{
								_player addItem _item;
								_player assignItem _item;
							};
						};
					};

					case 616:
					{
						if(_ispack) then
						{
							_player addItemToBackpack _item;
						}
							else
						{
							if(_override) then
							{
								_player addItem _item;
							}
								else
							{
								_player addItem _item;
								_player assignItem _item;
							};
						};
					};

					default
					{
						if(_ispack) then
						{
							_player addItemToBackpack _item;
						}
							else
						{
							_player addItem _item;
						};
					};
				};
			};
		};
	};
}
	else
{
	switch((_details select 6)) do
	{
		case "CfgVehicles":
		{
			removeBackpack _player;
		};

		case "CfgMagazines":
		{
			_player removeMagazine _item;
		};

		case "CfgGlasses":
		{
			if(_item == goggles _player) then
			{
				removeGoggles _player;
			}
				else
			{
				_player removeItem _item;
			};
		};

		case "CfgWeapons":
		{
			if((_details select 4) in [1,2,4,5,4096]) then
			{
				if((_details select 4) == 4096) then
				{
					if((_details select 5) == -1) then
					{
						_isgun = true;
					};
				}
					else
				{
					_isgun = true;
				};
			};

			if(_isgun) then
			{
				switch(true) do
				{
					case (primaryWeapon _player == _item) : {_ispack = false;};
					case (secondaryWeapon _player == _item) : {_ispack = false;};
					case (handGunweapon _player == _item) : {_ispack = false;};
					case (_item in assignedItems _player) : {_ispack = false;};
					default {_ispack = true;};
				};

				if(_item == "MineDetector") then
				{
					_player removeItem _item;
				}
					else
				{
					//FUCK YOU BOHEMIA INTERACTIVE I SHOULDN'T HAVE TO DO THIS.
					//Lovely code provided by [OCB]Dash
					private["_tmpfunction"];
					_tmpfunction = {
						private["_tWeapons","_tWeaponCount"];
						switch(true) do {
							case (_this in (uniformItems _player)): {
								_tWeapons = (getWeaponCargo (uniformContainer _player)) select 0;
								_tWeaponCount = (getWeaponCargo (uniformContainer  _player)) select 1;

								clearWeaponCargo (uniformContainer _player);
								{
									_numVestWeps = _tWeaponCount select _forEachIndex;
									if(_x == _this) then
									{
										_numVestWeps = _numVestWeps - 1;
									};
									(uniformContainer _player) addWeaponCargo [ _x,_numVestWeps];
								}forEach _tWeapons;
							};

							case (_this in (vestItems _player)): {
								_tWeapons = (getWeaponCargo (vestContainer _player)) select 0;
								_tWeaponCount = (getWeaponCargo (vestContainer  _player)) select 1;

								clearWeaponCargo (vestContainer _player);
								{
									_numVestWeps = _tWeaponCount select _forEachIndex;
									if(_x == _this) then
									{
										_numVestWeps = _numVestWeps - 1;
									};
									(vestContainer _player) addWeaponCargo [ _x,_numVestWeps];
								}forEach _tWeapons;
							};

							case (_this in (backpackItems _player)): {
								_tWeapons = (getWeaponCargo (backpackContainer _player)) select 0;
								_tWeaponCount = (getWeaponCargo (backpackContainer  _player)) select 1;

								clearWeaponCargo (backpackContainer _player);
								{
									_numVestWeps = _tWeaponCount select _forEachIndex;
									if(_x == _this) then
									{
										_numVestWeps = _numVestWeps - 1;
									};
									(backpackContainer _player) addWeaponCargo [ _x,_numVestWeps];
								}forEach _tWeapons;
							};
						};
					};

					if(_ispack) then
					{
						_item call _tmpfunction;
					}
						else
					{
						switch(true) do
						{
							case (_item in (uniformItems _player)): {_item call _tmpfunction;};
							case (_item in (vestItems _player)) : {_item call _tmpfunction;};
							case (_item in (backpackItems _player)) : {_item call _tmpfunction;};
							default {_player removeWeapon _item;};
						};
					};
				};
			}
				else
			{
				switch((_details select 5)) do
				{
					case 0: {_player unassignItem _item; _player removeItem _item;};
					case 605: {if(headGear _player == _item) then {removeHeadgear _player} else {_player removeItem _item};};
					case 801: {if(uniform _player == _item) then {removeUniform _player} else {_player removeItem _item};};
					case 701: {if(vest _player == _item) then {removeVest _player} else {_player removeItem _item};};
					case 621: {_player unassignItem _item; _player removeItem _item;};
					case 616: {_player unassignItem _item; _player removeItem _item;};
					default
					{
						switch (true) do
						{
							case (_item in (primaryWeaponItems _player)) : {_player removePrimaryWeaponItem _item;};
							case (_item in (handgunItems _player)) : {_player removeHandgunItem _item;};
							default {_player removeItem _item;};
						};
					};
				};
			};
		};
	};
};