

ogp.test.TestRunner.AddSuite( 'ogp.menu_util.SetButtonChoice', {

	["does not crash when given nil arguments"] = function()
		ogp.test.Assert.NoError( ogp.menu_util.SetButtonChoice, nil, nil )
	end,

	["does not crash when given button with nil attributes"] = function()
		local button = {
			 cvar=nil,
			 choices=nil,
		}
		ogp.test.Assert.NoError( ogp.menu_util.SetButtonChoice, button, 5 )
	end,

})
