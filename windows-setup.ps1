<#
	Script de configuração do meu powershell.
	
	— juan.
	Data: 2024-04-11

	Última atualização: 2024-06-01
#>

# Instalação do Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression;

	# Importação dos pacotes do Scoop
	scoop import "packages/scoop-packages.json";

# Instalação do Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));

    # Importação dos pacotes do Chocolatey
    choco install "packages/chocolatey-packages.config";

# Instalação do WinGet
Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe;
