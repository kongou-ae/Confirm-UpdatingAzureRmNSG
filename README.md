# Confirm-UpdatingAzureRmNSG

The script which help a human to update the setting of NSG.

# Install

1. Install WinMerge. The path of WinMerge must be in "C:\Program Files\WinMerge\WinMergeU.exe"
1. git clone https://github.com/kongou-ae/Confirm-UpdatingAzureRmNSG.git && cd Confirm-UpdatingAzureRmNSG.git

If the path of WinMerge is different "C:\Program Files\WinMerge\WinMergeU.exe", Please change "Confirm-UpdatingAzureRmNSG.ps1"

# Usage

```
# Login Azure
PS > Login-AzureRmAccount
PS > Select-AzureRmSubscription -SubscriptionId "Your Azure subscription id"

# Set variable
PS > $resourceGroupName = "The name of resource group"
PS > $nsgName = "The name of network security Group"

# Start updating the setting of NSG
PS > .\Confirm-UpdatingAzureRmNSG.ps1 -resourceGroupName $resourceGroupName -nsgName $nsgName
2018-0206-230600.log was created. This file has the resent setting of NSG(test20160218). Please change the setting of test20160218.
When you finish to change the setting of test20160218, Please push Enter key....
2018-0206-230633.log was created. This file has the resent setting of NSG(test20160218). WinMerge will start automatically.
```
