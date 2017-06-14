## Deploy To Azure
[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

## Azure PowerShellでのデプロイ

New-AzureRmResourceGroup -Name <uniqname> -Location japaneast
New-AzureRmResourceGroupDeployment -Name <uniqname> -ResourceGroupName <uniqname> -TemplateFile .\azuredeploy.json

## deploy スクリプト

./deploy.ps1 -Name <uniqname> -Location japaneast 


