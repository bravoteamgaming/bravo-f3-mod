if isDedicated exitWith{};

params ["_killed","_killer","_respawn","_respawnDelay"];

// Casualty Counter
_killed spawn {
	if (time < 30) exitWith {};
	
	sleep random 5;
	
	[group _this] remoteExecCall ["bravo_f3_mod_fnc_updateCas", 2]; // bravo_f3_mod_var_casualtyCount_[side]
};

// Save players dying gear
[_killed, [missionNamespace, "bravo_f3_mod_var_savedGear"]] call BIS_fnc_saveInventory;

if (isNil "bravo_f3_mod_param_respawn") then {bravo_f3_mod_param_respawn = 0};
if (isNil "bravo_f3_mod_var_localTickets") then { bravo_f3_mod_var_localTickets = if (bravo_f3_mod_param_respawn <= 10) then {bravo_f3_mod_param_respawn} else {0}; };

// Players sometime lose group when respawning
bravo_f3_mod_var_lastGroup = group _killed;

// Basic Spawning is set.
if (bravo_f3_mod_param_respawn in [30,60]) exitWith { 
	setPlayerRespawnTime bravo_f3_mod_param_respawn; 
};

// Player has tickets remaining.
if (bravo_f3_mod_var_localTickets > 0) exitWith {	
	setPlayerRespawnTime 20;
	bravo_f3_mod_var_localTickets = bravo_f3_mod_var_localTickets - 1;
	[format["Tickets: %1 Remaining",bravo_f3_mod_var_localTickets],0] call BIS_fnc_respawnCounter;
};

// Spawn disabled or no tickets remaining!
setPlayerRespawnTime 9999999;

// Check if Wave Spawning is required
if (bravo_f3_mod_param_respawn > 60) then {	
	// Work out time until spawning is due.
	private _respawnTime = bravo_f3_mod_param_respawn - (time mod bravo_f3_mod_param_respawn);
	// Set players spawn timer.
	setPlayerRespawnTime _respawnTime;
	// Update GUI
	[format["Reinforcements: Every %1 Minutes",round bravo_f3_mod_param_respawn / 60],0] call BIS_fnc_respawnCounter;
	// Start Spectator
	sleep 2;
	[] call bravo_f3_mod_fnc_spectateInit;
} else {
	// Hide the Spawn Counter
	sleep 1;
	_layer = "BIS_fnc_respawnCounter" call bis_fnc_rscLayer;
	_layer cutText ["", "plain"];
	// Start Spectator
	sleep 2;
	[] call bravo_f3_mod_fnc_spectateInit;
};