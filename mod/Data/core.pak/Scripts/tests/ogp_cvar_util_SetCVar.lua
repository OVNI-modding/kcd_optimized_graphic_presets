
ogp.test.suites.SetCVar = {

	["can set positive value to vanilla cvar"] = function()
		-- setup
		local expected = 5
		local cvar = 'r_DrawNearFoV'
		local initial = System.GetCVar(cvar)
		-- exec
		ogp.SetCVar( cvar, expected )
		-- verify
		local actual = System.GetCVar(cvar)
		ogp.test.AssertEquals( actual, expected )
		-- cleanup
		System.SetCVar( cvar, initial )
	end,

	["can set 0 to vanilla cvar"] = function()
		-- setup
		local expected = 0
		local cvar = 'r_DrawNearFoV'
		local initial = System.GetCVar(cvar)
		-- exec
		ogp.SetCVar( cvar, expected )
		-- verify
		local actual = System.GetCVar(cvar)
		ogp.test.AssertEquals( actual, expected )
		-- cleanup
		System.SetCVar( cvar, initial )
	end,

	["can set -999 to vanilla cvar"] = function()
		-- setup
		local expected = -999
		local cvar = 'r_DrawNearFoV'
		local initial = System.GetCVar(cvar)
		-- exec
		ogp.SetCVar( cvar, expected )
		-- verify
		local actual = System.GetCVar(cvar)
		ogp.test.AssertEquals( actual, expected )
		-- cleanup
		System.SetCVar( cvar, initial )
	end,

	["can set negative value to vanilla cvar"] = function()
		-- setup
		local expected = -5
		local cvar = 'r_DrawNearFoV'
		local initial = System.GetCVar(cvar)
		-- exec
		ogp.SetCVar( cvar, expected )
		-- verify
		local actual = System.GetCVar(cvar)
		ogp.test.AssertEquals( actual, expected )
		-- cleanup
		System.SetCVar( cvar, initial )
	end,

	["maps negative value assignement to sys_spec_ogp_xxx"] = function()
		-- setup
		local expected = -5
		local cvar = 'sys_spec_ogp_gi'
		local initial = System.GetCVar(cvar)
		-- exec
		ogp.SetCVar( cvar, expected )
		-- verify
		local actual = System.GetCVar(cvar)
		ogp.test.AssertEquals( actual, expected )
		-- cleanup
		System.SetCVar( cvar, initial )
	end,

	["maps 0 value assignement to sys_spec_ogp_xxx"] = function()
		-- setup
		local expected = 0
		local cvar = 'sys_spec_ogp_gi'
		local initial = System.GetCVar(cvar)
		-- exec
		ogp.SetCVar( cvar, expected )
		-- verify
		local actual = System.GetCVar(cvar)
		ogp.test.AssertEquals( actual, expected )
		-- cleanup
		System.SetCVar( cvar, initial )
	end,

	["maps positive value assignement to sys_spec_ogp_xxx_vanilla"] = function()
		-- setup
		local expected = 5
		local cvar = 'sys_spec_ogp_gi'
		local cvar_vanilla = cvar ..'_vanilla'
		local initial = System.GetCVar(cvar)
		-- exec
		ogp.SetCVar( cvar, expected )
		-- verify
		local actual = System.GetCVar(cvar_vanilla)
		ogp.test.AssertEquals( actual, expected )
		-- cleanup
		System.SetCVar( cvar_vanilla, initial )
	end,

	["maps positive value assignement to sys_spec_ogp_xxx when sys_spec_ogp_xxx_vanilla doesn't exist"] = function()
		-- setup
		local expected = 5
		local cvar = 'sys_spec_ogp_dof_state'
		local initial = System.GetCVar(cvar)
		-- exec
		ogp.SetCVar( cvar, expected )
		-- verify
		local actual = System.GetCVar(cvar)
		ogp.test.AssertEquals( actual, expected )
		-- cleanup
		System.SetCVar( cvar, initial )
	end,

	["is console-compatible (works with arguments as strings)"] = function()
		-- exec
		local succeeded, error = pcall( ogp.SetCVar, 'sys_spec_ogp_gi', '5' )
		-- verify
		ogp.test.Assert( succeeded )
		if not succeeded then ogp.LogError(error) end
	end,

}
