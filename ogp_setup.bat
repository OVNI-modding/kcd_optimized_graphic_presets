@echo off

:MENU
	cls
	echo ================================================================
	echo Optimized Graphic Presets (OGP) mod for Kingdom Come Deliverance
	echo ================================================================
	echo.

	if NOT exist "system.cfg" goto :ERROR_WRONG_STARTING_PATH
	if NOT exist "optimized_graphic_presets" goto :ERROR_OGP_FOLDER_ABSENT

	echo Please enter a number to select your choice:
	echo.
	echo 1 - Install OGP
	echo 2 - Remove obsolete files from older OGP versions.
	echo 3 - Uninstall OGP
	echo 9 - EXIT
	echo.

	set /P C=Type a number then press ENTER:
	if %C%==1 goto :INSTALL
	if %C%==2 goto :REMOVE_OLD_VERSIONS
	if %C%==3 goto :UNINSTALL

goto :EOF


:ERROR_WRONG_STARTING_PATH
	echo /!\ ERROR: This tool must be started from game's Mods\optimized_graphic_presets folder.
	echo eg: C:\Program Files ^(x86^)\Steam\steamapps\common\KingdomComeDeliverance\Mods\optimized_graphic_presets
	echo.
	pause
goto :EOF


:ERROR_OGP_FOLDER_ABSENT
	echo /!\ ERROR: "optimized_graphic_presets" folder is missing.
	echo.
	pause
goto :EOF


:INSTALL
	cls
	mkdir "Mods" 2>nul
	move /Y "optimized_graphic_presets" "Mods\"
	mklink /D "Data\user_profile" "%USERPROFILE%\Saved Games\kingdomcome" 2>nul
	move /Y "optimized_graphic_presets\Data\zzz_optimized_graphic_presets.pak" "Data\"
	echo.
	echo Done.
	echo.
	pause
goto :EOF


:REMOVE_OLD_VERSIONS
	cls
	del "ogp_hotkeys.cfg" 2>nul
	del "ugly.cfg" 2>nul
	del "low.cfg" 2>nul
	del "med.cfg" 2>nul
	del "high.cfg" 2>nul
	del "ultra.cfg" 2>nul
	del "vanilla_low.cfg" 2>nul
	del "vanilla_med.cfg" 2>nul
	del "vanilla_high.cfg" 2>nul
	del "vanilla_vhigh.cfg" 2>nul
	del "vanilla_ultra.cfg" 2>nul
	del "texture.cfg" 2>nul
	del "reset.cfg" 2>nul
	del "optimized_graphic_presets\readme.txt" 2>nul
	del "optimized_graphic_presets\README.md" 2>nul
	del "optimized_graphic_presets\user.cfg" 2>nul
	REM del "Data\zzz_optimized_graphic_presets.pak" 2>nul
	del "Config\high.cfg" 2>nul
	del "Config\low.cfg" 2>nul
	del "Config\medium.cfg" 2>nul
	del "Config\ovni.cfg" 2>nul
	del "Config\template.cfg" 2>nul
	del "Config\ugly.cfg" 2>nul
	del "Config\ultra.cfg" 2>nul
	del "Config\verylow.cfg" 2>nul
	rmdir "optimized_graphic_presets" 2>nul
	rmdir "Config" 2>nul
	echo.
	echo Done.
	echo.
	pause
goto :MENU


:UNINSTALL
	cls
	rmdir "Data\profile" 2>nul
	del "Data\zzz_optimized_graphic_presets.pak" 2>nul
	rmdir /S /Q "Mods\optimized_graphic_presets" 2>nul
	echo.
	echo This program must now exit to self-destruct. So long cruel world :'(
	echo.
	pause
	REM .bat self-destruction must be the last line
	REM see https://stackoverflow.com/questions/2888976/how-to-make-bat-file-delete-it-self-after-completion/20333152#20333152
	(goto) 2>nul & del "%~f0"
