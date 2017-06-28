[CmdletBinding()]
Param (
    [Parameter(Mandatory = $True, HelpMessage = "web apps deploy name")]
    [string]$Name,

    [Parameter(Mandatory = $True, HelpMessage = "remote git name")]
    [string]$RemoteName,

    [switch]$Force
)

$ErrorActionPreference="Stop"
Set-StrictMode -Version latest

$hasRemote = (git remote -v | % {($_ -split "\t")[0]} | Sort-Object -Unique | ? {$_ -match $RemoteName})

if ($hasRemote) {
    git remote -v
    if ($Force) {
        git remote remove $RemoteName
    }
    else {
        Write-Error "remote $RemoteName already exists"
    }
}

$xml = [xml](Get-AzureRmWebAppPublishingProfile -Name $Name -ResourceGroupName $Name -OutputFile PublishingProfile.xml)
$userName = $xml.SelectNodes("//publishProfile[@publishMethod=`"MSDeploy`"]/@userName").value
$userPw = $xml.SelectNodes("//publishProfile[@publishMethod=`"MSDeploy`"]/@userPWD").value

git remote add azure "https://${userName}:${userPw}@${Name}.scm.azurewebsites.net"

