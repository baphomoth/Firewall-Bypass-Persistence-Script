# Firewall Bypass & Persistence Powershell Script

## Objective

The script aims to provide a simple and effective way to bypass the Windows Firewall and establish persistence on a target system. By modifying the Windows Firewall rules and creating a scheduled task, the script ensures that the target system will not be affected by the Firewall, even after a reboot.

### Explanation

- The script starts by defining the Objective of the script.
- It imports the necessary modules `NetSecurity` and `ScheduledTasks` to enable Firewall rules and create scheduled tasks.
- The script enables the Windows Firewall for all profiles using `Set-NetFirewallProfile`.
- It allows all inbound and outbound traffic through the firewall using `Set-NetFirewallRule`.
- The script creates a scheduled task to run the script on startup. The task is set to run `powershell.exe` with the `-File` argument pointing to the current script. The task is set to run at startup using `New-ScheduledTaskTrigger -AtStartup`.
- The task is registered with `Register-ScheduledTask` and given the name "Firewall Bypass" and a description.
- Finally, the script notifies the user that the Firewall Bypass and Persistence have been completed.

### Notes

Save this script to a file and run it with PowerShell.
