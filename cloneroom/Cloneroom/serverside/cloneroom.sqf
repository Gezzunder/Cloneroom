private ["_objs","_respawnwest","_objects","_transports","_final","_cc","_agent"];
_deftrans = getArray(configFile >> "CfgEpoch" >> worldname >> "telePos");//load array with Altis.h telePos
_respawnwest=getMarkerPos "respawn_west";
if(count _deftrans > 0)then{waitUntil {sleep 1;(count(nearestObjects [_respawnwest, ["Transport_C_EPOCH"], 30]) == count _deftrans)};};//wait until they're on the map
_objects = nearestObjects [_respawnwest, [], 35];
if(count _objects > 0)then{ //delete the default debug box
	{
		if(typeOf _x != "Transport_C_EPOCH") then {
			deleteVehicle _x;
		};
	}forEach _objects;
};

_protection=createVehicle["ProtectionZone_Invisible_F",_respawnwest,[],0,"CAN_COLLIDE"];//replace the deleted one, simpler than excluding it above

_transports = [];
{
_transports pushBack nearestObject(_x select 1) //grab the transport objects
}forEach _deftrans;

_final = [
	[[23595.3,18004.8,1.33824],-45,[[3.09086e-008,-3.09086e-008,1],[0.707107,-0.707107,-4.37114e-008]]],// Tell 'em where to go [[pos],dir[[VectorDir],[VectorUp]]]
	[[23593,18002.6,1.33824],-45,[[3.09086e-008,-3.09086e-008,1],[0.707107,-0.707107,-4.37114e-008]]],
	[[23590.8,18000.3,1.33824],-45,[[3.09086e-008,-3.09086e-008,1],[0.707107,-0.707107,-4.37114e-008]]],
	[[23606.7,18004.7,1.38147],45,[[-3.09086e-008,-3.09086e-008,1],[-0.707107,-0.707107,-4.37114e-008]]],
	[[23609,18002.4,1.38147],45,[[-3.10227e-008,-3.07942e-008,1],[-0.709716,-0.704488,-4.37114e-008]]],
	[[23611.3,18000.2,1.38147],45,[[-3.09086e-008,-3.09086e-008,1],[-0.707107,-0.707107,-4.37114e-008]]]
];

