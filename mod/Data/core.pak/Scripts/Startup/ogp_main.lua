ogp = {}

-- Action.SaveXML(const char * definitionFile, const char * dataFile, SmartScriptTable dataTable)
-- Action.PauseGame( pause )

---
---
---
function ogp.Init()
	Script.ReloadScript( "Scripts/ogp_logging.lua" )
	Script.ReloadScript( "Scripts/ogp_menu_util.lua" )
	Script.ReloadScript( "Scripts/ogp_localization.lua" )
	ogp.LoadMenuDefinition()
	ogp.LogInfo("initialized")
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
