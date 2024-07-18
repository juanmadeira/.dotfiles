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
function gt { D:\Documents\documentos\programas\_cli\gt\gt.exe }
function caderninho { cd D:\Documents\documentos\caderninho }