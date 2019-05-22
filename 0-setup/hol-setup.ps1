# Description: Boxstarter Script
# Author: PJ Meyer
# Hands-on-lab setup for GitHub Satellite

Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/common"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "FileExplorerSettings.ps1";   # Smart settings
executeScript "SystemConfiguration.ps1";    # Enable developer mode
executeScript "CommonDevTools.ps1";         # WinZip, VS Code, etc.
executeScript "RemoveDefaultApps.ps1";      # Remove bloat
executeScript "HyperV.ps1";                 # Enable HyperV (Note: re-req for Docker)
executeScript "Docker.ps1";
executeScript "WSL.ps1";
executeScript "Browsers.ps1";               # TODO: Need to install Edge Insider manually


#--- Azure Tools ---
choco install -y azure-cli
choco install -y azure-functions-core-tools


#--- Install VS Code extensions ---
code-insiders --install-extension peterjausovec.vscode-docker
code-insiders --install-extension ms-vsliveshare.vsliveshare
code-insiders --install-extension ms-vscode-remote.vscode-remote-extensionpack
code-insiders --install-extension ms-azuretools.vscode-azurefunctions


#--- Configure WSL ---
Ubuntu1804 run curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - 
Ubuntu1804 run apt install -y nodejs git
pushd $env:USERPROFILE
md code & cd code
Ubuntu1804 run npx express-generator sample-express-app
# Do firstrun of `code-insiders` inside wsl to install the server
Ubuntu1804 run code-insiders sample-express-app


#--- Pull Docker images used by labs ---
docker pull maven:3.6-jdk-8
docker pull golang:1
docker pull python:3
docker pull node:lts


Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
