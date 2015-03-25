StartProgress = false;
enableSaving[false,false];

life_versionInfo = "Altis Life RPG (ES v4.1)";
//[] execVM "briefing.sqf"; Removed by Yeen 2/6/2015 cause its crap
[] execVM "KRON_Strings.sqf";
//[] execVM "scripts\welcome.sqf"; Maxi 2/6/2015 Welcome message
[] execVM "scripts\fn_statusBar.sqf"; //Maxi 2/6/2015 Status Bar
[] execVM "scripts\nosidechat.sqf"; //nosidechat bs- Maxi
[] execVM "scripts\fastrope.sqf"; //Toss ropes


[] spawn {
	_fuelPos = [
		[3757.14,13477.9,-0.0540276],[3757.54,13485.9,-0.010498],[4001.12,12592.1,-0.0965538],
		[5023.26,14429.6,-0.0978947],[5019.68,14436.7,-0.0114822],[2849.07,9955.15,-0.0126724],
		[6198.83,15081.4,-0.0911655],[6798.15,15561.6,-0.0439568],[9205.75,12112.2,-0.0487232],
		[9021.82,15728.7,-0.0294342],[9023.75,15729,-0.0272522],[9025.78,15729.4,-0.0205612],
		[8481.69,18260.7,-0.0266876],[5768.99,20085.7,-0.0590668],[11831.6,14155.9,-0.0342894],
		[12024.7,15830,-0.0298138],[12026.6,15830.1,-0.0342979],[12028.4,15830,-0.0388737],
		[14173.2,16541.8,-0.0946102],[13692,18586,-0.130533],[13697.3,18585,-0.0881214],
		[13704.1,18583.7,-0.0889683],[14221.4,18302.5,-0.0697155],[15297.1,17565.9,-0.283808],
		[15781,17453.2,-0.285192],[16750.9,12513.1,-0.0525198],[16871.7,15476.6,0.0106945],
		[16875.2,15469.4,0.0377445],[17417.2,13936.7,-0.106361],[19961.3,11454.6,-0.0349236],
		[19965.1,11447.6,-0.0483704],[20784.8,16665.9,-0.0521202],[20789.6,16672.3,-0.0213318],
		[21230.4,7116.56,-0.060379],[23379.4,19799,-0.0544052],[25701.2,21372.6,-0.0774155]
	];

	{
		_fuelPump = nearestObject[_x,"Land_fs_feed_F"];
		_fuelPump setFuelCargo 0;
		if(!isDedicated) then {
			_fuelPump addAction["Refuel Vehicle ($750)",life_fnc_refuelVehicle,"",0,false,false,"",'(count nearestObjects[_target,["Car","Truck","Air","Ship"],10]) > 0 && (_target distance player < 5)'];
		};
	} forEach _fuelPos;
};

//enableEnvironment false;
StartProgress = true;
introSpawn = nil;


MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;
    
};