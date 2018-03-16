

ogp.test = {

	--
	-- Table of test cases.
	--
	suites = {},

	--
	-- internal
	--
	results = {},

	--
	-- Adds message to ogp.testsResult
	--
	Assert = function( boolean )
		if boolean then
			ogp.test.results[#ogp.test.results] = ' ✅ ' .. ogp.test.results[#ogp.test.results]
		else
			ogp.test.results[#ogp.test.results] = ' ❎ ' .. ogp.test.results[#ogp.test.results]
		end
	end,

	--
	-- Runs test suites
	--
	Run = function()
		for suiteName,suite in pairs(ogp.test.suites) do
			for caseName,case in pairs(suite) do
				ogp.test.results[#ogp.test.results+1] = suiteName ..' '.. caseName
				case()
			end
		end
		for _,line in pairs(ogp.test.results) do
			ogp.LogInfo(line )
		end
	end,

}
