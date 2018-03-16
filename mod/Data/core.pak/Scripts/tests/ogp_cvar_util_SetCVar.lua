if ogp.loadedFiles.ogp_cvar_util_SetCVar==nil then ogp.loadedFiles.ogp_cvar_util_SetCVar=1


ogp.tests.SetCVar = {

	["can set positive value to vanilla cvar"] = function()
		-- setup
		local expected = 5
		local cvar = 'r_DrawNearFoV'
		local initial = System.GetCVar(cvar)
		-- exec
		ogp.SetCVar( cvar, expected )
		-- verify
		local actual = System.GetCVar(cvar)
		ogp.Assert( actual == expected )
		-- cleanup
		ogp.SetCVar( cvar, initial )
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
		ogp.Assert( actual == expected )
		-- cleanup
		ogp.SetCVar( cvar, initial )
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
		ogp.Assert( actual == expected )
		-- cleanup
		ogp.SetCVar( cvar, initial )
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
		ogp.Assert( actual == expected )
		-- cleanup
		ogp.SetCVar( cvar, initial )
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
		ogp.Assert( actual == expected )
		-- cleanup
		ogp.SetCVar( cvar, initial )
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
		ogp.Assert( actual == expected )
		-- cleanup
		ogp.SetCVar( cvar_vanilla, initial )
	end,

}
