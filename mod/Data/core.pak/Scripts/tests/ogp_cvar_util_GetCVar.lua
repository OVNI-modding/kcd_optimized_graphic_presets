
ogp.test.suites.GetCVar = {

	["always returns vanilla cvar's value, even when its value is 'magic' (-999)"] = function()
		-- setup
		local expected = -999
		local cvar = 'r_DrawNearFoV'
		local initial = System.GetCVar(cvar)
		System.SetCVar(cvar, expected)
		-- exec
		local actual = ogp.GetCVar(cvar)
		-- verify
		ogp.test.AssertEquals( actual, expected )
		-- cleanup
		System.SetCVar( cvar, initial )
	end,

	["returns sys_spec_ogp_xxx when its value is positive"] = function()
		-- setup
		local expected = 5
		local cvar = 'sys_spec_ogp_gi'
		local initial = System.GetCVar(cvar)
		System.SetCVar(cvar, expected)
		-- exec
		local actual = ogp.GetCVar(cvar)
		-- verify
		ogp.test.AssertEquals( actual, expected )
		-- cleanup
		System.SetCVar( cvar, initial )
	end,

	["returns sys_spec_ogp_xxx when its value is 0"] = function()
		-- setup
		local expected = 0
		local cvar = 'sys_spec_ogp_gi'
		local initial = System.GetCVar(cvar)
		System.SetCVar(cvar, expected)
		-- exec
		local actual = ogp.GetCVar(cvar)
		-- verify
		ogp.test.AssertEquals( actual, expected )
		-- cleanup
		System.SetCVar( cvar, initial )
	end,

	["returns xxx_vanilla counterpart when xxx value is -999"] = function()
		-- setup
		local cvar = 'sys_spec_ogp_gi'
		local cvar_vanilla = cvar .. '_vanilla'
		local initial = System.GetCVar(cvar)
		local expected = System.GetCVar(cvar_vanilla)
		System.SetCVar(cvar, -999) --set negative value
		-- exec
		local actual = ogp.GetCVar(cvar)
		-- verify
		ogp.test.AssertEquals( actual, expected )
		-- cleanup
		System.SetCVar( cvar, initial )
	end,

	["returns xxx when xxx value is -999, but no xxx_vanilla exists"] = function()
		-- setup
		local expected = -999
		local cvar = 'sys_spec_ogp_dof_state'
		local initial = System.GetCVar(cvar)
		System.SetCVar(cvar, expected)
		-- exec
		local actual = ogp.GetCVar(cvar)
		-- verify
		ogp.test.AssertEquals( actual, expected )
		-- cleanup
		System.SetCVar( cvar, initial )
	end,

}
