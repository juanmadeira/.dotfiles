# ~/Documents/WindowsPowerShell

# starship
Invoke-Expression (&starship init powershell)

# PSFzf
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
