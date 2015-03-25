class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
	};
};

class Life_Client_Core
{
	tag = "life";
	
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
		//class welcomeNotification {};
		class survival {};
	};
	
	class BountyHunter
	{
		file = "core\bountyhunter";
		class licenseSwap {};
		//class bountySelect {};
	};
	
	class TreasureHunting
	{
		file ="core\jobs\treasure_hunting";
		class Appraise {};
		class SearchWreck {};
		class TreasureHunt {};
		class TreasureHuntInit {};
	};
	
	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
		class adminMenu {};
		class adminQuery {};
	};
	
	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
		class newLifeRule {}; //Maxi 2/7/2015
	};
	
	class Actions
	{
		file = "core\actions";
		class buyLicense {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class serviceChopper {};
		class catchFish {};
		class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};
		class getDPMission {};
		class postBail {};
		class processAction {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class ticketAction2 {};
		class packupSpikes {};
		class storeVehicle {};
		class robAction {};
		class captureHideout {};
		class gather {};
		class gutAnimal {};
		class animMenu {}; //Animation Menu
		class robShops {}; //Rob shops - Maxi 2/7/2015
		class surrender {}; //Maxi Surrender 2/9/2015
		class robBank {}; //Rob bank tellers - Maxi 2/11/2015
		class skyDiving {}; //Skydiving Maxi 2/11/2015
		class jailBreakout {}; //new breakout system Maxi 2/14/2015
		class jailBreakoutCompleted {}; //new breakout system Maxi 2/14/2015
		class crushAction{}; //Crush Maxi 2/14/2015
		class civRestrainAction {}; //Maxi Handcuff shit
		class suicideBomb  {}; //lolwut
		class hackFedCam {}; //Hack the fed
		class collectWood {}; //Maxi - Collect wood for smaller bail
		class collectPlanks {}; //Maxi - Process for smaller bail
	};
	
	class Nightclub //Maxi Nightclub 2/12/2015
	{
		file = "core\nightclub";
		class nclights {};
		class ncLightsOn {};
		class ncstage {};
		class ncsmoke {};
		class ncflash {};
		class ncFlashOn {};
	};
	
	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class lockHouse {};
		class garageRefund {};
	};
	
	class Config
	{
		file = "core\config";
		class itemWeight {};
		class taxRate {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class vehicleWeightCfg {};
	};
	
	class Modshop
	{
		file = "core\modshop";
		class modShopClose {};
		class modShopInit {};
		class modShopSave {};
		class modShopUpdate {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedList2 {};
		class wantedInfo {};
		class wantedInfo2 {};
		class wantedMenu {};
		class wantedAddP {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class s_onChar {};
		class s_onCheckedChange {};
		class smartphone {}; //Maxi 2/7/2015 Smartphone
		class newMsg {}; //Maxi 2/7/2015 Smartphone
		class showMsg {}; //Maxi 2/7/2015 Smartphone
		class updateBounty {};
	};
	
	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class nearUnits {};
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class revealObjects {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class saveGear {};
		class loadGear {};
		class stripDownPlayer {};
		class nearATM {};
		class earplugs {}; //Maxi 2/6/2015 Lowers game volume
		class Info {}; //Maxi 2/6/2015 Adds a new dialog box when you join the server
		// removed due to bug - class UnLockCarSound {}; Maxi Global Unlock Sound for vehicles
		// removed due to bug - class LockCarSound {}; Maxi Global lock Sound for vehicles
		class speaking {}; //Maxi 2/10/15 see who is speaking	
		class reloadUniforms {}; //Maxi reload
		class goodbye {};
		class bankfast {};
	};
	
	class Loadout
	{
		file = "core\loadout";
		class loadoutMenu {};
		class loadoutInfo {};
		class loadoutCreate {};
		class loadoutCreateDone {};
		class loadoutCreateAdd {};
		class loadoutCreateRemove {};
		class loadoutAddMag {};
		class loadoutDelete {};
		class loadoutBuy {};
		class loadoutCalculateCosts {};
	};
	
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
		class bountyTaze {};
	};
	
	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class tazed {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		//class removeLicenses {}; 
		class demoChargeTimer {};
		class civLoadout {};
		class zoneCreator {};
		class breakoutTimer {};
		class civInteractionMenu {};
        class civRestrain {};
	};
	
	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleWeight {};
		class deviceMine {};
		class addVehicle2Chain {};
		class civVInteractionMenu {};
        class medVInteractionMenu {};
		class fuelManager {};
		class refuelVehicle {};
	};

	class Cop
	{
		file = "core\cop";
		//class copMarkers {};
		class copLights {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class copLoadout {};
		class ticketPaid {};
		class wantedGrab {};
		class ANPR {}; //Maxi 2/6/2015 - ANPR system
		class copEnter {}; //Maxi 2/6/2015 - Allow cops to enter/getout of locked vehicles
		class breathalyzer {}; //breathalyzer
		class seizeWeapons {}; //seize weapons
		class seizeWeaponsClient {}; //seize weapons
		class ticketGive10 {};
		class ticketGive30 {};
		class ticketPrompt30 {};
		class ticketPrompt10 {};
	};
	
	class CopPlaceables
	{
		file = "core\cop\placeables";
		class placeablesInit {};
		class placeablesMenu {};
		class placeablesRemoveAll {};
		class placeablePlace {};
		class placeableCancel {};
		class placeablesPlaceComplete {};
	};
	
	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
		class gangLeave {};
		class gangNewLeader {};
		class gangUpgrade {};
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
	};

	class CaptureZones
	{
		file = "core\gangs\capture";
		class areaCapture {};
		class areaCaptureUpdate {};
		class gangCapturePaycheck {};
	};
	
	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class slotmachine {}; //Maxi Slot Machine 2/8/2015
		class slotSpin {}; //Maxi Slot Machine 2/8/2015
	};
	
	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class lockpick {};
		class spikeStrip {};
		class jerryRefuel {};
		class flashbang {};
		class boltcutter {};
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
		class drinkbeer {};
		class drinkwhiskey {};
		class pLockpick {};
		class druguse {}; //drug use
		class lance {};
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
		class wireTransfer {};
	};
};