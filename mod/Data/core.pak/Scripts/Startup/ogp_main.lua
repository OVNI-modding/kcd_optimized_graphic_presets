ogp = {}
ogp.loadedScripts = {}


---
--- Inits ogp.
---
function ogp.Init()
	ogp.LoadScript( 'Scripts/ogp_testing.lua' )
	ogp.LoadScript( 'Scripts/ogp_logging.lua' )
	ogp.LoadScript( 'Scripts/ogp_string_util.lua' )
	ogp.LoadScript( 'Scripts/ogp_menu_util.lua' )
	ogp.LoadScript( 'Scripts/ogp_cvar_util.lua' )
	ogp.LoadScript( 'Scripts/ogp_localization.lua' )
	ogp.LoadScript( 'Scripts/ogp_advanced_menu.lua' )
	ogp.LoadScript( 'Scripts/ogp_console.lua' )

	ogp.LoadMenuDefinition()

	ogp.AddConsoleCommands()
	ogp.LogInfo("initialized")

end

--
--
--
function ogp.LoadScript( file )
	if ogp.loadedScripts[file] == nil then
		ogp.loadedScripts[file] = 1
		Script.ReloadScript(file)
	end
end

--
-- Run all unit tests
--
function ogp.RunTests( verbose )
	ogp.LoadScript( 'Scripts/tests/ogp_tests.lua' )
	ogp.test.Run( verbose )
end

---
--- Sets all-in-on graphic profile : -1 to -5 for ogp, 1,2,3,4,7 for vanilla
---
function ogp.SetProfile( value )
	value = tonumber(value)
	if value == 0 then
		-- custom profile, do nothing
		return
	elseif value == -1 then
		System.ExecuteCommand( 'exec Config/ogp_ugly' )
	elseif value == -2 then
		System.ExecuteCommand( 'exec Config/ogp_low' )
	elseif value == -3 then
		System.ExecuteCommand( 'exec Config/ogp_medium' )
	elseif value == -4 then
		System.ExecuteCommand( 'exec Config/ogp_high' )
	elseif value == -5 then
		System.ExecuteCommand( 'exec Config/ogp_ultra' )
	elseif value == 1 then
		System.ExecuteCommand( 'exec Config/ogp_vanilla_low' )
	elseif value == 2 then
		System.ExecuteCommand( 'exec Config/ogp_vanilla_medium' )
	elseif value == 3 then
		System.ExecuteCommand( 'exec Config/ogp_vanilla_high' )
	elseif value == 4 then
		System.ExecuteCommand( 'exec Config/ogp_vanilla_veryhigh' )
	elseif value == 7 then
		System.ExecuteCommand( 'exec Config/ogp_vanilla_ultra' )
	else
		ogp.LogError('in SetProfile, unknown value:' .. value)
	end
end


local succeeded, error = pcall( ogp.Init )
if not succeeded then
	ogp.LogError( error )
end
