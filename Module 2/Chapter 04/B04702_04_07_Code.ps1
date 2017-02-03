$param = @{
UserName = 'DSCDEMOLAB\ChenV'
ComputerName = $env:COMPUTERNAME
ConfigurationName = 'Microsoft.PowerShell'
Force = $true
Verbose = $true
}
Add-PswaAuthorizationRule @param
