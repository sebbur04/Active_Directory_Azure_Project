## Monitoring DC1 Active Directory Services
<# 

Invoke-Command -ComputerName DC1 -ScriptBlock {
    Get-Service | Select-Object DisplayName, ServiceName, Status | Format-Table -AutoSize
}
#> 
# Use the abouve command to get the list of services running on the DC1 server

$scriptBlock = {
    # Define the service name for Active Directory Domain Services
    # Her kan man hekte på flere services og sjekke om de kjørere eller ikke!
    $serviceName = "DFSR"

    # Retrieve the current status of the NTDS service
    $serviceStatus = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

    if ($serviceStatus.Status -ne 'Running') {
        try {
            Start-Service -Name $serviceName
            Write-Output "The $serviceName service was not running and has been started."
        } catch {
            Write-Output "Failed to start the $serviceName service. Error: $_"
        }
    } else {
        Write-Output "The $serviceName service is running."
    }
}

Invoke-Command -ComputerName DC1 -ScriptBlock $scriptBlock


