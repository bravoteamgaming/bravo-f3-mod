class CfgFunctions
{
	class bravo_f3_mod
	{
		class assignGear
		{
			file = "\bravo_f3_mod\functions\assignGear";
			class assignGear_AI{};
			class assignGear_attachments{};
			class assignGear_clothes{};
			class addBackpack{};
			class addWeapon{};
			class arrayCheck{};
			class assignGear{};
			class compatibleItems{};
			class magazineCheck{};
			class tidyGear{};
		};
		class briefing
		{
			file = "\bravo_f3_mod\functions\briefing";
			class briefing{};
			class briefing_admin{};
			class drawAO{};
			class showLoadoutSelect{};
			class showOrbat{};
			class fillAdministration{};
		};
		class JIP
		{
			file = "\bravo_f3_mod\functions\JIP";
			class teleportOption{};
			class teleportPlayer{};
		};
		class casualtiesCap
		{
			file = "\bravo_f3_mod\functions\casualtiesCap";
			class casualtiesCapCheck{};
			class casualtiesCap{};
		};
		class common
		{
			file = "\bravo_f3_mod\functions\common";
			class clientIntro{};
			class logIssue{};
			class processParamsArray
			{
				preInit = 1;
				postInit = 1;
			};
			class spectateInit{};
		};
		class medical
		{
			file = "\bravo_f3_mod\functions\medical";
			class medical_init
			{
				postInit = 1;
			};
		};
		class radios
		{
			file = "\bravo_f3_mod\functions\radios";
			{
				class radio_init
				{
					postInit = 1;
				};
			};
		};
		class zeus
		{
			file = "\bravo_f3_mod\functions\zeus";
			{
				class zeusInit
				{
					postInit = 1;
				};
				class zeusAddAddons{};
				class zeusAddObjects{};
				class zeusAssign{};
				class zeusRemovePlayers{};
				class zeusTerm{};
			};
		};
		class missionConditions
		{
			file = "\bravo_f3_mod\functions\missionConditions";
			class setConditions
			{
				postInit = 1;
			};
			class setFog{};
			class setTime{};
			class setWeather{};
			class setWind{};
		};
		class FTMemberMarkers
		{
			file = "\bravo_f3_mod\functions\FTMemberMarkers";
			class initFTMarkers{};
		};
		class groupMarkers
		{
			file = "\bravo_f3_mod\functions\groupMarkers";
			class setLocGroupMkr{};
			class localGroupMarker{};
		};
		class mapClickTeleport
		{
			file = "\bravo_f3_mod\functions\mapClickTeleport";
			class mapClickTeleportAction{};
			class mapClickHaloEffect{};
			class mapClickTeleportGroup{};
			class mapClickTeleportUnit{};
		};
		class misc
		{
			file = "\bravo_f3_mod\functions\misc";
			class debug{};
			class pylons{};
			class stayInVehicle{};
			class teleportPlayer{};
			class vas{};
			class virtualGarage{};
		};
		class nametag
		{
			file = "\bravo_f3_mod\functions\nametag";
			class nametags{};
			class drawNameTag{};
		};
		class safeStart
		{
			file = "\bravo_f3_mod\functions\safeStart";
			class safeStart{};
			class safeStartLoop{};
			class safety{};
		};
		class setAISkill
		{
			file = "\bravo_f3_mod\functions\setAISkill";
			class setAISkill{};
		};
		class setGroupID
		{
			file = "\bravo_f3_mod\functions\setGroupID";
			class setGroupIDs{};
		};
		class setTeamColours
		{
			file = "\bravo_f3_mod\functions\setTeamColours";
			class setTeamColours{};
		};
		class thirdPerson
		{
			file = "\bravo_f3_mod\functions\thirdPerson";
			class thirdPerson{};
		};
	};
};