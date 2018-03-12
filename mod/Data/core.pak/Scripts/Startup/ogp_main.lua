ogp = {}

ogp.settingsPath = "ogp_settings.xml"

-- Action.SaveXML(const char * definitionFile, const char * dataFile, SmartScriptTable dataTable)
-- Action.PauseGame( pause )

---
---
---
function ogp.Init()
	Script.ReloadScript( "Scripts/ogp_logging.lua" )
	Script.ReloadScript( "Scripts/ogp_string_util.lua" )
	Script.ReloadScript( "Scripts/ogp_menu_util.lua" )

	-- load localization for current language
	local language = System.GetCVar("g_language")
	local error = pcall( System.LoadLocalizationXml, "ogp_" .. language .. ".xml" )
	if error then
		System.LoadLocalizationXml("ogp_english.xml")
	end

	ogp.LoadMenuDefinition()
	ogp.AddConsoleCommands()
	ogp.LogInfo("initialized")
	ogp.LoadSettings()
end

---
---
---
function ogp.LoadMenuDefinition()
	local root = CryAction.LoadXML( "ogp_advancedSettingsMenu_def.xml", "ogp_advancedSettingsMenu.xml" )
	ogp.buttons = root.buttons;
end

---
---
---
function ogp.AddConsoleCommands()
	System.AddCCommand( "ogp_create_advanced_settings_buttons", "ogp.CreateAdvancedSettingsButtons()", "" )
	System.AddCCommand( "ogp_load_settings", "ogp.LoadSettings()", "" )
	System.AddCCommand( "ogp_apply_settings", "ogp.ApplySettings()", "" )
	System.AddCCommand( "ogp_save_settings", "ogp.SaveSettings()", "" )
	System.LogAlways( "[OGP] initialized" )
end

---
--- Returns the value of cvar; or if it's 0 returns the value of cvar_vanilla instead.
---
function ogp.GetOgpCVar( cvar )
	local value = System.GetCVar(cvar)
	if value == 0 then
		value = System.GetCVar( cvar .. "_vanilla" )
	end
	return value
end

---
--- if value is <= 0 assigns value to cvar, otherwise assigns it to cvar_vanilla.
---
function ogp.SetOgpCVar( cvar, value )
	if value > 0 then
		cvar = cvar .. "_vanilla"
	end
	ogp.LogInfo( cvar .. " = " .. value )
	System.SetCVar(cvar, value)
end

---
---
---
function ogp.CreateAdvancedSettingsButtons()
	for _,button in ipairs(ogp.buttons) do
		ogp.menu_util.AddChoiceButton( button.cvar, button.label, button.tooltip )
		for _,choice in ipairs(button.choices) do
			ogp.menu_util.AddChoiceOption( button.cvar, choice.label, choice.tooltip, choice.value )
		end
		local value = ogp.GetOgpCVar(button.cvar)
		ogp.menu_util.SetChoice( button.cvar, value )
	end
end

---
---
---
function ogp.ApplySettings()
	for _,button in ipairs(ogp.buttons) do
		local value = ogp.menu_util.GetChoice(button.cvar)
		ogp.SetOgpCVar( button.cvar, value )
	end
	System.ExecuteCommand( "e_UberlodActivate" )
end

---
---
---
function ogp.LoadSettings()
	local error, root = pcall( CryAction.LoadXML, "ogp_settings_def.xml", ogp.settingsPath )
	for _,setting in ipairs(root.settings) do
		ogp.SetOgpCVar( setting.cvar, setting.value )
	end
end

---
---
---
function ogp.SaveSettings()
	local root = {}
	root.settings = {}
	for _,button in ipairs(ogp.buttons) do
		local setting = {
			cvar = button.cvar,
			value = ogp.menu_util.GetChoice(button.cvar)
		}
		table.insert( root.settings, setting )
	end
	CryAction.SaveXML( "ogp_settings_def.xml", ogp.settingsPath, root )
end


ogp.Init()
