Param (
    [string]$Name,
    [string]$Location
)

$baseDir = (Split-Path -Parent $MyInvocation.MyCommand.Path)

New-AzureRmResourceGroup -Name $Name -Location $Location -Force

New-AzureRmResourceGroupDeployment -Name "$Name-$(Get-Date -f "ddHHmm")"  -ResourceGroupName $Name -TemplateFile "$baseDir\azuredeploy.json" `
    -siteName $Name `
    -hostingPlanName "$Name-plan"

