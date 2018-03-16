
---
--- Add tests in there...
---
ogp.tests = {}

ogp.testsResult = {}
ogp.testsResult.lines = {}

---
--- Adds message to ogp.testsResult
---
function ogp.Assert( boolean )
	if boolean then
		ogp.testsResult.lines[#ogp.testsResult.lines] = ' ✅ ' .. ogp.testsResult.lines[#ogp.testsResult.lines]
	else
		ogp.testsResult.lines[#ogp.testsResult.lines] = ' ❎ ' .. ogp.testsResult.lines[#ogp.testsResult.lines]
	end
end

---
--- Runs tests
---
function ogp.RunTest()
	for suiteName,suite in pairs(ogp.tests) do
		for caseName,case in pairs(suite) do
			ogp.testsResult.lines[#ogp.testsResult.lines+1] = suiteName ..' '.. caseName
			case()
		end
	end
	for _,line in pairs(ogp.testsResult.lines) do
		ogp.LogInfo(line )
	end
end
