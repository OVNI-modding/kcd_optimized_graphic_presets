--
-- Function to work with 2 linked cvargroups.
--
-- 0 and negatives value map to sys_spec_ogp_xxx
--
-- positive values are mapped to sys_spec_ogp_xxx_vanilla
--
-- -999 (minus 999) has a special meaning for sys_spec_ogp_xxx, it means that the last assignement
-- was mapped to sys_spec_ogp_xxx_vanilla.
-- In the cvragraoup definition, it is also used to reset the settings that are not handled by
-- vanilla cvargroups.
--

--
-- Returns true if given cvar exists, false otherwise.
--
function ogp.CVarExists( cvar )
	return System.GetCVar(cvar) ~= nil
end

--
-- Returns true if given cvar exists and is a combo cvar,
-- ie: a cvar that has a cvar..'_vanilla' counterpart that is used for stricly positive values.
--
function ogp.IsComboCVar( cvar )
	return ogp.CVarExists(cvar) and ogp.CVarExists(cvar..'_vanilla')
end

---
--- Returns the value of given vanilla cvar, or given sys_spec_ogp cvargoups
--- (either sys_spec_ogp_x or sys_spec_ogp_x_vanilla depending on its value).
---
function ogp.GetCVar( cvar )
	-- vanilla bahavior
	if not ogp.IsComboCVar(cvar) then
		return System.GetCVar(cvar)
	end
	-- combo
	local value = System.GetCVar(cvar)
	if value == -999 then
		return System.GetCVar(cvar..'_vanilla')
	end
	return value
end

---
--- Sets value to vanilla cvar, or sys_spec_ogp cvargoups
--- (either sys_spec_ogp_x or sys_spec_ogp_x_vanilla depending on the value)
---
function ogp.SetCVar( cvar, value )
	-- vanilla bahavior
	if not ogp.IsComboCVar(cvar) then
		System.SetCVar(cvar, value)
		return
	end
	-- combo
	if tonumber(value) <= 0 then
		ogp.SetCVarAndLog( cvar, value )
	else
		ogp.SetCVarAndLog( cvar, -999 )
		ogp.SetCVarAndLog( cvar..'_vanilla', value )
	end
end

--
--
--
function ogp.SetCVarAndLog( cvar, value )
	ogp.LogInfo( cvar..' = '..value )
	System.SetCVar( cvar, value )
end

---
--- Loads Settings from ogp.settingsPath.
---
function ogp.LoadSettings()
	ogp.LogInfo("Loading settings...")
	local succeeded, root = pcall( CryAction.LoadXML, 'ogp_settings_def.xml', ogp.settingsPath )
	-- failed to lad file
	if not succeeded then
		ogp.LogError("Settings cannot be loaded: "..root)
		return
	end
	-- LoadXML seems not to fail if xml doesn't exist, just returns empty root...
	if root == nil or root.settings == nil then
		ogp.LogInfo("Could not load " .. ogp.settingsPath )
		return
	end
	-- ok
	for _,setting in ipairs(root.settings) do
		ogp.SetCVar( setting.cvar, setting.value )
	end
	System.ExecuteCommand( 'e_UberlodActivate' )
	ogp.LogInfo("Loaded "..tostring(#root.settings).." settings from ".. ogp.settingsPath )
end

---
--- Saves settings to ogp.settingsPath using current cvar's values.
---
function ogp.SaveSettingsFromCVars()
	ogp.LogInfo("Saving settings from cvars...")
	local root = {}
	root.settings = {}
	for _,button in ipairs(ogp.buttons) do
		local setting = {
			cvar = button.cvar,
			value = ogp.GetCVar( button.cvar )
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
