// F3 - AI Skill Selector
if !isServer exitWith {};
if ((missionNamespace getVariable ["bravo_f3_mod_param_ZMMDiff",0]) == 0) exitWith {};

sleep 5;

private _skills = [	
	[[0.7,0.9],		"general"],
    [[0.7,1.0],		"courage"],
    [[0.15,0.35],	"aimingAccuracy"],
    [[0.6,0.8],		"aimingShake"],
    [[0.2,0.4],		"aimingSpeed"],
    [[0.8,1.0],		"commanding"],
    [[0.7,0.9],		"spotDistance"],
    [[0.65,0.85],	"spotTime"],
    [[0.8,1.0],		"reloadSpeed"]
];

private _sides = [WEST, EAST, INDEPENDENT] - (allPlayers apply { side group _x });

bravo_f3_mod_setAISkillLoop = true;

while { bravo_f3_mod_setAISkillLoop } do {
	{
		private _unit = _x;	
		
		if !(_unit getVariable ["bravo_f3_mod_setAISkill", false]) then {
			{ 
				_x params ["_skill","_type"];
				private _sv = (((_skill apply { _x * bravo_f3_mod_param_ZMMDiff }) call BIS_fnc_randomNum) min 1) max 0.15;
				if (_unit skill _type < _sv) then { _unit setSkill [_type, _sv] };
			} forEach _skills;
			
			_unit setVariable ["bravo_f3_mod_setAISkill", true];
		};
	} forEach (allUnits select { side _x in _sides && local _x && alive _x});

	sleep 300;
};