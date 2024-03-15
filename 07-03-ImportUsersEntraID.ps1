#---------------------------------------
#FERDIG
#---------------------------------------



$TenantID = "42b38ed3-4451-4a95-a62f-b2250c2683ac"
Connect-MgGraph -TenantId $TenantID -Scopes "User.ReadWrite.All", "Group.ReadWrite.All", "Directory.ReadWrite.All", "RoleManagement.ReadWrite.Directory"

$users = Import-CSV -Path '/Users/sebastian.burmo/Documents/GitHub/DCST_1005_LOCALRUN/07-00-CSV-Users.csv' -Delimiter ","

$PasswordProfile = @{
    Password = 'sr_2!fdfgsg32ad'
    }
foreach ($user in $users) {
    $Params = @{
        UserPrincipalName = $user.userPrincipalName + "@digsecgr3.onmicrosoft.com" #Bruke egen principal name i Entra ID og fjerne gammet domain til sky domain 
        DisplayName = $user.displayName
        GivenName = $user.GivenName
        Surname = $user.Surname
        MailNickname = $user.userPrincipalName
        AccountEnabled = $true
        PasswordProfile = $PasswordProfile
        Department = $user.Department
        CompanyName = "InfraIT Sec"
        Country = "Norway"
        City = "Trondheim"
    }
    $Params
    New-MgUser @Params
}
