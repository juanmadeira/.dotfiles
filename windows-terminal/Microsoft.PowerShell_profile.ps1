# %userprofile%/Documents/WindowsPowerShell

# starship
Invoke-Expression (&starship init powershell)

# PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'