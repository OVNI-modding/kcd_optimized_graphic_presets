@echo off
cls

echo.
echo This tool will remove files from older version of Optimized Graphic Presets (OGP) mod for Kingdom Come Deliverance.
echo.
echo IMPORTANT: user.cfg will stay as it is. If you no longer need it, you should delete it, overwise delete the OGP parts from it.
echo.
echo Press a key to continue...
echo.
pause

if exist "system.cfg" (
	del "ugly.cfg"
	del "low.cfg"
	del "med.cfg"
	del "high.cfg"
	del "ultra.cfg"
	del "vanilla_low.cfg"
	del "vanilla_med.cfg"
	del "vanilla_high.cfg"
	del "vanilla_vhigh.cfg"
	del "vanilla_ultra.cfg"
	del "texture.cfg"
	del "reset.cfg"
	del "optimized_graphic_presets\readme.txt"
	del "optimized_graphic_presets\README.md"
	del "optimized_graphic_presets\user.cfg"
	del "Data\zzz_optimized_graphic_presets.pak"
	del "Config\high.cfg"
	del "Config\low.cfg"
	del "Config\medium.cfg"
	del "Config\ovni.cfg"
	del "Config\template.cfg"
	del "Config\ugly.cfg"
	del "Config\ultra.cfg"
	del "Config\verylow.cfg"
	rmdir "optimized_graphic_presets"
	rmdir "Config"
	REM del "ogp_hotkeys.cfg"
) else (
	cls
	echo.
	echo Error: Please launch this tool in the game's root directory
	echo ^(eg^: C^:\Program Files ^(x86^)\Steam\steamapps\common\KingdomComeDeliverance\ ^)
	echo.
	pause
)
