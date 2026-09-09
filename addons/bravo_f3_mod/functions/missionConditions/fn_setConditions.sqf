// F3 - SetWeather
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================

// RUN ONLY ON THE SERVER
// This function does never need to run on a client
if ((getNumber (missionConfigFile >> "bravo_is_f3_mission")) != 1) exitWith{};
if !isServer exitWith {};

waitUntil {!isNil "bravo_f3_mod_var_setParams"};

// Only run if TOD parameter has not been set.
if (isNil "bravo_f3_mod_var_timeOfDay") then {
	[missionNamespace getVariable ["bravo_f3_mod_param_timeOfDay",0]] call bravo_f3_mod_fnc_setTime;
	[missionNamespace getVariable ["bravo_f3_mod_param_weather",0]] call bravo_f3_mod_fnc_setWeather;
	[missionNamespace getVariable ["bravo_f3_mod_param_fog",0]] spawn bravo_f3_mod_fnc_setFog;
};