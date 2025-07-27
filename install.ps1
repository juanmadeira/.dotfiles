<#
	script de configuração do meu windows 10
	
	— juan.
	data: 2024-04-11

	última atualização: 2025-07-24
#>

##################
### INSTALAÇÃO ###
##################

clear;
echo "";

# instalar scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression;

	# importar pacotes do scoop
    scoop bucket add extras; scoop bucket add games;
	scoop import "packages-scoop.json";


# instalar chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));

	# importar pacotes do chocolatey
	choco install "packages-chocolatey.config";


# instalar winget
Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe;

# copiar configurações
cp ../.config/starship.toml ~/.config;
cp -r ../.config/nvim ~/AppData/Local;
