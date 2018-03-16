

ogp.test = {

	--
	-- Table of test cases.
	--
	suites = {},

	--
	-- Mute logging, except for results.
	--
	muteLogging = true,

	--
	-- internal
	--
	passed = '',

	--
	-- internal
	--
	failureMessage = '',

	--
	-- Adds message to ogp.testsResult
	--
	Assert = function( boolean )
		ogp.test.failureMessage = ''
		ogp.test.passed = boolean
	end,

	--
	-- Adds message to ogp.testsResult
	--
	AssertEquals = function( actual, expected )
		ogp.test.Assert( actual==expected )
		if not ogp.test.passed then
			ogp.test.failureMessage = ": Expected '"..expected.."' but was '"..actual.."'"
		end
	end,

	--
	-- Runs test suites
	--
	Run = function()
		-- note: do not store messages to display them after since it can be conveniant to see
		-- debug logging printed in the correct order.
		local initialLogLevel = ogp.logLevel
		if ogp.test.muteLogging then
			ogp.logLevel = ogp.mutedlogLevel
		end
		for suiteName,suite in pairs(ogp.test.suites) do
			for caseName,case in pairs(suite) do
				case()
				if ogp.test.passed then
					ogp.test.message = ' ✅ '
				else
					ogp.test.message = ' ❎ '
				end
				ogp.test.message = ogp.test.message .. suiteName .." ".. caseName .." "..ogp.test.failureMessage
				ogp.Log( ogp.test.message )
			end
		end
		ogp.logLevel = initialLogLevel
	end,

}
