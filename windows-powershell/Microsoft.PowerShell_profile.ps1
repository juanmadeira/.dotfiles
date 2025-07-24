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

function c { clear }
function qt { exit }
function lg { lazygit }
