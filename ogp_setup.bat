@echo off

:MENU
	cls
	echo ================================================================
	echo Optimized Graphic Presets (OGP) mod for Kingdom Come Deliverance
	echo ================================================================
	echo.

	if NOT exist "system.cfg" goto :ERROR_WRONG_STARTING_PATH

	echo Please enter a number to select your choice:
	echo.
	echo 1 - Install or Update
	echo 2 - Uninstall
	echo 9 - EXIT
	echo.

	set /P C=Type a number then press ENTER:
	if %C%==1 goto :INSTALL
	if %C%==2 goto :UNINSTALL
	if %C%==3 goto :REMOVE_OLD_VERSIONS

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

	if NOT exist "optimized_graphic_presets" goto :ERROR_OGP_FOLDER_ABSENT

	REM Remove files from old versions
	mkdir "obsolete" 2>nul
	move /Y "ogp_hotkeys.cfg" "obsolete" 2>nul
	move /Y "ugly.cfg" "obsolete" 2>nul
	move /Y "low.cfg" "obsolete" 2>nul
	move /Y "med.cfg" "obsolete" 2>nul
	move /Y "high.cfg" "obsolete" 2>nul
	move /Y "ultra.cfg" "obsolete" 2>nul
	move /Y "vanilla_low.cfg" "obsolete" 2>nul
	move /Y "vanilla_med.cfg" "obsolete" 2>nul
	move /Y "vanilla_high.cfg" "obsolete" 2>nul
	move /Y "vanilla_vhigh.cfg" "obsolete" 2>nul
	move /Y "vanilla_ultra.cfg" "obsolete" 2>nul
	move /Y "texture.cfg" "obsolete" 2>nul
	move /Y "reset.cfg" "obsolete" 2>nul
	move /Y "optimized_graphic_presets\readme.txt" "obsolete" 2>nul
	REM move /Y "optimized_graphic_presets\README.md" "obsolete" 2>nul
	move /Y "optimized_graphic_presets\user.cfg" "obsolete" 2>nul
	rmdir "optimized_graphic_presets" 2>nul
	REM move /Y "Data\zzz_optimized_graphic_presets.pak" "obsolete" 2>nul
	mkdir "obsolete\Config" 2>nul
	move /Y "ogp_hotkeys.cfg" "obsolete\Config" 2>nul
	move /Y "Config\high.cfg" "obsolete\Config" 2>nul
	move /Y "Config\low.cfg" "obsolete\Config" 2>nul
	move /Y "Config\medium.cfg" "obsolete\Config" 2>nul
	move /Y "Config\ovni.cfg" "obsolete\Config" 2>nul
	move /Y "Config\template.cfg" "obsolete\Config" 2>nul
	move /Y "Config\ugly.cfg" "obsolete\Config" 2>nul
	move /Y "Config\ultra.cfg" "obsolete\Config" 2>nul
	move /Y "Config\verylow.cfg" "obsolete\Config" 2>nul
	rmdir "Config" 2>nul
	rmdir "obsolete\Config" 2>nul
	rmdir "obsolete" 2>nul

	REM Install new version
	mkdir "Mods" 2>nul
	mklink /D "Data\user_profile" "%USERPROFILE%\Saved Games\kingdomcome" 2>nul
	rmdir /S /Q "Mods\optimized_graphic_presets" 2>nul
	@echo on
	move /Y "optimized_graphic_presets\Data\optimized_graphic_presets.pak" "Data\zzz_optimized_graphic_presets.pak"
	move /Y "optimized_graphic_presets" "Mods\"
	@echo off

	REM IF %errorlevel% NEQ 0 echo ERROR

	echo.
	echo =============================================================================
	echo.
	echo                                   Done.
	echo                     (look above for possible errors)
	echo.
	echo.
	echo. If found, user.cfg and obsolete files from older verisons of OGP were moved
	echo.                          Within 'obsolete' foler
	echo.  It is safe to delete it (unless you did some changes you'd like to keep)
	echo.
	echo =============================================================================
	echo.
	pause
goto :EOF


:UNINSTALL
	cls
	@echo on
	rmdir "Data\user_profile" 2>nul
	del "Data\zzz_optimized_graphic_presets.pak" 2>nul
	rmdir /S /Q "Mods\optimized_graphic_presets" 2>nul
	@echo off
	echo.
	echo ====================================================================
	echo.
	echo                            Done.
	echo.
	echo This program must now exit to self-destruct. So long cruel world :'(
	echo.
	echo =====================================================================
	echo.
	pause
	REM .bat self-destruction must be the last line
	REM see https://stackoverflow.com/questions/2888976/how-to-make-bat-file-delete-it-self-after-completion/20333152#20333152
	(goto) 2>nul & del "%~f0"
