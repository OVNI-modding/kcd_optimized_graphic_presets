#!/usr/bin/env python3.6

version='3.1.0'
projectName='optimized_graphic_presets'
outputDir='builds'

#######################################

zipFilename=f'{projectName}_{version}.zip'

import io
import zipfile
from pathlib import Path

zout = zipfile.ZipFile( Path(outputDir, zipFilename), 'w', compression=zipfile.ZIP_DEFLATED )

# README
zout.write( 'README.md', Path(f'{projectName}/README.md') )

# setup
zout.write( 'ogp_setup.bat', Path(f'ogp_setup.bat') )

# Files in mod (not in sub dirs)
for file in Path('mod').glob('*.*'):
	if file.is_file():
		zout.write( str(file), Path(f'{projectName}/{file.name}') )

# Create in-memory package for each folder with .pak folder in mod/Data
for pak in Path('mod/Data').glob('**/*.pak'):
	if pak.is_dir():
		gamePackage = io.BytesIO()
		pakage = zipfile.ZipFile( gamePackage, 'w', compression=zipfile.ZIP_STORED )
		for file in pak.glob('**/*.*'):
			pakage.write( file, file.relative_to(pak) )
		pakage.close()
		zout.writestr( str(Path(projectName, 'Data', pak.name)), gamePackage.getvalue() )

# And .pak (dependencies) files
for pak in Path('mod/Data').glob('*.pak'):
	if pak.is_file():
		zout.write( str(pak), str(Path(projectName, 'Data', pak.name)) )

zout.close()
