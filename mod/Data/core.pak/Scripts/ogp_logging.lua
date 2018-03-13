
function ogp.Log(msg)
	System.LogAlways( "[OGP] " .. tostring(msg) )
end

function ogp.LogInfo(msg)
	ogp.Log( msg )
end

function ogp.LogWarning(msg)
	ogp.Log( "Warning: " .. tostring(msg) )
end

function ogp.LogError(msg)
	ogp.Log( "Error: " .. tostring(msg) )
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
