/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
		
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
life_pInact_curTarget = _curTarget;

//Button 1 - Set unrestrain button
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";


//Button 2 - Set Escort Button
if((_curTarget getVariable["Escorting",false])) then {
    _Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
    _Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; closeDialog 0;";
} else {
    _Btn2 ctrlSetText localize "STR_pInAct_Escort";
    _Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

//Button 3 - Set put in car button
_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";

//Button 4 - Set Lockpick Button
_Btn4 ctrlSetText localize "STR_pInAct_Lockpick";
_Btn4 buttonSetAction "[] spawn life_fnc_pLockpick; closeDialog 0;";

if(life_inv_lockpick > 0) then
{
    _Btn4 ctrlEnable true;
} else {
    _Btn4 ctrlEnable false;
};

//Button 5 - Set arrest button
_Btn5 ctrlSetText localize "STR_pInAct_Arrest";
_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_arrestAction;";

//Check that you are near one of the right places to put someone in prison
if(!((player distance (getMarkerPos "police_hq_1") < 30) OR  (player distance (getMarkerPos "hq") < 50) OR  (player distance (getMarkerPos "bounty_hq") < 50) OR  (player distance (getMarkerPos "bounty_hq1") < 50) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR (player distance (getMarkerPos "cop_spawn_5") < 30))) then  {
	_Btn5 ctrlEnable false;
};

//Button 6 - undefined
_Btn6 ctrlShow false;
//Button 7 - undefined
_Btn7 ctrlShow false;
//Button 8 - undefined
_Btn8 ctrlShow false; 
//Button 9 - undefined
_Btn9 ctrlShow false; 