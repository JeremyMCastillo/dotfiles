Invoke-Expression (& { (zoxide init powershell | Out-String) })
Set-Alias lg lazygit
Set-Alias ls eza
function kb { komorebic start --whkd }
function kq { komorebic stop }
function efmigration {
    $DIR = Get-Location
    Set-Location "C:\projects\nliven\WebPurchasing"

    dotnet exec `
        --depsfile .\bin\Debug\net8.0\WebPurchasing.deps.json `
        --runtimeconfig .\bin\Debug\net8.0\WebPurchasing.runtimeconfig.json `
        "$env:USERPROFILE\.nuget\packages\entityframework\6.4.4\tools\netcoreapp3.0\any\ef6.dll" `
        migrations add $args[0] --assembly .\bin\Debug\net8.0\WebPurchasing.dll --project-dir .

    Set-Location $DIR
}

function prune-merged {
  echo "Pruning merged branches..."
  git branch --merged | Where-Object { $_ -notmatch '^\*|master|main|dev' } | ForEach-Object { git branch -d $_.Trim() }
}
