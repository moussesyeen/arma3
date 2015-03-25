private[];
disableSerialization;

if (!life_placeable_placing_active) exitWith {};
if (life_placeable_active_object == ObjNull) exitWith {};


_currentPos = getPosATL life_placeable_active_object;
detach life_placeable_active_object;


life_placeable_active_object setPos[(getPos life_placeable_active_object select 0), (getPos life_placeable_active_object select 1), 0];

life_placeable_active_object enableSimulationGlobal true;


life_placeables_placed pushBack life_placeable_active_object;

life_placeable_placing_active = false;
life_placeable_active_object = ObjNull;