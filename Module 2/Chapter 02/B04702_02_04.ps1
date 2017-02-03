Function Get-Information
{
    (Get-Service).Where({$_.Status -eq 'Stopped'})
}
Get-Information