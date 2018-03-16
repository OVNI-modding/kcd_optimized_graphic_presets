

ogp.test = {

	--
	-- Table of test cases.
	--
	suites = {},

	--
	-- internal
	--
	passed = '',

	--
	-- Adds message to ogp.testsResult
	--
	Assert = function( boolean )
		passed = boolean
	end,

	--
	-- Runs test suites
	--
	Run = function( muteLogging )
		-- note: do not store messages to display them after since it can be conveniant to see
		-- debug logging printed in the correct order.
		local initialLogLevel = ogp.logLevel
		if muteLogging then
			ogp.logLevel = ogp.mutedlogLevel
		end
		for suiteName,suite in pairs(ogp.test.suites) do
			for caseName,case in pairs(suite) do
				case()
				if passed then
					message = ' ✅ '
				else
					message = ' ❎ '
				end
				message = message .. suiteName ..' '.. caseName
				ogp.Log( message )
			end
		end
		ogp.logLevel = initialLogLevel
	end,

}
