$host.ui.RawUI.WindowTitle = "Steam Library's 'What's New' Yeeter by MateusAuri"
<# 
Steam Library's 'What's New' Yeeter
by MateusAuri
last updated 202311192247

What's this?
    This batch script hides that annoying "What's New" section from your Steam Library

Use instructions:
    - Exit Steam
    - Navigate to your Steam install directory (usually "C:\Program Files (x86)\Steam")
    - Go into "steamui\css"
    - Drop both BAT and PS1 files in the "css" folder (it should be in the same folder as "chunk~2dcc5aaf7.css")
    - Double-click the BAT file
    - Repeat the previous step whenever "What's New" pops back again into your library
#>
# Makes a backup of the CSS file
Write-Host "Backing the 'chunk~2dcc5aaf7.css' file up into 'chunk~2dcc5aaf7.css.bak'..."
Copy-Item "chunk~2dcc5aaf7.css" -Destination "chunk~2dcc5aaf7.css.bak"
# Replaces all instances of 'height:324px' with 'display:none'
Write-Host "Yeeting 'What's New'..."
(Get-Content chunk~2dcc5aaf7.css) -Replace 'height:324px', 'display:none' | Set-Content chunk~2dcc5aaf7.css
# Removes the unwanted newline inserted by the previous command
Write-Host "Trimming some rough edges..."
$bytes = [System.IO.File]::ReadAllBytes("chunk~2dcc5aaf7.css")
[System.IO.File]::WriteAllBytes("chunk~2dcc5aaf7.css",$bytes[0..($bytes.length-3)])
# ???
Write-Host "Done!"
Write-Host "Exiting script..."
# Profit!
Timeout /T 3 > $null