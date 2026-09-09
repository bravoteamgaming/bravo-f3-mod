// F3 - EarPlugs
// Credits: Please see the F3 online manual http://www.ferstaberinde.com/f3/en/
// ====================================================================================

if (!hasInterface || playerSide == sideLogic) exitWith {};
if (!isDedicated && (isNull player)) then {waitUntil {sleep 0.1; !isNull player};};

// SET GLOBAL VARIABLES
// Default values
BRAVO_F3_MOD_KEY_EARPLUGS =  59; // The action key to toggle the earplugs.
BRAVO_F3_MOD_ACTIONKEY_EARPLUGS = "F1"; // The action key name to toggle the earplugs.

// SCRIPTSIDE
BRAVO_F3_MOD_EARPLUGS = false;

BRAVO_F3_MOD_KEYDOWN_EARPLUG = {
	_key = _this#1;
	_handeld = false;
	if(_key == BRAVO_F3_MOD_KEY_EARPLUGS) then {
		if (BRAVO_F3_MOD_EARPLUGS) then { 
			// Disable the earplugs
			BRAVO_F3_MOD_EARPLUGS = false; 
			missionNameSpace setVariable ["ACE_Hearing_disableVolumeUpdate", false];
			1 fadeSound 1;
			titleText ["You've removed your earplugs.", "PLAIN DOWN", 2];
		} else { 
			// Enable the earplugs
			BRAVO_F3_MOD_EARPLUGS = true;
			missionNameSpace setVariable ["ACE_Hearing_disableVolumeUpdate", true];
			1 fadeSound 0.20; 
			titleText ["You've inserted your earplugs.", "PLAIN DOWN", 2];
		};
		//_handeld = true;  // Remove to stop this interfering with other commands.
	};
	_handeld;
};

// ADD BRIEFING SECTION
// A section is added to the player's briefing to inform them about name tags being available.
//player removeDiaryRecord ["Diary", "Ear Plugs"];
private _ear = player createDiaryRecord ["Diary", ["Ear Plugs", format["
	<br/><font size='18' color='#80FF00'>EAR PLUGS</font><br/>%1 in the mission by pressing <font color='#00FFFF'>%2</font>.<br/><br/>When enabled, these will isolate ambient combat and vehicle sounds while leaving voice communications clear.",
	if (isClass(configFile >> "CfgPatches" >> "ace_main")) then { "In addition to ACE Earplugs, you may equip a set of <execute expression=""['',59] spawn BRAVO_F3_MOD_KEYDOWN_EARPLUG;"">Enhanced Ear Plugs</execute>" } else { "Toggle <execute expression=""['',59] spawn BRAVO_F3_MOD_KEYDOWN_EARPLUG;"">Ear Plugs</execute>" },
	BRAVO_F3_MOD_ACTIONKEY_EARPLUGS
]]];

// ADD EVENTHANDLERS
// After the mission has initialized eventhandler is added to the register keypresses.
sleep 0.1;

waitUntil {!isNull (findDisplay 46)}; // Make sure the display we need is initialized

if (!isNil "bravo_f3_mod_eh_earplug") then { (findDisplay 46) displayRemoveEventHandler ["KeyDown", bravo_f3_mod_eh_earplug]; };
bravo_f3_mod_eh_earplug = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this spawn BRAVO_F3_MOD_KEYDOWN_EARPLUG"];