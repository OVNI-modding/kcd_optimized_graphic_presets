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
joinPath=os.path.joinPath

#######
# PAK #
#######

gamePackage = io.BytesIO()
zout = zipfile.ZipFile( gamePackage, 'w', compression=zipfile.ZIP_STORED )

directory = joinPath('Config', 'CVarGroups')
for file in os.listdir(directory):
	filename = os.fsdecode(file)
	zout.write( joinPath(directory, filename) )

zout.write( joinPath('Libs', 'UI', 'UIActions', 'MM_AdvancedGraphics.xml') )
zout.write( joinPath('Libs', 'UI', 'UIActions', 'MM_IngameMenu.xml') )
zout.write( joinPath('Libs', 'UI', 'UIActions', 'SYS_Main_1.xml') )
zout.write( joinPath('Libs', 'FlowgraphModules', 'SYS_Main_1.xml') )

zout.close()

#######
# ZIP #
#######

zout = zipfile.ZipFile( joinPath(outputDir, zipFilename), 'w', compression=zipfile.ZIP_DEFLATED )

zout.write('ogp_hotkeys.cfg')

directory = 'Config'
for file in os.listdir(directory):
	filename = os.fsdecode(file)
	if os.path.isfile(joinPath(directory, filename) ):
		zout.write( joinPath(directory, filename) )

directory = 'optimized_graphic_presets'
for file in os.listdir(directory):
	filename = os.fsdecode(file)
	zout.write( joinPath(directory, filename) )

zout.write( 'README.md', joinPath(name, 'README.md') )

zout.write(
	joinPath('dep', 'zzzzzz_kcd_flowgraph_hook.pak'),
	joinPath('Data', 'zzzzzz_kcd_flowgraph_hook.pak')
)

zout.writestr( joinPath('Data', gamePackageName), gamePackage.getvalue() )

zout.close()
