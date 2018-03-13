ogp = {}

ogp.settingsPath = "user_profile/ogp_settings.xml"

-- Action.SaveXML(const char * definitionFile, const char * dataFile, SmartScriptTable dataTable)
-- Action.PauseGame( pause )

---
--- Inits ogp.
---
function ogp.Init()
	Script.ReloadScript( "Scripts/ogp_logging.lua" )
	Script.ReloadScript( "Scripts/ogp_string_util.lua" )
	Script.ReloadScript( "Scripts/ogp_menu_util.lua" )

	-- load localization for current language
	local language = System.GetCVar("g_language")
	local succeeded, retval = pcall( System.LoadLocalizationXml, "ogp_" .. language .. ".xml" )
	if not succeeded then
		System.LoadLocalizationXml("ogp_english.xml")
	end

	ogp.LoadMenuDefinition()
	ogp.AddConsoleCommands()
	-- ogp.LoadSettings()
	ogp.LogInfo("initialized")
end

---
--- Load advanced menu's structure.
---
function ogp.LoadMenuDefinition()
	local root = CryAction.LoadXML( "ogp_advancedSettingsMenu_def.xml", "ogp_advancedSettingsMenu.xml" )
	ogp.buttons = root.buttons;
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

---
--- Returns the value of given vanilla cvar, or given sys_spec_ogp cvargoups
--- (either sys_spec_ogp_x or sys_spec_ogp_x_vanilla depending on its value)
---
function ogp.GetCVar( cvar )
	local succeeded, retval
	if ogp.string.Starts( cvar, "sys_spec_ogp_") then
		succeeded, retval = pcall( ogp.GetOgpCVar, cvar )
	else
		succeeded, retval = pcall( System.GetCVar, cvar )
	end
	if not succeeded then
		ogp.LogError(retval)
		retval = 0
	end
	return retval
end

---
--- Returns the value of cvar; or if it's 0 returns the value of cvar_vanilla instead.
---
function ogp.GetOgpCVar( cvar )
	local value = System.GetCVar(cvar)
	local succeeded
	if value == 0 then
		succeeded, value = pcall( System.GetCVar, cvar.."_vanilla" )
		if not succeeded then
			ogp.LogError(value)
			return 0
		end
	end
	return value
end

---
--- Sets value to vanilla cvar, or sys_spec_ogp cvargoups
--- (either sys_spec_ogp_x or sys_spec_ogp_x_vanilla depending on the value)
---
function ogp.SetCVar( cvar, value )
	local succeeded, errorMessage
	if ogp.string.Starts( cvar, "sys_spec_ogp_") then
		succeeded, errorMessage = pcall( ogp.SetOgpCVar, cvar, value )
	else
		ogp.LogInfo( cvar .. " = " .. value )
		succeeded, errorMessage = pcall( System.SetCVar, cvar, value )
	end
	if not succeeded then
		ogp.LogError(errorMessage)
	end
end

---
--- If value is <= 0 assigns value to cvar, otherwise assigns it to cvar_vanilla.
--- Should not be used directly, use SetCVar instead.
---
function ogp.SetOgpCVar( cvar, value )
	value = tonumber(value)
	if value > 0 then
		cvar = cvar .. "_vanilla"
	end
	ogp.LogInfo( cvar .. " = " .. value )
	succeeded, errorMessage = pcall( System.SetCVar, cvar, value )
	if not succeeded then
		ogp.LogError(errorMessage)
	end
end

---
--- Create settings Buttons.
---
function ogp.CreateAdvancedSettingsButtons()
	for _,button in ipairs(ogp.buttons) do
		ogp.menu_util.AddChoiceButton( button.cvar, button.label, button.tooltip )
		for _,choice in ipairs(button.choices) do
			ogp.menu_util.AddChoiceOption( button.cvar, choice.label, choice.tooltip, choice.value )
		end
		local value = ogp.GetCVar(button.cvar)
		ogp.menu_util.SetChoice( button.cvar, value )
	end
end

---
--- Applies settings using button values.
---
function ogp.ApplySettings()
	for _,button in ipairs(ogp.buttons) do
		local value = ogp.menu_util.GetChoice(button.cvar)
		ogp.SetCVar( button.cvar, value )
	end
	System.ExecuteCommand( "e_UberlodActivate" )
end

---
--- This function does not work because LUA can only read files that are within pak files...
--- (Left there for documentation purpose)
---
function ogp.LoadSettings()
	local succeeded, root = pcall( CryAction.LoadXML, "ogp_settings_def.xml", ogp.settingsPath )
	-- LoadXML seems not to fail if xml doesn't exist, just returns empty root...
	if succeeded then
		for _,setting in ipairs(root.settings) do
			ogp.SetCVar( setting.cvar, setting.value )
		end
	else
		ogp.LogInfo("Settings cannot be loaded: "..root)
	end
end

---
--- Saves settings to ogp.settingsPath.
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
