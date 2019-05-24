//checks if player already has mission
_currentmission = player getVariable ["hasMission", false];
if (_currentmission) exitWith {
	hint "Complete your mission first.";
};

//gets passed arguments from call
_vehicleindex = (_this select 0);
_destinatonindex = (_this select 1);
_cargoindex = (_this select 2);

//gets selected items from passed indexes
_selectedvehicle = lbData [1500, _vehicleindex];
_vehicleweight = (_vehicleindex + 1)*10;
_selecteddesination = lbText [1700, _destinatonindex];
_selectedcargo = lbText [1800, _cargoindex];
_selecteddesinationloc = lbData [1700, _destinatonindex];
_cargoweight = 0;

//gets desination location and sign
switch (_selecteddesination) do {
	case "Kavala Air Garage": {loc = getPos signfour;siign = signfour};
	case "Molos Airfield": {loc = getPos signthree;siign = signthree};
	case "Athira Airport": {loc = getPos signtwo;siign = signtwo};
	case "Therisa Airfield": {loc = getPos signone;siign = signone};
};
//sets cargo weight and prices
switch (_selectedcargo) do {
	case "Apples": {_cargoweight = 1;_price = 1};
	case "Peaches": {_cargoweight = 2;_price = 2};
	case "Beer": {_cargoweight = 4;_price = 4};
	case "Whiskey": {_cargoweight = 6;_price = 6};
};

siign addAction ["Complete Mission",
{
	null = [siign] call xat_fnc_completemission;
}];


//sets player variables
payment = round(((_vehicleindex + 1)*10) / _cargoweight);
player setVariable ["Payment", payment, false];
player setVariable ["hasMission", true, false];
player setVariable ["Vehicle", _selectedvehicle, false];
player setVariable ["timeStarted", time, false];


//gets nearest system map marker for vehicle spawn
_referencePos = getPosWorld player; 
_sortedByRange = [allMapMarkers,[],{_referencePos distanceSqr getMarkerPos _x},"ASCEND"] call BIS_fnc_sortBy; 
private _nearestMarker = _sortedByRange select 0;
_selectedvehicle createVehicle (getMarkerPos _nearestMarker);//creates vehicle

_objects = nearestObjects [player, [_selectedvehicle], 50]; 
{_x setVariable ["hasMission", true, false];}foreach _objects;
hintSilent parseText format ["<t align='center'><t color='#329932'><t size='2.2'>Success</t></t></t><br/><br/>Make your way to %1", _selecteddesination];
closeDialog 2;
