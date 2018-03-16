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

	ogp.LoadMenuDefinition()
	ogp.LoadSettings()

	ogp.AddConsoleCommands()
	ogp.LogInfo("initialized")

end


function ogp.LoadScript( file )
	if ogp.loadedScripts[file] == nil then
		ogp.loadedScripts[file] = 1
		ogp.LoadScript(file)
	end
end

--
-- Run all unit tests
--
function ogp.RunTests()
	ogp.LoadScript( 'Scripts/tests/ogp_cvar_util.lua' )
	ogp.test.Run()
end

---
--- Create console/flowgraph interface
---
function ogp.AddConsoleCommands()
	System.AddCCommand( 'ogp_create_advanced_settings_buttons', 'ogp.CreateAdvancedSettingsButtons()', "" )
	System.AddCCommand( 'ogp_load_settings', 'ogp.LoadSettings()', "" )
	System.AddCCommand( 'ogp_apply_settings', 'ogp.ApplySettings()', "" )
	System.AddCCommand( 'ogp_save_settings', 'ogp.SaveSettings()', "" )
	System.AddCCommand( 'ogp_set_profile', 'ogp.SetProfile(%1)', "" )
	System.AddCCommand( 'ogp_run_tests', 'ogp.RunTests()', 'runs unit tests' )

	local ogp_set_xxx_doc="-1,-2,-3,-4,-5 for ogp // 1,2,3,4,7 for vanilla"
	System.AddCCommand( 'ogp_set_cvar', 'ogp.SetCVar(%1, %2)', '' )
	System.AddCCommand( 'ogp_set_gi', 'ogp.SetCVar("sys_spec_ogp_gi", %1)', ogp_set_xxx_doc )
	System.AddCCommand( 'ogp_set_grass', 'ogp.SetCVar("sys_spec_ogp_grass", %1)', ogp_set_xxx_doc )
	System.AddCCommand( 'ogp_set_lod', 'ogp.SetCVar("sys_spec_ogp_lod", %1)', ogp_set_xxx_doc )
	System.AddCCommand( 'ogp_set_particles', 'ogp.SetCVar("sys_spec_ogp_particles", %1)', ogp_set_xxx_doc )
	System.AddCCommand( 'ogp_set_physics', 'ogp.SetCVar("sys_spec_ogp_physics", %1)', ogp_set_xxx_doc )
	System.AddCCommand( 'ogp_set_shading', 'ogp.SetCVar("sys_spec_ogp_shading", %1)', ogp_set_xxx_doc )
	System.AddCCommand( 'ogp_set_shadows', 'ogp.SetCVar("sys_spec_ogp_shadows", %1)', ogp_set_xxx_doc )
	System.AddCCommand( 'ogp_set_ssdo', 'ogp.SetCVar("sys_spec_ogp_ssdo", %1)', ogp_set_xxx_doc )
	System.AddCCommand( 'ogp_set_texture', 'ogp.SetCVar("sys_spec_ogp_texture", %1)', ogp_set_xxx_doc )
	System.AddCCommand( 'ogp_set_water', 'ogp.SetCVar("sys_spec_ogp_water", %1)', ogp_set_xxx_doc )
	System.AddCCommand( 'ogp_set_weather', 'ogp.SetCVar("sys_spec_ogp_weather", %1)', ogp_set_xxx_doc )
	System.AddCCommand( 'ogp_set_3pl', 'System.SetCVar("sys_spec_ogp_3pl", %1)', ogp_set_xxx_doc )

end

---
--- Sets all-in-on graphic profile : -1 to -5 for ogp, 1,2,3,4,7 for vanilla
---
function ogp.SetProfile( value )
	value = tonumber(value)
	if value == -1 then
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

ogp.Init()
