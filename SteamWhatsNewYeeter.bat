@ECHO off
:: 
::               MateusAuri's
:: Steam Library 'What's New' Yeeter script
::
::What's this?
::    This batch/powershell script hides that annoying "What's New" shelf from your Steam Library (on Windows)
::
::Use instructions:
::    - Navigate to your Steam install directory (usually "C:\Program Files (x86)\Steam")
::    - Go into "steamui\css"
::    - Drop both BAT and PS1 files inside this "css" folder (the files should be in the same folder as "chunk~2dcc5aaf7.css")
::    - Double-click the BAT file
::    - Repeat the previous step whenever "What's New" pops back again into your library
:: 
::    You may want to create a shortcut to the BAT file for easier access in the future
:: 
:: This BAT file only exists to set the required permissions and then run the actual script from the PS1 file.
:: Because nothing's ever simple with computers. I hate this.
:: 
POWERSHELL -ExecutionPolicy Bypass ".\SteamWhatsNewYeeter.ps1"
ECHO 
ECHO.
ECHO This window will close itself in 90 seconds...
ECHO Enjoy your uncluttered library! :)
ECHO Bye! o/
ECHO.
TIMEOUT 90
