#!/usr/bin/env python3.6

version='3.0.0'
name='optimized_graphic_presets'

import os
import io
import zipfile


gamePackage = io.BytesIO()
zout = zipfile.ZipFile( gamePackage, 'w', compression=zipfile.ZIP_STORED )

directory = os.path.join('Config', 'CVarGroups')
for file in os.listdir(directory):
	filename = os.fsdecode(file)
	zout.write( os.path.join(directory, filename) )

fullFilename = os.path.join('Libs', 'UI', 'UIActions', 'MM_AdvancedGraphics.xml')
zout.write(fullFilename)

fullFilename = os.path.join('Libs', 'UI', 'UIActions', 'MM_IngameMenu.xml')
zout.write(fullFilename)

zout.close()


zipFilename=f'kcd_{name}_{version}.zip'
zout = zipfile.ZipFile( os.path.join('builds', zipFilename), 'w', compression=zipfile.ZIP_DEFLATED )

zout.write('ogp_hotkeys.cfg')

directory = 'Config'
for file in os.listdir(directory):
	filename = os.fsdecode(file)
	if os.path.isfile(os.path.join(directory, filename) ):
		zout.write( os.path.join(directory, filename) )

directory = 'optimized_graphic_presets'
for file in os.listdir(directory):
	filename = os.fsdecode(file)
	zout.write( os.path.join(directory, filename) )

gamePackageName=f'zzz_{name}.pak'
zout.writestr( os.path.join('Data', gamePackageName), gamePackage.getvalue() )

zout.close()
