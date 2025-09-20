# Create symlinks for Windows Neovim configuration files
mklink -Path "$env:USERPROFILE\AppData\Local\nvim" -Target "$PSScriptRoot\..\nvim" -ItemType Junction -Force
