

ogp.test.TestRunner.AddSuite( "ogp.test.Spy.wasCalled", {

	["is false when spy just inited"] = function()
		local spy = ogp.test.Spy.Create()
		-- verify
		ogp.test.Assert.False( spy.wasCalled )
	end,

	["is true once spy is called"] = function()
		local spy = ogp.test.Spy.Create()
		-- action
		spy:Call()
		-- verify
		ogp.test.Assert.True( spy.wasCalled )
	end,

})


ogp.test.TestRunner.AddSuite( "ogp.test.Spy.callCount", {

	["is 0 when spy just inited"] = function()
		local spy = ogp.test.Spy.Create()
		-- verify
		ogp.test.Assert.Equals( spy.callCount, 0 )
	end,

	["is 1 when spy was called 1 time"] = function()
		local spy = ogp.test.Spy.Create()
		-- action
		spy:Call()
		-- verify
		ogp.test.Assert.Equals( spy.callCount, 1 )
	end,

	["is 1 when spy was called 2 times"] = function()
		local spy = ogp.test.Spy.Create()
		-- action
		spy:Call()
		spy:Call()
		-- verify
		ogp.test.Assert.Equals( spy.callCount, 2 )
	end,

})


ogp.test.TestRunner.AddSuite( "ogp.test.Spy.lastCallArgs", {

	["is empty when spy just inited"] = function()
		local spy = ogp.test.Spy.Create()
		-- verify
		ogp.test.Assert.Equals( #spy.lastCallArgs, 0 )
	end,

	["is empty when spy called with args then without arguments"] = function()
		local spy = ogp.test.Spy.Create()
		-- action
		spy:Call( "hello" )
		spy:Call()
		-- verify
		ogp.test.Assert.Equals( #spy.lastCallArgs, 0 )
	end,

	["is contains args passed the last time spy was called"] = function()
		local spy = ogp.test.Spy.Create()
		-- action
		spy:Call( "Not", "The", "Right", "Args" )
		spy:Call( "hello", 10, true )
		-- verify
		ogp.test.Assert.Equals( #spy.lastCallArgs, 3 )
		ogp.test.Assert.Equals( spy.lastCallArgs[1], "Hello" )
		ogp.test.Assert.Equals( spy.lastCallArgs[2], 10 )
		ogp.test.Assert.Equals( spy.lastCallArgs[3], true )
	end,

})


ogp.test.TestRunner.AddSuite( "ogp.test.Spy.Call", {

	["calls provided function"] = function()
		local spy = ogp.test.Spy.Create( ogp.test.Assert.Pass )
		-- action
		spy:Call()
	end,

})
