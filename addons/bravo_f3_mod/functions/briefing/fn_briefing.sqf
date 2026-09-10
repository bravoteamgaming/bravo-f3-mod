// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if !hasInterface exitWith {};
if (!isDedicated && (isNull player)) then {waitUntil {sleep 0.1; !isNull player};};

// Wait until server has set parameters.
waitUntil{ !isNil "bravo_f3_mod_var_missionLoaded" };

// DECLARE VARIABLES AND FUNCTIONS

private ["_unitSide","_incAdmin","_uidList"];

["briefing.sqf",format["Starting for: %1 (%2)",player,side player],"DEBUG"] call bravo_f3_mod_fnc_logIssue;

// DETECT PLAYER SIDE
// The following code detects what side the player's slot belongs to, and stores
// it in the private variable _unitSide

_incAdmin = false;
_uidList = getArray (missionConfigFile >> "enableDebugConsole");

// BRIEFING: ADMIN
// The following block of code executes only if the player is the current host
// it automatically includes a file which contains the appropriate briefing data.

// Get Author ID if present
if (!isNil "bravo_f3_mod_var_AuthorUID") then {
	_uidList pushBackUnique bravo_f3_mod_var_AuthorUID;
};

// Check if player is authorised admin (or 2600K) ;)
if ((getPlayerUID player) in _uidList) then { _incAdmin = true;};

if (serverCommandAvailable "#kick" || !isMultiplayer || _incAdmin) then {
	#include "bravo_f3_mod_briefing_admin.sqf";
	["briefing.sqf","Briefing for admin included","DEBUG"] call bravo_f3_mod_fnc_logIssue;
};

player createDiaryRecord ["Diary", ["",""]];

//player removeDiaryRecord ["Diary", "Administration"];
//player removeDiaryRecord ["Diary", "Mission"];

if (isNil "bravo_f3_mod_param_CasualtiesCap") then { bravo_f3_mod_param_CasualtiesCap = 100 }; // Set CasCap if author did not.

// The code below creates the administration sub-section of notes.
_adm = player createDiaryRecord ["Diary", ["Administration",[] call bravo_f3_mod_fnc_fillAdministration]];

// Edit the if statement for different faction briefs.

if (side group player != CIVILIAN) then {
	// The code below creates the execution sub-section of notes.
	_exe = player createDiaryRecord ["Diary", ["ZGM Notes",format["
	<br/><font size='18' color='#80FF00'>CREDITS</font>
	<br/>Created by <font color='#FF0080'>BlackFire</font color>
	<br/>
	<br/>This is a sub Template mainly for ZGM style of missions, using a modified 26K Template. A custom-made mission for BRAVO TEAM.
	<br/>Bravo Team Team-speak: 81.110.111.161 / Password: milkfloat
	<br/>",
	if (bravo_f3_mod_param_CasualtiesCap > 0 && bravo_f3_mod_param_CasualtiesCap < 100) then { format["Ensure casualties are kept below %1 and %1&#37; of your force is not incapacitated.<br/>", bravo_f3_mod_param_CasualtiesCap] } else { "" },
	(((vehicles select { side _x getFriend side group player < 0.6 && !(_x isKindOf "staticWeapon" || _x isKindOf "static") && count crew _x > 0}) apply {  getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName") }) call BIS_fnc_consolidateArray) apply { format["%2x <font color='#00FFFF'>%1</font><br/>", _x#0, _x#1] } joinString "",
	format["%1x <font color='#00FFFF'>Infantry Groups</font><br/>", { side _x getFriend side group player < 0.6 && count units _x >= 3 && vehicle leader _x == leader _x} count allGroups],
	((allUnits select { side _x getFriend side group player < 0.6 && count crew _x > 0 && (vehicle _x != _x || secondaryWeapon _x != "") && (getarray(configFile >> "CfgVehicles" >> typeOf vehicle _x >> "threat")#1 >= 0.9 || getarray(configFile >> "CfgVehicles" >> typeOf vehicle _x >> "threat")#2 == 1) } apply {  getText (configFile >> "CfgVehicles" >> typeOf (if (secondaryWeapon _x isEqualTo "") then { vehicle _x } else { _x }) >> "displayName") }) call BIS_fnc_consolidateArray) apply { format["%2x <font color='#00FFFF'>%1</font><br/>", _x#0, _x#1] } joinString ""
	]]];
};

if (fileExists "f3\f3_mission_briefing.sqf") then {
	call compile preprocessFileLineNumbers "f3\f3_mission_briefing.sqf";
};

player createDiaryRecord ["Diary", ["",""]];

// Default non-commanders to group, commanders to side.
if (leader player == player) then { setCurrentChannel 1 } else { setCurrentChannel 3 };

// Automatically select Mission - Credits: Larrow
waitUntil {!isNull (uiNamespace getVariable ["RscDiary", displayNull])};

_fnc_selectIndex = {
	params[ "_ctrl", "_name" ];

	for "_i" from 0 to ( lnbSize _ctrl select 0 ) -1 do {
		if ( _ctrl lnbText [ _i, 0 ] == _name ) exitWith { _ctrl lnbSetCurSelRow _i };
	};
};

[uiNamespace getVariable "RscDiary" displayCtrl 1001, "Briefing" ] call _fnc_selectIndex;
[uiNamespace getVariable "RscDiary" displayCtrl 1002, "Mission" ] call _fnc_selectIndex;

// Handle any authors not using the F3 assignGear script
[] spawn {
	uiSleep 2;
	if !(player getVariable ["bravo_f3_mod_var_assignGear_done", false]) then {
		["briefing.sqf","Gear was forced to finish for player","DEBUG"] call bravo_f3_mod_fnc_logIssue;
		player setVariable ["bravo_f3_mod_var_assignGear_done", true];
	};
};
