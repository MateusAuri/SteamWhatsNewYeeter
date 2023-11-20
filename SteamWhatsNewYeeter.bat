@ECHO off
:: 
:: Steam Library's 'What's New' Yeeter
:: by MateusAuri
:: last updated 202311192247
:: 
:: What's this?
::     This script hides that annoying "What's New" section from your Steam Library
:: 
:: Use instructions:
::     - Exit Steam
::     - Navigate to your Steam install directory (usually "C:\Program Files (x86)\Steam")
::     - Go into "steamui\css"
::     - Drop both BAT and PS1 files in the "css" folder (it should be in the same folder as "chunk~2dcc5aaf7.css")
::     - Double-click this BAT file
::     - Repeat the previous step whenever "What's New" pops back again into your library
:: 
:: Sets PowerShell permission to be able to run it at all because nothing ever can be simple with computers I hate this
:: And then runs the actual script file
POWERSHELL -ExecutionPolicy Bypass ".\SteamWhatsNewYeeter.ps1"