

ogp.string = {}

function ogp.string.Starts( str, pattern )
   return string.sub( str, 1, string.len(pattern) ) == pattern
end

function ogp.string.Ends( str, pattern )
   return string.sub( str, -string.len(pattern) ) == pattern
end
