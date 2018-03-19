

---
--- Init lua and xml localization.
---
function ogp.InitLocalization()
	-- ogp.LoadLuaLocalization()
	ogp.LoadXmlLocalization()
end

---
--- Loads Lua localization files.
---
function ogp.LoadLuaLocalization()
	ogp.LoadScript( 'ogp_english.lua' ) -- fallback
	ogp.LoadScript( 'ogp_' .. System.GetCVar('g_language') .. '.lua' )
end

---
--- Loads XML localization files.
---
function ogp.LoadXmlLocalization()
	System.LoadLocalizationXml( 'ogp_' .. System.GetCVar('g_language') .. '.xml' )

	-- LoadLocalizationXml does not override previously loaded strings.
	-- this allows to load english localization as a fallback.
	System.LoadLocalizationXml( 'ogp_english.xml' )
end

---
--- Localizes given string.
---
function ogp.Localize( str )
	return ogp.strings[str] or str
end


ogp.InitLocalization()
