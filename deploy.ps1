[CmdletBinding()]
Param (
    [Parameter(Mandatory=$True)]
    [string]$Name,
    [Parameter(Mandatory=$True)]
    [ValidateSet("eastasia",
        "southeastasia",
        "centralus",
        "eastus",
        "eastus2",
        "westus",
        "northcentralus",
        "southcentralus",
        "northeurope",
        "westeurope",
        "japanwest",
        "japaneast",
        "brazilsouth",
        "australiaeast",
        "australiasoutheast",
        "southindia",
        "centralindia",
        "westindia",
        "canadacentral",
        "canadaeast",
        "uksouth",
        "ukwest",
        "westcentralus",
        "westus2",
        "koreacentral",
        "koreasouth")] 
    [string]$Location
)

$baseDir = (Split-Path -Parent $MyInvocation.MyCommand.Path)

New-AzureRmResourceGroup -Name $Name -Location $Location -Force

New-AzureRmResourceGroupDeployment -Name "$Name-$(Get-Date -f "ddHHmm")"  -ResourceGroupName $Name -TemplateFile "$baseDir\azuredeploy.json" `
    -siteName $Name `
    -hostingPlanName "$Name-plan"

