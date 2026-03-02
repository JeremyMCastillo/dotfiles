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

# Powershell profile
$Target = "$PSScriptRoot\Microsoft.PowerShell_profile.ps1"
$Link = "$profile"
Clean-Existing-Link -LinkPath $Link
cmd /c "mklink /H $Link $Target"
$Target = "$PSScriptRoot\powershell\settings.json"
$Link = "C:\Users\jcast\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
Clean-Existing-Link -LinkPath $Link
cmd /c "mklink /H $Link $Target"

# Claude Code config
$Target = "$PSScriptRoot\.claude\settings.json"
$Link = "$env:USERPROFILE\.claude\settings.json"
if (-not (Test-Path "$env:USERPROFILE\.claude")) { New-Item -ItemType Directory -Path "$env:USERPROFILE\.claude" | Out-Null }
Clean-Existing-Link -LinkPath $Link
cmd /c "mklink /H $Link $Target"
$Target = "$PSScriptRoot\.claude\skills"
$Link = "$env:USERPROFILE\.claude\skills"
Clean-Existing-Link -LinkPath $Link
cmd /c "mklink /J $Link $Target"
