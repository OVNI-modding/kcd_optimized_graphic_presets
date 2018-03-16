
ogp.debuglogLevel=4
ogp.infologLevel=3
ogp.warninglogLevel=2
ogp.errorlogLevel=1
ogp.mutedlogLevel=0

--
-- Used to filter log (eg: for unit tests)
--
ogp.logLevel=ogp.debuglogLevel


function ogp.Log(msg)
	System.LogAlways( "[OGP] " .. tostring(msg) )
end

function ogp.LogDebug(msg)
	if ogp.logLevel >= ogp.debuglogLevel then
		ogp.Log( "Debug: " .. msg )
	end
end

function ogp.LogInfo(msg)
	if ogp.logLevel >= ogp.infologLevel then
		ogp.Log( msg )
	end
end

function ogp.LogWarning(msg)
	if ogp.logLevel >= ogp.warninglogLevel then
		ogp.Log( "Warning: " .. tostring(msg) )
	end
end

function ogp.LogError(msg)
	if ogp.logLevel >= ogp.errorlogLevel then
		ogp.Log( "Error: " .. tostring(msg) )
	end
end

-- from https://gist.github.com/hashmal/874792
-- Print contents of `tbl`, with indentation.
-- `indent` sets the initial level of indentation.
function ogp.LogTable(tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      System.LogAlways(formatting)
      ogp.LogTable(v, indent+1)
    elseif type(v) == 'boolean' then
      System.LogAlways(formatting .. tostring(v))
    else
      System.LogAlways(formatting .. tostring(v))
    end
  end
end
