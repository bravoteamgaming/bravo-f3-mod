// F3 - Radio Framework initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if ((getNumber (missionConfigFile >> "bravo_is_f3_mission")) != 1) exitWith{};
waitUntil{!isNil "bravo_f3_mod_var_setParams"};
if (isNil "bravo_f3_mod_param_radios") exitWith { ["fn_radio_init.sqf","No radio parameters defined - Exiting","INFO"] call bravo_f3_mod_fnc_logIssue };

waitUntil{!isNil "bravo_f3_mod_var_setGroupsIDs";};
["fn_radio_init.sqf",format["Radio Starting: %1",bravo_f3_mod_param_radios],"DEBUG"] call bravo_f3_mod_fnc_logIssue;

// Load the radio settings
if (fileExists "f3\f3_mission_radios.sqf") then {
	call compile preprocessFileLineNumbers "f3\f3_mission_radios.sqf";
};

// If any radio system selected
// Check which system to use

if (bravo_f3_mod_param_radios == 1) exitWith { [] execVM "\bravo_f3_mod\radios\tfr\tfr_init.sqf" };
if (bravo_f3_mod_param_radios == 2) exitWith { [] execVM "\bravo_f3_mod\radios\acre2\acre2_init.sqf" };

[] execVM "\bravo_f3_mod\radios\vanilla\vanilla_init.sqf";