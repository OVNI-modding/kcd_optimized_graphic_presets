@echo off

:MENU
	cls
	echo ==========================================================================
	echo Setup for Optimized Graphic Presets (OGP) mod for Kingdom Come Deliverance
	echo ==========================================================================
	echo.
	if NOT exist "..\..\system.cfg" (
		echo /!\ ERROR: This tool must be started from game's Mods\optimized_graphic_presets folder.
		echo eg: C:\Program Files ^(x86^)\Steam\steamapps\common\KingdomComeDeliverance\Mods\optimized_graphic_presets
		echo.
		pause
		goto :EOF
	)
	echo Please enter a number to select your choice:
	echo.
	echo 1 - Install OGP
	echo 2 - Remove obsolete files from older OGP versions.
	echo 9 - EXIT
	echo.
	set /P C=Type a number then press ENTER:
	if %C%==1 goto :INSTALL
	if %C%==2 goto :REMOVE_OLD_VERSIONS
goto :EOF


:INSTALL
	cls
	mklink /D "..\..\Data\profile" "%USERPROFILE%\Saved Games\kingdomcome"
	echo.
	pause
goto :MENU


:REMOVE_OLD_VERSIONS
	cls
	del "..\..\ogp_hotkeys.cfg"
	del "..\..\ugly.cfg"
	del "..\..\low.cfg"
	del "..\..\med.cfg"
	del "..\..\high.cfg"
	del "..\..\ultra.cfg"
	del "..\..\vanilla_low.cfg"
	del "..\..\vanilla_med.cfg"
	del "..\..\vanilla_high.cfg"
	del "..\..\vanilla_vhigh.cfg"
	del "..\..\vanilla_ultra.cfg"
	del "..\..\texture.cfg"
	del "..\..\reset.cfg"
	del "..\..\optimized_graphic_presets\readme.txt"
	del "..\..\optimized_graphic_presets\README.md"
	del "..\..\optimized_graphic_presets\user.cfg"
	del "..\..\Data\zzz_optimized_graphic_presets.pak"
	del "..\..\Config\high.cfg"
	del "..\..\Config\low.cfg"
	del "..\..\Config\medium.cfg"
	del "..\..\Config\ovni.cfg"
	del "..\..\Config\template.cfg"
	del "..\..\Config\ugly.cfg"
	del "..\..\Config\ultra.cfg"
	del "..\..\Config\verylow.cfg"
	rmdir "..\..\optimized_graphic_presets"
	rmdir "..\..\Config"
	echo.
	echo Note: some errors may have occured for files that didn't exist. That's OKAY.
	echo.
	pause
goto :MENU
