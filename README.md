# workshop-abakus-tf-aks
A repository for a workshop given to Abakus.

# Prerequisite
* Terraform
* Az CLI
* Code editor
* Git

# Installation guide
All installasjon kan utføres ved å følge følgende prosess:
* Trykk på windows knappen og skriv in Powershell -> Start Windows Powershell
* Installer chocolatey ved å kjøre

  ```iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))```
* Installer Vs Code ved å kjøre

    ```choco install vscode -y```
* Installer terraform ved å kjøre

   ```Choco install terraform –version=1.0.0 -y```
* Installer Git ved å kjøre

   ```choco install git.install```

* Installer AZ CLI ved å kjøre

  ```Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi```

Verifiser at terraform og az cli har blitt installert ved å lukke windows powershell og åpne opp et nytt vindu
* Terraform –version : du skal få ut versjonen av terraform.
* Az –version: du skal få ut versjonen av AZ CLI.
# How to
## Deployer terraform konfigurasjon til subscription
* Naviger til mappen `terraform`
* Log på Azure ved å bruke `az cli`

   ```az login --tenant id --use-device-code ```
* Kjør `terraform init`
* Kjør `terraform apply`

Output er navnet på ressursgruppen din.