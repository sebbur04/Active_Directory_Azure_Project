# Variables for AZ Connection == TRUE
$tenantID = "42b38ed3-4451-4a95-a62f-b2250c2683ac" 
$subscrptionID = "a359d4aa-201e-43e6-bce2-654bb5387e6a" 

# Connect to Azure
Connect-AzAccount -Tenant $tenantID -Subscription $subscrptionID

# Variables - REMEMBER to change $prefix to your own prefix
$prefix = 'seb'
# Resource group:
$resourceGroupName = $prefix + '-rg-network-001'
$location = 'uksouth'

# Create Resource Group for the VNETs with a function
function New-ResourceGroup {
    param (
        [string]$resourceGroupName,
        [string]$location
    )

    # Check if the Resource Group already exists
    $resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue

    if (-not $resourceGroup) {
        # Resource Group does not exist, so create it
        New-AzResourceGroup -Name $resourceGroupName -Location $location -ErrorAction Stop
        Write-Output "Created Resource Group: $resourceGroupName in $location"
    } else {
        Write-Output "Resource Group $resourceGroupName already exists."
    }
}


# Create the resource group, if it does not exist
New-ResourceGroup -resourceGroupName $resourceGroupName -location $location