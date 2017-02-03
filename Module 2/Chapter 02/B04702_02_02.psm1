Function Get-RunningServices
{
    (Get-Service).Where({$_.Status -eq 'Running'})
}

Function Get-StoppedServices
{
    (Get-Service).Where({$_.Status -eq 'Stopped'})
}

New-Alias -Name grsv -Value Get-RunningServices
New-Alias -Name gssv -Value Get-StoppedServices

Export-ModuleMember -Function * -Alias *