if ogp.test then return end
ogp.LoadScript( 'Scripts/ogp_console.lua' )
ogp.LoadScript( 'Scripts/ogp_logging.lua' )


ogp.test = {}

--
-- Table of test cases.
--
ogp.test.suites = {}

--
-- internal
--
ogp.test.passed = false

--
-- internal
--
ogp.test.skipped = false

--
-- internal
--
ogp.test.failureMessage = ""

--
--
--
ogp.test.Assert = function( boolean )
	ogp.test.failureMessage = ""
	ogp.test.passed = boolean
	ogp.test.skipped = false
end

--
--
--
ogp.test.AssertEquals = function( actual, expected )
	ogp.test.Assert( actual==expected )
	if not ogp.test.passed then
		ogp.test.failureMessage = ": Expected '"..expected.."' but was '"..actual.."'"
		-- TODO concat message ?
	end
end

--
--
--
ogp.test.AssertNoError = function( func, ... )
	local succeeded, error = pcall( func, unpack(arg) )
	ogp.test.Assert( succeeded )
	if not succeeded then ogp.LogError(error) end
end

--
--
--
ogp.test.AddSuite = function( sSuiteName, tSuite )
	ogp.test.suites[sSuiteName] = tSuite
end


ogp.console.AddCommand( 'ogp_run_tests', 'ogp.test.Run(%1)',[[
Runs unit tests.
@arg verbose [0/1]
]])
ogp.test.Run = function( verbose )
	-- note: do not store messages to display them after since it can be conveniant to see
	-- debug logging printed in the correct order.
	local initialLogLevel = ogp.logLevel
	local initialLogVerbosityCVar = System.GetCVar('log_Verbosity')
	if tonumber(verbose) == 0 then
		ogp.logLevel = ogp.mutedlogLevel
		System.SetCVar('log_Verbosity', 0 )
	end
	for suiteName,suite in pairs(ogp.test.suites) do
		for caseName,case in pairs(suite) do
			ogp.test.skipped = true
			case()
			if ogp.test.skipped then
				-- ogp.test.message = ' 🌕 '
				ogp.test.message = ' ❎ '
			elseif ogp.test.passed then
				ogp.test.message = ' ✅ '
			else
				ogp.test.message = ' ❎ '
			end
			ogp.test.message = ogp.test.message .. suiteName .." ".. caseName .." "..ogp.test.failureMessage
			ogp.Log( ogp.test.message )
		end
	end
	ogp.logLevel = initialLogLevel
	System.SetCVar('log_Verbosity', initialLogVerbosityCVar )
end
