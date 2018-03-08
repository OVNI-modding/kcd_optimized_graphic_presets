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
from pathlib import Path

#######
# PAK #
#######

gamePackage = io.BytesIO()
zout = zipfile.ZipFile( gamePackage, 'w', compression=zipfile.ZIP_STORED )
# add everythin in pak folder
for root, dirs, files in os.walk('pak'):
	zipRoot = Path( *Path(root).parts[2:] )
	for file in files:
		zout.write( Path(root,file), zipRoot/file )
zout.close()

#######
# ZIP #
#######

zout = zipfile.ZipFile( Path(outputDir, zipFilename), 'w', compression=zipfile.ZIP_DEFLATED )

# hotkeys config
zout.write('ogp_hotkeys.cfg')
# presets
directory = 'Config'
for file in os.listdir(directory):
	filename = os.fsdecode(file)
	if os.path.isfile( Path(directory, filename) ):
		zout.write( Path(directory, filename) )
# add {name} folder
for file in Path(name).glob('**/*'):
	zout.write( file, Path(name, file.name) )
# README
zout.write( 'README.md', Path(f'{name}/README.md') )
# Package dependencies
for file in Path('dep').glob('*.pak'):
	zout.write( file, Path('Data',file.name) )
# New package
zout.writestr( str(Path('Data', gamePackageName)), gamePackage.getvalue() )

zout.close()
