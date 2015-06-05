private["_aa","_ab","_ac","_ad","_ae"];
_debugLocation=getMarkerPos "respawn_west";
_debugLocation set[2,0];
_debug=createVehicle["Debug_static_F",_debugLocation,[],0,"CAN_COLLIDE"];
_protection=createVehicle["ProtectionZone_Invisible_F",_debugLocation,[],0,"CAN_COLLIDE"];
for "_i" from 1 to 4 do
	{
	_class=["clone_empty_static_F","clone_male_static_F","clone_female_static_F"]select(floor(random 3));
	_debug1=createVehicle[_class,(_debug modelToWorld(_debug selectionPosition(str _i))),[],0,"CAN_COLLIDE"];
	_debug1 setDir-90;
};
for "_i" from 5 to 8 do
	{
	_class=["clone_empty_static_F","clone_male_static_F","clone_female_static_F"]select(floor(random 3));
	_debug1=createVehicle[_class,(_debug modelToWorld(_debug selectionPosition(str _i))),[],0,"CAN_COLLIDE"];
	_debug1 setDir 90;
};
private ["_objs"];
_objs = [
	[ "Sign_Sphere25cm_F",_debugLocation,0], //so you know where respawn_west is.The following is copied from default altis.h, change {} to [] and change classnames 
	[ "Transport_C_EPOCH", [ 23600.5, 18009, 0.233421 ], 0, [ 13326.5, 14515.2, 0.16426 ] ], // Trader city 1
	[ "Transport_C_EPOCH", [ 23585.4, 18000.7, 0.233424 ], 0, [ 6192.46, 16834, 0.00154114 ] ], // Trader city 2
	[ "Transport_C_EPOCH", [ 23615.5, 18000.9, 0.233423 ], 0, [ 18451.9, 14278.1, 0.00143814 ] ] // Trader city 3
];

{
private ["_obj"];
	_obj = createVehicle [_x select 0, [0,0,0], [], 0, "CAN_COLLIDE"];
	_obj setDir (_x select 2);
	_obj setPos (_x select 1);
	_obj setPosATL (_x select 1);
} foreach _objs;

