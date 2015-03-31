/*
	File: fn_paroniNotice.sqf
*/
private["_pName"];
_pName = [_this,0,"Unknown Named Player",[0]] call BIS_fnc_param;
_amount = [_this,1,0,[0]] call BIS_fnc_param;
_cashType = [_this,2,0,[0]] call BIS_fnc_param; //0 = onhand | 1 = atm
_mathType = [_this,3,0,[0]] call BIS_fnc_param; //0 = add | 1 = subtract

if(_amount == 0) exitWith {};
if!(_cashType in [0,1]) exitWith {};
if!(_mathType in [0,1]) exitWith {};

if(isServer && !hasInterface) exitWith {}; //NO SERVER DO NOT EXECUTE IT!
#include <macro.h>
if(__GETC__(life_adminlevel) < 1) exitWith {};
hint parseText format["<t align='center'><t color='#FF0000'><t size='2'>Paroni-Notice</t></t><br/>Hacker Flagged</t><br/><br/>Name: %1<br/>Detection: %2",_pName,"This player was detected by the anti-money hack script. Ban them for money hacking ASAP!"];

//debugging info
diag_log "===========================================================================";
diag_log "=========================MONEY GLITCHING DETECTED==========================";
diag_log "===========================================================================";
diag_log "-----------------------------TRANSACTION VALUES----------------------------";
diag_log format["Server ticktime: %1",diag_tickTime];
diag_log format["Transaction Amount: %1",_amount];
if(_cashType == 1) then
{
	diag_log format["Transaction Type: %1","ATM"];
}
else
{
	diag_log format["Transaction Type: %1","Onhand Cash"];
};
if(_mathType == 1) then
{
	diag_log format["Math Type: %1","Subtraction"];
}
else
{
	diag_log format["Math Type: %1","Addition"];
};
diag_log "-----------------------------CLIENT CHECK VALUES----------------------------";
diag_log format["Notation Onhand Amount: %1",gsn_life_cash];
diag_log format["Notation ATM Amount: %1",gsn_lifeatm_cash];
diag_log format["Readable Onhand Amount: %1",[gsn_life_cash] call life_fnc_numberText];
diag_log format["Readable ATM Amount: %1",[gsn_lifeatm_cash] call life_fnc_numberText];
diag_log format["Cash Cache Index: %1",gsn_cash_caches_index];
diag_log format["ATM Cache Index: %1",gsn_atm_caches_index];
diag_log format["GSN Cash Cache Array Size: %1",(call gsn_cash_cache_array_size)];
diag_log format["GSN ATM Cache Array Size: %1",(call gsn_atm_cache_array_size)];
diag_log format["GSN Cash Cache Checksum: %1",(call gsn_cash_cache_checksum)];
diag_log format["GSN ATM Cache Checksum: %1",(call gsn_atm_cache_checksum)];
diag_log format["GSN Cash Cache Array %1",gsn_cash_cache_array];
diag_log format["GSN ATM Cache Array %1",gsn_atm_cache_array];
diag_log "-----------------------------ARRAY CACHE VALUES----------------------------";
{
	diag_log format["GSN Cash Cache Array Entry (Readable||Notation): %1||%2",[_x] call life_fnc_numberText,_x];
} foreach gsn_cash_cache_array;

{
	diag_log format["GSN ATM Cache Array Entry (Readable||Notation): %1||%2",[_x] call life_fnc_numberText,_x];
} foreach gsn_atm_cache_array;

diag_log format["Cash Cache Array Value To Check (Notation||Readable): %1||%2",(gsn_cash_cache_array select gsn_cash_caches_index),[(gsn_cash_cache_array select gsn_cash_caches_index)] call life_fnc_numberText];
diag_log format["GSN ATM Cache Array Value To Check (Notation||Readable) %1||%2",(gsn_atm_cache_array select gsn_atm_caches_index),[(gsn_atm_cache_array select gsn_atm_caches_index)] call life_fnc_numberText];
diag_log "---------------------------------------------------------------------------";
diag_log "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||";
diag_log "---------------------------------------------------------------------------";