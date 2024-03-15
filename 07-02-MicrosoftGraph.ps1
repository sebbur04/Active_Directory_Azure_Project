#---------------------------------------
#FERDIG
#---------------------------------------

# Install Microsoft Graph Module
# Install-Module Microsoft.Graph
Install-Module Microsoft.Graph #FOR Å LASTE NED MICROSOFT GRAPH MODUL, IKKE KJØR IGJEN, LASTET NED LOKALT
# Get-InstaledModule -Name Microsoft.Graph.*

$TenantID = "42b38ed3-4451-4a95-a62f-b2250c2683ac" #Local EntraID used on Micrsoft Azure tenant!! MY OWN 
Connect-MgGraph -TenantId $TenantID -Scopes "User.ReadWrite.All", "Group.ReadWrite.All", "Directory.ReadWrite.All", "RoleManagement.ReadWrite.Directory"

#VISER DETALJER OM SELVE OPPKOBLINGEN TIL MICROSOFT AZURE
$Details = Get-MgContext
$Scopes = $Details | Select-Object -ExpandProperty Scopes
$Scopes = $Scopes -join ","
$OrgName = (Get-MgOrganization).DisplayName
""
""
"Microsoft Graph current session details:"
"---------------------------------------"
"Tenant Id = $($Details.TenantId)"
"Client Id = $($Details.ClientId)"
"Org name  = $OrgName"
"App Name  = $($Details.AppName)"
"Account   = $($Details.Account)"
"Scopes    = $Scopes"
"---------------------------------------"
