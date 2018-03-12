

function ogp._Log(msg)
	System.LogAlways( "[OGP] " .. msg )
end

function ogp.LogInfo(msg)
	ogp._Log( msg )
end

function ogp.LogWarning(msg)
	ogp._Log( "Warning: " .. msg )
end

function ogp.LogError(msg)
	ogp._Log( "Warning: " .. msg )
end

-- from https://gist.github.com/hashmal/874792
-- Print contents of `tbl`, with indentation.
-- `indent` sets the initial level of indentation.
function ogp:LogTable(tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      System.LogAlways(formatting)
      tprint(v, indent+1)
    elseif type(v) == 'boolean' then
      System.LogAlways(formatting .. tostring(v))
    else
      System.LogAlways(formatting .. v)
    end
  end
end
