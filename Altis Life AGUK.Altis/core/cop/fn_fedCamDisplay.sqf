/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop = _this select 0;
_mode = _this select 3;

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(life_fed_hacked) exitWith {hint "The bank camera is hacked! You cannot get the console working..."};
if(isNil "life_fed_scam") then {
	life_fed_scam = "camera" camCreate [0,0,0];
	life_fed_scam camSetFov 0.5;
	life_fed_scam camCommit 0;
	"rendertarget0" setPiPEffect [0];
	life_fed_scam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
	playSound "RscDisplayCurator_visionMode";
};
switch (_mode) do {
	case "side": {
		life_fed_scam camSetPos [7866.8,16137.7,4.71541];
		life_fed_scam camSetTarget [7967.79,16140.6,0.00167847];
		life_fed_scam camCommit 0;
	};
	
	case "bottomfloor": {
		life_fed_scam camSetPos [7922.05,16157.2,3.01099];
		life_fed_scam camSetTarget [7914,16154.1,0.00143433];
		life_fed_scam camCommit 0;
	};

	case "topfloor": {
		life_fed_scam camSetPos [7922.05,16157.2,6.41093];
		life_fed_scam camSetTarget [7905.28,16150.7,0.00144196];
		life_fed_scam camCommit 0;
	};
	
	case "front": {
		life_fed_scam camSetPos [7896.72,16142.6,6.67852] ;
		life_fed_scam camSetTarget [7909.38,16165,0.00157166];
		life_fed_scam camCommit 0;
	};
	
	case "back": {
		life_fed_scam camSetPos [7931.2,16156.5,4.33111];
		life_fed_scam camSetTarget [7907.01,16139.8,0.00143433];
		life_fed_scam camCommit 0;
	};
	
	case "off" :{
		life_fed_scam cameraEffect ["terminate", "back"];
		camDestroy life_fed_scam;
		_laptop setObjectTexture [0,"textures\police\station\wallpaper.paa"];
		life_fed_scam = nil;
		playSound "RscDisplayCurator_visionMode";
	};
};