
private ["_nameList","_objectList","_sortedObjects","_sortedNames"];

_nameList = [];
_objectList = [];
_sortedObjects = [];

//sort the player name (the easy part)
{
	if(alive _x) then
	{
		_objectList pushBack _x ;
		_nameList pushBack (name _x);
	};
} foreach playableUnits;

_sortedNames = _nameList call BIS_fnc_sortAlphabetically;

//now we get to map the name to the object
for "_currentName" from 0 to ((count _sortedNames) -1) do
{
   	for "_currentObject" from 0 to ((count _objectList) -1) do
	{
		_tmpName = name (_objectList select _currentObject);
		_tmpUnit = (_sortedNames select _currentName);
		if(_tmpName == _tmpUnit) then
		{
			_sortedObjects pushBack (_objectList select _currentObject);
		};
   };
};

_sortedObjects;