_respawnwest=getMarkerPos "respawn_west";
_objects = nearestObjects [_respawnwest, [], 35];
_start = count _objects;
if(count _objects > 0)then{
	{
		if(typeOf _x != "Transport_C_EPOCH") then {
			_pos = getPos _x;
			_pos = [_pos select 0,_pos select 1,1];
			_dir = getDir _x;
			deleteVehicle _x;
		};
	}forEach _objects;
};
_center = "Sign_Sphere25cm_F" createVehicle _respawnwest; //shows where _respawnwest is
_center setpos _respawnwest;

