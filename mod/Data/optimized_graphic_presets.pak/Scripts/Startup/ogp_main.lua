ogp = {}

ogp.settingsPath = "user_profile/ogp_settings.xml"

---
--- Inits ogp.
---
function ogp.Init()
	Script.ReloadScript( "Scripts/ogp_logging.lua" )
	Script.ReloadScript( "Scripts/ogp_string_util.lua" )
	Script.ReloadScript( "Scripts/ogp_menu_util.lua" )
	Script.ReloadScript( "Scripts/ogp_localization.lua" )

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
	--TODO System.AddCCommand( "ogp_set_cvar", "System.SetCVar(%1, %2)", "" )
end

---
--- Create settings Buttons.
---
function ogp.CreateAdvancedSettingsButtons()
	for _,button in ipairs(ogp.buttons) do
		ogp.menu_util.AddChoiceButton(
			button.cvar,
			ogp.Localize( button.label ),
			ogp.Localize( button.tooltip )
		)
		for _,choice in ipairs(button.choices) do
			ogp.menu_util.AddChoiceOption(
				button.cvar,
				ogp.Localize( choice.label ),
				ogp.Localize( choice.tooltip ),
				choice.value
			)
		end
		local value = System.GetCVar(button.cvar)
		ogp.menu_util.SetChoice( button.cvar, value )
	end
end

---
--- Applies settings using button values.
---
function ogp.ApplySettings()
	for _,button in ipairs(ogp.buttons) do
		local value = ogp.menu_util.GetChoice(button.cvar)
		System.SetCVar( button.cvar, value )
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
			System.SetCVar( setting.cvar, setting.value )
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
