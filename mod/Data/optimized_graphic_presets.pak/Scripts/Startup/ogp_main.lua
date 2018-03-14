ogp = {}


---
--- Inits ogp.
---
function ogp.Init()
	Script.ReloadScript( "Scripts/ogp_logging.lua" )
	Script.ReloadScript( "Scripts/ogp_string_util.lua" )
	Script.ReloadScript( "Scripts/ogp_menu_util.lua" )
	Script.ReloadScript( "Scripts/ogp_cvar_util.lua" )
	Script.ReloadScript( "Scripts/ogp_localization.lua" )
	Script.ReloadScript( "Scripts/ogp_advanced_menu.lua" )

	ogp.AddConsoleCommands()
	ogp.LogInfo("initialized")
end

---
--- Create console/flowgraph interface
---
function ogp.AddConsoleCommands()
	System.AddCCommand( "ogp_create_advanced_settings_buttons", "ogp.CreateAdvancedSettingsButtons()", "" )
	-- System.AddCCommand( "ogp_load_settings", "ogp.LoadSettings()", "" )
	System.AddCCommand( "ogp_apply_settings", "ogp.ApplySettings()", "" )
	System.AddCCommand( "ogp_save_settings", "ogp.SaveSettings()", "" )
	System.AddCCommand( "ogp_set_cvar", "ogp.SetCVar(%1, %2)", "" )
	System.AddCCommand( "ogp_set_profile", "ogp.SetProfile(%1)", "" )
end

---
--- Sets all-in-on graphic profile : -1 to -5 for ogp, 1,2,3,4,7 for vanilla
---
function ogp.SetProfile( value )
	if value == -1 then
		System.ExecuteCommand( "loadconfig ogp_ugly" )
	elseif value == -2 then
		System.ExecuteCommand( "loadconfig ogp_low" )
	elseif value == -3 then
		System.ExecuteCommand( "loadconfig ogp_medium" )
	elseif value == -4 then
		System.ExecuteCommand( "loadconfig ogp_high" )
	elseif value == -5 then
		System.ExecuteCommand( "loadconfig ogp_ultra" )
	elseif value == 1 then
		System.ExecuteCommand( "loadconfig ogp_vanilla_low" )
	elseif value == 2 then
		System.ExecuteCommand( "loadconfig ogp_vanilla_medium" )
	elseif value == 3 then
		System.ExecuteCommand( "loadconfig ogp_vanilla_high" )
	elseif value == 4 then
		System.ExecuteCommand( "loadconfig ogp_vanilla_veryhigh" )
	elseif value == 7 then
		System.ExecuteCommand( "loadconfig ogp_vanilla_ultra" )
	else
		ogp.LogError("in SetProfile, unknown value:" .. value)
	end
end

ogp.Init()
