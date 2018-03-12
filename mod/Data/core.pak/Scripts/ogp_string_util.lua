

ogp.string = {}

function ogp.string.starts( str, pattern )
   return string.sub( str, 1, string.len(pattern) ) == pattern
end

function ogp.string.ends( str, pattern )
   return string.sub( str, -string.len(pattern) ) == pattern
end
