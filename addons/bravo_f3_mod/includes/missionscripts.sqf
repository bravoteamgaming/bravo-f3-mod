player addRating 100000;

[player, "NoVoice"] remoteExec ["setSpeaker", -2, format["NoVoice_%1", netId player]]; // No player voice

showSubtitles false; // No radio calls

"Group" setDynamicSimulationDistance 1200;

"Vehicle" setDynamicSimulationDistance 2500;

if (!isNil "bravo_f3_mod_param_engineArtillery") then {
	if (bravo_f3_mod_param_engineArtillery == 0) then {
		enableEngineArtillery false; 	// Disable Artillery Computer
	};
};
onMapSingleClick "_shift";	// Disable Map Clicking

// SHARED SCRIPTS - Both client and server
bravo_f3_mod_sqf_safe = spawn bravo_f3_mod_fnc_safeStart; 	// F3 - Safe Start
// ====================================================================================
// SERVER ONLY SCRIPTS!
if isServer then {
	spawn bravo_f3_mod_fnc_setGroupIDs;
	spawn bravo_f3_mod_fnc_stayInVehicle;
	
	// Clear DCd player bodies at start
	[] spawn {
		sleep 0.1;
		["init.sqf",format["Mission Beginning - P: %1 A: %2", count allPlayers, allPlayers select {alive _x}],"INFO"] call bravo_f3_mod_fnc_logIssue;
		{if (_x isKindOf "Man" && (_x getVariable["bravo_f3_mod_var_assignGear",""] != "")) then {deleteVehicle _x}} forEach allDead;
	};
	
	// Performance Counter / Debug
	[] spawn {
		sleep 1;
		spawn bravo_f3_mod_fnc_debug;
		waitUntil {
			sleep 30;
			diag_log text format ["[F3] PERFORMANCE --- %5 --- Time: %1 --- Server FPS: %2 Min: %3 --- Players: %4",[(round time)] call BIS_fnc_secondsToString, round (diag_fps), round (diag_fpsmin), count allPlayers, missionName];
			!isNil "bravo_f3_mod_var_stopLogging";
		};
	};
	missionNamespace setVariable ["bravo_f3_mod_var_missionLoaded", true, true];
	["init.sqf","Mission Loaded","INFO"] call bravo_f3_mod_fnc_logIssue;
};
// ====================================================================================
// CLIENT ONLY SCRIPTS - Typically controlled via MISSION PARAMETERS.
if hasInterface then { 
	bravo_f3_mod_sqf_draw = spawn bravo_f3_mod_fnc_drawAO;
	bravo_f3_mod_sqf_intro = spawn bravo_f3_mod_fnc_clientIntro;
	bravo_f3_mod_sqf_ftmk = spawn bravo_f3_mod_fnc_setTeamColours;
	bravo_f3_mod_sqf_grpm = spawn bravo_f3_mod_fnc_setLocGroupMkr;
	bravo_f3_mod_sqf_third = spawn bravo_f3_mod_fnc_thirdPerson;
	bravo_f3_mod_sqf_vas = spawn bravo_f3_mod_fnc_vas;
	bravo_f3_mod_sqf_jip = spawn bravo_f3_mod_fnc_teleportOption;
	bravo_f3_mod_sqf_brief = spawn bravo_f3_mod_fnc_briefing;
	bravo_f3_mod_sqf_orbat = spawn bravo_f3_mod_fnc_showOrbat;
	bravo_f3_mod_sqf_gearSel = spawn bravo_f3_mod_fnc_showLoadoutSelect;
	bravo_f3_mod_sqf_earp = spawn bravo_f3_mod_fnc_earplugs;
	bravo_f3_mod_sqf_names = spawn bravo_f3_mod_fnc_nametags;
	bravo_f3_mod_sqf_ftmrk = spawn bravo_f3_mod_fnc_initFTMarkers;
	bravo_f3_mod_sqf_skill = spawn bravo_f3_mod_fnc_setAISkill;
};