_cc = -1;
{
	_cc=_cc+1;
	_x setDir ((_final select _cc) select 1);
	_x setPosATL ((_final select _cc) select 0);
	_x setVectorDirAndUp ((_final select _cc) select 2);
	_x addAction [format["%1",_cc], "",[],95,false];
} foreach _transports; //move the transporters
//add some window dressing...
_objs = [
	["",[0,0,0],0,[[0,1,0],[0,0,1]],false],
	["Land_GH_Pool_F",[23598.1,17991,0.968507],0,[[0,1,0],[0,0,1]],false],
	["Land_Dome_Big_F",[23599,17991.2,0],0,[[0,1,0],[0,0,1]],false],
	["clone_female_static_F",[23600.8,17994.4,1.6219],180,[[-8.74228e-008,-1,0],[-0,0,1]],false],
	["clone_male_static_F",[23605.8,18011,1.43362],0,[[0,1,0],[0,0,1]],false],
	["clone_male_static_F",[23590.3,18011.1,1.43362],0,[[0,1,0],[0,0,1]],false],
	["clone_empty_static_F",[23610.7,18005.4,2.69713],138.491,[[-0.12816,0.0877431,0.987864],[-0.650862,0.744123,-0.150533]],false],
	["CinderWall_EPOCH",[23605,18013.1,1.33761],0,[[0,1,0],[0,0,1]],false],
	["CinderWall_EPOCH",[23600.4,18013.1,1.33761],0,[[0,1,0],[0,0,1]],false],
	["CinderWall_EPOCH",[23595.8,18013.1,1.33761],0,[[0,1,0],[0,0,1]],false],
	["CinderWall_EPOCH",[23591.1,18013.1,1.33761],0,[[0,1,0],[0,0,1]],false],
	["CinderWall_EPOCH",[23609.4,18011.2,1.33761],45,[[0.707107,0.707107,0],[0,0,1]],false],
	["CinderWall_EPOCH",[23612.7,18008,1.33761],45,[[0.707107,0.707107,0],[0,0,1]],false],
	["CinderWall_EPOCH",[23615.9,18004.7,1.33761],45,[[0.707107,0.707107,0],[0,0,1]],false],
	["CinderWall_EPOCH",[23619.2,18001.5,1.33761],45,[[0.707107,0.707107,0],[0,0,1]],false],
	["CinderWall_EPOCH",[23620.5,17997.6,1.33761],90,[[1,-4.37114e-008,0],[0,-0,1]],false],
	["CinderWall_EPOCH",[23620.5,17993,1.33761],90,[[1,-4.37114e-008,0],[0,-0,1]],false],
	["CinderWall_EPOCH",[23620.5,17988.4,1.33761],90,[[1,-4.37114e-008,0],[0,-0,1]],false],
	["CinderWall_EPOCH",[23620.5,17983.8,1.33761],90,[[1,-4.37114e-008,0],[0,-0,1]],false],
	["CinderWall_EPOCH",[23618.7,17979.9,1.33761],135.102,[[0.705847,-0.708365,0],[0,-0,1]],false],
	["CinderWall_EPOCH",[23615.5,17976.7,1.33761],135.102,[[0.705847,-0.708365,0],[0,-0,1]],false],
	["CinderWall_EPOCH",[23612.2,17973.4,1.33761],135.102,[[0.705847,-0.708365,0],[0,-0,1]],false],
	["CinderWall_EPOCH",[23609,17970.2,1.33761],135.102,[[0.705847,-0.708365,0],[0,-0,1]],false],
	["CinderWall_EPOCH",[23604.9,17968.6,1.33761],180,[[-8.74228e-008,-1,0],[-0,0,1]],false],
	["CinderWall_EPOCH",[23600.3,17968.6,1.33761],180,[[-8.74228e-008,-1,0],[-0,0,1]],false],
	["CinderWall_EPOCH",[23595.6,17968.6,1.33761],180,[[-8.74228e-008,-1,0],[-0,0,1]],false],
	["CinderWall_EPOCH",[23591.1,17968.6,1.33761],180,[[-8.74228e-008,-1,0],[-0,0,1]],false],
	["CinderWall_EPOCH",[23587.2,17970.2,1.33761],225,[[-0.707107,-0.707107,0],[-0,0,1]],false],
	["CinderWall_EPOCH",[23583.9,17973.5,1.33761],225,[[-0.707107,-0.707107,0],[-0,0,1]],false],
	["CinderWall_EPOCH",[23580.7,17976.7,1.33761],225,[[-0.707107,-0.707107,0],[-0,0,1]],false],
	["CinderWall_EPOCH",[23577.4,17980,1.33761],225,[[-0.707107,-0.707107,0],[-0,0,1]],false],
	["CinderWall_EPOCH",[23575.6,17984.3,1.33761],270,[[-1,4.88762e-007,0],[0,0,1]],false],
	["CinderWall_EPOCH",[23575.6,17988.9,1.33761],270,[[-1,4.88762e-007,0],[0,0,1]],false],
	["CinderWall_EPOCH",[23575.7,17993.5,1.33761],270,[[-1,4.88762e-007,0],[0,0,1]],false],
	["CinderWall_EPOCH",[23575.7,17998.1,1.33761],270,[[-1,4.88762e-007,0],[0,0,1]],false],
	["CinderWall_EPOCH",[23577.4,18002.1,1.33761],315,[[-0.707107,0.707107,0],[0,0,1]],false],
	["CinderWall_EPOCH",[23580.7,18005.3,1.33761],315,[[-0.707107,0.707107,0],[0,0,1]],false],
	["CinderWall_EPOCH",[23583.9,18008.6,1.33761],315,[[-0.707107,0.707107,0],[0,0,1]],false],
	["CinderWall_EPOCH",[23587.2,18011.8,1.33761],315,[[-0.707107,0.707107,0],[0,0,1]],false],
	["PlotPole_EPOCH",[23600.8,17994.4,4.75444],0,[[0,1,0],[0,0,1]],false],
	["PlotPole_EPOCH",[23590.3,18011,4.62296],180,[[-8.74228e-008,-1,0],[-0,0,1]],false],
	["PlotPole_EPOCH",[23605.8,18011,4.62296],180,[[-8.74228e-008,-1,0],[-0,0,1]],false],
	["Land_Device_disassembled_F",[23597.4,17976.3,0],0,[[0,1,0],[0,0,1]],false],
	["Land_Pallet_MilBoxes_F",[23592.2,17976.1,-0.00417566],340.671,[[-0.330992,0.943634,0],[0,0,1]],false],
	["Land_Pallet_MilBoxes_F",[23592.2,17978.1,-0.00306368],179.182,[[0.0142762,-0.999898,0],[0,-0,1]],false],
	["Land_PaperBox_open_full_F",[23602.7,17975,0],0,[[0,1,0],[0,0,1]],false],
	["Land_PaperBox_open_empty_F",[23600.2,17975,0],0,[[0,1,0],[0,0,1]],false],
	["MapBoard_seismic_F",[23594.6,17979,-0.042783],290.966,[[-0.933793,0.357814,0],[0,0,1]],false],
	["Land_PCSet_01_mouse_F",[23600.8,17979.3,0.787242],37.7387,[[0.612062,0.79081,0],[0,0,1]],false],
	["Land_SatellitePhone_F",[23602.3,17980.1,1.37139],0.306828,[[0.00535506,0.999986,0],[0,0,1]],false],
	["Land_PalletTrolley_01_yellow_F",[23592.8,17976.3,0.0236833],158.932,[[0.359475,-0.933155,0],[0,-0,1]],false],
	["Land_PortableLight_double_F",[23588.3,17980.2,1.39556],320.727,[[-0.633016,0.774139,0],[0,0,1]],false],
	["Land_PortableLight_double_F",[23604.6,17980.6,1.39556],47.5569,[[0.737948,0.674858,0],[0,0,1]],false],
	["Land_Workbench_01_F",[23583.9,17994,0.875767],0,[[0,1,0],[0,0,1]],false],
	["Land_WeldingTrolley_01_F",[23585.1,17992.6,0.874303],314.898,[[-0.708364,0.705847,0],[0,0,1]],false],
	["Land_dp_transformer_F",[23583.8,17985.1,1.38966],0,[[0,1,0],[0,0,1]],false],
	["Land_PowerGenerator_F",[23585.4,17989.2,0.887681],0,[[0,1,0],[0,0,1]],false],
	["Land_TTowerSmall_1_F",[23583.8,17982.9,0],0,[[0,1,0],[0,0,1]],false],
	["Land_Medevac_house_V1_F",[23609.5,17985.4,1.03615],135,[[0.707107,-0.707107,0],[0,-0,1]],false],
	["Land_TreeBin_F",[23607,18004.8,0.363293],45,[[0.707107,0.707107,0],[0,0,1]],false],
	["Land_TreeBin_F",[23609.3,18002.6,0.363293],45,[[0.707107,0.707107,0],[0,0,1]],false],
	["Land_TreeBin_F",[23611.6,18000.4,0.363293],45,[[0.707107,0.707107,0],[0,0,1]],false],
	["Land_TreeBin_F",[23590.7,18000.4,0.40529],45,[[0.707107,0.707107,0],[0,0,1]],false],
	["Land_TreeBin_F",[23592.9,18002.8,0.395226],45,[[0.707107,0.707107,0],[0,0,1]],false],
	["Land_TreeBin_F",[23595.1,18005,0.379211],45,[[0.707107,0.707107,0],[0,0,1]],false],
	["UserTexture1m_F",[23595.3,18004.8,3],-45,[[-0.707107,0.707107,0],[0,0,1]],false,true,"\x\addons\cloneroom\art\map3.paa"],
	["UserTexture1m_F",[23593.1,18002.6,3],315,[[-0.707107,0.707107,0],[0,0,1]],false,true,"\x\addons\cloneroom\art\map2.paa"],
	["UserTexture1m_F",[23590.8,18000.3,3],315,[[-0.707107,0.707107,0],[0,0,1]],false,true,"\x\addons\cloneroom\art\map1.paa"],
	["UserTexture1m_F",[23606.8,18004.7,3],45,[[0.707107,0.707107,0],[0,0,1]],false,true,"\x\addons\cloneroom\art\map4.paa"],
	["UserTexture1m_F",[23609.1,18002.4,3],45,[[0.707107,0.707107,0],[0,0,1]],false,true,"\x\addons\cloneroom\art\map5.paa"],
	["UserTexture1m_F",[23611.3,18000.2,3],45,[[0.707107,0.707107,0],[0,0,1]],false,true,"\x\addons\cloneroom\art\map6.paa"],
	["UserTexture10m_F",[23598.2,17968.9,4.68135],180,[[-8.74228e-008,-1,0],[-0,0,1]],false,true,"\x\addons\cloneroom\art\splash.paa"],
	["UserTexture10m_F",[23598.3,18012.8,4.72646],0,[[0,1,0],[0,0,1]],false,true,"\x\addons\cloneroom\art\splash.paa"]
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
	if (_x select 5) then {
	_obj setObjectTextureGlobal [0,_x select 6];
	};
} foreach _objs;
//throw in a surprise...
_agent=createAgent["Epoch_Sapper_F",[23609.3,17984.6,1.66299],[],0,"CAN_COLLIDE"];
_agent setDir 317.352;
diag_log "***************  cloneroom completed  *********************";