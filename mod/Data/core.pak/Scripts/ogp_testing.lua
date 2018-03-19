if ogp.test then return end
ogp.LoadScript( 'Scripts/ogp_console.lua' )
ogp.LoadScript( 'Scripts/ogp_logging.lua' )



local Spy = {}
Spy.__index = Spy

function Spy.Create( func )
	local o = {
		func = func,
		wasCalled = false,
		callCount = 0,
		lastCallArgs = {},
	}
	setmetatable(o, Spy)
	return o
end

function Spy:Call( ... )
	self.wasCalled = true
	self.callCount = self.callCount + 1
	self.lastCallArgs = arg
	if self.func then self.func( unpack(arg) ) end
end



local Assert = {
	failureMessage = "",
	skipped = false,
	passed = false,
}
--
-- Internal
--
Assert.Reset = function()
	Assert.failureMessage = ""
	Assert.skipped = false
	Assert.passed = false
end

Assert.Pass = function()
	Assert.skipped = false
	Assert.passed = true
end

Assert.Fail = function( message )
	message = message or ''
	Assert.skipped = false
	Assert.passed = false
	Assert.failureMessage = Assert.failureMessage .. tostring(message)
end

Assert.Equals = function( actual, expected )
	if actual==expected then
		Assert.Pass()
	else
		Assert.Fail( " Expected '"..tostring(expected).."' but was '"..tostring(actual).."'" )
	end
end

Assert.True = function( bool )
	Assert.Equals( bool, true )
end

Assert.False = function( bool )
	Assert.Equals( bool, false )
end

Assert.NoError = function( func, ... )
	local succeeded, error = pcall( func, unpack(arg) )
	if succeeded then Assert.Pass() else Assert.Fail(error) end
end



TestRunner = {
	--
	-- Table of test cases.
	--
	suites = {}
}
--
-- Adds a suite to the test runner.
--
TestRunner.AddSuite = function( name, cases )
	table.insert( TestRunner.suites, {
		name = name,
		cases = cases,
	})
end
--
-- Start tests in addition order.
--
TestRunner.Start = function( verbose )
	-- note: do not store messages to display them after since it can be conveniant to see
	-- debug logging printed in the correct order.
	local initialLogLevel = ogp.logLevel
	local initialLogVerbosityCVar = System.GetCVar('log_Verbosity')
	if tonumber(verbose) == 0 then
		ogp.logLevel = ogp.mutedlogLevel
		System.SetCVar('log_Verbosity', 0 )
	end
	for _,suite in ipairs(TestRunner.suites) do
		for caseName,case in pairs(suite.cases) do
			Assert.Reset()
			case()
			if Assert.passed then
				if System.IsEditor() then message = ' ✅ ' else message = ' [o] ' end
			else
				if System.IsEditor() then message = ' ❎ ' else message = ' [X] ' end
			end
			message = message .. suite.name .. ' ' .. caseName .. ' ' .. Assert.failureMessage
			ogp.Log( message )
		end
	end
	ogp.logLevel = initialLogLevel
	System.SetCVar('log_Verbosity', initialLogVerbosityCVar )
end



ogp.test = {
	Spy = Spy,
	Assert = Assert,
	TestRunner = TestRunner,
}



ogp.console.AddCommand( 'ogp_run_tests', 'ogp.test.TestRunner.Start(%1)',[[
Runs unit tests.
@arg verbose [0/1]
]])
