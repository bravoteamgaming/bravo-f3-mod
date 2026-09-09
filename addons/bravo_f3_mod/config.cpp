class CfgPatches
{
	class bravo_f3_mod
	{
		name = "Bravo F3 Mod";
		author = "NikkoJT";
		url = "https://github.com/bravoteamgaming/bravo-f3-mod";
		version = 4.0;
		versionStr = "4.0";
		versionAr[] = {4,0};
		requiredVersion = 2.00;
		requiredAddons[] = {"cba_common"};
		units[] = {};
		weapons[] = {};
		skipWhenMissingDependencies = 1;
	};
};

class CfgSettings
{
	class CBA
	{
		class Versioning
		{
			class bravo_f3_mod
			{
				main_addon = "bravo_f3_mod";
			};
		};
	};
};

#include "cfgFunctions.hpp"