// F3 - Nametags
if (!isDedicated && (isNull player)) then { waitUntil {sleep 0.1; !isNull player} };

// Only run in MP and for valid players!
if (!isMultiplayer || !hasInterface || playerSide == sideLogic) exitWith {};


// SET GLOBAL VARIABLES
bravo_f3_mod_DIST_TAGS = 75;		// Distance to display name tags for all units around
bravo_f3_mod_KEY_TAGS =  "TeamSwitch"; // The action key to toggle the name tags. See possible keys here: http://community.bistudio.com/wiki/Category:Key_Actions

// Globally disable this script by setting a mission variable 'F_SHOW_TAGS = FALSE'.
bravo_f3_mod_SHOW_TAGS = missionNamespace getVariable ['bravo_f3_mod_SHOW_TAGS', profileNamespace getVariable ['bravo_f3_mod_SHOW_TAGS', true]]; // Draw tags (master)

bravo_f3_mod_SIZE_TAGS = profileNamespace getVariable ['bravo_f3_mod_SIZE_TAGS', 0.04]; // The size the names are displayed in
bravo_f3_mod_FONT_TAGS = profileNamespace getVariable ['bravo_f3_mod_FONT_TAGS', "PuristaBold"]; // Font for the names

bravo_f3_mod_TEAM_TAGS = profileNamespace getVariable ['bravo_f3_mod_TEAM_TAGS', true]; // Show team icons only?
bravo_f3_mod_NAME_TAGS = profileNamespace getVariable ['bravo_f3_mod_NAME_TAGS', true]; // Draw names
bravo_f3_mod_GPID_TAGS = profileNamespace getVariable ['bravo_f3_mod_GPID_TAGS', true]; // Show unit's group next to unit name (except for player's own group)
bravo_f3_mod_TYPE_TAGS = profileNamespace getVariable ['bravo_f3_mod_TYPE_TAGS', true]; // Show type of vehicle under driver's names
bravo_f3_mod_TYPE_ICON = profileNamespace getVariable ['bravo_f3_mod_TYPE_ICON', true]; // Show type of vehicle under driver's names
bravo_f3_modF_OVER_ONLY = profileNamespace getVariable ['bravo_f3_mod_OVER_ONLY', false]; // Cursor only mode

