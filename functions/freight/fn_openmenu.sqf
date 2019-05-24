createDialog "airfreight";
waitUntil {!(isNull(findDisplay 1234))}; //wait until display is open

//array of listbox items
_names = ["I_C_Heli_Light_01_civil_F","B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_black_F","O_Heli_Transport_04_box_black_F","O_Heli_Transport_04_covered_black_F","I_Heli_Transport_02_F"];
_desintations = ["Kavala Air Garage","Molos Airfield","Athira Airport","Therisa Airfield"];
_cargo = ["Apples","Peaches","Beer","Whiskey"];

//set values and data in listbox for all items
{lbAdd [1700, _x];}forEach _desintations;
{lbAdd [1800, _x];}forEach _cargo;
{
	_vehicleclass = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
	if (!(_vehicleclass isEqualTo "")) then {
		lbAdd [1500, _vehicleclass];
		lbSetData [1500, _forEachIndex, _x];
	};
} forEach _names;

lbSetCurSel [1500, 0];lbSetCurSel [1700, 0]; //set cursor selection

while {!(isNull(findDisplay 1234))} do {
	_index = lbCurSel 1500;
	_destinationindex = lbCurSel 1700;
	_cargoindex = lbCurSel 1800;
	//fix cursor selection if breaks
	if (_index == -1) then {_index = 0;lbSetCurSel [1500, 0];};
	if (_destinationindex == -1) then {_destinationindex = 0;lbSetCurSel [1700, 0];};
	if (_cargoindex == -1) then {_cargoindex = 0;lbSetCurSel [1800, 0];};

	//get values
	_selectedvehicle = lbText [1500, _index];
	_vehicleweight = (_index + 1)*10;
	_selecteddesination = lbText [1700, _destinationindex];
	_selectedcargo = lbText [1800, _cargoindex];
	_selecteddesinationloc = lbData [1700, _destinationindex];

	//private _var is faster than setting in array
	private _cargoweight = 0;
	private _price = 0;
	private _loc = "";
	//getting location of selected destination
	switch (_selecteddesination) do {
		case "Kavala Air Garage": {_loc = getPos signfour};
		case "Molos Airfield": {_loc = getPos signthree};
		case "Athira Airport": {_loc = getPos signtwo};
		case "Therisa Airfield": {_loc = getPos signone};
	};
	//setting cargoweight
	switch (_selectedcargo) do {
		case "Apples": {_cargoweight = 1;};
		case "Peaches": {_cargoweight = 2;};
		case "Beer": {_cargoweight = 4;};
		case "Whiskey": {_cargoweight = 6;};
	};
	_overallamount = round(_vehicleweight / _cargoweight);
	_payment = round(((_index + 1)*10));
	_text = parseText format ["<t align='center'><t size='2'>Job Details</t></t><br/><br/><br/><t align='left'>Vehicle: %1</t><br/><t align='left'>Vehicle Max Weight: %2</t><br/><t align='left'>Desination: %3</t><br/><br/><t align='left'>Pojected Payment: £%4</t>", _selectedvehicle, _vehicleweight, _selecteddesination, _payment];
	((uiNamespace getVariable "airfreight_dialog") displayCtrl 1100) ctrlSetStructuredText _text;
	sleep 0.1;
};