
ogp.settingsPath = '%USER%/ogp_settings.xml'

---
--- Load menu's structure.
---
function ogp.LoadMenuDefinition()
	local root = CryAction.LoadXML( 'ogp_advancedSettingsMenu_def.xml', 'ogp_advancedSettingsMenu.xml' )
	ogp.buttons = root.buttons;
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
	System.ExecuteCommand( 'e_UberlodActivate' )
end

---
--- This function does not work because LUA can only read files that are within pak files...
--- (Left there for documentation purpose)
---
function ogp.LoadSettings()
	ogp.LogInfo("Loading settings...")
	local succeeded, root = pcall( CryAction.LoadXML, 'ogp_settings_def.xml', ogp.settingsPath )
	-- LoadXML seems not to fail if xml doesn't exist, just returns empty root...
	if succeeded then
		if root ~= nil and root.settings ~= nil then
			for _,setting in ipairs(root.settings) do
				ogp.SetCVar( setting.cvar, setting.value )
			end
			ogp.LogInfo("Loaded "..tostring(#root.settings).." settings from ".. ogp.settingsPath )
		else
			ogp.LogInfo("Could not load " .. ogp.settingsPath )
		end
	else
		ogp.LogError("Settings cannot be loaded: "..root)
	end
end

---
--- Saves settings to ogp.settingsPath using button's value.
---
function ogp.SaveSettings()
	ogp.LogInfo("Saving settings...")
	local root = {}
	root.settings = {}
	for _,button in ipairs(ogp.buttons) do
		local setting = {
			cvar = button.cvar,
			value = ogp.menu_util.GetChoice(button.cvar)
		}
		table.insert( root.settings, setting )
	end
	local succeeded, error = pcall( CryAction.SaveXML, 'ogp_settings_def.xml', ogp.settingsPath, root )
	if succeeded then
		ogp.LogInfo("Settings saved.")
	else
		ogp.LogError( "Failed to save settings: " .. error )
	end
end
