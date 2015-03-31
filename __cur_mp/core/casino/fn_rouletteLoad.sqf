/*
	File: fn_roulleteLoad.sqf
	Author: Paronity
	Description: configure the roulette UI for use
*/
disableSerialization;
_display = findDisplay 2505;
_image1 = _display displayCtrl 1224;
_image2 = _display displayCtrl 1209;
_image3 = _display displayCtrl 1200;
_image4 = _display displayCtrl 1228;
_image5 = _display displayCtrl 1210;
_image6 = _display displayCtrl 1201;
_image7 = _display displayCtrl 1227;
_image8 = _display displayCtrl 1211;
_image9 = _display displayCtrl 1202;
_image10 = _display displayCtrl 1229;
_image11 = _display displayCtrl 1215;
_image12 = _display displayCtrl 1217;
_image13 = _display displayCtrl 1230;
_image14 = _display displayCtrl 1225;
_image15 = _display displayCtrl 1216;
_image16 = _display displayCtrl 1231;
_image17 = _display displayCtrl 1213;
_image18 = _display displayCtrl 1218;
_image19 = _display displayCtrl 1233;
_image20 = _display displayCtrl 1226;
_image21 = _display displayCtrl 1219;
_image22 = _display displayCtrl 1232;
_image23 = _display displayCtrl 1212;
_image24 = _display displayCtrl 1205;
_image25 = _display displayCtrl 1234;
_image26 = _display displayCtrl 1220;
_image27 = _display displayCtrl 1204;
_image28 = _display displayCtrl 1235;
_image29 = _display displayCtrl 1214;
_image30 = _display displayCtrl 1203;
_image31 = _display displayCtrl 1237;
_image32 = _display displayCtrl 1222;
_image33 = _display displayCtrl 1208;
_image34 = _display displayCtrl 1236;
_image35 = _display displayCtrl 1221;
_image36 = _display displayCtrl 1207;
_imageOdd = _display displayCtrl 1246;
_imageEven = _display displayCtrl 1243;
_imageColumn1 = _display displayCtrl 1238;
_imageColumn2 = _display displayCtrl 1223;
_imageColumn3 = _display displayCtrl 1206;
_image1_12 = _display displayCtrl 1239;
_image13_24 = _display displayCtrl 1240;
_image25_36 = _display displayCtrl 1241;
_imageRed = _display displayCtrl 1244;
_imageBlack = _display displayCtrl 1245;
_image1_18 = _display displayCtrl 1242;
_image19_36 = _display displayCtrl 1247;
_image0 = _display displayCtrl 5771;
_wheelState = _display displayCtrl 1248;

gsn_roulette_bets = [];

//image array to iterate through the numbers easier
_numericalImages = [_image0,_image1,_image2,_image3,_image4,_image5,_image6,_image7,_image8,_image9,_image10,_image11,_image12,_image13,_image14,_image15,_image16,_image17,_image18,_image19,_image20,_image21,_image22,_image23,_image24,_image25,_image26,_image27,_image28,_image29,_image30,_image31,_image32,_image33,_image34,_image35,_image36];

//iterate through numerical images and assign image
_i = 0;

{
	_x ctrlSetText format["images\roulette\table_top\%1.jpg",_i];
	_i = _i + 1;
}forEach _numericalImages;

//manual assignment of remaining images
_imageColumn1 ctrlSetText format["images\roulette\table_top\%1.jpg","column"];
_imageColumn2 ctrlSetText format["images\roulette\table_top\%1.jpg","column"];
_imageColumn3 ctrlSetText format["images\roulette\table_top\%1.jpg","column"];
_imageOdd ctrlSetText format["images\roulette\table_top\%1.jpg","odd"];
_imageEven ctrlSetText format["images\roulette\table_top\%1.jpg","even"];
_image1_12 ctrlSetText format["images\roulette\table_top\%1.jpg","1_12"];
_image13_24 ctrlSetText format["images\roulette\table_top\%1.jpg","13_24"];
_image25_36 ctrlSetText format["images\roulette\table_top\%1.jpg","25_36"];
_imageRed ctrlSetText format["images\roulette\table_top\%1.jpg","red"];
_imageBlack ctrlSetText format["images\roulette\table_top\%1.jpg","black"];
_image1_18 ctrlSetText format["images\roulette\table_top\%1.jpg","1_18"];
_image19_36 ctrlSetText format["images\roulette\table_top\%1.jpg","19_36"];

//set the starting image for the wheel
_wheelState ctrlSetText format["images\roulette\wheels\%1.jpg","wheel_0"];