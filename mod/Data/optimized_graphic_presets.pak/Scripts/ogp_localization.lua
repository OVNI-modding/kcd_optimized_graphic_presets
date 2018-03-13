--
-- There are issues with vanilla localization system :
-- 1) overriding xxx_ui.xml file is out of question since we want to add strings, not replace the whole thing
--    (ie: new pathes may add new string, we dont want to remove them by overriding localization file...)
-- 2) System.LoadLocalizationXml does not fail when given file does not exists, making impossible to detect dynamically
--    if a localization file was added.
-- 3) System.LoadLocalizationXml does not allow to override (so we cannot load english first as a failsafe, then g_language afterward)
--

ogp.strings = {}

---
--- Loads localization files.
---
function ogp.InitLocalization()
	Script.ReloadScript( 'ogp_english.lua' ) -- failsafe
	Script.ReloadScript( 'ogp_' .. System.GetCVar('g_language') .. '.lua' )
end

---
--- Localizes given string if it starts by '@'
---
function ogp.Localize( str )
	if string.sub(str,1,1) ~= '@' then
		return str
	end
	return ogp.strings[ string.sub(str,2) ] or str
end


ogp.InitLocalization()
