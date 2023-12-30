@ECHO off
:: 
::               MateusAuri's
:: Steam Library 'What's New' Yeeter script
::           Version 202312290855
:: 
:: What's this?
::     This batch/powershell script hides that annoying "What's New" shelf or section from your Steam Library
:: 
:: Use instructions:
::     - Exit Steam
::     - Navigate to your Steam install directory (usually "C:\Program Files (x86)\Steam")
::     - Go into "steamui\css"
::     - Drop both BAT and PS1 files in the "css" folder (it should be in the same folder as "chunk~2dcc5aaf7.css")
::     - Double-click this BAT file
::     - Repeat the previous step whenever "What's New" pops back again into your library
:: You may want to create a shortcut to the BAT file for easier access in the future
:: 
:: Sets PowerShell permission to be able to run it at all
:: Because nothing ever can be simple with computers I hate this
:: And then runs the actual script file
POWERSHELL -ExecutionPolicy Bypass ".\SteamWhatsNewYeeter.ps1"
TIMEOUT 60
