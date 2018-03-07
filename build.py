#!/usr/bin/env python3.6

version='3.0.0'
name='optimized_graphic_presets'
packagePrefix='zzz_'
outputDir='builds'

#######################################

zipFilename=f'{name}_{version}.zip'
gamePackageName=f'{packagePrefix}{name}.pak'

import os
import io
import zipfile
join=os.path.join

#######
# PAK #
#######

gamePackage = io.BytesIO()
zout = zipfile.ZipFile( gamePackage, 'w', compression=zipfile.ZIP_STORED )

directory = join('Config', 'CVarGroups')
for file in os.listdir(directory):
	filename = os.fsdecode(file)
	zout.write( join(directory, filename) )

zout.write( join('Libs', 'UI', 'UIActions', 'MM_AdvancedGraphics.xml') )
zout.write( join('Libs', 'UI', 'UIActions', 'MM_IngameMenu.xml') )
zout.write( join('Libs', 'UI', 'UIActions', 'SYS_Main_1.xml') )

zout.close()

#######
# ZIP #
#######

zout = zipfile.ZipFile( join(outputDir, zipFilename), 'w', compression=zipfile.ZIP_DEFLATED )

zout.write('ogp_hotkeys.cfg')

directory = 'Config'
for file in os.listdir(directory):
	filename = os.fsdecode(file)
	if os.path.isfile(join(directory, filename) ):
		zout.write( join(directory, filename) )

directory = 'optimized_graphic_presets'
for file in os.listdir(directory):
	filename = os.fsdecode(file)
	zout.write( join(directory, filename) )

zout.write(
	join('dep', 'zzzzzz_kcd_flowgraph_hook.pak'),
	join('Data', 'zzzzzz_kcd_flowgraph_hook.pak')
)

zout.writestr( join('Data', gamePackageName), gamePackage.getvalue() )

zout.close()
