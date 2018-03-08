#!/usr/bin/env python3.6

version='3.0.0'
name='optimized_graphic_presets'
packagePrefix='zzz_'
outputDir='builds'

#######################################

zipFilename=f'{name}_{version}.zip'
gamePackageName=f'{packagePrefix}{name}.pak'

import io
import zipfile
from pathlib import Path

#######
# PAK #
#######

gamePackage = io.BytesIO()
zout = zipfile.ZipFile( gamePackage, 'w', compression=zipfile.ZIP_STORED )
# add all files in pak folder
for file in Path('pak').glob('**/*.*'):
	zout.write( file, file.relative_to('pak') )
zout.close()

#######
# ZIP #
#######

zout = zipfile.ZipFile( Path(outputDir, zipFilename), 'w', compression=zipfile.ZIP_DEFLATED )

# hotkeys config
zout.write('ogp_hotkeys.cfg')
# presets
for file in Path('Config').glob('*.cfg'):
	zout.write(file)
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
