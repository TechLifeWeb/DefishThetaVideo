:: DefishThetaVideo
:: Created by Scott Kingery
:: techlifeweb.com
:: -------------------------
:: This batch file assumes you have connected your Theta S to your computer and copied all the video files to a 
:: the PHOTOPATH folder you specify below. It will then will loop through all the MP4 files in that folder and convert them from
:: dual fish eye videos into a 360 video.
:: The new file will have 360 added to the name. Example: R0010255.MP4 becomes R0010255-360.MP4
:: The original file is moved to a folder called Processed that will be created if necessary under your PHOTOPATH folder
:: -----------------------
:: This batch file requires you first install the Richo Theta tools for Windows
:: Download that software from here: https://theta360.com/en/support/download/
:: You MUST update the paths that are used on your system. See the notes below
:: ---------------------------
@echo off
SetLocal ENABLEDELAYEDEXPANSION

::Put the path to your Ricoh Theta program here
set defishpath=C:\Program Files (x86)\RICOH THETA\tools

::Put the path to the videos you want to process here
set photopath=E:\Imported\360ToProcess

::Once the original is processed we move it out of the way to a subfolder called processed
if not exist "%photopath%\processed" md "%photopath%\processed"

::No further edits needed. 
for  %%f in ("%photopath%\*.MP4") do (
	"%defishpath%\DualfishBlender.exe"  %%f %%~dpf%%~nf-360.MP4 -ts:0 -af:-20 -dynamic
	move "%%f" "%photopath%\processed\"
	)
	
:eof

