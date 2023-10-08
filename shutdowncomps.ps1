# List of computer names or IP addresses
$computers = "Computer1", "Computer2", "Computer3", "Computer4", "Computer5", "Computer6", "Computer7", "Computer8", "Computer9", "Computer10"

# Loop through each computer and initiate a remote shutdown
foreach ($computer in $computers) {
    Write-Host "Shutting down $computer..."
    shutdown.exe /s /m \\$computer /t 0
}

Write-Host "Shutdown command sent to all computers."

