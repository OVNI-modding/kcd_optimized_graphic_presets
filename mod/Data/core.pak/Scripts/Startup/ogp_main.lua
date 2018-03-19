


local lastUid = 0
--
--
--
local function GetUid()
	lastUid = lastUid + 1
	return lastUid
end



local loadedScripts = {}
--
--
--
local function LoadScript( file )
	if loadedScripts[file] == nil then
		loadedScripts[file] = 1
		Script.ReloadScript(file)
	end
end



---
--- Inits ogp.
---
local function Init()
	LoadScript( 'Scripts/ogp_testing.lua' )
	LoadScript( 'Scripts/ogp_logging.lua' )
	LoadScript( 'Scripts/ogp_string_util.lua' )
	LoadScript( 'Scripts/ogp_menu_util.lua' )
	LoadScript( 'Scripts/ogp_cvar_util.lua' )
	LoadScript( 'Scripts/ogp_localization.lua' )
	LoadScript( 'Scripts/ogp_advanced_menu.lua' )

	ogp.LoadMenuDefinition()

	LoadScript( 'Scripts/tests/ogp_tests.lua' )

	ogp.LogInfo("initialized")
end



ogp = {
	GetUid = GetUid,
	LoadScript = LoadScript,
}



local succeeded, error = pcall( Init )
if not succeeded then
	ogp.LogError( error )
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
