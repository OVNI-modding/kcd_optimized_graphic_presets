if ogp.console then return end
ogp.LoadScript( 'Scripts/ogp_logging.lua' )



--
-- Same as System.AddCommand, except it logs error to console and doesn't support command using colon operator.
--
local function AddCommand( sCommandName, sCommand, sHelp )
	sCommand = 'ogp.console.Wrap(' .. string.gsub( sCommand, '%(', ',', 1 )
	sCommand = string.gsub( sCommand, ',%)', '%)' )
	System.AddCCommand( sCommandName, sCommand, sHelp )
end
local function Wrap( func, ... )
	local succeeded, error = pcall( func, unpack(arg) )
	if not succeeded then
		ogp.LogError( error )
	end
end


ogp.console = {
	AddCommand = AddCommand,
	Wrap = Wrap,
}


--
-- Create console/flowgraph interface
--
function ogp.console.AddAllCommands()
	ogp.console.AddCommand( 'ogp_create_advanced_settings_buttons', 'ogp.CreateAdvancedSettingsButtons()', "" )
	ogp.console.AddCommand( 'ogp_load_settings', 'ogp.LoadSettings()', "" )
	ogp.console.AddCommand( 'ogp_apply_settings', 'ogp.ApplySettings()', "" )
	ogp.console.AddCommand( 'ogp_save_settings_from_cvars', 'ogp.SaveSettingsFromCVars()', "" )
	ogp.console.AddCommand( 'ogp_save_settings_from_buttons', 'ogp.SaveSettingsFromButtons()', "" )
	ogp.console.AddCommand( 'ogp_set_profile', 'ogp.SetProfile(%1)', "" )

	local ogp_set_xxx_doc="-1,-2,-3,-4,-5 for ogp // 1,2,3,4,7 for vanilla"
	ogp.console.AddCommand( 'ogp_set_cvar', 'ogp.SetCVar(%1, %2)', '' )
	ogp.console.AddCommand( 'ogp_set_gi', 'ogp.SetCVar("sys_spec_ogp_gi", %1)', ogp_set_xxx_doc )
	ogp.console.AddCommand( 'ogp_set_grass', 'ogp.SetCVar("sys_spec_ogp_grass", %1)', ogp_set_xxx_doc )
	ogp.console.AddCommand( 'ogp_set_lod', 'ogp.SetCVar("sys_spec_ogp_lod", %1)', ogp_set_xxx_doc )
	ogp.console.AddCommand( 'ogp_set_particles', 'ogp.SetCVar("sys_spec_ogp_particles", %1)', ogp_set_xxx_doc )
	ogp.console.AddCommand( 'ogp_set_physics', 'ogp.SetCVar("sys_spec_ogp_physics", %1)', ogp_set_xxx_doc )
	ogp.console.AddCommand( 'ogp_set_shading', 'ogp.SetCVar("sys_spec_ogp_shading", %1)', ogp_set_xxx_doc )
	ogp.console.AddCommand( 'ogp_set_shadows', 'ogp.SetCVar("sys_spec_ogp_shadows", %1)', ogp_set_xxx_doc )
	ogp.console.AddCommand( 'ogp_set_ssdo', 'ogp.SetCVar("sys_spec_ogp_ssdo", %1)', ogp_set_xxx_doc )
	ogp.console.AddCommand( 'ogp_set_texture', 'ogp.SetCVar("sys_spec_ogp_texture", %1)', ogp_set_xxx_doc )
	ogp.console.AddCommand( 'ogp_set_water', 'ogp.SetCVar("sys_spec_ogp_water", %1)', ogp_set_xxx_doc )
	ogp.console.AddCommand( 'ogp_set_weather', 'ogp.SetCVar("sys_spec_ogp_weather", %1)', ogp_set_xxx_doc )
	ogp.console.AddCommand( 'ogp_set_3pl', 'ogp.SetCVar("sys_spec_ogp_3pl", %1)', ogp_set_xxx_doc )

end
