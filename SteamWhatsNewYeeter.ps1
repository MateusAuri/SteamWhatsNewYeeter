$host.ui.RawUI.WindowTitle = "MateusAuri's Steam Library 'What's New' Yeeter script"

$lastupdated = 202312290855
<# 
              MateusAuri's
Steam Library 'What's New' Yeeter script

What's this?
    This batch/powershell script hides that annoying "What's New" shelf or section from your Steam Library

Use instructions:
    - Navigate to your Steam install directory (usually "C:\Program Files (x86)\Steam")
    - Go into "steamui\css"
    - Drop both BAT and PS1 files in the "css" folder (it should be in the same folder as "chunk~2dcc5aaf7.css")
    - Double-click the BAT file
    - Repeat the previous step whenever "What's New" pops back again into your library
    
    You may want to create a shortcut to the BAT file for easier access in the future
#>
Write-Host "`n"
Write-Host "--------------------------------------------"
Write-Host "|               MateusAuri's               |"
Write-Host "| Steam Library 'What's New' Yeeter script |"
Write-Host "|           Version $lastupdated           |"
Write-Host "--------------------------------------------"
# Assumes that Steam is running just in case
[bool] $steamisrunning = 1
# Checks if Steam is actually running
Write-Host "`n"
Write-Host "Checking if Steam is running..."
if ((Get-Process steam 2>$null) -Or (Get-Process steamservice 2>$null) -Or (Get-Process steamwebhelper 2>$null)) {
    [bool] $steamisrunning = 1
    Write-Host "`n"
    Write-Host "Steam seems to be running"
    Write-Host "But don't fret, I'll deal with that for you"
} else {
    [bool] $steamisrunning = 0
    Write-Host "`n"
    Write-Host "Steam is not running, that's nice!"
}

# "Function" that is applied if the file is not modified yet
$applythething = {
    Write-Host "`n"
    # Kills Steam process until it's dead
    if ($steamisrunning) {
        Write-Host "Killing Steam processes..."
        if (Get-Process steam 2>$null) {
            Get-Process steam | Stop-Process -Force 2>$null
        }
        Timeout /T 5 > $null
        if (Get-Process steamwebhelper 2>$null) {
            Get-Process steamwebhelper | Stop-Process -Force 2>$null
        }
        Timeout /T 5 > $null
        if (Get-Process steamservice 2>$null) {
            Get-Process steamservice | Stop-Process -Force 2>$null
        }
    }
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
    # Reopens Steam
    if ($steamisrunning) {
        Write-Host "Reopening Steam..."
        Timeout /T 2 > $null
        ..\..\steam.exe -nofriendsui 2>$null
    }
    Write-Host "`n"
    Write-Host "Done!"
}

# Checks if file is already modified
if (!(Test-Path chunk~2dcc5aaf7.css)) {
    Write-Host "`n"
    Write-Host "Hey, wait a minute, I can't find the 'chunk~2dcc5aaf7.css' file!"
    Write-Host "Please make sure that you're running this script from inside the 'steamui\css' folder"
    Write-Host "Full path is probably 'C:\Program Files (x86)\Steam\steamui\css' for you"
    Write-Host "It should have a file called 'chunk~2dcc5aaf7.css' in there"
} elseif (Select-String -Path chunk~2dcc5aaf7.css -Pattern "height:324px" -SimpleMatch -Quiet) {
    &$applythething
} else {
    Write-Host "`n"
    Write-Host "Wait, 'chunk~2dcc5aaf7.css' seems to be modified already"
    Write-Host "Which means that the 'What's New' shelf has already been yeeted (for now)"
}
# Wraps it up
Write-Host "`n"
Write-Host "If you liked this script and would really really like to thank me,"
Write-Host "Please consider throwing a dollar or so at me, because I'm broke af right now"
Write-Host "`n"
Write-Host "Donation links and updates at"
Write-Host "https://github.com/MateusAuri/SteamWhatsNewYeeter"
Write-Host "`n"
Write-Host "Okay, exiting script now..."
Write-Host "Enjoy your uncluttered library! :)"
Write-Host "Bye!"
Write-Host "`n"
