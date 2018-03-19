
ogp.test.TestRunner.AddSuite( "ogp.console.AddCommand", {

	["calls func without args"] = function()
		-- setup
		local cmd = 'ogp.spy.Call( ogp.spy,)'
		local name = tostring( 'ogp_test_'..ogp.GetUid() )
		ogp.spy = ogp.test.Spy.Create()
		-- action
		ogp.console.AddCommand( name, cmd ,[[Just a test stub, do not use]] )
		System.ExecuteCommand( name )
		-- verify
		ogp.test.Assert.True( ogp.spy.wasCalled )
	end,

	["passes inlined arguments with the right types"] = function()
		-- setup
		local cmd = 'ogp.spy.Call( ogp.spy, "Hello", 10, true )'
		local name = tostring( 'ogp_test_'..ogp.GetUid() )
		ogp.spy = ogp.test.Spy.Create()
		-- action
		ogp.console.AddCommand( name, cmd ,[[Just a test stub, do not use]] )
		System.ExecuteCommand( name )
		-- verify
		ogp.test.Assert.True( ogp.spy.wasCalled )
		ogp.test.Assert.Equals( type( ogp.spy.lastCallArgs[1] ), 'string' )
		ogp.test.Assert.Equals( type( ogp.spy.lastCallArgs[2] ), 'number' )
		ogp.test.Assert.Equals( type( ogp.spy.lastCallArgs[3] ), 'boolean' )
	end,

	["passes inlined arguments with the right values"] = function()
		-- setup
		local cmd = 'ogp.spy.Call( ogp.spy, "Hello", 10, true )'
		local name = tostring( 'ogp_test_'..ogp.GetUid() )
		ogp.spy = ogp.test.Spy.Create()
		-- action
		ogp.console.AddCommand( name, cmd ,[[Just a test stub, do not use]] )
		System.ExecuteCommand( name )
		-- verify
		ogp.test.Assert.True( ogp.spy.wasCalled )
		ogp.test.Assert.Equals( ogp.spy.lastCallArgs[1], "Hello" )
		ogp.test.Assert.Equals( ogp.spy.lastCallArgs[2], 10 )
		ogp.test.Assert.Equals( ogp.spy.lastCallArgs[3], true )
	end,

	["passes arguments from console as string"] = function()
		-- setup
		local cmd = 'ogp.spy.Call( ogp.spy, %1, %2, %3 )'
		local name = tostring( 'ogp_test_'..ogp.GetUid() )
		ogp.spy = ogp.test.Spy.Create()
		-- action
		ogp.console.AddCommand( name, cmd ,[[Just a test stub, do not use]] )
		System.ExecuteCommand( name  .. ' "Hello" 10 true' )
		-- verify
		ogp.test.Assert.True( ogp.spy.wasCalled )
		ogp.test.Assert.Equals( type( ogp.spy.lastCallArgs[1] ), 'string' )
		ogp.test.Assert.Equals( type( ogp.spy.lastCallArgs[2] ), 'string' )
		ogp.test.Assert.Equals( type( ogp.spy.lastCallArgs[3] ), 'string' )
	end,

	["passes arguments from console with the right value (as string)"] = function()
		-- setup
		local cmd = 'ogp.spy.Call( ogp.spy, %1, %2, %3 )'
		local name = tostring( 'ogp_test_'..ogp.GetUid() )
		ogp.spy = ogp.test.Spy.Create()
		-- action
		ogp.console.AddCommand( name, cmd ,[[Just a test stub, do not use]] )
			System.ExecuteCommand( name  .. ' "Hello" 10 true' )
		-- verify
		ogp.test.Assert.True( ogp.spy.wasCalled )
		ogp.test.Assert.Equals( ogp.spy.lastCallArgs[1], "Hello" )
		ogp.test.Assert.Equals( ogp.spy.lastCallArgs[2], '10' )
		ogp.test.Assert.Equals( ogp.spy.lastCallArgs[3], 'true' )
	end,


	["supports command using colon operator"] = function()
		ogp.test.Assert.Fail()
	end,

})
