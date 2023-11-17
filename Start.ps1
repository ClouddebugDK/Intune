function Show-Menu {
    param (
        [string]$Title = 'Intune Configuration'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "1: Press '1' for this option: Collect Diagnostics Log."
    Write-Host "2: Press '2' for this option."
    Write-Host "3: Press '3' for this option."
    Write-Host "Q: Press 'Q' to quit."
}

do
{
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
    '1' {
        'You chose option #1'
        If (!(Test-path Test-path "C:\Temp")){
            New-Item -Path C:temp -ItemType Directory -Force   
        }
        Set-Location -Path "C:\temp"
        wget https://aka.ms/intuneps1 -outfile IntuneODCStandAlone.ps1
        powerShell -ExecutionPolicy Bypass -File .\IntuneODCStandAlone.ps1 
    } 
    '2' {
        'You chose option #2'
    } 
    '3' {
        'You chose option #3'
    }
    }
    pause
}

until ($selection -eq 'q')function Show-Menu {
    param (
        [string]$Title = 'Intune Configuration'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "1: Press '1' for: Update Collect Diagnostics Log."
    Write-Host "2: Press '2' for this option."
    Write-Host "3: Press '3' for this option."
    Write-Host "Q: Press 'Q' to quit."
}

do {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection) {
        '1' {
            'You chose option #1'
            If (!(Test-path -path "C:\Temp" -ErrorAction SilentlyContinue)) {
                New-Item -Path "C:\temp" -ItemType Directory -Force | Out-Null   
            }
            Set-Location -Path "C:\temp" 
            wget https://aka.ms/intuneps1 -outfile IntuneODCStandAlone.ps1
            powerShell -ExecutionPolicy Bypass -File .\IntuneODCStandAlone.ps1
            Install-Module "Az.Storage" | Out-Null
            Import-Module "Az.Storage" | Out-Null

            $LogFile = Get-ChildItem -Path "C:\Temp" -Include "$env_computername_CollectedData*.zip" -Recurse

        } 
        '2' {
            'You chose option #2'
        } 
        '3' {
            'You chose option #3'
        }
    }
    pause
}

until ($selection -eq 'q')