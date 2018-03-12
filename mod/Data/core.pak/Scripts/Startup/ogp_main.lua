ogp = {}
System.LogAlways( "[OGP] initializing..." )

-- Action.SaveXML(const char * definitionFile, const char * dataFile, SmartScriptTable dataTable)
-- Action.PauseGame( pause )

---
---
---
function ogp.Init()
	Script.ReloadScript( "Scripts/ogp_menu_util.lua" )
	Script.ReloadScript( "Scripts/ogp_localization.lua" )
	ogp.LoadLocalizations()
	local root = CryAction.LoadXML( "ogp_advancedSettingsMenu_def.xml", "ogp_advancedSettingsMenu.xml" )
	ogp.buttons = root.buttons;
	System.AddCCommand( "ogp_load_settings", "ogp.LoadSettings(%line)", "" )
	System.AddCCommand( "ogp_create_advanced_settings_menu", "ogp.CreateAdvancedSettingsMenu()", "" )
	System.AddCCommand( "ogp_create_advanced_settings_buttons", "ogp.CreateAdvancedSettingsButtons()", "" )
	System.LogAlways( "[OGP] initialized" )
end

---
---
---
function ogp.LoadSettings(xmlFile)

end

---
---
---
function ogp.SaveSettings(xmlFile)

end

---
---
---
function ogp.CreateAdvancedSettingsMenu()
	ogp.menu_util.ClearAll()
	ogp.menu_util.SetTitleBox( "controls" )
	ogp.menu_util.SetContainer( 1500, 250, 13 )
	ogp.CreateAdvancedSettingsButtons()
	ogp.menu_util.AddButton( "apply", "@ui_Apply", "", ogp.menu_util.actionTypes.apply, 1 )
	ogp.menu_util.AddButton( "back", "@ui_back", "", ogp.menu_util.actionTypes.back, 1 )
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
		local value = System.GetCVar(button.cvar)
		if value < 0 then
			value = System.GetCVar( button.cvar .. "_vanilla" )
		end
		ogp.menu_util.SetChoice( button.cvar, value )
	end
end

---
---
---
function ogp.ApplySettings()
	for _,button in ipairs(ogp.buttons) do
		local cvar = button.cvar
		local choice = ogp.menu_util.GetChoice(cvar)
		if choice > 10 then
			cvar = cvar .. "_vanilla"
			choice = choice - 10
		end
		System.SetCVar(cvar, value)
	end
	System.ExecuteCommand( "e_UberlodActivate" )
end


ogp.Init()
