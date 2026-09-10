// Compile TFAR relevant functions
bravo_f3_mod_fnc_tfr_addRadios = compileFinal preprocessFileLineNumbers "\bravo_f3_mod\functions\radios\tfr\fn_tfr_addRadios.sqf";

if hasInterface then { execVM "\bravo_f3_mod\functions\radios\tfr\tfr_clientInit.sqf"; };