[CmdletBinding()]
param(
  [Parameter(Mandatory = $true)]
  [String]$resourceGroupName,
  [Parameter(Mandatory = $true)]
  [String]$nsgName
)

$ErrorActionPreference = "Stop"

$winMergePath = "C:\Program Files\WinMerge\WinMergeU.exe"

if ((Test-Path $winMergePath) -eq $false) {
  Write-Host "Please check whether you have installed WinMerge in your PC."
  exit 1
}

$beforeFilePath = Get-Date -Format "yyyy-MMdd-HHmmss"
$before = Get-AzureRmNetworkSecurityGroup -ResourceGroupName $resourceGroupName -Name $nsgName
$before | Out-File "$beforeFilePath.log"

if (Test-Path "$beforeFilePath.log") {
  Write-Host "$beforeFilePath.log was created. This file has the resent setting of NSG($nsgName). Please change the setting of $nsgName."
}
else { 
  Write-Host "Error.The file which should be created before starting a change is nothing."
  exit 1  
}

Write-Host "When you finish to change the setting of $nsgName, Please push Enter key...."
$host.UI.RawUI.ReadKey() | Out-Null

$afterFilePath = Get-Date -Format "yyyy-MMdd-HHmmss"
$after = Get-AzureRmNetworkSecurityGroup -ResourceGroupName $resourceGroupName -Name $nsgName
$after | Out-File "$afterFilePath.log"

if (Test-Path "$afterFilePath.log") {
  Write-Host "$afterFilePath.log was created. This file has the resent setting of NSG($nsgName). WinMerge will start automatically."
}
else { 
  Write-Host "Error.The file which should be created after finishing a change is nothing."
  exit 1  
}

Start-Process -FilePath $winMergePath -ArgumentList "$beforeFilePath.log", "$afterFilePath.log" -Wait
