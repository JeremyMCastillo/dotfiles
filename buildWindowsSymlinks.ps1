# Create symlinks for Windows Neovim configuration files

function Clean-Existing-Link {
    param (
        [string]$LinkPath
    )
    if (Test-Path $LinkPath) {
        Write-Host "Removing existing link or directory: $LinkPath"
        Remove-Item $LinkPath -Recurse -Force
    }
}

# Neovim conifg
$Target = "$PSScriptRoot\nvim"
$Link = "$env:USERPROFILE\AppData\Local\nvim"
Clean-Existing-Link -LinkPath $Link
cmd /c "mklink /J $Link $Target"

# Wezterm config
$Target = "$PSScriptRoot\.wezterm.lua"
$Link = "$env:USERPROFILE\.wezterm.lua"
Clean-Existing-Link -LinkPath $Link
cmd /c "mklink /H $Link $Target"

# whkd config 
$Target = "$PSScriptRoot\.config\whkdrc"
$Link = "$env:USERPROFILE\.config\whkdrc"
Clean-Existing-Link -LinkPath $Link 
cmd /c "mklink /H $Link $Target"

# Komorebi config 
$Target = "$PSScriptRoot\komorebi.json"
$Link = "$env:USERPROFILE\komorebi.json"
Clean-Existing-Link -LinkPath $Link
cmd /c "mklink /H $Link $Target"
$Target = "$PSScriptRoot\komorebi.bar.json"
$Link = "$env:USERPROFILE\komorebi.bar.json"
Clean-Existing-Link -LinkPath $Link
cmd /c "mklink /H $Link $Target"
