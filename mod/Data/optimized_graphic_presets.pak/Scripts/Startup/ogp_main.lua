ogp = {}


---
--- Inits ogp.
---
function ogp.Init()
	Script.ReloadScript( "Scripts/ogp_logging.lua" )
	Script.ReloadScript( "Scripts/ogp_string_util.lua" )
	Script.ReloadScript( "Scripts/ogp_menu_util.lua" )
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
end

ogp.Init()
