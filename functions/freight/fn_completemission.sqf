//vehicle check
_vehicle = player getVariable ["Vehicle", 0];
_objects = nearestObjects [player, [_vehicle], 50]; 
if(count(_objects) isEqualTo 0) exitWith {
	hintSilent parseText "<t align='center'><t color='#ff4c4c'><t size='2.2'>Error</t></t></t><br/><br/> You need to use the assigned vehicle..";
};

//gets players stats
_money = player getVariable ["Money", 0];
_payment = player getVariable ["Payment", 0];
_timestarted = player getVariable ["timeStarted", 0];
(_this select 0) removeAction 1;//removes complete mission from sign

_timedifference = time - _timestarted;
_damage = 0;_damagecost = 0;_success = "";_newmoney = 0;_oops = "";_timebonus = 0;//used in and out of scopes

//deletes vehicle
{
	_var = _x getVariable ["hasMission", false];
	if (_var) then {
		_damage = (damage _x);
		deleteVehicle _x;
	} 
}foreach _objects;

//checks vehicle damage for time/repair bonus 
if (_timedifference > 170) then {_timebonus isEqualTo 0.25;};
if (_damage > 0.0) then {
	_damagecost = _payment / (_damage * 100);
	_newmoney = ((_money + _payment) - _damagecost)*_timebonus;
	_oops = format ["<br/><br/><t align='center'><t color='#ff4c4c'><t size='2.2'>Damage Report</t></t></t><br/><br/>Repairs costed you £%1",_damagecost];
} else {
	_newmoney = (_money + _payment)*(1.25+_timebonus);
	_bonus = (_money + _payment)*(0.25+_timebonus);
	_oops = format ["<br/><br/><t align='center'><t color='#329932'><t size='2.2'>Bonus</t></t></t><br/>£%1", _bonus];
};


hintSilent parseText format ["<t align='center'><t color='#329932'><t size='2.2'>Success</t></t></t><br/><br/> You have made £%1<br/>You now have £%2%3", _payment,_newmoney,_oops];
//sets new stats
player setVariable ["Money", _newmoney, false];
player setVariable ["hasMission", false, false];
player setVariable ["Payment", 0, false];
player setVariable ["timeStarted", 0, false];
