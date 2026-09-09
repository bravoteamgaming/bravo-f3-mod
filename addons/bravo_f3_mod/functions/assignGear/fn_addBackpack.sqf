// Zeus - Checks if a backpack is valid and if so adds it.
// ====================================================================================
params["_toCheck","_refUnit"];

_toCheck = [_toCheck] call bravo_f3_mod_fnc_arrayCheck;

if (!isNil "_toCheck" && {isClass (configFile >> "CfgVehicles" >> _toCheck)}) then {
	removeBackpack _refUnit;
	_refUnit addBackpack _toCheck;
	if (count backpackItems _refUnit > 0) then { clearMagazineCargoGlobal (unitBackpack _refUnit); };
} else {
	["fn_addBackpack.sqf",format["Backpack (%1) not found for %2.",_toCheck,_refUnit]] call bravo_f3_mod_fnc_logIssue;
};