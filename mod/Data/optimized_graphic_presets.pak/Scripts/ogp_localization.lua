-- I rather not overwrite xxx_ui.xml files since replacing everything would make this mod less future-proof


ogp.strings = {}


---
--- Loads localization files.
---
--- Note: It's rather memory-innefficient to load every languages, but there's not that much text.
--- Ideally, language change should be observed (if possible/convenient).
---
function ogp.InitLocalization()
	local languages = {"english", "french", "german", "spanish", "italian", "polish", "czech", "russian", "chineses", "turkish"}
	for _,language in ipairs(languages) do
		Script.ReloadScript( "ogp_" .. language .. ".lua" )
	end
end

---
--- Localizes given sting using ogp.strings[g_language] or ogp.strings.english
---
function ogp.Localize( string )
	local language = System.GetCVar("g_language")
	if ogp.strings[language] == nil then
		language = "english"
	end
	return ogp.strings[language][string] or ogp.strings["english"][string] or string
end


ogp.InitLocalization()
