<#
	script de configuração do meu windows (powershell)
	
	— juan.
	data: 2024-04-11

	última atualização: 2024-06-02
#>

# instalação do scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression;

	# importação dos pacotes do scoop
	scoop import "packages/scoop-packages.json";

	# neovim
	cp -r .dotfiles/nvim AppData/Local;

# instalação do chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));

	# importação dos pacotes do chocolatey
	choco install "packages/chocolatey-packages.config";

# instalação do winget
Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe;
