if (time < 1) exitWith { systemChat "[ACRE] Wait until the mission has started to reinitialize your radio." };

private _fRadiosShortRange = (missionNamespace getVariable ["bravo_f3_mod_radios_settings_riflemanRadio",["all"]]) + (missionNamespace getVariable ["bravo_f3_mod_radios_settings_personalRadio",["leaders"]]);
private _fRadiosLongRange = missionNamespace getVariable ["bravo_f3_mod_radios_settings_longRangeUnits",["leaders"]];

private _radioText = format["[ACRE] Running: %1 - Give SR: %2  LR: %3", 
	[] call acre_api_fnc_isInitialized,
	((player getVariable ["bravo_f3_mod_var_assignGear", "r"]) in _fRadiosShortRange || "all" in _fRadiosShortRange || (player == leader (group player) && "leaders" in _fRadiosShortRange)),
	((player getVariable ["bravo_f3_mod_var_assignGear", "r"]) in _fRadiosLongRange || "all" in _fRadiosLongRange || (player == leader (group player) && "leaders" in _fRadiosLongRange))
];

systemChat _radioText;
diag_log text _radioText;

[] execVM "\bravo_f3_mod\functions\radios\acre2\acre2_init.sqf";

systemChat "[ACRE] Radio re-initialised.";