// DISABLE Tags for Regular Members
if (count (squadParams player) > 0) then {
	//["ZEUS"] findIf { _x == "zeus" }
	if (toUpper ((squadParams player) # 0 # 0) == "ZEUS") then { bravo_f3_mod_SHOW_TAGS = false };
};

if (isClass(configFile >> "CfgPatches" >> "ace_main")) then { bravo_f3_mod_SHOW_TAGS = false };

bravo_f3_mod_ACTIONKEY_TAGS = (actionKeys bravo_f3_mod_KEY_TAGS)#0;
bravo_f3_mod_KEYNAME_TAGS = actionKeysNames bravo_f3_mod_KEY_TAGS;
if (isNil "bravo_f3_mod_ACTIONKEY_TAGS") then {bravo_f3_mod_ACTIONKEY_TAGS = 22; bravo_f3_mod_KEYNAME_TAGS = 'U';}; // If the user has not bound 'TeamSwitch' to a key we default to 'U' to toggle the tags

bravo_f3_mod_KEYDOWN_NAMETAG = {
	_key = _this#1;
	_handeld = false;
	if(_key == bravo_f3_mod_ACTIONKEY_TAGS) then {
		bravo_f3_mod_SHOW_TAGS = !bravo_f3_mod_SHOW_TAGS;
		profileNamespace setVariable ['bravo_f3_mod_SHOW_TAGS', bravo_f3_mod_SHOW_TAGS];
		titleText [format["%1 unit tags", if (bravo_f3_mod_SHOW_TAGS) then {"Enabled"} else {"Disabled"}], "PLAIN DOWN", 2];
		//_handeld = true;
	};
	_handeld;
};

// ADD BRIEFING SECTION
// A section is added to the player's briefing to inform them about name tags being available.
cursorTarget enableSimulationGlobal true;
[] spawn {
	_bstr = format ["<font size='18' color='#80FF00'>NAME TAGS</font><br/>Toggle name tags for friendly units below.<br/><br/>No information will be displayed for any units greater than %3m away.<br/>", 
		bravo_f3_mod_KEYNAME_TAGS, bravo_f3_mod_KEY_TAGS, bravo_f3_mod_DIST_TAGS];

	{
		_x params ["_title","_desc","_id","_off","_on","_color"];
		
		if (missionNamespace getVariable [str _id,""] == "") then {
			_bstr = _bstr + format["<br/><font color='#00FFFF'>%1</font> - %2 <font %6><execute expression=""%3 = true; hintSilent '%1: %5'; profileNamespace setVariable ['%3', true]; saveProfileNamespace;"">%5</execute></font> | <font %7><execute expression=""%3 = false; hintSilent '%1: %4'; profileNamespace setVariable ['%3', false]; saveProfileNamespace;"">%4</execute></font>",
				_title,
				_desc,
				_id,
				_off,
				_on,
				if (_color) then {"color='#80FF00'"} else {""},
				if (_color) then {"color='#CF142B'"} else {""}
			];
		};
	} forEach [
		["All Tags","Displaying of all unit tags: ","bravo_f3_mod_SHOW_TAGS","Disabled","Enabled",false],
		["Icon Display","Display Icons for: ","bravo_f3_mod_OVER_ONLY","Nearby Units","Cursor Only",false],
		["Icon Filter","Floating Icons for: ","bravo_f3_mod_TEAM_TAGS","Everyone","Team Only",false],
		["Group ID","Show when looking at a unit: ","bravo_f3_mod_GPID_TAGS","Deactivated","Activated",true],
		["Unit Name","Show when looking at a unit: ","bravo_f3_mod_NAME_TAGS","Deactivated","Activated",true],
		["Type Text","Show when looking at a unit: ","bravo_f3_mod_TYPE_TAGS","Deactivated","Activated",true],
		["Type Icon","Show all units ranks or types: ","bravo_f3_mod_TYPE_ICON","Rank","Type",false]
	];
			
	_bstr = _bstr + "<br/><br/><font size='18' color='#80FF00'>FONT TYPES</font><br/>Click on any of the following fonts to set the font type.<br/>
	<font face='EtelkaMonospaceProBold'><execute expression=""bravo_f3_mod_FONT_TAGS = 'EtelkaMonospaceProBold'; hintSilent 'Font: Etelka Bold'; profileNamespace setVariable ['bravo_f3_mod_FONT_TAGS', bravo_f3_mod_FONT_TAGS]; saveProfileNamespace;"">Etelka Bold</execute></font><br/>
	<font face='PuristaBold'><execute expression=""bravo_f3_mod_FONT_TAGS = 'PuristaBold'; hintSilent 'Font: Purista Bold'; profileNamespace setVariable ['bravo_f3_mod_FONT_TAGS', bravo_f3_mod_FONT_TAGS]; saveProfileNamespace;"">Purista Bold</execute></font> (Default)<br/>
	<font face='PuristaMedium'><execute expression=""bravo_f3_mod_FONT_TAGS = 'PuristaMedium'; hintSilent 'Font: Purista'; profileNamespace setVariable ['bravo_f3_mod_FONT_TAGS', bravo_f3_mod_FONT_TAGS]; saveProfileNamespace;"">Purista</execute></font><br/>
	<font face='RobotoCondensedBold'><execute expression=""bravo_f3_mod_FONT_TAGS = 'RobotoCondensedBold'; hintSilent 'Font: Roboto Bold'; profileNamespace setVariable ['bravo_f3_mod_FONT_TAGS', bravo_f3_mod_FONT_TAGS]; saveProfileNamespace;"">Roboto Bold</execute></font><br/>
	<font face='RobotoCondensed'><execute expression=""bravo_f3_mod_FONT_TAGS = 'RobotoCondensed'; hintSilent 'Font: Roboto'; profileNamespace setVariable ['bravo_f3_mod_FONT_TAGS', bravo_f3_mod_FONT_TAGS]; saveProfileNamespace;"">Roboto</execute></font><br/>";
	
	_bstr = _bstr + "<br/><font size='18' color='#80FF00'>FONT SIZE</font><br/>Click on any of the below options to set the font size.<br/>
	<execute expression=""if (bravo_f3_mod_SIZE_TAGS > 1) then { bravo_f3_mod_SIZE_TAGS = 1 } else { bravo_f3_mod_SIZE_TAGS = bravo_f3_mod_SIZE_TAGS + 0.005 };  hintSilent format['Tag Size: %1', bravo_f3_mod_SIZE_TAGS]; profileNamespace setVariable ['bravo_f3_mod_SIZE_TAGS', bravo_f3_mod_SIZE_TAGS]; saveProfileNamespace;"">+ Increase Font</execute><br/>
	<execute expression=""if (bravo_f3_mod_SIZE_TAGS < 0.01) then { bravo_f3_mod_SIZE_TAGS = 0.01 } else { bravo_f3_mod_SIZE_TAGS = bravo_f3_mod_SIZE_TAGS - 0.005 }; hintSilent format['Tag Size: %1', bravo_f3_mod_SIZE_TAGS]; profileNamespace setVariable ['bravo_f3_mod_SIZE_TAGS', bravo_f3_mod_SIZE_TAGS]; saveProfileNamespace;"">- Decrease Font</execute><br/>
	<execute expression=""bravo_f3_mod_SIZE_TAGS = 0.04;  hintSilent format['Tag Size: %1', bravo_f3_mod_SIZE_TAGS]; profileNamespace setVariable ['bravo_f3_mod_SIZE_TAGS', bravo_f3_mod_SIZE_TAGS]; saveProfileNamespace;"">Reset to Default</execute><br/>";

	//player removeDiaryRecord ["Diary", "NameTags (Options)"];
	player createDiaryRecord ["Diary", ["NameTags (Options)",_bstr]];
};

// ADD EVENTHANDLERS
// After the mission has initialized event handlers are added to the register key-presses.

sleep 0.1;

waitUntil {!isNull (findDisplay 46)}; // Make sure the display we need is initialized

if (!isNil "bravo_f3_mod_eh_nameKeys") then { (findDisplay 46) displayRemoveEventHandler ["keyDown", bravo_f3_mod_eh_nameKeys] };
bravo_f3_mod_eh_nameKeys = (findDisplay 46) displayAddEventHandler   ["keyDown", "_this spawn bravo_f3_mod_KEYDOWN_NAMETAG"];

if (!isNil "bravo_f3_mod_eh_nameTags") then { removeMissionEventHandler ["Draw3D", bravo_f3_mod_eh_nameTags] };
bravo_f3_mod_eh_nameTags = addMissionEventHandler ["Draw3D", { call bravo_f3_mod_fnc_drawNameTag } ];