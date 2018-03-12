
ogp.menu_util = {}

---
--- Action type for buttons
---
ogp.menu_util.actionTypes = { apply="apply", back="back", reset="reset" }

---
--- Action type for buttons
---
function ogp.menu_util.ClearAll()
	local useLastSelect = 0
	UIAction.CallFunction( "MainMenu", -1, "ClearAll", useLastSelect )
end

---
--- Setup a new screen start
---
function ogp.menu_util.SetContainer( buttonXPos, buttonYPos, maxButtons )
	local containerIndex = 0
	UIAction.CallFunction( "MainMenu", -1, "SetContainer", containerIndex, buttonXPos, buttonYPos, maxButtons )
end

---
---
---
function ogp.menu_util.SetTitleBox( header )
	UIAction.CallFunction( "MainMenu", -1, "SetTitleBox", header )
end

---
--- Darkens the menu 0/1
---
function ogp.menu_util.SetMenuColor(state)
	UIAction.CallFunction( "MainMenu", -1, "SetMenuColor", tonumber(state) )
end

---
--- Adds a simple button to the menu
---
function ogp.menu_util.AddButton( buttonId, label, tooltip, actionType, containerIndex )
	local disabled = false
	local sound = ""
	UIAction.CallFunction( "MainMenu", -1, "AddButton", buttonId, containerIndex, label, actionType, tooltip, disabled, sound )
end

---
---
---
function ogp.menu_util.AddChoiceButton( buttonId, label, tooltip )
	local containerIndex = 0
	local disabled = false
	local sound = ""
	UIAction.CallFunction( "MainMenu", -1, "AddChoicesButton", buttonId, containerIndex, label, tooltip, disabled, sound )
end

---
---
---
function ogp.menu_util.AddChoiceOption( buttonId, label, tooltip, value )
	local containerIndex = 0
	local disabled = false
	local sound = ""
	UIAction.CallFunction( "MainMenu", -1, "AddChoiceOption", value, buttonId, containerIndex, label, tooltip, disabled, sound )
end

---
---
---
function ogp.menu_util.GetChoice( buttonId )
	local containerIndex = 0
	return tonumber( UIAction.CallFunction("MainMenu", -1, "GetChoice", buttonId, containerIndex) )
end

---
---
---
function ogp.menu_util.SetChoice( buttonId, value )
	local containerIndex = 0
	UIAction.CallFunction( "MainMenu", -1, "SetChoice", buttonId, containerIndex, value )
end
