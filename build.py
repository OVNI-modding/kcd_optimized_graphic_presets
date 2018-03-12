#!/usr/bin/env python3.6

version='3.0.0'
projectName='optimized_graphic_presets'
packagePrefix='zzz_'
outputDir='builds'

#######################################

zipFilename=f'{projectName}_{version}.zip'

import io
import zipfile
from pathlib import Path

zout = zipfile.ZipFile( Path(outputDir, zipFilename), 'w', compression=zipfile.ZIP_DEFLATED )

# README
zout.write( 'README.md', Path(f'Mods/{projectName}/README.md') )

# Files in mod (not in sub dirs)
for file in Path('mod').glob('*.*'):
	if file.is_file():
		zout.write( str(file), Path(f'Mods/{projectName}/{file.name}') )


# Create in-memory package for each folder with .pak folder in mod/Data
for pak in Path('mod/Data').glob('**/*.pak'):
	if pak.is_dir():
		gamePackage = io.BytesIO()
		pakage = zipfile.ZipFile( gamePackage, 'w', compression=zipfile.ZIP_STORED )
		for file in pak.glob('**/*.*'):
			pakage.write( file, file.relative_to(pak) )
		pakage.close()
		zout.writestr( str(Path('Mods', projectName, 'Data', pak.name)), gamePackage.getvalue() )

zout.close()
