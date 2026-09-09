// F3 Zeus Support  - Initialization
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/

if ((getNumber (missionConfigFile >> "bravo_is_f3_mission")) != 1) exitWith{};
if !isServer exitWith {};

["fn_zeusInit.sqf","Started","DEBUG"] call bravo_f3_mod_fnc_logIssue;

bravo_f3_mod_fnc_zeusCreate = {
	params ["_curatorID", ["_target", "objNull"]];
	waitUntil { (missionNamespace getVariable ["bravo_f3_mod_var_missionLoaded", false]) };
	
	if (!isNull (missionNamespace getVariable [_curatorID, objNull])) exitWith {};
	
	_curator = (createGroup sideLogic) createUnit ["ModuleCurator_F",[0,0,0],[],0,""];
	_curator setVehicleVarName _curatorID;
	missionNamespace setVariable [_curatorID, _curator];

	_curator setVariable ["ShowNotification", FALSE, TRUE];
	_curator setVariable ["Addons", 3, TRUE]; // 1 - Mission, 2 - Official, 3 - Unofficial
	_curator setVariable ["Owner", _target];  
	_curator setVariable ["BIS_fnc_initModules_activate", TRUE];
	
	[_curator, [-1, -2, 0]] call bis_fnc_setCuratorVisionModes;
	
	_curator setCuratorWaypointCost 0;
	{ _curator setCuratorCoef [_curatorID, 0] } forEach ["place", "edit", "delete", "destroy", "group", "synchronize"];

	["fn_zeusInit.sqf",format["Curator Assigned (%1 - %2)", _curatorID, _target], "INFO"] call bravo_f3_mod_fnc_logIssue;
	
	_curator
};

// Create free in-game curator, assign to admin by default.
["bravo_f3_mod_ZeusCurator", "#AdminLogged"] spawn bravo_f3_mod_fnc_zeusCreate;

// Set up author for Zeus
if !(isNil "bravo_f3_mod_var_AuthorUID") then {
	["bravo_f3_mod_ZeusCuratorAuthor",bravo_f3_mod_var_AuthorUID] spawn bravo_f3_mod_fnc_zeusCreate;	
} else {
	["bravo_f3_mod_ZeusCuratorAuthor","76561197970695190"] spawn bravo_f3_mod_fnc_zeusCreate;	
};