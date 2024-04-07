# Description: This script is used to connect to Azure using the Az module
# Install-Module -Name Az -AllowClobber -Scope CurrentUser
### FERDIG

# Import the Az module
Import-Module Az

Get-Command -Verb New -Noun AzVirtualNetwork* -Module Az.Network

# Variables - Correct for my Azure enviroment
$tenantID = "42b38ed3-4451-4a95-a62f-b2250c2683ac"
$subscrptionID = "a359d4aa-201e-43e6-bce2-654bb5387e6a"

# Connect to Azure
Connect-AzAccount -Tenant $tenantID -Subscription $subscrptionID


# Variables
$prefix = 'seb'
# Resource group:
$rgName = $prefix + '-rg-powershell-001-InfraIT'
$location = 'uksouth'

# VNET:
$vnetName = $prefix + '-vnet-powershell-InfraIT'
$addressPrefix = '10.10.0.0/16'

# SUBNET:
$subnetName = $prefix + '-snet-powershell-002-InfraIT'
$subnetAddressPrefix = '10.10.0.0/24'



# Create Resource group
$rg = @{
    Name = $rgName
    Location = $location
}
New-AzResourceGroup @rg

# Create VNET
$vnet = @{
    Name = $vnetName
    ResourceGroupName = $rgName
    Location = $location
    AddressPrefix = $addressPrefix
}
$virtualNetwork = New-AzVirtualNetwork @vnet

$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet

$virtualNetwork | Set-AzVirtualNetwork