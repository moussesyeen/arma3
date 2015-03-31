/*
	File: fn_towLights.sqf
	Author: [GSN] Pager & [GSN] Paronity
	Website: GSNGaming.com
	Date Created: 2.27.2015
	Date Modified: 2.27.2015 v1.0
*/

private ["_veh","_lightYellow","_leftRed","_brightnessHigh","_brightnessLow","_attach","_leftLights","_rightLights","_type","_attenuation"];

_veh = (_this select 0);
_type = typeOf _veh;
_sun = (sunOrMoon < 1);

if (isNil "_veh" || isNull _veh || !(_veh getVariable "lights")) exitWith {};

_lightYellow = [255, 255, 0];

if (_sun) then
{
	_brightnessLow = 0;
	_brightnessHigh = 10;
	_attenuation = [0.001, 3000, 0, 125000];
} else {
	_brightnessLow = 0;
	_brightnessHigh = 60;
	_attenuation = [0.001, 3000, 0, 400000];
};

_flashes = 2;
_flashOn = 0.1;
_flashOff = 0.001;

_leftLights = [];
_rightLights = [];

_attach =
{
	_isLight = _this select 0;
	_color = _this select 1;
	_position = _this select 2;
	_light = "#lightpoint" createVehicleLocal getPos _veh;
	_light setLightBrightness 0;
	_light setLightAmbient [0,0,0];
	_light setLightAttenuation _attenuation;
	_light setLightIntensity 1000;
	_light setLightFlareSize 1;
	_light setLightFlareMaxDistance 150;
	_light setLightUseFlare true;
	_light setLightDayLight true;

	switch (_color) do
	{
		case "yellow": { _light setLightColor _lightYellow; };
	};

	if (_isLight) then
	{
		_leftLights pushBack [_light, _position];
	} else {
		_rightLights pushBack [_light, _position];
	};

	_light lightAttachObject [_veh, _position];
};

switch (_type) do
{
	case "C_Offroad_01_repair_F":
	{
		[false, "yellow", [-0.44, 0, 0.525]] call _attach;
		[true, "yellow", [0.345, 0, 0.525]] call _attach;
		[false, "yellow", [0.575, -2.95, -0.77]] call _attach;
		[true, "yellow", [-0.645, -2.95, -0.77]] call _attach;
		[false, "yellow", [0.17, 2.655, -0.49]] call _attach;
		[true, "yellow", [-0.25, 2.655, -0.49]] call _attach;
	};

_lightsOn = true;
while {(alive _veh)} do
{
	if (!(_veh getVariable "lights")) exitWith {};
	if (_lightsOn) then
	{
		for [{_i=0}, {_i<_flashes}, {_i=_i+1}] do
		{
			{ (_x select 0) setLightBrightness _brightnessHigh; } forEach _leftLights;
			uiSleep _flashOn;
			{ (_x select 0) setLightBrightness _brightnessLow; } forEach _leftLights;
			uiSleep _flashOff;
		};
		{ (_x select 0) setLightBrightness 0; } forEach _leftLights;

		for [{_i=0}, {_i<_flashes}, {_i=_i+1}] do
		{
			{ (_x select 0) setLightBrightness _brightnessHigh; } forEach _rightLights;
			uiSleep _flashOn;
			{ (_x select 0) setLightBrightness _brightnessLow; } forEach _rightLights;
			uiSleep _flashOff;
		};
		{ (_x select 0) setLightBrightness 0; } forEach _rightLights;
	};
};

{ deleteVehicle (_x select 0) } foreach _leftLights;
{ deleteVehicle (_x select 0) } foreach _rightLights;

_leftLights = [];
_rightLights = [];
