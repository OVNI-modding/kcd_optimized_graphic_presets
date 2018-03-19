if ogp.menu_util then return end
ogp.LoadScript( 'Scripts/ogp_logging.lua' )


ogp.menu_util = {}

---
--- Action type for buttons
---
ogp.menu_util.actionTypes = { apply='apply', back='back', reset='reset' }

---
--- Action type for buttons
---
function ogp.menu_util.ClearAll()
	local useLastSelect = 0
	UIAction.CallFunction( 'MainMenu', -1, 'ClearAll', useLastSelect )
end

---
--- Setup a new screen start
---
function ogp.menu_util.SetContainer( buttonXPos, buttonYPos, maxButtons )
	local containerIndex = 0
	UIAction.CallFunction( 'MainMenu', -1, 'SetContainer', containerIndex, buttonXPos, buttonYPos, maxButtons )
end

---
---
---
function ogp.menu_util.SetTitleBox( header )
	UIAction.CallFunction( 'MainMenu', -1, 'SetTitleBox', header )
end

---
--- Darkens the menu 0/1
---
function ogp.menu_util.SetMenuColor(state)
	UIAction.CallFunction( 'MainMenu', -1, 'SetMenuColor', tonumber(state) )
end

---
--- Adds a simple button to the menu
---
function ogp.menu_util.AddButton( buttonId, label, tooltip, actionType, containerIndex )
	local disabled = false
	local sound = ''
	UIAction.CallFunction( 'MainMenu', -1, 'AddButton', buttonId, containerIndex, label, actionType, tooltip, disabled, sound )
end

---
---
---
function ogp.menu_util.AddChoiceButton( buttonId, label, tooltip )
	local containerIndex = 0
	local disabled = false
	local sound = ''
	UIAction.CallFunction( 'MainMenu', -1, 'AddChoicesButton', buttonId, containerIndex, label, tooltip, disabled, sound )
end

---
---
---
function ogp.menu_util.AddChoiceOption( buttonId, label, tooltip, value )
	local containerIndex = 0
	local disabled = false
	local sound = ''
	UIAction.CallFunction( 'MainMenu', -1, 'AddChoiceOption', value, buttonId, containerIndex, label, tooltip, disabled, sound )
end

---
---
---
function ogp.menu_util.GetChoice( buttonId )
	local containerIndex = 0
	return tonumber( UIAction.CallFunction('MainMenu', -1, 'GetChoice', buttonId, containerIndex) )
end

---
---
---
function ogp.menu_util.SetChoice( buttonId, value )
	local containerIndex = 0
	UIAction.CallFunction( 'MainMenu', -1, 'SetChoice', buttonId, containerIndex, value )
end

---
---
--- int value
---
function ogp.menu_util.SetButtonChoice( button, value )

	if button == nil then return end
	if button.cvar == nil then return end
	if button.choices == nil then return end
	if value == nil then return end

	local containerIndex = 0
	local buttonId = button.cvar

	ogp.LogInfo( "Setting button choice: "..buttonId.. " = "..value )

	-- clamp choice to available values
	local minValue = button.choices[1].value
	local maxValue = minValue
	for _,choice in ipairs(button.choices) do
		if choice.value < minValue then minValue = choice.value end
		if choice.value > maxValue then maxValue = choice.value end
	end
	if value < minValue then value = minValue end
	if value > maxValue then value = maxValue end

	UIAction.CallFunction( 'MainMenu', -1, 'SetChoice', buttonId, containerIndex, value )
end

---
--- CallbackName(elementName, instanceId, eventName, argTable)
---
function ogp.menu_util.AddEventListener( eventName, callbackObject, callbackFunctionName )
	UIAction.RegisterElementListener(callbackObject, 'MainMenu', -1, eventName, callbackFunctionName)
end
