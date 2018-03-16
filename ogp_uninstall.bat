@echo off

:MENU
	cls
	echo ========================================================================
	echo Uninstaller for Optimized Graphic Presets (Kingdom Come Deliverance mod)
	echo ========================================================================
	echo.

	if NOT exist "system.cfg" goto :ERROR_WRONG_STARTING_PATH

	echo This will remove files from any version of OGP.

	set /M Do you want to continue [Y,N] ?
	if Errorlevel 1 goto :UNINSTALL

goto :EOF


:ERROR_WRONG_STARTING_PATH
	echo /!\ ERROR: This tool must be started from game's root folder.
	echo eg: C:\Program Files ^(x86^)\Steam\steamapps\common\KingdomComeDeliverance
	echo.
	pause
goto :EOF


:UNINSTALL
	cls

	if NOT exist "optimized_graphic_presets" goto :ERROR_OGP_FOLDER_ABSENT

	REM Remove files from versions 1.x and 2.x

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
	del "ogp_hotkeys.cfg" 2>nul

	del "optimized_graphic_presets\readme.txt" 2>nul
	del "optimized_graphic_presets\README.md" 2>nul
	del "optimized_graphic_presets\user.cfg" 2>nul
	rmdir "optimized_graphic_presets" 2>nul

	del "Config\high.cfg" 2>nul
	del "Config\low.cfg" 2>nul
	del "Config\medium.cfg" 2>nul
	del "Config\ovni.cfg" 2>nul
	del "Config\template.cfg" 2>nul
	del "Config\ugly.cfg" 2>nul
	del "Config\ultra.cfg" 2>nul
	del "Config\verylow.cfg" 2>nul
	rmdir "Config" 2>nul

	del "Data\zzz_optimized_graphic_presets.pak" 2>nul

	REM old 3.0.x bugged out-of place files

	del "Data\user_profile\ogp_settings.xml" 2>nul
	rmdir "Data\user_profile" 2>nul

	REM v3.0.x and up

	del "Data\zzz_optimized_graphic_presets.pak" 2>nul

	REM v3 and up

	rmdir /S /Q "Mods\optimized_graphic_presets" 2>nul

	echo.
	echo ====================================================================
	echo.
	echo                               Done.
	echo.
	echo Note that user.cfg was not removed (since it is not specific to OGP)
	echo                You may want to remove it youself.
	echo.
	echo This program must now exit to self-destruct. So long cruel world :'(
	echo.
	echo =====================================================================
	echo.
	pause
	REM .bat self-destruction must be the last line
	REM see https://stackoverflow.com/questions/2888976/how-to-make-bat-file-delete-it-self-after-completion/20333152#20333152
	(goto) 2>nul & del "%~f0"
