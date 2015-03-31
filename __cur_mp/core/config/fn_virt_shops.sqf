/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Market",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","storagesmall","storagebig","grapes","detector","hgloves","underwatercharge","hknife","pgrapes"]]};
	case "rebel": {["Rebel Market",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge","grapes","detector","hgloves","ziptie","scalpel","underwatercharge","hknife","carbomb"]]};
	case "gang": {["Gang Market", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","blastingcharge","boltcutter","grapes","detector","hgloves","ziptie","scalpel","underwatercharge","hknife","carbomb"]]};
	case "medic": {["Medic Market", ["water","rabbit","apple","redgull","tbacon","fuelF","peach","grapes","jaws"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drug Dealer",["cocainep","heroinp","marijuana"]]};
	case "oil": {["Oil Trader",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Altis Fish Market",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Altis Glass Dealer",["glass"]]};
	case "iron": {["Altis Industrial Trader",["iron_r","copper_r"]]};
	case "diamond": {["Diamond Dealer",["diamond","diamondc"]]};
	case "salt": {["Salt Dealer",["salt_r"]]};
	case "cop": {["Cop Item Shop",["donuts","coffee","spikeStrip","water","rabbit","apple","redgull","fuelF","defusekit"]]};
	case "cement": {["Cement Dealer",["cement"]]};
	case "gold": {["Gold Buyer",["goldbar","goldbarp"]]};
	case "treasure": {["Pawn Shop",["treasure"]]};
	case "uranium": {["Uranium Trader",["euranium","uranium"]]};
	case "sacid": {["Water Department",["sacid"]]};
	case "rfuel": {["Rocket Engineer",["rfuel"]]};
	case "beer": {["Liqour Store",["vodka","moonshine","whiskey"]]};
	case "organ": {["Organ Dealer",["kidney"]]};
	case "butcher": {["Butchers R Us",["carcus","carcush"]]};
	case "recruiter": {["Recruiter Market", ["water","rabbit","apple","redgull","tbacon","fuelF","peach","grapes"]]};
};