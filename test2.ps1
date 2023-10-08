# List of computer names or IP addresses
$computers = "Computer1", "Computer2", "Computer3", "Computer4", "Computer5", "Computer6", "Computer7", "Computer8", "Computer9", "Computer10"

# Function to check if a computer is online
Function Test-ConnectionStatus {
    param (
        [string]$computer
    )
    $pingResult = Test-Connection -ComputerName $computer -Count 1 -Quiet
    return $pingResult
}

# Function to remotely shut down a computer
Function Shutdown-RemoteComputer {
    param (
        [string]$computer
    )
    Write-Host "Shutting down $computer..."
    shutdown.exe /s /m \\$computer /t 0
}

# Loop through each computer
foreach ($computer in $computers) {
    if (Test-ConnectionStatus -computer $computer) {
        Shutdown-RemoteComputer -computer $computer
    } else {
        Write-Host "Error: $computer is offline or unreachable."
        # Add error handling or troubleshooting steps as needed
    }
}

Write-Host "Shutdown command sent to all computers."
