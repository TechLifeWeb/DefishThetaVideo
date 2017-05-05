@echo off
SetLocal ENABLEDELAYEDEXPANSION
::Put the path to your hugin program here
set hughinpath=C:\Program Files (x86)\Hugin\bin

::Put the path to ExifTool here
set exiftoolpath=D:\OneDrive\Programs\ExifTool

::Put the pathe to your Ricoh Theta program here
set defishpath=C:\Program Files (x86)\RICOH THETA\tools

::Put the path to the pictures you want to straighten here
set photopath=E:\Imported\360ToProcess

::Once the original is processed we move it out of the way to a subfolder called processed
if not exist "%photopath%\processed" md "%photopath%\processed"

::No further edits needed. 
for  %%f in ("%photopath%\*.MP4") do (
	"%defishpath%\DualfishBlender.exe"  %%f %%~dpf%%~nf-360.MP4 -ts:0 -af:-20 -dynamic
	move "%%f" "%photopath%\processed\"
	)
	
:eof

