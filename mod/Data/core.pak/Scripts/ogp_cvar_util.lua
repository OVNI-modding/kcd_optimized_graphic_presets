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

---
--- Returns the value of given vanilla cvar, or given sys_spec_ogp cvargoups
--- (either sys_spec_ogp_x or sys_spec_ogp_x_vanilla depending on its value).
---
function ogp.GetCVar( cvar )
	local succeeded, retval
	if ogp.string.Starts( cvar, "sys_spec_ogp_") then
		succeeded, retval = pcall( ogp._GetOgpCVar, cvar )
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
function ogp._GetOgpCVar( cvar )
	local value = System.GetCVar(cvar)
	local succeeded
	if value == -999 then
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
		succeeded, errorMessage = pcall( ogp._SetOgpCVar, cvar, value )
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
function ogp._SetOgpCVar( cvar, value )
	local succeeded, errorMessage
	value = tonumber(value)
	if value > 0 then
		-- reset sys_spec_ogp_xxx
		ogp.LogInfo( cvar .. " = -999" )
		succeeded, errorMessage = pcall( System.SetCVar, cvar, -999 )
		if not succeeded then ogp.LogError(errorMessage) end
		-- will set value to sys_spec_ogp_xxx_vanilla
		cvar = cvar .. "_vanilla"
	end
	ogp.LogInfo( cvar .. " = " .. value )
	succeeded, errorMessage = pcall( System.SetCVar, cvar, value )
	if not succeeded then
		ogp.LogError(errorMessage)
	end
end
