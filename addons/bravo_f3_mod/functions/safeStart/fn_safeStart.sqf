// F3 - Safe Start
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================
//	This script inits the Mission Timer and the Safe Start, has the server setup the publicVariable
//      while the client waits, sets units invincibility and displays hints, then disables it.

//Setup the variables
waitUntil{!isNil "bravo_f3_mod_var_setParams"};
if (isNil "bravo_f3_mod_param_safe_start") then {bravo_f3_mod_param_safe_start = 1;};

sleep 0.5;

// If the server time is greater than the Safe-Start time, exit.
if (time > (bravo_f3_mod_param_safe_start * 60) || bravo_f3_mod_param_safe_start < 1) exitWith {};

// BEGIN SAFE-START LOOP
// If a value was set for the mission-timer, begin the safe-start loop and turn on invincibility

if (bravo_f3_mod_param_safe_start > 0) then {
	// The server will handle the loop and notifications
	if isServer then { spawn bravo_f3_mod_fnc_safeStartLoop; };

	// Enable invincibility for players
	if hasInterface then { [true] call bravo_f3_mod_fnc_safety; };
};