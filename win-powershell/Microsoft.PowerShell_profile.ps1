# ~/Documents/WindowsPowerShell

# starship
Invoke-Expression (&starship init powershell);

# chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# aliases
function ~ { cd ~ }
function .. { cd .. }
function caderninho { cd D:\Documents\documentos\caderninho }

New-Alias -Name gt -Value D:\Documents\documentos\programas\_cli\gt\gt.exe

