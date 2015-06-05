private ["_objs"];
_objs = [
	["Land_Amphitheater_F",[23601.1,18012.2,0.03531],0,[[0,1,0],[0,0,1]],false],
	["Land_Amphitheater_F",[23589.3,18003.6,0],280.432,[[-0.98347,0.181069,0],[0,0,1]],false],
	["Land_Amphitheater_F",[23595.7,17990.2,-0.316746],202.295,[[-0.379376,-0.925243,0],[-0,0,1]],false],
	["Land_Amphitheater_F",[23611.7,18002.6,0],79.7727,[[0.984111,0.177554,0],[0,0,1]],false],
	["Land_Amphitheater_F",[23606.8,17991.5,0],139.295,[[0.652165,-0.758077,0],[0,-0,1]],false],
	["Transport_C_EPOCH",[23600.6,17996.2,1.79779],180,[[3.82137e-015,4.37114e-008,1],[8.74228e-008,1,-4.37114e-008]],false],
	["Transport_C_EPOCH",[23597.8,17997.3,1.79779],210,[[2.18557e-008,3.78552e-008,1],[0.5,0.866025,-4.37114e-008]],false],
	["Transport_C_EPOCH",[23603.2,17997.1,1.79779],150,[[-2.18557e-008,3.78552e-008,1],[-0.5,0.866026,-4.37114e-008]],false],
	["Campfire_burning_F",[23600.6,17996.2,-0.2044],0,[[0,1,0],[0,0,1]],false],
	["Land_Grave_obelisk_F",[23600.6,17996.2,-4.29642],0,[[0,1,0],[0,0,1]],false],
	["Land_Grave_obelisk_F",[23603.2,17997.1,-4.29642],150,[[0.5,-0.866026,0],[0,-0,1]],false],
	["Land_Grave_obelisk_F",[23597.8,17997.3,-4.29642],210,[[-0.5,-0.866025,0],[-0,0,1]],false],
	["Land_Sign_WarningMilitaryArea_F",[23600.1,18012.4,6.5],0,[[0,1,0],[0,0,1]],false]
];

{
	private ["_obj"];
	_obj = createVehicle [_x select 0, [0,0,0], [], 0, "CAN_COLLIDE"];
	if (_x select 4) then {
		_obj setDir (_x select 2);
		_obj setPos (_x select 1);
	} else {
		_obj setPosATL (_x select 1);
		_obj setVectorDirAndUp (_x select 3);
	};
} foreach _objs;