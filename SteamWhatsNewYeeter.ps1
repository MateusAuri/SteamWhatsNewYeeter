$host.ui.RawUI.WindowTitle = "'What's New' Yeeter by MateusAuri"
$lastupdated = 202606060230
$targetfilename = "chunk~2dcc5aaf7.css"
$targetclassname = "_17uEBe5Ri8TMsnfELvs8-N"
<#

               MateusAuri's
 Steam Library 'What's New' Yeeter script

What's this?
	This batch/powershell script hides that annoying "What's New" shelf from your Steam Library (on Windows)

Use instructions:
	- Navigate to your Steam install directory (usually "C:\Program Files (x86)\Steam")
	- Go into "steamui\css"
	- Drop both BAT and PS1 files inside this "css" folder (the files should be in the same folder as the file specified in "$targetfilename")
	- Double-click the BAT file
	- Repeat the previous step whenever "What's New" pops back again into your library
	
	You may want to create a shortcut to the BAT file for easier access in the future

#>
Write-Host "`n"
Write-Host "--------------------------------------------"
Write-Host "|               MateusAuri's               |"
Write-Host "| Steam Library 'What's New' Yeeter script |"
Write-Host "|              v$lastupdated               |"
Write-Host "--------------------------------------------"
Write-Host "`n"
Write-Host "Hi there! o/"
Write-Host "`n"
Write-Host "-------------------------------------------------------------------"

# Checks if the file exists
Function fileexists {
	return (Test-Path $targetfilename)
}

# Checks if the file is already modified
Function fileismodified {
	return (Select-String -Path $targetfilename -Pattern "cutedogs" -CaseSensitive -SimpleMatch -Quiet)
}

# Checks if Steam is running
Function steamisrunning {
	return ((Get-Process steam 2>$null) -Or (Get-Process steamservice 2>$null) -Or (Get-Process steamwebhelper 2>$null))
}

# Kills Steam processes until they're dead
Function closesteam {
	if (steamisrunning) {
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
}

# Reopens Steam
Function opensteam {
	Timeout /T 2 > $null
	..\..\steam.exe -nofriendsui 2>$null
}

# The main yeeting function
Function applythething {
	# Makes a backup of the CSS file
	Write-Host "`n"
	Write-Host "Backing the '$targetfilename' file up into '$targetfilename.bak'..."
	Copy-Item "$targetfilename" -Destination "$targetfilename.bak"
	# Inserts'display:none' into the properties of each mention of the CSS class specified in "$targetclassname"
	# And pads the text with cute dogs, which also enables detecting if the file has been modified already
	Write-Host "`n"
	Write-Host "Yeeting 'What's New'..."
	(Get-Content $targetfilename) | Foreach-Object {
		$_ -Replace "$targetclassname{box-sizing:border-box", "$targetclassname{display:none;cutedogs" `
		-Replace "$targetclassname{background:#000", "$targetclassname{display:none;z;" `
		-Replace "$targetclassname{height:300px", "$targetclassname{display:none" `
		-Replace "$targetclassname{height:283px", "$targetclassname{display:none" `
		-Replace "$targetclassname{background:none", "$targetclassname{display:none;z;"
	} | Set-Content $targetfilename
	# Removes the unwanted newline inserted by the previous command
	Write-Host "`n"
	Write-Host "Trimming some rough edges..."
	$bytes = [System.IO.File]::ReadAllBytes("$targetfilename")
	[System.IO.File]::WriteAllBytes("$targetfilename",$bytes[0..($bytes.length-3)])
	Write-Host "`n"
	Write-Host "Wrapping up..."
	Write-Host "`n"
	if (fileismodified) {
		Write-Host "'What's New' has been yeeted!"
	} else {
		Write-Host "Hmm, weird, something must've gone wrong..."
	}
	Write-Host "`n"
	Write-Host "-------------------------------------------------------------------"
}

# These are just used to compare user input
$yesses = @("y","yes","yos","yup","yea","yeah","yeag","yessir","affirmative","do it","hell yea","hell yeah","hell yeag","alright","aight","whatever","ok","okay","otay :)","f me up brah")
$noes = @("n","no","nop","nope","noo","dont","don't","don't you dare","yesn't")

# Main script logic starts here
if (!(fileexists)) {
	Write-Host "`n"
	Write-Host "Hey, wait a minute, I can't find the '$targetfilename' file!"
	Write-Host "Please make sure that you're running this script from inside the 'steamui\css' folder"
	Write-Host "Full path is probably 'C:\Program Files (x86)\Steam\steamui\css' for you"
	Write-Host "It should have a file called '$targetfilename' in there"
	Write-Host "`n"
	Write-Host "If there's no file with that name in the 'css' folder, a Steam update"
	Write-Host "might have changed the way the library works, and in that case,"
	Write-Host "you're gonna need to wait for an update"
	Write-Host "(or figure out how to do it yourself)"
} elseif (fileismodified) {
	Write-Host "`n"
	Write-Host "The '$targetfilename' file seems to be modified already!"
	Write-Host "That means the 'What's New' shelf has already been yeeted,"
} else {
	applythething
	if (steamisrunning) {
		Write-Host "`n"
		Write-Host "Steam needs to be restarted for the 'What's New' shelf to go away for good."
		$inputclosesteam = Read-Host "Do you want me to quickly force-close it? (y/n)"
		if ($inputclosesteam -in $yesses) {
			Write-Host "`n"
			Write-Host "Attempting to close Steam..."
			closesteam
		} elseif ($inputclosesteam -in $noes) {
			Write-Host "`n"
			Write-Host "OK! But you will need to restart it manually to apply the changes."
		} else {
			Write-Host "`n"
			Write-Host "Wha? I'll take that as a 'no', just in case..."
			Write-Host "You will need to restart it manually to apply the changes."
		}
	}
	if (!(steamisrunning)) {
		Write-Host "`n"
		$inputopensteam = Read-Host "Do you want me to reopen Steam right now? (y/n)"
		if ($inputopensteam -in $yesses) {
			Write-Host "`n"
			Write-Host "Attempting to open Steam..."
			opensteam
		} elseif ($inputopensteam -in $noes) {
			Write-Host "`n"
			Write-Host "OK!"
		} else {
			Write-Host "`n"
			Write-Host "Wha? I'll take that as a 'no', just in case..."
		}
	}
}
Write-Host "`n"
Write-Host "Alright, that's it for now!"
Write-Host "`n"
Write-Host "-------------------------------------------------------------------"
Write-Host "`n"
Write-Host "If you liked this script and would really really like to thank me,"
Write-Host "please consider throwing a dollar or so at me"
Write-Host "`n"
Write-Host "Donation links and updates at"
Write-Host "https://github.com/MateusAuri/SteamWhatsNewYeeter"
Write-Host "`n"
Write-Host "-------------------------------------------------------------------"
