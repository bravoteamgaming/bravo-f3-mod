class bravo_f3_mod_paramSpacer_title
{
	title = "---- ADMIN Options - System -----";
	values[] = {-100};
	texts[] = {" "};
	default = -100;
};
class bravo_f3_mod_param_debugMode			// F3 - Debug Mode
{
	title = "Debug Testing";
	values[] = {0,1};
	texts[] = {"Off","On"};
	default = 0;
};
class bravo_f3_mod_param_virtualArsenal
{
		title = "Virtual Arsenal";
		values[] = {0,1};
		texts[] = {"Disabled","Enabled"};
		default = 0;
};
class bravo_f3_mod_paramSpacer_title1
{
	title = "---- GAME Options - Environment ----";
	values[] = {-100};
	texts[] = {" "};
	default = -100;
};
class bravo_f3_mod_param_weather
{
	title = "Weather";
	values[] = {0,1,2,3,4,5,6,7};
	texts[] = {"Mission Default","Calm","Light Cloud","Overcast","Light Rain","Rain","Storm","Random"};
	default = 1;
};
class bravo_f3_mod_param_fog
{
	title = "Fog";
	values[] = {0,1,2,3,4};
	texts[] = {"Mission Default","None","Light","Heavy","Random"};
	default = 1;
};
class bravo_f3_mod_param_timeOfDay
{
	title = "Time of Day";
	values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14};
	texts[] = {"Mission Default","1hr to First Light","30m to First Light","First Light","30m after First Light","Morning","Late Morning","Noon","Afternoon","1hr to Last Light","30m to Last Light","Last Light","Night","Midnight","Random"};
	default = 8;
};
class bravo_f3_mod_param_timeMultiplier
{
	title = "Time Multiplier";
	values[] = {0.5,1,6,12,24};
	texts[] = {"Half Time","Normal","1 Day = 4 Hours","1 Day = 2 Hours","1 Day = 1 Hour"};
	default = 1;
};
class bravo_f3_mod_paramSpacer_title2
{
	title = "---- GAME Options - Immersion ----";
	values[] = {-100};
	texts[] = {" "};
	default = -100;
};
class bravo_f3_mod_param_CasualtiesCap		// F3 - Casualty Limit - Can override by calling f_fnc_CasualtiesCapCheck.
{
	title = "Casualty Counter - count and % of dead units";
	values[] = {0,40,50,60,70,80,90};
	texts[] = {"Disabled","40","50","60","70","80","90"};
	default = 0;
};	
class bravo_f3_mod_param_medical
{
	title = "Medical";
	values[] = {-1,0,1};
	texts[] = {"Automatic","Vanilla","Farooq Revive"};
	default = -1;
};
class bravo_f3_mod_param_respawn
{
	title = "Respawn";
	values[] = {0,30,60,300,600,900,1200,1,2,5,10};
	texts[] = {"Disabled","Timer 30 Seconds","Timer 1 Minute","Wave 5 Minutes","Wave 10 Minutes","Wave 15 Minutes","Wave 20 Minutes","2 Tickets","3 Tickets","5 Tickets","10 Tickets"};
	default = 30;
};
class bravo_f3_mod_param_jipTeleport
{
	title = "JIP Teleport Mode";
	values[] = {0,1,2,3};
	texts[] = {"Disabled", "Action only", "Flagpole only", "Both"};
	default = 0;
};
class bravo_f3_mod_param_ZMMDiff
{
	title = "Use F3 AI Skill";
	values[] = {0,1};
	texts[] = {"Disabled", "Enabled"};
	default = 0;
};
class bravo_f3_mod_param_engineArtillery
{
	title = "Artillery computer";
	values[] = {0,1};
	texts[] = {"Disabled", "Enabled"};
	default = 0;
};